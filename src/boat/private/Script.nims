##[
# base execution entity

FYIs
----
- a script should never rollback something that wasnt transported by boat
  - we should check before adding / removing anything
    - if it came from us: continue
    - if it didnt: ignore but reuse it

Interface
---------
- cost
  - time: in MS, total time you must pay to execute this script
  - space: in bytes, pretty sure we can diff a duf
- provides set[cmd]
  - we need to track incase of rollback
  - if more than 1 script is `done` and provides this `cmd`, we shouldnt remove it
    - if this is the only script that provides this cmd, we should remove it
- requires set[cmd]
  - we need to track in case of execute
  - we need to increment the number of Scripts that depend on `cmd` to support rollback
- repeatable bool
  - can execute be invoked more than once
- concurrent bool
  - implies repeatable, but forces concurrent execution
- onFailure()? async bool
  - optional fn if execute() == false
- onSuccess()? async bool
  - optional fn if execute() == true
- rollback() async bool
  - fn if onSuccess() == false
  - or to undo whatever execute() does
  - this is required, even if its just a fn that returns true

  .. codeblock:: Nim
    if provides.forEach CaptainsLog.provides(cmd) > 1 || CaptainsLog.requires(cmd) > 1 ||
      requires.forEach CaptainsLog.requires(cmd) > 1
      skip()
    else case of cmd:
      x: sudo apt remove cmd
      y: pnpm -g remove cmd
      z: etc
- execute proc(...) async bool
  - logic to execute
  - must return bool indicating success
  - must always be an async fn, even if nothing occurs asynchronously
]##
