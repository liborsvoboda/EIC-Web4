// generated by codegen, do not edit
/**
 * This module provides the generated definition of `ArgList`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl
import codeql.rust.elements.Expr

/**
 * INTERNAL: This module contains the fully generated definition of `ArgList` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A ArgList. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::ArgList` class directly.
   * Use the subclass `ArgList`, where the following predicates are available.
   */
  class ArgList extends Synth::TArgList, AstNodeImpl::AstNode {
    override string getAPrimaryQlClass() { result = "ArgList" }

    /**
     * Gets the `index`th argument of this argument list (0-based).
     */
    Expr getArg(int index) {
      result =
        Synth::convertExprFromRaw(Synth::convertArgListToRaw(this).(Raw::ArgList).getArg(index))
    }

    /**
     * Gets any of the arguments of this argument list.
     */
    final Expr getAnArg() { result = this.getArg(_) }

    /**
     * Gets the number of arguments of this argument list.
     */
    final int getNumberOfArgs() { result = count(int i | exists(this.getArg(i))) }
  }
}