count :: Ord a => [a] -> Int
count []     = error "Surpasser count of an empty list is undefined."
count (x:xs) = length $ filter (>x) xs

msc :: Ord a => [a] -> Int
msc l = let len = length l
            xpd = take len $ iterate tail l
        in maximum $ map count xpd
