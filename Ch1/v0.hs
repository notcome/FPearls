(\\) :: Eq a => [a] -> [a] -> [a]
xs \\ ys = let f y = filter (/= y)
               fs  = map f ys
           in foldr ($) xs fs

minfree l = head $ [0..] \\ l
