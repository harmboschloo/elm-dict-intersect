module AutoSelect exposing (main)

import AutoSelect.Internal as Internal
import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner
import Data.Dicts exposing (..)
import Dict


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
        [ Benchmark.compare "100/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_100)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_100 dict2_100 dict3_100)
        , Benchmark.compare "50/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_50 dict2_100 dict3_100)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_50 dict2_100 dict3_100)
        , Benchmark.compare "25/100/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_25 dict2_100 dict3_100)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_50 dict2_100 dict3_100)
        , Benchmark.compare "100/50/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_50 dict3_100)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_100 dict2_50 dict3_100)
        , Benchmark.compare "100/25/100"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_25 dict3_100)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_100 dict2_25 dict3_100)
        , Benchmark.compare "100/100/50"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_50)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_100 dict2_100 dict3_50)
        , Benchmark.compare "100/100/25"
            "normal"
            (\_ -> Internal.fold3 Dict.foldl fold3Help [] dict1_100 dict2_100 dict3_25)
            "autoSelect"
            (\_ -> Internal.foldl3AutoSelect fold3Help [] dict1_100 dict2_100 dict3_25)
        ]


main : Runner.BenchmarkProgram
main =
    Runner.program benchmark
