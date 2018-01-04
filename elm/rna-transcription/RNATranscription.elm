module RNATranscription exposing (..)

import Dict

-- NOTE: maybe this needs to produce an error
rnaDictionary : Dict.Dict Char Char
rnaDictionary =
    Dict.fromList
        [ ( 'G'
          , 'C'
          )
        , ( 'C'
          , 'G'
          )
        , ( 'T'
          , 'A'
          )
        , ( 'A'
          , 'U'
          )
        ]


convertToRNA : Char -> Char
convertToRNA dna =
    Maybe.withDefault dna <| Dict.get dna rnaDictionary


toRNA : String -> Result error String
toRNA str = Ok "fake"
-- toRNA dna =
--     let
--         dnaList =
--             String.split "" dna

--         maybeDna =
--             Just <| String.join "" (dnaList |>
--             String.map convertToRNA)
--     in
--         case maybeDna of
--             Just dna ->
--                 Ok dna
--             Nothing ->
--                 Err "X"
