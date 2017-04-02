module Role.List.View exposing (view)

import Role.List.Model as Model exposing (Model)
import Html exposing (Html, text)
import Role.List.Msg as Msg exposing (Msg)
import Material.Table as Table
import Data.Role as Role exposing (Role)
import Material.Options as Options
import String
import Debug


view : Model -> Html Msg
view model =
    userTable model.roles


userTable : List Role -> Html Msg
userTable roles =
    Table.table [ Options.css "width" "100%" ]
        [ Table.thead []
            [ Table.tr []
                [ Table.th [] [ text "Name" ]
                , Table.th [] [ text "User Access" ]
                , Table.th [] [ text "Role Access" ]
                ]
            ]
        , Table.tbody []
            (roles
                |> List.map
                    (\item ->
                        Table.tr []
                            [ Table.td [] [ text item.name ]
                            , Table.td [] [ text <| String.join "," (Debug.log "test" item.userAccess) ]
                            , Table.td [] [ text <| String.join "," item.roleAccess ]
                            ]
                    )
            )
        ]


list2str : List String -> String
list2str lst =
    "test"
