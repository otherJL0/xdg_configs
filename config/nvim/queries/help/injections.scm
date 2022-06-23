; ; (code_block) @lua


; ; (((code_block) @_code_block
; ;  (#match? @_code_block "^\s*local")) @lua)


; ; ((code_block) @query)



; (line
;  (word) @_filename
;  (code_block) @lua (#offset! @lua 0 1 0 0)
; (#match? @_filename "\.lua:$"))


; (line
;  (word) @_filename
;  (code_block) @vim (#offset! @vim 0 1 0 0)
; (#match? @_filename "\.vim:$"))

; ; (line
; ;  (word)*
;  (word) @_filename
;  (code_block) @lua (#offset! @lua 0 1 0 -1)
; (#match? @_filename "[^(vim|lua)]:$")
; ) @vim_capture



; ((code_block) @lua
; (#match? @lua ":lua(do|file)?")
; (#offset! @lua 4 1 0 0))


(line
 (word) @_filename
 (code_block) @lua (#offset! @lua 0 1 0 -1)
(#match? @_filename "\.lua:$"))


(line
 (word) @_filename
 (code_block) @vim (#offset! @vim 0 1 0 -1)
(#match? @_filename "\.vim:$"))

(line
 (word)*
 (code_block) @vim 
 (#offset! @vim 1 2 0 -1)
 (#match? @vim ":lua")
)
