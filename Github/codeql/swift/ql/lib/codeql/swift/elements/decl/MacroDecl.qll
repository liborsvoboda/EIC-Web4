// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `MacroDecl`.
 */

private import internal.MacroDeclImpl
import codeql.swift.elements.decl.GenericContext
import codeql.swift.elements.MacroRole
import codeql.swift.elements.decl.ParamDecl
import codeql.swift.elements.decl.ValueDecl

/**
 * A declaration of a macro. Some examples:
 *
 * ```
 * @freestanding(declaration)
 * macro A() = #externalMacro(module: "A", type: "A")
 * @freestanding(expression)
 * macro B() = Builtin.B
 * @attached(member)
 * macro C() = C.C
 * ```
 */
final class MacroDecl = Impl::MacroDecl;