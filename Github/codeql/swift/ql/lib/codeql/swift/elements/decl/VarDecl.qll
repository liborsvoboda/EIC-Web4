// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `VarDecl`.
 */

private import internal.VarDeclImpl
import codeql.swift.elements.decl.AbstractStorageDecl
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.pattern.Pattern
import codeql.swift.elements.decl.PatternBindingDecl
import codeql.swift.elements.type.Type

/**
 * A declaration of a variable such as
 * * a local variable in a function:
 * ```
 * func foo() {
 *   var x = 42  // <-
 *   let y = "hello"  // <-
 *   ...
 * }
 * ```
 * * a member of a `struct` or `class`:
 * ```
 * struct S {
 *   var size : Int  // <-
 * }
 * ```
 * * ...
 */
final class VarDecl = Impl::VarDecl;