// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from Lifetime x, string hasText
where
  toBeTested(x) and
  not x.isUnknown() and
  if x.hasText() then hasText = "yes" else hasText = "no"
select x, "hasText:", hasText