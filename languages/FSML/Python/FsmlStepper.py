class FsmlStepper():

    def add(self, fromState, input, action, toState):
        if not fromState in self.fsm:
            self.fsm[fromState] = dict()
            self.fsm[fromState]["transitions"] = dict()
        self.fsm[fromState]["transitions"][input] = (action, toState)

    def run(self, input):
        input = list(input)
        output = []
        while input:
            symbol = input.pop(0)
            action, targetState = self.step(symbol)
            if action is not None: output.append(action)
        return output

    def step(self, symbol):
        (action, targetState) = self.fsm[self.currentState]["transitions"][symbol]
        if action is not None: self.handler.handle(action)
        self.currentState = targetState
        return action, targetState
