// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `SelfApplyExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.internal.ApplyExprImpl::Impl as ApplyExprImpl
import codeql.swift.elements.expr.Expr

/**
 * INTERNAL: This module contains the fully generated definition of `SelfApplyExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * An internal raw instance of method lookups like `x.foo` in `x.foo()`.
   * This is completely replaced by the synthesized type `MethodLookupExpr`.
   * INTERNAL: Do not reference the `Generated::SelfApplyExpr` class directly.
   * Use the subclass `SelfApplyExpr`, where the following predicates are available.
   */
  class SelfApplyExpr extends Synth::TSelfApplyExpr, ApplyExprImpl::ApplyExpr {
    /**
     * Gets the base of this self apply expression.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateBase() {
      result =
        Synth::convertExprFromRaw(Synth::convertSelfApplyExprToRaw(this)
              .(Raw::SelfApplyExpr)
              .getBase())
    }

    /**
     * Gets the base of this self apply expression.
     */
    final Expr getBase() {
      exists(Expr immediate |
        immediate = this.getImmediateBase() and
        if exists(this.getResolveStep()) then result = immediate else result = immediate.resolve()
      )
    }
  }
}