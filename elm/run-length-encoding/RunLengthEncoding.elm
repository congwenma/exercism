module RunLengthEncoding exposing (..)

import Regex exposing (regex)
import Debug exposing (..)


version : Int
version =
    2


toInt string =
    String.toInt string |> Result.toMaybe |> Maybe.withDefault 0


decodeHelper : String -> String
decodeHelper str =
    let
        count =
            String.toInt <| String.dropRight 1 str

        letter =
            String.right 1 str
    in
        if String.length str < 2 then
            str
        else
            case count of
                Ok ct ->
                    String.repeat ct letter

                Err msg ->
                    msg


decode : String -> String
decode str =
    let
        result =
            log "$$$$$$$$$$$$_Decode" <|
                Regex.replace Regex.All
                    (Regex.regex "[0-9]*[A-Za-z \\u0000-\\uFFFF]{1}")
                    (\match ->
                        decodeHelper match.match
                    )
                    str
    in
        result


encode : String -> String
encode str =
    let
        data =
            encodeHelper (String.split "" str) []

        result =
            List.foldl
                (\tup accu ->
                    let
                        ( fir, sec ) =
                            tup
                    in
                        case sec of
                            1 ->
                                accu ++ (fir)

                            _ ->
                                accu ++ (toString sec) ++ (fir)
                )
                ""
                data
    in
        result


encodeHelper : List String -> List ( String, Int ) -> List ( String, Int )
encodeHelper letterList result =
    case letterList of
        [] ->
            result

        letter :: rest ->
            let
                allTupleExceptLast =
                    List.take ((List.length result) - 1) result

                lastTupleInList =
                    List.drop ((List.length result) - 1) result

                lastTupleCount =
                    List.map Tuple.second lastTupleInList |> List.sum
            in
                if (List.map (\n -> Tuple.first n) lastTupleInList) == [ letter ] then
                    encodeHelper rest (List.append allTupleExceptLast [ ( letter, lastTupleCount + 1 ) ])
                else
                    encodeHelper rest (List.append result [ ( letter, 1 ) ])
