; =============================================================
; Tree-sitter query for extracting function calls from Fortran
; =============================================================

; Subroutine calls: CALL foo(args)
(subroutine_call
  subroutine: (identifier) @callee.name) @call

; Function references in expressions: foo(args)
(call_expression
  function: (identifier) @callee.name) @call

; USE module imports: USE mymodule
; In use_statement, module_name is an aliased identifier (leaf node)
(use_statement
  (module_name) @import.name) @import
