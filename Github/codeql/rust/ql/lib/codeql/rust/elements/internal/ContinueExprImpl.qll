// generated by codegen, remove this comment if you wish to edit this file
/**
 * This module provides a hand-modifiable wrapper around the generated class `ContinueExpr`.
 *
 * INTERNAL: Do not use.
 */

private import codeql.rust.elements.internal.generated.ContinueExpr

/**
 * INTERNAL: This module contains the customizable definition of `ContinueExpr` and should not
 * be referenced directly.
 */
module Impl {
  /**
   * A continue expression. For example:
   * ```rust
   * loop {
   *     if not_ready() {
   *         continue;
   *     }
   * }
   * ```
   * ```rust
   * 'label: loop {
   *     if not_ready() {
   *         continue 'label;
   *     }
   * }
   * ```
   */
  class ContinueExpr extends Generated::ContinueExpr { }
}