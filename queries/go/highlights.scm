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

(import_spec
  path: (interpreted_string_literal
    (interpreted_string_literal_content) @module)
  (#set! priority 105))
