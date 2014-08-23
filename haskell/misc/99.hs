--8
compress [] = []
compress [x] = [x]
compress (x:y:xs) = if x == y then compress (y:xs) else x : compress(y:xs)

--9
pack [] = []
pack [x] = [[x]]
pack (x:xs) = let (first:rest) = pack xs in
  if x == head first then (x:first):rest
  else [x]:(first:rest)

--10
rle [] = []
rle [x] = [(1,x)]
rle (x:xs) = let (first:rest) = rle xs in
  if x == snd first then (1 + fst first, x):rest
  else (1,x):(first:rest)

--15
repli [] _ = []
repli [x] y = take y [x,x..]
repli (x:xs) y = (take y [x,x..]) ++ repli xs y

--main = do
--  str <- compress "aaaabccaadeeee"
--  putStrLn str