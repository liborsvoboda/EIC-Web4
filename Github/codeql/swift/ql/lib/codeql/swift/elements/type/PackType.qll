// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `PackType`.
 */

private import internal.PackTypeImpl
import codeql.swift.elements.type.Type

/**
 * An actual type of a pack expression at the instatiation point.
 *
 * In the following example, PackType will appear around `makeTuple` call site as `Pack{String, Int}`:
 * ```
 * func makeTuple<each T>(_ t: repeat each T) -> (repeat each T) { ... }
 * makeTuple("A", 2)
 * ```
 *
 * More details:
 * https://github.com/apple/swift-evolution/blob/main/proposals/0393-parameter-packs.md
 */
final class PackType = Impl::PackType;