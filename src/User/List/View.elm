module Uset.List.View exposing (..)

import User.List.Model as Model exposing (Model)
import Html exposing (Html, text)
import User.List.Msg as Msg exposing (Msg)
import Material.Table as Table
import Data.User as User exposing (User)


view : Model.Container c -> (Msg -> a) -> Html a
view model msgMap =
    Html.map msgMap <|
        userTable model.list.users


userTable : List User -> Html Msg
userTable users =
    Table.table []
        [ Table.thead []
            [ Table.tr []
                [ Table.th [] [ text "Name" ]
                , Table.th [] [ text "Username" ]
                , Table.th [] [ text "Unit Price" ]
                ]
            ]
        , Table.tbody []
            (users
                |> List.map
                    (\item ->
                        Table.tr []
                            [ Table.td [] [ text item.name ]
                            , Table.td [] [ text item.username ]
                            , Table.td [] [ text item.email ]
                            , Table.td [] [ text item.gender ]
                            , Table.td [] [ text <| list2str item.phone ]
                            , Table.td [] [ text item.address ]
                            ]
                    )
            )
        ]


list2str : List String -> String
list2str lst =
    "test"
