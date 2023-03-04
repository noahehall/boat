##[
# GUNNER
- ensures everything works smoothly, is captured, and progresses in the appropriate order
- all entities are required to check with the gunner before doing anything
- should always be immutable and hold 0 state
  - the captains.log is always the source of truth


# runThread(what): void todo

# runAsync(what) {.async.}
    # canRun should be smart enough to determine if this thing CAN run, not if it should
    # e.g. if this thing has errored before, dont let it run
    # this check should occur way before we get to runAsync tho
    # swing back to this once the ADRs and other fns are flushed out
    if (!captains.log.nims.canRun(what))
      vessel.log(denied, what)
      return self

    var success = false

    vessel.log(...)
    captains.log.nims.doing(what) # increment

    vessel.log(...)
    success = await what.execute()
    vessel.log(success, what)
    captains.log.nims.track(success, what)

    if (!success)
      if (what.onFailure)
        status = await what.onFailure()
        vessel.log(status, what)

      captains.log.nims.doing(what) # decrement
      return self

    if (what.onSuccess)
      status = await what.onSuccess()
      vessel.log(status, what)

      if (!status)
        success = false

        if (what.rollback)
          status = await what.rollback()
          vessel.log(status, what)
          captains.log.nims.track(status, what)

          # if rollback exists but fails
          # throw immediately
          # dont update captains.log, dont pass go, dont collect $200
          # whatever `what` is should never be run again
          if (!status) throw()

        return self

    # successful execution and post execution
    captains.log.nims.done(what) # change status

    vessel.log(...)
    return self

# execute(what) {.async.}
  vessel.log(received: what)

  # check if we've done this before
  if (captains.log.nims.done(what))
    vessel.log(...)

    # nothing to do
    if (!what.repeatable && !what.concurrent) return self

  # we're doing it the first time, or doing it again
  # concurrent > asynchronous executions

  # always runThread
  if (what.concurrent) self.runThread(what); return self

  # else run asynchronously
  return await self.runAsync(what)


]##
