// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from GenericArgList x, int index
where toBeTested(x) and not x.isUnknown()
select x, index, x.getGenericArg(index)