-- BEGIN ...
module Language.FSML.SampleIO where
import Language.FSML.Syntax
import Language.FSML.Domains
-- END ...
-- Sample input for sample FSM
sampleInput :: Input
sampleInput =
  [
    "ticket", -- Regular insertion of a ticket in locked state
    "ticket", -- Irregular insertion of a ticket in unlocked state
    "pass", -- Regular passage of turnstile in unlocked state
    "pass", -- Irregular attempt to pass turnstile in locked state
    "ticket", -- Irregular insertion of a ticket in exceptional state
    "mute", -- Mute exceptional state alarm
    "release" -- Return from exceptional to locked state
  ]

-- Expected output
sampleOutput :: Output
sampleOutput = ["collect","eject","alarm","eject"]
