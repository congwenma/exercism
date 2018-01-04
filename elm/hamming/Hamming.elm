module Hamming exposing (..)


compare : List String -> List String -> Int -> Maybe Int
compare listA listB accumulation =
    case ( listA, listB ) of
        ( [], [] ) ->
            Just accumulation

        ( headListA :: tailListA, headListB :: tailListB ) ->
            if headListA /= headListB then
                compare tailListA tailListB (accumulation + 1)
            else
                compare tailListA tailListB accumulation

        ( _ :: _, [] ) ->
            Nothing

        ( [], _ :: _ ) ->
            Nothing


distance : String -> String -> Maybe Int
distance strandA strandB =
    compare
        (String.split "" strandA)
        (String.split "" strandB)
        0
