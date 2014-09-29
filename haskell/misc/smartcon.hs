data Complex a = Complex { real :: a, img :: a }

complex :: (Num a) => a -> a -> Complex a
complex r i = Complex r i

instance (Show a) => Show (Complex a) where
  show (Complex r i) = "re: " ++ show r ++ " im: " ++ show i

main = do
  let a = complex 2 3 in print a