module Test where

spec f z = [(x, y) | x <- [0..z], y <- [0..z], f (x, y) == z]

f0 (x, y) = 2^y * (2*x+1) - 1
f1 (x, y) = x*2^x + y*2^y + 2*x + y
f2 (x, y) = 3*x + 37*y + y^2
f3 (x, y) = x^2 + y^2 + x + y
f4 (x, y) = x + 2^y + y - 1

test f = std == res
  where std = benchmark spec 5000
        res = benchmark f    5000

benchmark invert z = map (flip invert z) fs
  where fs = [f0, f1, f2, f3, f4]
