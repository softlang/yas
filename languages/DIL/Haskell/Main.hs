import Language.DIL.Sample
import Language.DIL.Syntax
import Language.DIL.WellFormedness
import Language.DIL.Lookup
import Data.Proxy

main = do
  print $ lookupFieldSet (Proxy @Book) (Proxy @TaxRate) sample
  print $ lookupFieldSet (Proxy @DVD) (Proxy @TaxRate) sample
  print $ lookupFieldSet (Proxy @MobyDick) (Proxy @Price) sample
  print $ lookupFieldSet (Proxy @Film2001) (Proxy @Price) sample
