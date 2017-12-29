module Accumulate exposing (..)


accumulate : (a -> a) -> List a -> List a
accumulate fn input =
    List.map fn input
