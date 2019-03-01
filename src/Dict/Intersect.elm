module Dict.Intersect exposing (foldl2, foldl3, foldr2, foldr3)

import Dict exposing (Dict)
import Dict.Intersect.Internal as Internal



-- FOLD2 --


foldl2 :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldl2 =
    Internal.foldl2Optimized


foldr2 :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldr2 =
    Internal.foldr2Optimized



-- FOLD3 --


foldl3 :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldl3 =
    Internal.foldl3Optimized


foldr3 :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldr3 =
    Internal.foldr3Optimized
