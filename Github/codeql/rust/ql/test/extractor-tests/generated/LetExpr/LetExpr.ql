// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from LetExpr x, int getNumberOfAttrs, string hasExpr, string hasPat
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasExpr() then hasExpr = "yes" else hasExpr = "no") and
  if x.hasPat() then hasPat = "yes" else hasPat = "no"
select x, "getNumberOfAttrs:", getNumberOfAttrs, "hasExpr:", hasExpr, "hasPat:", hasPat