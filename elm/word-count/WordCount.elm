module WordCount exposing (..)

import Dict exposing (..)
import Regex
import Debug exposing (..)
import Array


parseWords : String -> List String
parseWords =
    List.map (\v -> String.toLower (v.match))
        << Regex.find Regex.All (Regex.regex "\\w+")


wordCount : String -> Dict String Int
wordCount string =
    List.foldl
        (\k acc ->
            if not (Dict.member k acc) then
                Dict.insert k 1 acc
            else
                Dict.update k
                    (Maybe.map ((+) 1))
                    acc
        )
        Dict.empty
        (parseWords string)
