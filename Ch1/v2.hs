import Data.Array
import Data.Array.ST

minfree = search . check
  where
    search   = length . takeWhile id . elems
    check xs = runSTArray $
      do a <- newArray (0, n) False
         sequence [writeArray a x True | x <- xs, x < n]
         return a
      where n = length xs
