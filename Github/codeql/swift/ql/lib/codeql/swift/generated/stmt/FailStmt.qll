// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `FailStmt`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.stmt.internal.StmtImpl::Impl as StmtImpl

/**
 * INTERNAL: This module contains the fully generated definition of `FailStmt` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::FailStmt` class directly.
   * Use the subclass `FailStmt`, where the following predicates are available.
   */
  class FailStmt extends Synth::TFailStmt, StmtImpl::Stmt {
    override string getAPrimaryQlClass() { result = "FailStmt" }
  }
}