# Minfree
Calculate the smallest natural number not in a given finite set X of natural numbers.

- `v0.hs`: the specification
- `v1.hs`: an $O(n\log{}n)$ solution I thought by myself, using a [divide and conquer algorithm](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithms)
- `v2.hs`: an array based solution on _Pearls_
- `v3.hs`: a linear solution using a D&C algorithm on _Pearls_

## Comparison of `v1.hs` and `v3.hs`
`v3.hs` depends on the assumption that there is no duplicate element in the input. Under this assumption, there is a constant time test to determine whether we should search the “left” list (namely `ll` or `us`) or the “right” one (namely, `lr` or `vs`):

```Haskell
m == b - a = minfrom b (n - m, vs)
```

This is to say, if length of the left list equal to `mid - lo`, then every element of $[lo, mid$ exists in the left list.

My `v1.hs` version doesn’t take this advantage and thus has an $O(n\log{}n)$ time complexity. In the worst scenario, namely the smallest absent number is $n - 1$ where n is the length of the input list, the execution path of my algorithm is similar to that of [Quicksort](http://en.wikipedia.org/wiki/Quicksort).
