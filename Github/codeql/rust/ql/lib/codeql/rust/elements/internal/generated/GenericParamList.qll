// generated by codegen, do not edit
/**
 * This module provides the generated definition of `GenericParamList`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl
import codeql.rust.elements.GenericParam

/**
 * INTERNAL: This module contains the fully generated definition of `GenericParamList` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A GenericParamList. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::GenericParamList` class directly.
   * Use the subclass `GenericParamList`, where the following predicates are available.
   */
  class GenericParamList extends Synth::TGenericParamList, AstNodeImpl::AstNode {
    override string getAPrimaryQlClass() { result = "GenericParamList" }

    /**
     * Gets the `index`th generic parameter of this generic parameter list (0-based).
     */
    GenericParam getGenericParam(int index) {
      result =
        Synth::convertGenericParamFromRaw(Synth::convertGenericParamListToRaw(this)
              .(Raw::GenericParamList)
              .getGenericParam(index))
    }

    /**
     * Gets any of the generic parameters of this generic parameter list.
     */
    final GenericParam getAGenericParam() { result = this.getGenericParam(_) }

    /**
     * Gets the number of generic parameters of this generic parameter list.
     */
    final int getNumberOfGenericParams() { result = count(int i | exists(this.getGenericParam(i))) }
  }
}