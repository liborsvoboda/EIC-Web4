// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `FunctionType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.internal.AnyFunctionTypeImpl::Impl as AnyFunctionTypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `FunctionType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::FunctionType` class directly.
   * Use the subclass `FunctionType`, where the following predicates are available.
   */
  class FunctionType extends Synth::TFunctionType, AnyFunctionTypeImpl::AnyFunctionType {
    override string getAPrimaryQlClass() { result = "FunctionType" }
  }
}