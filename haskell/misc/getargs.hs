import Data.Maybe
import System.Environment

maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
  [(x,"")] -> Just x
  _        -> Nothing

argsToMaybeNums :: Read a => [String] -> [Maybe a]
argsToMaybeNums args = map maybeRead args
  
printSum :: Show a => Num a => [Maybe a] -> IO ()
printSum maybeNums = let somethingWrong = any isNothing maybeNums in
                      case somethingWrong of
                        True  -> error "can't sum these"
                        False -> let sumArgs = sum $ map fromJust maybeNums in
                                  print sumArgs

--main :: IO ()
--main = do
--  list <- getArgs -- getArgs :: IO [String]
--  let list' = argsToMaybeNums list in
--    printSum list' -- IO ()

-- another solution. this one simply discards strange args
--main :: IO ()
--main = do
--  list <- getArgs
--  -- catMaybes ignores all the Nothing's
--  print $ sum $ catMaybes $ argsToMaybeNums list