module Raindrops exposing (..)

import Array
import Debug exposing (log)


raindrops : Int -> String
raindrops num =
    let
        factor357 : List ( String, Bool )
        factor357 =
            [ ( "Pling", num % 3 == 0 )
            , ( "Plang", num % 5 == 0 )
            , ( "Plong", num % 7 == 0 )
            ]

        factorKeys : List String
        factorKeys =
            List.map Tuple.first <| List.filter (\( name, isFactor ) -> isFactor) factor357
    in
        if List.isEmpty factorKeys then
            toString num
        else
            String.join "" factorKeys
