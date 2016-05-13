# From Meteor's random/random.js.
UNMISTAKABLE_CHARS = '23456789ABCDEFGHJKLMNPQRSTWXYZabcdefghijkmnopqrstuvwxyz'
INVALID_ID_CHARS_REGEX = new RegExp "[^#{ UNMISTAKABLE_CHARS }]"
INVALID_SHA256_CHARS_REGEX = new RegExp '[^a-f0-9]'

# Regular expression for matching e-mail addresses.
EMAIL_REGEX = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

Match.PositiveNumber = Match.Where (x) ->
  check x, Number
  x > 0

Match.NonEmptyString = Match.Where (x) ->
  check x, String
  x.trim().length > 0

Match.DocumentId = Match.Where (x) ->
  check x, String
  check x, Match.Where (y) -> y.length is 17
  not INVALID_ID_CHARS_REGEX.test x

Match.ObjectWithOnlyStrings = Match.Where (x) ->
  check x, Object
  for key, value of x
    check key, String
    check value, String

Match.Enumeration = (pattern, enumeration) ->
  values = _.values enumeration
  Match.Where (a) ->
    check a, pattern
    a in values

Match.SHA256String = Match.Where (x) ->
  check x, String
  check x, Match.Where (y) -> y.length is 64
  not INVALID_SHA256_CHARS_REGEX.test x

Match.EMail = Match.Where (x) ->
  check x, Match.NonEmptyString
  EMAIL_REGEX.test x

# We provide our own optional that also allows null.
Match.OptionalOrNull = (pattern) ->
  # We implement it inside Match.Optional so that Match.OptionalOrNull keeps the special semantics
  # inside objects where it means that object field can not exist (instanceof is used to check for
  # this). Thus Match.OptionalOrNull inside objects allows that field does not exist, that it exists
  # but it is null, or that it is the pattern. We additionally allow for undefined because in simulation
  # on the client a value can be undefined, but when serialized and send to the server it gets transformed
  # into the null. So we want the same check to work both on the client and server.
  Match.Optional Match.OneOf pattern, null, undefined
