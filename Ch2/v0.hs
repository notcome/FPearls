tails :: [a] -> [[a]]
tails []     = []
tails (x:xs) = (x:xs):tails xs

scount :: Ord a => [a] -> Int
scount []     = error "Surpasser count of an empty list is undefined."
scount (x:xs) = length $ filter (>x) xs

msc :: Ord a => [a] -> Int
msc = maximum . map scount . tails
