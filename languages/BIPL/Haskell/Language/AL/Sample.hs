-- BEGIN ...
module Language.AL.Sample where
import Language.AL.Syntax
-- END ...
sample = [
   Const 14, Store "x", -- x = 14;
   Const 4, Store "y", -- y = 4;
   Const 0, Store "q", -- q = 0;
   Load "x", Store "r", -- r = x;
   Label "0", -- Beginning of while loop
   Load "r", Load "y", Geq, -- (r >= y)
   Not, CJump "1", -- Skip while loop
   Load "r", Load "y", Sub, Store "r", -- r = r - y;
   Load "q", Const 1, Add, Store "q", -- q = q + 1;
   Jump "0", -- Next iteration of loop
   Label "1" -- Label to goto when skipping loop
 ]
