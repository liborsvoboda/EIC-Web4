// generated by codegen, do not edit
/**
 * This module provides the generated definition of `BoxPat`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Pat
import codeql.rust.elements.internal.PatImpl::Impl as PatImpl

/**
 * INTERNAL: This module contains the fully generated definition of `BoxPat` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A box pattern. For example:
   * ```rust
   * match x {
   *     box Option::Some(y) => y,
   *     box Option::None => 0,
   * };
   * ```
   * INTERNAL: Do not reference the `Generated::BoxPat` class directly.
   * Use the subclass `BoxPat`, where the following predicates are available.
   */
  class BoxPat extends Synth::TBoxPat, PatImpl::Pat {
    override string getAPrimaryQlClass() { result = "BoxPat" }

    /**
     * Gets the pat of this box pat, if it exists.
     */
    Pat getPat() {
      result = Synth::convertPatFromRaw(Synth::convertBoxPatToRaw(this).(Raw::BoxPat).getPat())
    }

    /**
     * Holds if `getPat()` exists.
     */
    final predicate hasPat() { exists(this.getPat()) }
  }
}