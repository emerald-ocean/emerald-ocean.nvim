;; extends

(double_quote_scalar
  "\"" @string.quote
  (#set! priority 105))

(single_quote_scalar
  "'" @string.quote
  (#set! priority 105))
