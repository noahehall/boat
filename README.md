# boat

- [moved to nirvai](https://github.com/nirv-ai/boat)

> Bunch of Arbitrary Tasks.
> Under the Captain's Command; the Gunner will shoot them down

- automated transport and workflow runner

## todos

- think there should be a distinct `captains.log.nims` in each captain directory consumed by a boat
  - instead of trying to merge into a single compositive captains.log
  - just track which captain provides and requires each X
  - check if X is required/provided by more than 1 captain, and increment
    - will guard against
      - rolling back X if its required by more than 1 captain
      - irrelevant installations of X if its already been provided
- update bookofnims/.git{ignore,attributes} with this one
  - i think just the drawio extensions
- move to nirvai once ADRs stabilize
- add planned obsolescence & deprecation notice to nirvai scripts in favor of boat
  - boat should replace all bash scripts used by nirvai
- offloading installs to nimble tasks
  - perhaps even forwarding all requests to nimble tasks would simplify things
  - nah this TODO doesnt make sense
- i have a feeling we're going to regret using nimscript instead of just compiling to C
  - swing back to this once the ADRs stabilize and BEFORE moving repo to nirv
  - upgrading from nimscript is straight forward; shouldnt be an issue when the time comes
  - nahh this is how it should work
    - everything in src/private is compiled to C
      - the core functionality should not be exposed to the limitations of nimscript
    - everything not in src/private is a nimscript
      - these are really just scripts anyway
      - with attributes exposing fns and directives to be called by the compiled executor
