module Dict.Intersect exposing
    ( foldl2, foldr2
    , foldl3, foldr3
    , foldl4, foldr4
    , foldl5, foldr5
    , foldl6, foldr6
    , foldl7, foldr7
    , foldl8, foldr8
    )

{-|

@docs foldl2, foldr2
@docs foldl3, foldr3
@docs foldl4, foldr4
@docs foldl5, foldr5
@docs foldl6, foldr6
@docs foldl7, foldr7
@docs foldl8, foldr8

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
    Internal.fold2 Dict.foldl


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
    Internal.fold2 Dict.foldr



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
    Internal.fold3 Dict.foldl


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
    Internal.fold3 Dict.foldr



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
    Internal.fold4 Dict.foldl


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
    Internal.fold4 Dict.foldr



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
    Internal.fold5 Dict.foldl


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
    Internal.fold5 Dict.foldr



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
    Internal.fold6 Dict.foldl


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
    Internal.fold6 Dict.foldr



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
    Internal.fold7 Dict.foldl


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
    Internal.fold7 Dict.foldr



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
    Internal.fold8 Dict.foldl


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
    Internal.fold8 Dict.foldr
