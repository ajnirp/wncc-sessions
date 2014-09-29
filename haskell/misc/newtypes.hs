newtype PersonsAge2 = PersonsAge2 Int

isLessThanSix :: Int -> Bool
isLessThanSix x = x < (6 :: Int)

main = do
  print (isLessThanSix b) where b = 5 :: PersonsAge2