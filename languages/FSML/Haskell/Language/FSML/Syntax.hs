-- BEGIN ...
module Language.FSML.Syntax where
-- END ...
type Fsm = [State]
type State = (Initial, Id, [Transition])
type Transition = (Event, Maybe Action, Id)
type Initial = Bool
type Id = String
type Event = String
type Action = String
