// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `ParenType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.internal.SugarTypeImpl::Impl as SugarTypeImpl
import codeql.swift.elements.type.Type

/**
 * INTERNAL: This module contains the fully generated definition of `ParenType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::ParenType` class directly.
   * Use the subclass `ParenType`, where the following predicates are available.
   */
  class ParenType extends Synth::TParenType, SugarTypeImpl::SugarType {
    override string getAPrimaryQlClass() { result = "ParenType" }

    /**
     * Gets the type of this paren type.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Type getImmediateType() {
      result =
        Synth::convertTypeFromRaw(Synth::convertParenTypeToRaw(this).(Raw::ParenType).getType())
    }

    /**
     * Gets the type of this paren type.
     */
    final Type getType() {
      exists(Type immediate |
        immediate = this.getImmediateType() and
        if exists(this.getResolveStep()) then result = immediate else result = immediate.resolve()
      )
    }
  }
}