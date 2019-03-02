module Dict.Intersect.Internal exposing
    ( fold2
    , fold3
    , fold4
    , fold5
    , fold6
    , fold7
    , fold8
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


foldl2AutoSelect :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldl2AutoSelect fn acc dict1 dict2 =
    if Dict.size dict1 <= Dict.size dict2 then
        fold2 Dict.foldl fn acc dict1 dict2

    else
        fold2 Dict.foldl (\k v2 v1 acc_ -> fn k v1 v2 acc_) acc dict2 dict1


foldr2AutoSelect :
    (comparable -> v1 -> v2 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> acc
foldr2AutoSelect fn acc dict1 dict2 =
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



-- FOLD4 --


fold4 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
fold4 foldFn fn acc dict1 dict2 dict3 dict4 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            case Dict.get k dict4 of
                                Just v4 ->
                                    fn k v1 v2 v3 v4 acc_

                                Nothing ->
                                    acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1



-- FOLD5 --


fold5 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
fold5 foldFn fn acc dict1 dict2 dict3 dict4 dict5 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            case Dict.get k dict4 of
                                Just v4 ->
                                    case Dict.get k dict5 of
                                        Just v5 ->
                                            fn k v1 v2 v3 v4 v5 acc_

                                        Nothing ->
                                            acc_

                                Nothing ->
                                    acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1



-- FOLD6 --


fold6 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
fold6 foldFn fn acc dict1 dict2 dict3 dict4 dict5 dict6 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            case Dict.get k dict4 of
                                Just v4 ->
                                    case Dict.get k dict5 of
                                        Just v5 ->
                                            case Dict.get k dict6 of
                                                Just v6 ->
                                                    fn k v1 v2 v3 v4 v5 v6 acc_

                                                Nothing ->
                                                    acc_

                                        Nothing ->
                                            acc_

                                Nothing ->
                                    acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1



-- FOLD7 --


fold7 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> Dict comparable v7
    -> acc
fold7 foldFn fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            case Dict.get k dict4 of
                                Just v4 ->
                                    case Dict.get k dict5 of
                                        Just v5 ->
                                            case Dict.get k dict6 of
                                                Just v6 ->
                                                    case Dict.get k dict7 of
                                                        Just v7 ->
                                                            fn k v1 v2 v3 v4 v5 v6 v7 acc_

                                                        Nothing ->
                                                            acc_

                                                Nothing ->
                                                    acc_

                                        Nothing ->
                                            acc_

                                Nothing ->
                                    acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1



-- FOLD8 --


fold8 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> acc -> acc)
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
fold8 foldFn fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 =
    foldFn
        (\k v1 acc_ ->
            case Dict.get k dict2 of
                Just v2 ->
                    case Dict.get k dict3 of
                        Just v3 ->
                            case Dict.get k dict4 of
                                Just v4 ->
                                    case Dict.get k dict5 of
                                        Just v5 ->
                                            case Dict.get k dict6 of
                                                Just v6 ->
                                                    case Dict.get k dict7 of
                                                        Just v7 ->
                                                            case Dict.get k dict8 of
                                                                Just v8 ->
                                                                    fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_

                                                                Nothing ->
                                                                    acc_

                                                        Nothing ->
                                                            acc_

                                                Nothing ->
                                                    acc_

                                        Nothing ->
                                            acc_

                                Nothing ->
                                    acc_

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1
