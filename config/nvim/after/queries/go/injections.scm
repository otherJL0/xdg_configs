((call_expression
   (selector_expression) @_graphql_request 
   (argument_list . [(raw_string_literal) @injection.content]))
 (#eq? @_graphql_request "graphql.NewRequest")
   (#set! injection.language "graphql")
   (#offset! @injection.content 1 9 -1 10)
   )
