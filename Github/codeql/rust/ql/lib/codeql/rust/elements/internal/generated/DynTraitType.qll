// generated by codegen, do not edit
/**
 * This module provides the generated definition of `DynTraitType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.TypeBoundList
import codeql.rust.elements.internal.TypeRefImpl::Impl as TypeRefImpl

/**
 * INTERNAL: This module contains the fully generated definition of `DynTraitType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A DynTraitType. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::DynTraitType` class directly.
   * Use the subclass `DynTraitType`, where the following predicates are available.
   */
  class DynTraitType extends Synth::TDynTraitType, TypeRefImpl::TypeRef {
    override string getAPrimaryQlClass() { result = "DynTraitType" }

    /**
     * Gets the type bound list of this dyn trait type, if it exists.
     */
    TypeBoundList getTypeBoundList() {
      result =
        Synth::convertTypeBoundListFromRaw(Synth::convertDynTraitTypeToRaw(this)
              .(Raw::DynTraitType)
              .getTypeBoundList())
    }

    /**
     * Holds if `getTypeBoundList()` exists.
     */
    final predicate hasTypeBoundList() { exists(this.getTypeBoundList()) }
  }
}