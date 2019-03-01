module Dict.Intersect.Internal exposing
    ( fold2
    , fold3
    , fold4
    , fold5
    , fold6
    , fold7
    , fold8
    , fold9
    , fold10
    , foldl2Optimized
    , foldl3Optimized
    , foldl4Optimized
    , foldl5Optimized
    , foldl6Optimized
    , foldl7Optimized
    , foldl8Optimized
    , foldl9Optimized
    , foldl10Optimized
    , foldr2Optimized
    , foldr3Optimized
    , foldr4Optimized
    , foldr5Optimized
    , foldr6Optimized
    , foldr7Optimized
    , foldr8Optimized
    , foldr9Optimized
    , foldr10Optimized
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


foldl4Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldl4Optimized fn acc dict1 dict2 dict3 dict4 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        minSize =
            size1 |> min size2 |> min size3 |> min size4
    in
    if minSize == size1 then
        fold4 Dict.foldl fn acc dict1 dict2 dict3 dict4

    else if minSize == size2 then
        fold4 Dict.foldl (\k v2 v1 v3 v4 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict2 dict1 dict3 dict4

    else if minSize == size3 then
        fold4 Dict.foldl (\k v3 v1 v2 v4 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict3 dict1 dict2 dict4

    else
        fold4 Dict.foldl (\k v4 v1 v2 v3 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict4 dict1 dict2 dict3


foldr4Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldr4Optimized fn acc dict1 dict2 dict3 dict4 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        minSize =
            size1 |> min size2 |> min size3 |> min size4
    in
    if minSize == size1 then
        fold4 Dict.foldr fn acc dict1 dict2 dict3 dict4

    else if minSize == size2 then
        fold4 Dict.foldr (\k v2 v1 v3 v4 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict2 dict1 dict3 dict4

    else if minSize == size3 then
        fold4 Dict.foldr (\k v3 v1 v2 v4 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict3 dict1 dict2 dict4

    else
        fold4 Dict.foldr (\k v4 v1 v2 v3 acc_ -> fn k v1 v2 v3 v4 acc_) acc dict4 dict1 dict2 dict3



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


foldl5Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldl5Optimized fn acc dict1 dict2 dict3 dict4 dict5 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5
    in
    if minSize == size1 then
        fold5 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5

    else if minSize == size2 then
        fold5 Dict.foldl (\k v2 v1 v3 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict2 dict1 dict3 dict4 dict5

    else if minSize == size3 then
        fold5 Dict.foldl (\k v3 v1 v2 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict3 dict1 dict2 dict4 dict5

    else if minSize == size4 then
        fold5 Dict.foldl (\k v4 v1 v2 v3 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict4 dict1 dict2 dict3 dict5

    else
        fold5 Dict.foldl (\k v5 v1 v2 v3 v4 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict5 dict1 dict2 dict3 dict4


foldr5Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldr5Optimized fn acc dict1 dict2 dict3 dict4 dict5 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5
    in
    if minSize == size1 then
        fold5 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5

    else if minSize == size2 then
        fold5 Dict.foldr (\k v2 v1 v3 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict2 dict1 dict3 dict4 dict5

    else if minSize == size3 then
        fold5 Dict.foldr (\k v3 v1 v2 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict3 dict1 dict2 dict4 dict5

    else if minSize == size4 then
        fold5 Dict.foldr (\k v4 v1 v2 v3 v5 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict4 dict1 dict2 dict3 dict5

    else
        fold5 Dict.foldr (\k v5 v1 v2 v3 v4 acc_ -> fn k v1 v2 v3 v4 v5 acc_) acc dict5 dict1 dict2 dict3 dict4



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


foldl6Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldl6Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6
    in
    if minSize == size1 then
        fold6 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5 dict6

    else if minSize == size2 then
        fold6 Dict.foldl (\k v2 v1 v3 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6

    else if minSize == size3 then
        fold6 Dict.foldl (\k v3 v1 v2 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6

    else if minSize == size4 then
        fold6 Dict.foldl (\k v4 v1 v2 v3 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6

    else if minSize == size5 then
        fold6 Dict.foldl (\k v5 v1 v2 v3 v4 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6

    else
        fold6 Dict.foldl (\k v6 v1 v2 v3 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5


foldr6Optimized :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldr6Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6
    in
    if minSize == size1 then
        fold6 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5 dict6

    else if minSize == size2 then
        fold6 Dict.foldr (\k v2 v1 v3 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6

    else if minSize == size3 then
        fold6 Dict.foldr (\k v3 v1 v2 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6

    else if minSize == size4 then
        fold6 Dict.foldr (\k v4 v1 v2 v3 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6

    else if minSize == size5 then
        fold6 Dict.foldr (\k v5 v1 v2 v3 v4 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6

    else
        fold6 Dict.foldr (\k v6 v1 v2 v3 v4 v5 acc_ -> fn k v1 v2 v3 v4 v5 v6 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5



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


foldl7Optimized :
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
foldl7Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7
    in
    if minSize == size1 then
        fold7 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7

    else if minSize == size2 then
        fold7 Dict.foldl (\k v2 v1 v3 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7

    else if minSize == size3 then
        fold7 Dict.foldl (\k v3 v1 v2 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7

    else if minSize == size4 then
        fold7 Dict.foldl (\k v4 v1 v2 v3 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7

    else if minSize == size5 then
        fold7 Dict.foldl (\k v5 v1 v2 v3 v4 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7

    else if minSize == size6 then
        fold7 Dict.foldl (\k v6 v1 v2 v3 v4 v5 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7

    else
        fold7 Dict.foldl (\k v7 v1 v2 v3 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6


foldr7Optimized :
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
foldr7Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7
    in
    if minSize == size1 then
        fold7 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7

    else if minSize == size2 then
        fold7 Dict.foldr (\k v2 v1 v3 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7

    else if minSize == size3 then
        fold7 Dict.foldr (\k v3 v1 v2 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7

    else if minSize == size4 then
        fold7 Dict.foldr (\k v4 v1 v2 v3 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7

    else if minSize == size5 then
        fold7 Dict.foldr (\k v5 v1 v2 v3 v4 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7

    else if minSize == size6 then
        fold7 Dict.foldr (\k v6 v1 v2 v3 v4 v5 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7

    else
        fold7 Dict.foldr (\k v7 v1 v2 v3 v4 v5 v6 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6



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


foldl8Optimized :
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
foldl8Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8
    in
    if minSize == size1 then
        fold8 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8

    else if minSize == size2 then
        fold8 Dict.foldl (\k v2 v1 v3 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8

    else if minSize == size3 then
        fold8 Dict.foldl (\k v3 v1 v2 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8

    else if minSize == size4 then
        fold8 Dict.foldl (\k v4 v1 v2 v3 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8

    else if minSize == size5 then
        fold8 Dict.foldl (\k v5 v1 v2 v3 v4 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8

    else if minSize == size6 then
        fold8 Dict.foldl (\k v6 v1 v2 v3 v4 v5 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8

    else if minSize == size7 then
        fold8 Dict.foldl (\k v7 v1 v2 v3 v4 v5 v6 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8

    else
        fold8 Dict.foldl (\k v8 v1 v2 v3 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7


foldr8Optimized :
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
foldr8Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8
    in
    if minSize == size1 then
        fold8 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8

    else if minSize == size2 then
        fold8 Dict.foldr (\k v2 v1 v3 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8

    else if minSize == size3 then
        fold8 Dict.foldr (\k v3 v1 v2 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8

    else if minSize == size4 then
        fold8 Dict.foldr (\k v4 v1 v2 v3 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8

    else if minSize == size5 then
        fold8 Dict.foldr (\k v5 v1 v2 v3 v4 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8

    else if minSize == size6 then
        fold8 Dict.foldr (\k v6 v1 v2 v3 v4 v5 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8

    else if minSize == size7 then
        fold8 Dict.foldr (\k v7 v1 v2 v3 v4 v5 v6 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8

    else
        fold8 Dict.foldr (\k v8 v1 v2 v3 v4 v5 v6 v7 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7



-- FOLD9 --


fold9 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> acc -> acc)
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
fold9 foldFn fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 =
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
                                                                    case Dict.get k dict9 of
                                                                        Just v9 ->
                                                                            fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_

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

                Nothing ->
                    acc_
        )
        acc
        dict1


foldl9Optimized :
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
foldl9Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        size9 =
            Dict.size dict9

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8 |> min size9
    in
    if minSize == size1 then
        fold9 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size2 then
        fold9 Dict.foldl (\k v2 v1 v3 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size3 then
        fold9 Dict.foldl (\k v3 v1 v2 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size4 then
        fold9 Dict.foldl (\k v4 v1 v2 v3 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8 dict9

    else if minSize == size5 then
        fold9 Dict.foldl (\k v5 v1 v2 v3 v4 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8 dict9

    else if minSize == size6 then
        fold9 Dict.foldl (\k v6 v1 v2 v3 v4 v5 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8 dict9

    else if minSize == size7 then
        fold9 Dict.foldl (\k v7 v1 v2 v3 v4 v5 v6 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8 dict9

    else if minSize == size8 then
        fold9 Dict.foldl (\k v8 v1 v2 v3 v4 v5 v6 v7 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict9

    else
        fold9 Dict.foldl (\k v9 v1 v2 v3 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict9 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8


foldr9Optimized :
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
foldr9Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        size9 =
            Dict.size dict9

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8 |> min size9
    in
    if minSize == size1 then
        fold9 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size2 then
        fold9 Dict.foldr (\k v2 v1 v3 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size3 then
        fold9 Dict.foldr (\k v3 v1 v2 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8 dict9

    else if minSize == size4 then
        fold9 Dict.foldr (\k v4 v1 v2 v3 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8 dict9

    else if minSize == size5 then
        fold9 Dict.foldr (\k v5 v1 v2 v3 v4 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8 dict9

    else if minSize == size6 then
        fold9 Dict.foldr (\k v6 v1 v2 v3 v4 v5 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8 dict9

    else if minSize == size7 then
        fold9 Dict.foldr (\k v7 v1 v2 v3 v4 v5 v6 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8 dict9

    else if minSize == size8 then
        fold9 Dict.foldr (\k v8 v1 v2 v3 v4 v5 v6 v7 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict9

    else
        fold9 Dict.foldr (\k v9 v1 v2 v3 v4 v5 v6 v7 v8 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_) acc dict9 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8



-- FOLD10 --


fold10 :
    ((comparable -> v1 -> acc -> acc) -> acc -> Dict comparable v1 -> acc)
    -> (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> v7 -> v8 -> v9 -> v10 -> acc -> acc)
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
fold10 foldFn fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10 =
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
                                                                    case Dict.get k dict9 of
                                                                        Just v9 ->
                                                                            case Dict.get k dict10 of
                                                                                Just v10 ->
                                                                                    fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_

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

                        Nothing ->
                            acc_

                Nothing ->
                    acc_
        )
        acc
        dict1


foldl10Optimized :
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
foldl10Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        size9 =
            Dict.size dict9

        size10 =
            Dict.size dict10

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8 |> min size9 |> min size10
    in
    if minSize == size1 then
        fold10 Dict.foldl fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size2 then
        fold10 Dict.foldl (\k v2 v1 v3 v4 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size3 then
        fold10 Dict.foldl (\k v3 v1 v2 v4 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size4 then
        fold10 Dict.foldl (\k v4 v1 v2 v3 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size5 then
        fold10 Dict.foldl (\k v5 v1 v2 v3 v4 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8 dict9 dict10

    else if minSize == size6 then
        fold10 Dict.foldl (\k v6 v1 v2 v3 v4 v5 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8 dict9 dict10

    else if minSize == size7 then
        fold10 Dict.foldl (\k v7 v1 v2 v3 v4 v5 v6 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8 dict9 dict10

    else if minSize == size8 then
        fold10 Dict.foldl (\k v8 v1 v2 v3 v4 v5 v6 v7 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict9 dict10

    else if minSize == size9 then
        fold10 Dict.foldl (\k v9 v1 v2 v3 v4 v5 v6 v7 v8 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict9 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict10

    else
        fold10 Dict.foldl (\k v10 v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict10 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9


foldr10Optimized :
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
foldr10Optimized fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10 =
    let
        size1 =
            Dict.size dict1

        size2 =
            Dict.size dict2

        size3 =
            Dict.size dict3

        size4 =
            Dict.size dict4

        size5 =
            Dict.size dict5

        size6 =
            Dict.size dict6

        size7 =
            Dict.size dict7

        size8 =
            Dict.size dict8

        size9 =
            Dict.size dict9

        size10 =
            Dict.size dict10

        minSize =
            size1 |> min size2 |> min size3 |> min size4 |> min size5 |> min size6 |> min size7 |> min size8 |> min size9 |> min size10
    in
    if minSize == size1 then
        fold10 Dict.foldr fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size2 then
        fold10 Dict.foldr (\k v2 v1 v3 v4 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict2 dict1 dict3 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size3 then
        fold10 Dict.foldr (\k v3 v1 v2 v4 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict3 dict1 dict2 dict4 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size4 then
        fold10 Dict.foldr (\k v4 v1 v2 v3 v5 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict4 dict1 dict2 dict3 dict5 dict6 dict7 dict8 dict9 dict10

    else if minSize == size5 then
        fold10 Dict.foldr (\k v5 v1 v2 v3 v4 v6 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict5 dict1 dict2 dict3 dict4 dict6 dict7 dict8 dict9 dict10

    else if minSize == size6 then
        fold10 Dict.foldr (\k v6 v1 v2 v3 v4 v5 v7 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict6 dict1 dict2 dict3 dict4 dict5 dict7 dict8 dict9 dict10

    else if minSize == size7 then
        fold10 Dict.foldr (\k v7 v1 v2 v3 v4 v5 v6 v8 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict7 dict1 dict2 dict3 dict4 dict5 dict6 dict8 dict9 dict10

    else if minSize == size8 then
        fold10 Dict.foldr (\k v8 v1 v2 v3 v4 v5 v6 v7 v9 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict8 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict9 dict10

    else if minSize == size9 then
        fold10 Dict.foldr (\k v9 v1 v2 v3 v4 v5 v6 v7 v8 v10 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict9 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict10

    else
        fold10 Dict.foldr (\k v10 v1 v2 v3 v4 v5 v6 v7 v8 v9 acc_ -> fn k v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 acc_) acc dict10 dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 dict9
