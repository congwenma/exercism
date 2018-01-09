module RNATranscription exposing (..)

import Dict


-- NOTE: maybe this needs to produce an error


rnaDictionary : Dict.Dict Char Char
rnaDictionary =
    Dict.fromList
        [ ( 'G', 'C' )
        , ( 'C', 'G' )
        , ( 'T', 'A' )
        , ( 'A', 'U' )
        ]


convertToRNA : Char -> Char
convertToRNA dna =
    Maybe.withDefault 'X' (Dict.get dna rnaDictionary)


toRNA : String -> Result Char String
toRNA dna =
    let
        dnaList : List Char
        dnaList =
            String.toList dna

        rnaList : List Char
        rnaList =
            List.map convertToRNA dnaList

        containsInvalid =
            List.any (\n -> n == 'X') rnaList

        containsValid =
            List.any (\n -> Dict.member n rnaDictionary) rnaList
    in
        if containsInvalid then
            if containsValid then
                Err 'U'
            else
                Err 'X'
        else
            rnaList
                |> List.map String.fromChar
                |> String.join ""
                |> Ok
