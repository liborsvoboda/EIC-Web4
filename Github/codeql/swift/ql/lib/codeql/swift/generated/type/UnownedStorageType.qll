// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `UnownedStorageType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.internal.ReferenceStorageTypeImpl::Impl as ReferenceStorageTypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `UnownedStorageType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::UnownedStorageType` class directly.
   * Use the subclass `UnownedStorageType`, where the following predicates are available.
   */
  class UnownedStorageType extends Synth::TUnownedStorageType,
    ReferenceStorageTypeImpl::ReferenceStorageType
  {
    override string getAPrimaryQlClass() { result = "UnownedStorageType" }
  }
}