##[

- setting up my box
- [fresh install](https://github.com/noahehall/theBookOfNoah/blob/master/_freshinstall.md)

gunner
  init >
    parse config $HOME/boat.cfg
    push config() ->
      set config $SHELL
  shoot > check init() -> shell? continue | (bad -> askInit())
    what(name) -> parse deck ->
      recursive deck? deckExists ? deckname(name) | (warn -> skip)
      is duty? dutyExists ? duty(dutyname) | (warn -> skip)
  duty > check init() -> shell? continue | (bad -> askInit())
    do(name) ->
      not setup for vessel ? warn -> skip
      matches config? skip
      drop anchor(install duty.name.for.vessel)
  revert > check init() -> shell? continue | (bad -> warn -> skip)
    undo(name)


]##
