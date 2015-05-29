import Data.List

table :: Ord a => [a] -> [(a, Int)]
table [x] = [(x, 0)]
table zs  = join (m-n) (table xs) (table ys)
  where m = length zsh
        n = m `quot` 2
        (xs, ys) = splitAt n zs

join :: Ord a => Int -> [(a, Int)] -> [(a, Int)] -> [(a, Int)]
join 0 xs [] = xs
join n [] ys = ys
join n xs@((x, c):xs') ys@((y, d):ys')
  | x <  y = let rest = join n xs' ys
             in (x, c+n):rest
  | x >= y = let rest = join (n-1) xs ys'
             in   (y, d):rest

msc :: Ord a => [a] -> Int
msc = maximum . map snd . table
