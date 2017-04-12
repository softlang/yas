# File _languages/FSML/Prolog/generated/Stepper.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/generated/Stepper.java)**
```
// Generated code
public class Stepper extends StepperBase<State, Input, Action> {
  public Stepper(HandlerBase<Action> handler) {
    this.handler = handler;
    state = State.locked;
    add(State.locked, Input.ticket, Action.collect, State.unlocked);
    add(State.locked, Input.pass, Action.alarm, State.exception);
...
```
