// generated by codegen, do not edit
/**
 * This module provides the generated definition of `IdentPat`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Attr
import codeql.rust.elements.Name
import codeql.rust.elements.Pat
import codeql.rust.elements.internal.PatImpl::Impl as PatImpl

/**
 * INTERNAL: This module contains the fully generated definition of `IdentPat` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A binding pattern. For example:
   * ```rust
   * match x {
   *     Option::Some(y) => y,
   *     Option::None => 0,
   * };
   * ```
   * ```rust
   * match x {
   *     y@Option::Some(_) => y,
   *     Option::None => 0,
   * };
   * ```
   * INTERNAL: Do not reference the `Generated::IdentPat` class directly.
   * Use the subclass `IdentPat`, where the following predicates are available.
   */
  class IdentPat extends Synth::TIdentPat, PatImpl::Pat {
    override string getAPrimaryQlClass() { result = "IdentPat" }

    /**
     * Gets the `index`th attr of this ident pat (0-based).
     */
    Attr getAttr(int index) {
      result =
        Synth::convertAttrFromRaw(Synth::convertIdentPatToRaw(this).(Raw::IdentPat).getAttr(index))
    }

    /**
     * Gets any of the attrs of this ident pat.
     */
    final Attr getAnAttr() { result = this.getAttr(_) }

    /**
     * Gets the number of attrs of this ident pat.
     */
    final int getNumberOfAttrs() { result = count(int i | exists(this.getAttr(i))) }

    /**
     * Gets the name of this ident pat, if it exists.
     */
    Name getName() {
      result =
        Synth::convertNameFromRaw(Synth::convertIdentPatToRaw(this).(Raw::IdentPat).getName())
    }

    /**
     * Holds if `getName()` exists.
     */
    final predicate hasName() { exists(this.getName()) }

    /**
     * Gets the pat of this ident pat, if it exists.
     */
    Pat getPat() {
      result = Synth::convertPatFromRaw(Synth::convertIdentPatToRaw(this).(Raw::IdentPat).getPat())
    }

    /**
     * Holds if `getPat()` exists.
     */
    final predicate hasPat() { exists(this.getPat()) }
  }
}