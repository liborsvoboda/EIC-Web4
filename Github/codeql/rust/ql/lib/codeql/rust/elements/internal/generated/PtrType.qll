// generated by codegen, do not edit
/**
 * This module provides the generated definition of `PtrType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.TypeRef
import codeql.rust.elements.internal.TypeRefImpl::Impl as TypeRefImpl

/**
 * INTERNAL: This module contains the fully generated definition of `PtrType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A PtrType. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::PtrType` class directly.
   * Use the subclass `PtrType`, where the following predicates are available.
   */
  class PtrType extends Synth::TPtrType, TypeRefImpl::TypeRef {
    override string getAPrimaryQlClass() { result = "PtrType" }

    /**
     * Gets the ty of this ptr type, if it exists.
     */
    TypeRef getTy() {
      result = Synth::convertTypeRefFromRaw(Synth::convertPtrTypeToRaw(this).(Raw::PtrType).getTy())
    }

    /**
     * Holds if `getTy()` exists.
     */
    final predicate hasTy() { exists(this.getTy()) }
  }
}
