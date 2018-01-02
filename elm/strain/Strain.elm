module Strain exposing (..)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        first :: rest ->
            if predicate first then
                first :: keep predicate rest
            else
                keep predicate rest

        [] ->
            []


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    case list of
        first :: rest ->
            if not <| predicate first then
                first :: discard predicate rest
            else
                discard predicate rest

        [] ->
            []
