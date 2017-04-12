# File _languages/FSML/Prolog/sample.input_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/sample.input)**
```
[
  ticket, % Regular insertion of a ticket
  pass, % Regular passage of turnstile
  ticket, % Regular insertion of a ticket
  pass, % Regular passage of turnstile
  ticket, % Regular insertion of a ticket
  ticket, % Tickets are ejected in unlocked state
...
```

## Languages
* [Term](../languages/Term.md)

## References
* elementOf('languages/FSML/Prolog/sample.input',term)
* mapsTo(simulateFsm,['languages/FSML/sample.term','languages/FSML/Prolog/sample.input'],['languages/FSML/Prolog/sample.output'])
* mapsTo(acceptFsm,['languages/FSML/sample.term','languages/FSML/Prolog/sample.input'],[])
