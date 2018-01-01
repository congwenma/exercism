module Triangle exposing (..)

import Result exposing (Result(..))


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind s1 s2 s3 =
    if s1 <= 0 || s2 <= 0 || s3 <= 0 then
        Err "Invalid lengths"
    else if (s1 + s2 <= s3) || (s2 + s3 <= s1) || (s1 + s3 <= s2) then
        Err "Violates inequality"
    else if s1 == s2 && s2 == s3 then
        Ok Equilateral
    else if s1 == s2 || s2 == s3 || s3 == s1 then
        Ok Isosceles
    else
        Ok Scalene
