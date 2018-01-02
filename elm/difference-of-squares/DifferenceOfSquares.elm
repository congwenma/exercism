module DifferenceOfSquares exposing (..)

import Debug


rangeTo =
    List.range 0


sum =
    List.foldl (+) 0


square =
    flip (^) 2


squareOfSum =
    square << sum << rangeTo


sumOfSquares =
    sum << List.map square << rangeTo


difference n =
    squareOfSum n - sumOfSquares n
