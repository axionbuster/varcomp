# `varcomp` -- Variadic function composition

Variadic function composition done via the `.**.` operator.

## Usage

```haskell
import Variadic.Composition ((.**.))

-- Simple composition

g :: Char -> String
g = const "hello"

-- One argument

f0 :: Int -> Char
f0 = undefined

h1 :: Int -> String
h1 = g .**. f0

-- Two arguments

f2 :: Int -> Double -> Char
f2 = undefined

h2 :: Int -> Double -> String
h2 = g .**. f2

-- Three arguments

f3 :: Int -> Double -> String -> Char
f3 = undefined

h3 :: Int -> Double -> String -> Char
h3 = g .**. f3
```