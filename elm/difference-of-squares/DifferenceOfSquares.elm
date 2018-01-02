module DifferenceOfSquares exposing (..)

import Debug


rangeTo =
    List.range 0


squareOfSum n =
    (rangeTo n
        |> List.foldl (+) 0
    )
        ^ 2


sumOfSquares n =
    rangeTo n
        |> List.map (\n -> n ^ 2)
        |> List.foldl (+) 0


difference n =
    squareOfSum n - sumOfSquares n
