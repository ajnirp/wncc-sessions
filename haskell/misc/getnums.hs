import Data.Maybe

maybeRead :: Read a => String -> Maybe a
-- reads :: Read a => ReadS a
-- http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#t:ReadS
-- String -> [(a, String)]
maybeRead s = case reads s of
  [(x,"")] -> Just x -- the second thing is the "remainder" after parsing
  _        -> Nothing

getListFromString :: String -> Maybe [Integer]
getListFromString s = maybeRead $ "[" ++ s ++ "]"

askUser :: IO [Integer]
askUser = do
  putStrLn "Enter a list of comma separated numbers" -- IO ()
  input <- getLine -- getLine :: IO String, input :: String
  let maybeList = getListFromString input in
    case maybeList of
      Just l  -> return l -- return :: a -> IO a
      Nothing -> askUser

main :: IO ()
main = do
  list <- askUser
  print $ sum list