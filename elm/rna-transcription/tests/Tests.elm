module Tests exposing (..)

import Test exposing (..)
import Expect
import RNATranscription exposing (toRNA, convertToRNA)


tests : Test
tests =
    describe "RNATranscription"
        [ describe "convertToRNA"
            [ test "convert known DNA" <| \() -> Expect.equal ('C') (convertToRNA 'G')
            , test "ok1" <| \() -> Expect.equal ('X') (convertToRNA 'X')
            ]
        , toRNATests
        ]


toRNATests : Test
toRNATests =
    describe "toRNA"
        [ test "complement of cytosine is guanine" <|
            \() -> Expect.equal (Ok "G") (toRNA "C")
        , test "complement of guanine is cytosine" <|
            \() -> Expect.equal (Ok "C") (toRNA "G")
        , test "complement of thymine is adenine" <|
            \() -> Expect.equal (Ok "A") (toRNA "T")
        , test "complement of adenine is uracil" <|
            \() -> Expect.equal (Ok "U") (toRNA "A")
        , test "complement" <|
            \() -> Expect.equal (Ok "UGCACCAGAAUU") (toRNA "ACGTGGTCTTAA")
        , test "correctly handles completely invalid input" <|
            \() -> Expect.equal (Err 'X') (toRNA "XXX")
        , test "correctly handles partially invalid input" <|
            \() -> Expect.equal (Err 'U') (toRNA "UGAAXXXGACAUG")
        ]
