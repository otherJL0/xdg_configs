(call 
function: (attribute attribute: (identifier) @_execute)
arguments: (argument_list (string) @sqlite (#offset! @sqlite 0 1 0 -1) (#match? @sqlite "^\"[A-Za-z].*[\);]\"$")) 
(#match? @_execute "execute"))


(call 
function: (attribute attribute: (identifier) @_execute)
arguments: (argument_list (string) @sqlite (#offset! @sqlite 0 3 0 -3) (#match? @sqlite "^\"{3}[A-Za-z].*[\);]\"{3}$")) 
(#match? @_execute "execute"))

(call 
function: (attribute attribute: (identifier) @_execute)
arguments: (argument_list (string) @sqlite (#offset! @sqlite 0 4 0 -4) (#match? @sqlite "^\"{3} [A-Za-z].*[\);] \"{3}$")) 
(#match? @_execute "execute"))

((call
  function: (attribute
	  object: (identifier) @_re)
  arguments: (argument_list (string) @regex))
 (#eq? @_re "re")
 (#lua-match? @regex "^r.*"))

(comment) @comment
