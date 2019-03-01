module Optimized exposing (main)

import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner
import Dict exposing (Dict)
import Dict.Intersect.Internal as Internal


dict1_100 : Dict Int Int
dict1_100 =
    List.range 1 100
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict1_50 : Dict Int Int
dict1_50 =
    List.range 1 50
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict1_25 : Dict Int Int
dict1_25 =
    List.range 1 25
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


dict2_100 : Dict Int Float
dict2_100 =
    List.range 1 100
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict2_50 : Dict Int Float
dict2_50 =
    List.range 1 50
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict2_25 : Dict Int Float
dict2_25 =
    List.range 1 25
        |> List.map (\i -> ( i, toFloat i ))
        |> Dict.fromList


dict3_100 : Dict Int String
dict3_100 =
    List.range 1 100
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList


dict3_50 : Dict Int String
dict3_50 =
    List.range 1 50
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList


dict3_25 : Dict Int String
dict3_25 =
    List.range 1 25
        |> List.map (\i -> ( i, String.fromInt i ))
        |> Dict.fromList


type alias Data =
    { id : Int
    , data1 : Int
    , data2 : Float
    , data3 : String
    }


fold3Help : Int -> Int -> Float -> String -> List Data -> List Data
fold3Help id data1 data2 data3 list =
    Data id data1 data2 data3 :: list


benchmark : Benchmark
benchmark =
    Benchmark.describe "foldl3"
        [ Benchmark.compare " 100/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_100)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_100 dict2_100 dict3_100)
        , Benchmark.compare " 50/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_50 dict2_100 dict3_100)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_50 dict2_100 dict3_100)
        , Benchmark.compare " 25/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_25 dict2_100 dict3_100)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_50 dict2_100 dict3_100)
        , Benchmark.compare " 100/50/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_50 dict3_100)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_100 dict2_50 dict3_100)
        , Benchmark.compare " 100/25/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_25 dict3_100)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_100 dict2_25 dict3_100)
        , Benchmark.compare " 100/100/50"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_50)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_100 dict2_100 dict3_50)
        , Benchmark.compare " 100/100/25"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_25)
            "optimized"
            (\_ -> Internal.foldl3Optimized fold3Help [] dict1_100 dict2_100 dict3_25)
        ]


main : Runner.BenchmarkProgram
main =
    Runner.program benchmark
