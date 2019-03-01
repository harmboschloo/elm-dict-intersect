module Dict.Intersect exposing
    ( foldl2, foldr2
    , foldl3, foldr3
    , foldl4, foldr4
    , foldl5, foldr5
    , foldl6, foldr6
    , foldl7, foldr7
    , foldl8, foldr8
    , foldl9, foldr9
    , foldl10, foldr10
    )

{-|

@docs foldl2, foldr2
@docs foldl3, foldr3
@docs foldl4, foldr4
@docs foldl5, foldr5
@docs foldl6, foldr6
@docs foldl7, foldr7
@docs foldl8, foldr8
@docs foldl9, foldr9
@docs foldl10, foldr10

-}

import Dict exposing (Dict)
import Dict.Intersect.Internal as Internal



-- 2 --


{-| Fold over the key-value pairs in 2 dictionaries from lowest key to highest key.
Only keys that exist in both dictionaries are used.
-}
foldl2 :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldl2 =
    Internal.foldl2Optimized


{-| Fold over the key-value pairs in 2 dictionaries from highest key to lowest key.
Only keys that exist in both dictionaries are used.
-}
foldr2 :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldr2 =
    Internal.foldr2Optimized



-- 3 --


{-| Fold over the key-value pairs in 3 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl3 :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldl3 =
    Internal.foldl3Optimized


{-| Fold over the key-value pairs in 3 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr3 :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldr3 =
    Internal.foldr3Optimized



-- 4 --


{-| Fold over the key-value pairs in 4 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl4 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldl4 =
    Internal.foldl4Optimized


{-| Fold over the key-value pairs in 4 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr4 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldr4 =
    Internal.foldr4Optimized



-- 5 --


{-| Fold over the key-value pairs in 5 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl5 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldl5 =
    Internal.foldl5Optimized


{-| Fold over the key-value pairs in 5 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr5 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldr5 =
    Internal.foldr5Optimized



-- 6 --


{-| Fold over the key-value pairs in 6 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl6 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldl6 =
    Internal.foldl6Optimized


{-| Fold over the key-value pairs in 6 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr6 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldr6 =
    Internal.foldr6Optimized



-- 7 --


{-| Fold over the key-value pairs in 7 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl7 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> acc
foldl7 =
    Internal.foldl7Optimized


{-| Fold over the key-value pairs in 7 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr7 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> acc
foldr7 =
    Internal.foldr7Optimized



-- 8 --


{-| Fold over the key-value pairs in 8 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl8 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> acc
foldl8 =
    Internal.foldl8Optimized


{-| Fold over the key-value pairs in 8 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr8 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> acc
foldr8 =
    Internal.foldr8Optimized



-- 9 --


{-| Fold over the key-value pairs in 9 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl9 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> Dict comparable v9
    -> acc
foldl9 =
    Internal.foldl9Optimized


{-| Fold over the key-value pairs in 9 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr9 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> Dict comparable v9
    -> acc
foldr9 =
    Internal.foldr9Optimized



-- 10 --


{-| Fold over the key-value pairs in 10 dictionaries from lowest key to highest key.
Only keys that exist in all dictionaries are used.
-}
foldl10 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> v10 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> Dict comparable v9
    -> Dict comparable v10
    -> acc
foldl10 =
    Internal.foldl10Optimized


{-| Fold over the key-value pairs in 10 dictionaries from highest key to lowest key.
Only keys that exist in all dictionaries are used.
-}
foldr10 :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> v10 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> Dict comparable v8
    -> Dict comparable v9
    -> Dict comparable v10
    -> acc
foldr10 =
    Internal.foldr10Optimized
