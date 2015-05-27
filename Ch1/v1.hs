partition p []     = ([], [])
partition p (x:xs) = let
  (lt, lf) = partition p xs
  in if p x then (x:lt, lf)
                else (lt, x:lf)

minfree l = let (Just x) = search l 0 $ length l in x
  where
{-
 - ~search l lo hi~ searches for the 1st elem of [lo, hi] absent from l,
 -   where any elem of l is in the range of [lo, hi]
 - 
 -   l is empty                 => lo is the 1st absent elem
 -   l is nonempty and lo == hi => no elem of [lo, hi] is absent from l.
 -}
    search :: [Int] -> Int -> Int -> Maybe Int
    search [] lo hi = Just lo
    search l  lo hi
      | lo == hi  = Nothing
      | otherwise = let
        mid      = (lo + hi) `quot` 2
        (ll, lr) = partition (<= mid) l
        left     = search ll lo mid
        in case left of
          Nothing -> search lr (mid + 1) hi
          x       -> x
