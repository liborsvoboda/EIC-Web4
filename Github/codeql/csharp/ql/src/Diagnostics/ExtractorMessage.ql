/**
 * @name Extraction message
 * @description An error message reported by the extractor. This could lead to inaccurate results.
 * @kind diagnostic
 * @id cs/extraction-message
 * @tags internal non-attributable
 */

import csharp
import semmle.code.csharp.commons.Diagnostics

from ExtractorMessage message
select message,
  message.getSeverityText() + " was generated by " + message.getOrigin() + ": " + message.getText() +
    "\n" + message.getStackTrace()