module User.List.View exposing (view)

import User.List.Model as Model exposing (Model)
import Html exposing (Html, text)
import User.List.Msg as Msg exposing (Msg)
import Material.Table as Table
import Data.User as User exposing (User)
import Material.Options as Options


view : Model -> Html Msg
view model =
    userTable model.users


userTable : List User -> Html Msg
userTable users =
    Table.table [ Options.css "width" "100%" ]
        [ Table.thead []
            [ Table.tr []
                [ Table.th [] [ text "Name" ]
                , Table.th [] [ text "Username" ]
                , Table.th [] [ text "Emal" ]
                , Table.th [] [ text "Gender" ]
                , Table.th [] [ text "Phone" ]
                , Table.th [] [ text "Address" ]
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
