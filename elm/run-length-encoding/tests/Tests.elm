module Tests exposing (..)

import Test exposing (..)
import Expect
import RunLengthEncoding exposing (version, decode, encode, encodeHelper, decodeHelper)
import Debug exposing (..)


tests : Test
tests =
    describe "RunLengthEncoding"
        [ describe "encodeHelper"
            [ test "works" <| \() -> Expect.equal [ ( "A", 2 ), ( "B", 3 ), ( "C", 4 ) ] (encodeHelper (String.split "" "AABBBCCCC") [])
            ]
        , describe "decodeHelper"
            [ test "works" <| \() -> Expect.equal "AAA" (decodeHelper "3A")
            , test "works with a single" <| \() -> Expect.equal "A" (decodeHelper "A")
            ]
        , test "the solution is for the correct version of the test" <|
            \() -> Expect.equal 2 version
        , test "encode simple" <|
            \() -> Expect.equal "2A3B4C" (encode "AABBBCCCC")
        , test "decode simple" <|
            \() -> Expect.equal "AABBBCCCC" (decode "2A3B4C")
        , test "encode with single values" <|
            \() ->
                Expect.equal "12WB12W3B24WB"
                    (encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
        , test "decode with single values" <|
            \() ->
                Expect.equal "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
                    (log "RESULTS" <| decode "12WB12W3B24WB")
        , test "(decode (encode (...)) combination" <|
            \() ->
                Expect.equal "zzz ZZ  zZ"
                    (decode (encode "zzz ZZ  zZ"))
        , test "decode with a x10 value" <|
            \() ->
                Expect.equal "WWWWWWWWWW"
                    (decode "10W")
        , test "encode unicode" <|
            \() -> Expect.equal "⏰3⚽2⭐⏰" (encode "⏰⚽⚽⚽⭐⭐⏰")
        , test "decode unicode" <|
            \() -> Expect.equal "⏰⚽⚽⚽⭐⭐⏰" (decode "⏰3⚽2⭐⏰")
        ]
