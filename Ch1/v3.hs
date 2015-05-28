partition p []     = ([], [])
partition p (x:xs) = let
  (lt, lf) = partition p xs
  in if p x then (x:lt, lf)
                else (lt, x:lf)

minfree xs = minfrom 0 (length xs, xs)
  where
    minfrom a (0, xs) = a
    minfrom a (n, xs)
      | m == b - a = minfrom b (n - m, vs)
      | otherwise  = minfrom a (m,     us)
      where (us, vs) = partition (< b) xs
            b        = a + 1 + n `div` 2
            m        = length us
