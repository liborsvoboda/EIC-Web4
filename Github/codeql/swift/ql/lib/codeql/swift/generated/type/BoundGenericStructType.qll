// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `BoundGenericStructType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.internal.BoundGenericTypeImpl::Impl as BoundGenericTypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `BoundGenericStructType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::BoundGenericStructType` class directly.
   * Use the subclass `BoundGenericStructType`, where the following predicates are available.
   */
  class BoundGenericStructType extends Synth::TBoundGenericStructType,
    BoundGenericTypeImpl::BoundGenericType
  {
    override string getAPrimaryQlClass() { result = "BoundGenericStructType" }
  }
}