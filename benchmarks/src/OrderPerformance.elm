module OrderPerformance exposing (main)

import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner
import Data.Dicts exposing (..)
import Dict exposing (Dict)
import Dict.Intersect


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
    Benchmark.describe "order performance foldl3"
        [ Benchmark.benchmark "100/100/100"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_100 dict2_100 dict3_100)
        , Benchmark.benchmark "50/100/100"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_50 dict2_100 dict3_100)
        , Benchmark.benchmark "25/100/100"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_25 dict2_100 dict3_100)
        , Benchmark.benchmark "100/50/100"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_100 dict2_50 dict3_100)
        , Benchmark.benchmark "100/25/100"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_100 dict2_25 dict3_100)
        , Benchmark.benchmark "100/100/50"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_100 dict2_100 dict3_50)
        , Benchmark.benchmark "100/100/25"
            (\_ -> Dict.Intersect.foldl3 fold3Help [] dict1_100 dict2_100 dict3_25)
        ]


main : Runner.BenchmarkProgram
main =
    Runner.program benchmark
