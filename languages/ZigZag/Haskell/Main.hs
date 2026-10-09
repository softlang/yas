import Language.ZigZag.Syntax
import Language.ZigZag.Resolution
import Control.Monad(guard)

main = do
     -- Testing resolution
     guard $ resolve sample "Book" "taxRate" == Just (IntValue 7)
     guard $ resolve sample "MobyDick" "price" == Just (FloatValue 9.95)
     guard $ resolve sample "Bookworm" "name" == Just (StringValue "bookworm")
