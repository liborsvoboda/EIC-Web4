// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `DotSyntaxCallExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.internal.SelfApplyExprImpl::Impl as SelfApplyExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `DotSyntaxCallExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::DotSyntaxCallExpr` class directly.
   * Use the subclass `DotSyntaxCallExpr`, where the following predicates are available.
   */
  class DotSyntaxCallExpr extends Synth::TDotSyntaxCallExpr, SelfApplyExprImpl::SelfApplyExpr {
    override string getAPrimaryQlClass() { result = "DotSyntaxCallExpr" }
  }
}