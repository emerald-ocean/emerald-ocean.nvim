;; extends

((field_declaration
  name: (field_identifier) @variable.member.definition)
  (#set! priority 105))

(var_declaration
  "var" @keyword.declaration
  (#set! priority 105))

(const_declaration
  "const" @keyword.declaration
  (#set! priority 105))

(interpreted_string_literal
  "\"" @string.quote
  (#set! priority 105))

(raw_string_literal
  "`" @string.quote
  (#set! priority 105))
