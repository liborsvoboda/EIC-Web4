// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from RangeExpr x, int getNumberOfAttrs, string hasEnd, string hasOperatorName, string hasStart
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfAttrs = x.getNumberOfAttrs() and
  (if x.hasEnd() then hasEnd = "yes" else hasEnd = "no") and
  (if x.hasOperatorName() then hasOperatorName = "yes" else hasOperatorName = "no") and
  if x.hasStart() then hasStart = "yes" else hasStart = "no"
select x, "getNumberOfAttrs:", getNumberOfAttrs, "hasEnd:", hasEnd, "hasOperatorName:",
  hasOperatorName, "hasStart:", hasStart