module Sublist exposing (..)

import Debug exposing (..)


version : Int
version =
    2


sublist : List Int -> List Int -> ListComparison
sublist list1 list2 =
    compareList list1 list2


examineRemaining : List a -> a -> List a -> List a
examineRemaining list item accu =
    case list of
        head :: restList ->
            if item == head then
                List.append accu restList
            else
                examineRemaining restList item (List.append accu [ head ])

        [] ->
            accu


filterFirstFromList : List a -> a -> List a
filterFirstFromList list item =
    examineRemaining list item []


compareList : List Int -> List Int -> ListComparison
compareList list1 list2 =
    case ( list1, list2 ) of
        ( head1 :: restList1, head2 :: restList2 ) ->
            let
                debHead1 =
                    Debug.log "head1*******"

                debHead2 =
                    Debug.log "head2*******"
            in
                if List.member head1 list2 then
                    compareList restList1 (filterFirstFromList list2 head1)
                else if List.member head2 list1 then
                    compareList (filterFirstFromList list1 head2) restList2
                else
                    Unequal

        ( head1 :: restList1, [] ) ->
            Superlist

        ( [], head2 :: restList2 ) ->
            let
                head2Info =
                    Debug.log "head2*******"
            in
                Sublist

        ( [], [] ) ->
            Equal


type ListComparison
    = Superlist
    | Sublist
    | Unequal
    | Equal



-- TODO: Also use set for solution
