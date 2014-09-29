--Complex :: (Num a) => a -> a
data Complex a = Complex { real :: a, img :: a } deriving Show

instance (Show a) => Show (Complex a) where
	show (Complex re im) = "re: " ++ show re ++ " im: " ++ show im

main = do
  --print $ Complex 'a' 'b'
  print $ Complex 2 3