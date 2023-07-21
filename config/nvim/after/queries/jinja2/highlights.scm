; "{{" @punctuation.bracket
; "}}" @punctuation.bracket
; ; ; "{{%" @punctuation.bracket
; ; ; "%}}" @punctuation.bracket
; ")" @punctuation.bracket
; "(" @punctuation.bracket
; ;
; ; Keywords
;
; [
;     "else"
;     "elif"
;     "if"
; ] @conditional
;
; [
;     "endif"
;     "endfor"
;     "template"
;     "define"
;     "block"
; ] @keyword
;
(identifier) @variable

(fn_call
  fn_name: (identifier) @function)
