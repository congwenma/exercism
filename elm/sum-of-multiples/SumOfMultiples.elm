module SumOfMultiples exposing (..)

import Debug exposing (log)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multipleList number =
    let
        numberRange =
            List.range 1 (number - 1)
    in
        numberRange
            |> List.filter
                (\n ->
                    List.any (\multiple -> n % multiple == 0) multipleList
                )
            |> List.sum
