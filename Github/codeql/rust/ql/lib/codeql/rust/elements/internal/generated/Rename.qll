// generated by codegen, do not edit
/**
 * This module provides the generated definition of `Rename`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.AstNodeImpl::Impl as AstNodeImpl
import codeql.rust.elements.Name

/**
 * INTERNAL: This module contains the fully generated definition of `Rename` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A Rename. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::Rename` class directly.
   * Use the subclass `Rename`, where the following predicates are available.
   */
  class Rename extends Synth::TRename, AstNodeImpl::AstNode {
    override string getAPrimaryQlClass() { result = "Rename" }

    /**
     * Gets the name of this rename, if it exists.
     */
    Name getName() {
      result = Synth::convertNameFromRaw(Synth::convertRenameToRaw(this).(Raw::Rename).getName())
    }

    /**
     * Holds if `getName()` exists.
     */
    final predicate hasName() { exists(this.getName()) }
  }
}