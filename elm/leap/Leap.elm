module Leap exposing (..)


isLeapYear : Int -> Bool
isLeapYear year =
    year % 400 == 0 || (not <| year % 100 == 0) && year % 4 == 0
