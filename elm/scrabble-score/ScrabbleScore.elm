module ScrabbleScore exposing (..)


point1 =
    [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ]


point2 =
    [ "D", "G" ]


point3 =
    [ "B", "C", "M", "P" ]


point4 =
    [ "F", "H", "V", "W", "Y" ]


point5 =
    [ "K" ]


point8 =
    [ "J", "X" ]


point10 =
    [ "Q", "Z" ]


scoreLetter : String -> Int
scoreLetter letter =
    if List.member letter point1 then
        1
    else if List.member letter point2 then
        2
    else if List.member letter point3 then
        3
    else if List.member letter point4 then
        4
    else if List.member letter point5 then
        5
    else if List.member letter point8 then
        8
    else if List.member letter point10 then
        10
    else
        0


scoreWord : String -> Int
scoreWord word =
    List.foldr (\letter total -> (scoreLetter letter) + total) 0 (String.split "" <| String.toUpper word)
