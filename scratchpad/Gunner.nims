##[
# GUNNER
- ensures everything works smoothly, is captured, and progresses in the appropriate order
- all entities are required to check with the gunner before doing anything
- should always be immutable and hold 0 state
  - the captains.log is always the source of truth


# runThread(what): void todo
  # should mimic runAsync in principle
  # but needs to call joinThreads
  # error handling will be a bit different as well

# runAsync(what) {.async.}
  var success = false

  vessel.log(...)
  CaptainsLog.doing(what) # increment

  vessel.log(...)
  success = await what.execute()
  vessel.log(success, what)
  CaptainsLog.track(success, what)

  if (!success)
    if (what.onFailure)
      status = await what.onFailure()
      vessel.log(status, what)

    CaptainsLog.doing(what) # decrement
    return self

  if (what.onSuccess)
    status = await what.onSuccess()
    vessel.log(status, what)

    if (!status)
      success = false

      if (what.rollback)
        status = await what.rollback()
        vessel.log(status, what)
        CaptainsLog.track(status, what)

        # if rollback exists but fails
        # throw immediately
        # dont update captains.log, dont pass go, dont collect $200
        # whatever `what` is should never be run again
        if (!status) throw()

      return self

  # successful execution and post execution
  CaptainsLog.done(what) # change status

  vessel.log(...)
  return self

# execute(what) {.async.}
  vessel.log(received: what)

  # canRun should be smart enough to determine if this thing CAN run, not if it should
  # think this should be dependency & runtime checks
  # and if its on the error list
  # swing back to this once the ADRs and other fns are flushed out
  if (!CaptainsLog.canRun(what))
    vessel.log(denied, what)
    return self

  # check if we've done this before
  if (CaptainsLog.done(what))

    # nothing to do
    if (!what.repeatable && !what.concurrent)
    vessel.log(...)
    return self

  # we're doing it the first time, or doing it again
  # concurrent > asynchronous executions

  # always runThread
  if (what.concurrent) self.runThread(what); return self

  # else run asynchronously
  return await self.runAsync(what)

]##
