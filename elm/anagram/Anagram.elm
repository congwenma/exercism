module Anagram exposing (..)

import Debug exposing (..)


isAnagram : String -> String -> Bool
isAnagram target word =
    let
        lowerTarget =
            String.toLower target

        lowerWord =
            String.toLower word
    in
        sortListWord lowerTarget == sortListWord lowerWord && lowerTarget /= lowerWord


sortListWord : String -> List Char
sortListWord word =
    word |> String.toList |> List.sort


detect : String -> List String -> List String
detect target words =
    List.filter (isAnagram target) words
