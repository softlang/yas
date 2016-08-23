-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
module Language.FSML.QQ.Sample where
import Language.FSML.QuasiQuoter
import Language.FSML.Syntax

-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state locked {
              ticket / collect -> unlocked;
              pass / alarm -> exception;
        }
        state unlocked {
              ticket / eject;
              pass -> locked;
        }
        state exception {
              ticket / eject;
              pass;
              mute;
              release -> locked;
        }
|]
