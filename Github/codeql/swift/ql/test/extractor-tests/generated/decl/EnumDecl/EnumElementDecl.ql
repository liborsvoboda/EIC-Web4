// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from
  EnumElementDecl x, ModuleDecl getModule, int getNumberOfMembers, Type getInterfaceType,
  string getName, int getNumberOfParams
where
  toBeTested(x) and
  not x.isUnknown() and
  getModule = x.getModule() and
  getNumberOfMembers = x.getNumberOfMembers() and
  getInterfaceType = x.getInterfaceType() and
  getName = x.getName() and
  getNumberOfParams = x.getNumberOfParams()
select x, "getModule:", getModule, "getNumberOfMembers:", getNumberOfMembers, "getInterfaceType:",
  getInterfaceType, "getName:", getName, "getNumberOfParams:", getNumberOfParams