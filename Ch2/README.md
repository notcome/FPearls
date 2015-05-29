# A Surpassing Problem
Calculate the maximum surpasser count of a list.

- `v0.hs`: the specification
- `v1.hs`: an $O(n\log{}n)$ solution using a D&C algorithm on _Pearls_

## Notes
The approach to find this D&C algorithm is not hard. First, the author
attempts to find a linear `join` function that satisfies:

```Haskell
table (xs ++ ys) = join (table xs) (table ys)
```

By transforming the equation of `table` we could define `join` as:

```Haskell
join txs tys = [(z, c + tcount z tys) | (z, c) <- txs] ++ tys
tcount z tys = scount z (map fst tys)
```

, which is unfortunately not a linear time function.

Then, the author observes that we could improve `tcount` as long as `tys` is
sorted:

```Haskell
length (filter (z <) (map fst tys)) = length (dropWhile ((z >=) . fst) tys)
```

Therefore, the author concludes that it’s _sensible_ to maintain `table` in
ascending order. The rest part is pretty simple:

```Haskell
-- n = length ys
join n xs@((x, c):xs') ys@((y, d):ys')
  | x <  y = let rest = join n xs' ys
-- all elements in ys are larger than x, the number of which is n:
             in (x, c+n):rest
  | x >= y = let rest = join (n-1) xs ys'
             in   (y, d):rest
```

To me, the argument for that keeping `table` sorted is better is not very
convincing. But I think the rest deduction in this chapter is pretty good, as it
perfectly exemplifies how people generally design and optimize an algorithm.
