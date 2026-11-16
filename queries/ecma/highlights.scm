;; extends

(string
  [
    "\""
    "'"
  ] @string.quote
  (#set! priority 105))

(template_string
  "`" @string.quote
  (#set! priority 105))

(template_substitution
  [
    "${"
    "}"
  ] @string.special
  (#set! priority 105))

(lexical_declaration
  [
    "const"
    "let"
  ] @keyword.declaration
  (#set! priority 105))

(variable_declaration
  "var" @keyword.declaration
  (#set! priority 105))

(for_in_statement
  [
    "const"
    "let"
    "var"
  ] @keyword.declaration
  (#set! priority 105))
