-- | Variadic composition
module Variadic.Composition
  ( Compose,
    (.**.),
  )
where

infixr 9 .**.

-- | Variadic composition
class Compose a b c where
  -- | Compose two functions
  (.**.) :: a -> b -> c

instance Compose (a -> b) (c -> a) (c -> b) where
  (.**.) = (.)
  {-# INLINE (.**.) #-}

instance
  (Compose (a -> b) (f -> d) (f -> e)) =>
  Compose (a -> b) (f -> f -> d) (f -> f -> e)
  where
  f .**. g = (.**.) f . g
  {-# INLINE (.**.) #-}
