stepperOfFsm(Fsm, Text) :-

  % Map transitions to calls to the stepper's "add" method
  findall(S,
    (
      % Iterate over states and transitions
      member((_, From, Ts), Fsm),
      member((I, A, To), Ts),

      EFrom = select(name('State'), From), % Expression for source state
      ETo = select(name('State'), To), % Expression for target state
      EI = select(name('Input'), I), % Expression for input

      % Expression for (optional) action
      (A = [A1] -> AE = select(name('Action'), A1); AE = null),

      % Expression statement for "add"
      S = expression(call(add, [EFrom, EI, AE, ETo]))
    ),
    Ss),

  HA = assign(select(this, handler), name(handler)), % Handler assignment
  SI = assign(name(state), select(name('State'),locked)), % State initialization

  % Stepper subclass
  Class = class(public, false, 'Stepper', [],
    [typeapp('StepperBase', 
      [typename('State'), typename('Input'), typename('Action')])],
    [constr(
      public,
      [(typeapp('HandlerBase', [typename('Action')]), handler)],
      [HA,SI|Ss])]),

  % Render the class
  ppJavaDecl(Class, Text).
