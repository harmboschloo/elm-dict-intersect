module AutoSelect.Internal exposing
    ( fold2
    , fold3
    , fold4
    , fold5
    , fold6
    , fold7
    , fold8
    , foldl2AutoSelect
    , foldl3AutoSelect
    , foldl4AutoSelect
    , foldl5AutoSelect
    , foldl6AutoSelect
    , foldl7AutoSelect
    , foldl8AutoSelect
    , foldr2AutoSelect
    , foldr3AutoSelect
    , foldr4AutoSelect
    , foldr5AutoSelect
    , foldr6AutoSelect
    , foldr7AutoSelect
    , foldr8AutoSelect
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


foldl3AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldl3AutoSelect fn acc dict1 dict2 dict3 =
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


foldr3AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> acc
foldr3AutoSelect fn acc dict1 dict2 dict3 =
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


foldl4AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldl4AutoSelect fn acc dict1 dict2 dict3 dict4 =
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


foldr4AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> acc
foldr4AutoSelect fn acc dict1 dict2 dict3 dict4 =
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


foldl5AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldl5AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 =
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


foldr5AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> acc
foldr5AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 =
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


foldl6AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldl6AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 =
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


foldr6AutoSelect :
    (comparable -> v1 -> v2 -> v3 -> v4 -> v5 -> v6 -> acc -> acc)
    -> acc
    -> Dict comparable v1
    -> Dict comparable v2
    -> Dict comparable v3
    -> Dict comparable v4
    -> Dict comparable v5
    -> Dict comparable v6
    -> acc
foldr6AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 =
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


foldl7AutoSelect :
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
foldl7AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 =
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


foldr7AutoSelect :
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
foldr7AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 =
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


foldl8AutoSelect :
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
foldl8AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 =
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


foldr8AutoSelect :
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
foldr8AutoSelect fn acc dict1 dict2 dict3 dict4 dict5 dict6 dict7 dict8 =
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
