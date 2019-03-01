module Dict.Intersect.Internal exposing
    ( fold2
    , fold3
    , foldl2Optimized
    , foldl3Optimized
    , foldr2Optimized
    , foldr3Optimized
    )

import Dict exposing (Dict)



-- FOLD2 --


fold2 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
fold2 foldFn fn acc dict1 dict2 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    fn k v1 v2 acc_

                Nothing ->
                    acc_
        )
        acc
        dict1


foldl2Optimized :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldl2Optimized fn acc dict1 dict2 =
    if Dict.size dict1 <= Dict.size dict2 then
        fold2 Dict.foldl fn acc dict1 dict2

    else
        fold2 Dict.foldl (\k v2 v1 acc_ -> fn k v1 v2 acc_) acc dict2 dict1


foldr2Optimized :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldr2Optimized fn acc dict1 dict2 =
    if Dict.size dict1 <= Dict.size dict2 then
        fold2 Dict.foldr fn acc dict1 dict2

    else
        fold2 Dict.foldr (\k v2 v1 acc_ -> fn k v1 v2 acc_) acc dict2 dict1



-- FOLD3 --


fold3 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
fold3 foldFn fn acc dict1 dict2 dict3 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            fn k v1 v2 v3 acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1


foldl3Optimized :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldl3Optimized fn acc dict1 dict2 dict3 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        minSize =
            size1 |> min size2 |> min size3
    in
    if minSize == size1 then
        fold3 Dict.foldl fn acc dict1 dict2 dict3

    else if minSize == size2 then
        fold3 Dict.foldl (\k v2 v1 v3 acc_ -> fn k v1 v2 v3 acc_) acc dict2 dict1 dict3

    else
        fold3 Dict.foldl (\k v3 v1 v2 acc_ -> fn k v1 v2 v3 acc_) acc dict3 dict1 dict2


foldr3Optimized :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldr3Optimized fn acc dict1 dict2 dict3 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        minSize =
            size1 |> min size2 |> min size3
    in
    if minSize == size1 then
        fold3 Dict.foldr fn acc dict1 dict2 dict3

    else if minSize == size2 then
        fold3 Dict.foldr (\k v2 v1 v3 acc_ -> fn k v1 v2 v3 acc_) acc dict2 dict1 dict3

    else
        fold3 Dict.foldr (\k v3 v1 v2 acc_ -> fn k v1 v2 v3 acc_) acc dict3 dict1 dict2
