// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `PackElementExpr`.
 */

private import internal.PackElementExprImpl
import codeql.swift.elements.expr.Expr

/**
 * A pack element expression is a child of PackExpansionExpr.
 *
 * In the following example, `each t` on the second line is the pack element expression:
 * ```
 * func makeTuple<each T>(_ t: repeat each T) -> (repeat each T) {
 *   return (repeat each t)
 * }
 * ```
 *
 * More details:
 * https://github.com/apple/swift-evolution/blob/main/proposals/0393-parameter-packs.md
 */
final class PackElementExpr = Impl::PackElementExpr;