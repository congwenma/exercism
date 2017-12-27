module Bob exposing (..)

import Regex
import Debug exposing (log)


hey str =
    let
        item =
            toString <| Regex.contains (Regex.regex "!") str
    in
        if String.isEmpty <| String.trim str then
            "Fine. Be that way!"
        else if Regex.contains (Regex.regex "[a-z0-9]+.*\\?$") str then
            "Sure."
        else if
            Regex.contains (Regex.regex "[^a-z]+[!\\?]+$") str
                || Regex.contains (Regex.regex "^[A-Z ]+$") str
        then
            "Whoa, chill out!"
        else
            "Whatever."
