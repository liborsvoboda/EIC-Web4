// generated by codegen, do not edit
/**
 * This module provides the generated definition of `WhileExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Attr
import codeql.rust.elements.BlockExpr
import codeql.rust.elements.Expr
import codeql.rust.elements.internal.ExprImpl::Impl as ExprImpl
import codeql.rust.elements.Label

/**
 * INTERNAL: This module contains the fully generated definition of `WhileExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A WhileExpr. For example:
   * ```rust
   * todo!()
   * ```
   * INTERNAL: Do not reference the `Generated::WhileExpr` class directly.
   * Use the subclass `WhileExpr`, where the following predicates are available.
   */
  class WhileExpr extends Synth::TWhileExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "WhileExpr" }

    /**
     * Gets the `index`th attr of this while expression (0-based).
     */
    Attr getAttr(int index) {
      result =
        Synth::convertAttrFromRaw(Synth::convertWhileExprToRaw(this).(Raw::WhileExpr).getAttr(index))
    }

    /**
     * Gets any of the attrs of this while expression.
     */
    final Attr getAnAttr() { result = this.getAttr(_) }

    /**
     * Gets the number of attrs of this while expression.
     */
    final int getNumberOfAttrs() { result = count(int i | exists(this.getAttr(i))) }

    /**
     * Gets the condition of this while expression, if it exists.
     */
    Expr getCondition() {
      result =
        Synth::convertExprFromRaw(Synth::convertWhileExprToRaw(this).(Raw::WhileExpr).getCondition())
    }

    /**
     * Holds if `getCondition()` exists.
     */
    final predicate hasCondition() { exists(this.getCondition()) }

    /**
     * Gets the label of this while expression, if it exists.
     */
    Label getLabel() {
      result =
        Synth::convertLabelFromRaw(Synth::convertWhileExprToRaw(this).(Raw::WhileExpr).getLabel())
    }

    /**
     * Holds if `getLabel()` exists.
     */
    final predicate hasLabel() { exists(this.getLabel()) }

    /**
     * Gets the loop body of this while expression, if it exists.
     */
    BlockExpr getLoopBody() {
      result =
        Synth::convertBlockExprFromRaw(Synth::convertWhileExprToRaw(this)
              .(Raw::WhileExpr)
              .getLoopBody())
    }

    /**
     * Holds if `getLoopBody()` exists.
     */
    final predicate hasLoopBody() { exists(this.getLoopBody()) }
  }
}