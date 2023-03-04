##[
# base execution entity

Interface
---------
- repeatable: bool
  - can execute be invoked more than once
- concurrent: bool
  - implies repeatable, but forces concurrent execution
- onFailure()? async bool
  - optional fn if execute() == false
- onSuccess()? async bool
  - optional fn if execute() == true
- rollback()? async bool
  - optional fn if onSuccess() == false
- execute proc(...) async bool
  - logic to execute
  - must return bool indicating success
  - must always be an sync fn, even if nothing occurs asynchronously
]##
