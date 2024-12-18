-- | Variadic composition
module Variadic.Composition
  ( Compose,
    (.**.),
  )
where

infixr 9 .**.

-- | Variadic composition
class Compose a b c d e where
  -- | Compose two functions
  (.**.) :: (a -> b) -> (c -> d) -> (c -> e)

instance Compose a b c a b where
  (.**.) = (.)
  {-# INLINE (.**.) #-}

instance
  (Compose a b f d e) =>
  Compose a b c (f -> d) (f -> e)
  where
  f .**. g = (.**.) f . g
  {-# INLINE (.**.) #-}
