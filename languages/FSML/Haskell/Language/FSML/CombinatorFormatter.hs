-- BEGIN ...
module Language.FSML.CombinatorFormatter(fsm) where
import Language.FSML.Syntax
import Text.PrettyPrint.HughesPJ

-- END ...
fsm :: Fsm -> Doc
fsm (Fsm ss) = vcat (map state ss)

state :: State -> Doc
state (State initial source ts) =
  (if initial then text "initial" else empty)
  <+> text "state"
  <+> text source
  <+> text "{"
  $$ nest 2 (vcat (map (transition source) ts))
  $$ text "}"

transition :: String -> Transition -> Doc
transition source (Transition ev ac target) =
  text ev
  <> maybe empty (\ac'-> text "/" <> text ac') ac
  <+> (if source == target
         then empty
         else text "->" <+> text target)
  <> text ";"
