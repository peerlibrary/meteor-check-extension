Check Extension
===============

Meteor package which provides a few extensions to the built-in `Match` object.

Installation
------------

```
meteor add peerlibrary:check-extension
```

Checks
------

The following additional checks are provided:

  * `Match.PositiveNumber` matches only positive numbers.
  * `Match.NonEmptyString` matches only strings with a length greater than zero.
  * `Match.DocumentId` matches only valid ObjectIds.
  * `Match.ObjectWithOnlyStrings` matches only objects containing strings as keys and values.
  * `Match.Enumeration(pattern, enumeration)` matches values matching `pattern` belonging to a certain `enumeration` object or array.
  * `Match.SHA256String` matches hex-encoded SHA-256 digests.
  * `Match.EMail` matches only non-empty e-mail strings.
  * `Match.OptionalOrNull(pattern)` matches an optional `pattern` or an explicit `null` value.
  * `Match.RegexString(regex)` matches strings matching `regex` regular expression.
