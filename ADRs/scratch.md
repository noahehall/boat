## requirements

### nimscript

- nimscript only
  - positives
    - cross-platform by default: just use `when defined(type)` for branching
    - no need to figure out cross compiling; skipped most of that section
  - limitations:
    - but I presume compiling specifically for a type of vessel would be
      - more robust
      - more expressive: nimscript is only a subset of nim, thus our capabilities will be limited
        - shouldnt be a problem for the task at hand, just need to manage scope creep
    - nim required: if we compiled e.g. to C boat would be self contained
    - a self contained executable would be perfect for CI / containers
      - long term goal should be to finish bookofnim and compile boat supporting \*nix + mac
  - negatives:
    - have to download a bunch of files instead of a single binary
    - see limitations, which arent necessarily negatives due to the end goal
  - unknown
    - not sure how autocompletion works with nimscript
    - i think nimlang source has an autocompletion file somewhere

### installation

- consumers shouldnt need to download files they dont need
- its not a space issue, the files should be relatively small
  - its a human issue, i dont want shiz i dont want on my box
  - maybe do what nimble/apt does and keep shiz in a separate repo
    - then you can just add a repository and pick which one to use on duplicate duties
    - we can download a cache of available duties and on which repos they're available
    - should be able to specify a preferred repo, or the repo list should be an ordered list

## nice to haves

### vault integration

- private decks and duties requiring recurring authnz
