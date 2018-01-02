module WordCount exposing (..)

import Dict exposing (..)
import Regex
import Debug exposing (..)
import Array


wordRegex =
    Regex.regex "[^a-z0-9]*"


emptyString str =
    ""


formulateSet : String -> List ( String, Int ) -> List ( String, Int )
formulateSet newWord list =
    let
        found : List ( String, Int )
        found =
            Debug.log "------found--------" <| List.filter (\n -> Tuple.first n == newWord) list
    in
        case found of
            [] ->
                ( newWord, 1 ) :: list

            _ ->
                let
                    dinfo =
                        Debug.log "******word******" newWord

                    newCount =
                        (Debug.log "******newCount******" <| (List.foldl (\tup acc -> Tuple.second tup) 0 found)) + 1

                    listWithoutWord =
                        Debug.log "***** listWithoutWord ******" <| List.filter (\tup -> not <| List.member tup found) list
                in
                    ( newWord, newCount ) :: listWithoutWord


wordCount : String -> Dict String Int
wordCount string =
    let
        cleanList =
            log "********cleanlist" <|
                (List.filter (\s -> not (String.isEmpty s))
                    ((List.map (\word -> Regex.replace Regex.All wordRegex emptyString word)
                        << String.split " "
                     )
                        (String.toLower string)
                    )
                )
    in
        Dict.fromList
            (List.foldl formulateSet [] cleanList)



-- Dict.fromList
-- [ ( "hello", 1 )
-- ]
