using System;
using System.Collections.Generic;
using System.Linq;
using Semmle.Util;
using Semmle.Autobuild.Shared;
using Semmle.Extraction.CSharp.DependencyFetching;

namespace Semmle.Autobuild.CSharp
{
    /// <summary>
    /// A build rule where the build command is of the form "dotnet build".
    /// Currently unused because the tracer does not work with dotnet.
    /// </summary>
    internal class DotNetRule : IBuildRule<CSharpAutobuildOptions>
    {
        public List<IProjectOrSolution> FailedProjectsOrSolutions { get; } = [];

        /// <summary>
        /// A list of projects which are incompatible with DotNet.
        /// </summary>
        public IEnumerable<Project<CSharpAutobuildOptions>> NotDotNetProjects { get; private set; }

        public DotNetRule() => NotDotNetProjects = [];

        public BuildScript Analyse(IAutobuilder<CSharpAutobuildOptions> builder, bool auto)
        {
            if (!builder.ProjectsOrSolutionsToBuild.Any())
                return BuildScript.Failure;

            if (auto)
            {
                NotDotNetProjects = builder.ProjectsOrSolutionsToBuild
                    .SelectMany(p => new[] { p }.Concat(p.IncludedProjects))
                    .OfType<Project<CSharpAutobuildOptions>>()
                    .Where(p => !p.DotNetProject);
                var notDotNetProject = NotDotNetProjects.FirstOrDefault();

                if (notDotNetProject is not null)
                {
                    builder.Logger.LogInfo($"Not using .NET Core because of incompatible project {notDotNetProject}");
                    return BuildScript.Failure;
                }

                builder.Logger.LogInfo("Attempting to build using .NET Core");
            }

            return WithDotNet(builder, ensureDotNetAvailable: false, (dotNetPath, environment) =>
                {
                    var ret = GetInfoCommand(builder.Actions, dotNetPath, environment);
                    foreach (var projectOrSolution in builder.ProjectsOrSolutionsToBuild)
                    {
                        var cleanCommand = GetCleanCommand(builder.Actions, dotNetPath, environment);
                        cleanCommand.QuoteArgument(projectOrSolution.FullPath);
                        var clean = cleanCommand.Script;

                        var restoreCommand = GetRestoreCommand(builder.Actions, dotNetPath, environment);
                        restoreCommand.QuoteArgument(projectOrSolution.FullPath);
                        var restore = restoreCommand.Script;

                        var build = GetBuildScript(builder, dotNetPath, environment, projectOrSolution.FullPath);

                        ret &= BuildScript.Try(clean) & BuildScript.Try(restore) & BuildScript.OnFailure(build, ret =>
                        {
                            FailedProjectsOrSolutions.Add(projectOrSolution);
                        });
                    }
                    return ret;
                });
        }

        /// <summary>
        /// Returns a script that attempts to download relevant version(s) of the
        /// .NET Core SDK, followed by running the script generated by <paramref name="f"/>.
        ///
        /// The arguments to <paramref name="f"/> are the path to the directory in which the
        /// .NET Core SDK(s) were installed and any additional required environment
        /// variables needed by the installed .NET Core (<code>null</code> when no variables
        /// are needed).
        /// </summary>
        public static BuildScript WithDotNet(IAutobuilder<AutobuildOptionsShared> builder, bool ensureDotNetAvailable, Func<string?, IDictionary<string, string>?, BuildScript> f)
        {
            var temp = FileUtils.GetTemporaryWorkingDirectory(builder.Actions.GetEnvironmentVariable, builder.Options.Language.UpperCaseName, out var shouldCleanUp);
            return DotNet.WithDotNet(builder.Actions, builder.Logger, builder.Paths.Select(x => x.Item1), temp, shouldCleanUp, ensureDotNetAvailable, builder.Options.DotNetVersion, installDir =>
            {
                var env = new Dictionary<string, string>
                {
                    { "DOTNET_SKIP_FIRST_TIME_EXPERIENCE", "true" },
                    { "MSBUILDDISABLENODEREUSE", "1" }
                };
                if (installDir is not null)
                {
                    // The installation succeeded, so use the newly installed .NET
                    var path = builder.Actions.GetEnvironmentVariable("PATH");
                    var delim = builder.Actions.IsWindows() ? ";" : ":";
                    env.Add("DOTNET_MULTILEVEL_LOOKUP", "false"); // prevent look up of other .NET SDKs
                    env.Add("PATH", installDir + delim + path);
                }
                return f(installDir, env);
            });
        }

        /// <summary>
        /// Returns a script that attempts to download relevant version(s) of the
        /// .NET Core SDK, followed by running the script generated by <paramref name="f"/>.
        ///
        /// The argument to <paramref name="f"/> is any additional required environment
        /// variables needed by the installed .NET Core (<code>null</code> when no variables
        /// are needed).
        /// </summary>
        public static BuildScript WithDotNet(IAutobuilder<AutobuildOptionsShared> builder, Func<IDictionary<string, string>?, BuildScript> f)
            => WithDotNet(builder, ensureDotNetAvailable: false, (_, env) => f(env));

        private static string DotNetCommand(IBuildActions actions, string? dotNetPath) =>
            dotNetPath is not null ? actions.PathCombine(dotNetPath, "dotnet") : "dotnet";

        private static BuildScript GetInfoCommand(IBuildActions actions, string? dotNetPath, IDictionary<string, string>? environment)
        {
            var info = new CommandBuilder(actions, null, environment).
                RunCommand(DotNetCommand(actions, dotNetPath)).
                Argument("--info");
            return info.Script;
        }

        private static CommandBuilder GetCleanCommand(IBuildActions actions, string? dotNetPath, IDictionary<string, string>? environment)
        {
            var clean = new CommandBuilder(actions, null, environment).
                RunCommand(DotNetCommand(actions, dotNetPath)).
                Argument("clean");
            return clean;
        }

        private static CommandBuilder GetRestoreCommand(IBuildActions actions, string? dotNetPath, IDictionary<string, string>? environment)
        {
            var restore = new CommandBuilder(actions, null, environment).
                RunCommand(DotNetCommand(actions, dotNetPath)).
                Argument("restore");
            return restore;
        }

        /// <summary>
        /// Gets the `dotnet build` script.
        /// </summary>
        private static BuildScript GetBuildScript(IAutobuilder<CSharpAutobuildOptions> builder, string? dotNetPath, IDictionary<string, string>? environment, string projOrSln)
        {
            var build = new CommandBuilder(builder.Actions, null, environment);
            var script = build.RunCommand(DotNetCommand(builder.Actions, dotNetPath)).
                Argument("build").
                Argument("--no-incremental");

            return
                script.QuoteArgument(projOrSln).
                    Script;
        }
    }
}