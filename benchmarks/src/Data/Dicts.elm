module Data.Dicts exposing
    ( dict1_100
    , dict1_25
    , dict1_50
    , dict2_100
    , dict2_25
    , dict2_50
    , dict3_100
    , dict3_25
    , dict3_50
    )

import Dict exposing (Dict)


dict1_25 : Dict Int Int
dict1_25 =
    List.range 1 25
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict1_50 : Dict Int Int
dict1_50 =
    List.range 1 50
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict1_100 : Dict Int Int
dict1_100 =
    List.range 1 100
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict2_25 : Dict Int Float
dict2_25 =
    List.range 1 25
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict2_50 : Dict Int Float
dict2_50 =
    List.range 1 50
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict2_100 : Dict Int Float
dict2_100 =
    List.range 1 100
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict3_25 : Dict Int String
dict3_25 =
    List.range 1 25
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList


dict3_50 : Dict Int String
dict3_50 =
    List.range 1 50
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList


dict3_100 : Dict Int String
dict3_100 =
    List.range 1 100
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList
