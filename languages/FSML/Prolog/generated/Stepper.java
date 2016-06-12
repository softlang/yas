// Generated code
public class Stepper extends StepperBase<State, Input, Action> {
  public Stepper(HandlerBase<Action> handler) {
    this.handler = handler;
    state = State.locked;
    add(State.locked, Input.ticket, Action.collect, State.unlocked);
    add(State.locked, Input.pass, Action.alarm, State.exception);
    add(State.unlocked, Input.ticket, Action.eject, State.unlocked);
    add(State.unlocked, Input.pass, null, State.locked);
    add(State.exception, Input.ticket, Action.eject, State.exception);
    add(State.exception, Input.pass, null, State.exception);
    add(State.exception, Input.mute, null, State.exception);
    add(State.exception, Input.release, null, State.locked);
  }
}
