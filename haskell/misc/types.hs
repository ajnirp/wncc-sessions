type PersonsAge = Int
--newtype PersonsAge2 = PersonsAge2 Int

isLessThanSix :: Int -> Bool
isLessThanSix x = x < (6 :: Int)

main = do
  let a = 5 :: PersonsAge in print (isLessThanSix a)
  --let b = 5 :: PersonsAge2 in print (isLessThanSix b)