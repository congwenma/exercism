module Pangram exposing (..)


allCharsList : List String
allCharsList =
    String.split "" "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram str =
    let
        lowerStr =
            String.toLower str
    in
        List.all (\char -> String.contains char lowerStr) allCharsList
