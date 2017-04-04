module User.View exposing (..)

import User.Msg as Msg exposing (Msg)
import User.Model as Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Material.Typography as Typo
import Material.Options as Options
import User.Label as Label
import Material.Grid as Grid
import Material.Chip as Chip
import Material.Grid as Grid
import User.List.View as UserView


view : Model -> Html Msg
view model =
    if model.view == Label.create then
        gridView model <| div [] [ text "create" ]
    else if model.view == Label.list then
        gridView model <|
            Html.map Msg.UserList <|
                UserView.view model.list
    else if model.view == Label.detail then
        detailView model
    else if model.view == Label.edit then
        editView model
    else
        div [] []


gridView : Model -> Html Msg -> Html Msg
gridView model child =
    Options.div [ Options.css "width" "100%" ] [ child ]


detailView : Model -> Html Msg
detailView model =
    Grid.grid []
        [ Grid.cell [ Grid.size Grid.All 3 ]
            [ Options.styled p [ Typo.title ] [ text "Detail" ] ]
        , Grid.cell [ Grid.offset Grid.All 8, Grid.size Grid.All 1 ]
            [ Chip.span
                [ Chip.deleteIcon "cancel" ]
                [ Chip.content []
                    [ text "Cancel" ]
                ]
            ]
        ]


editView : Model -> Html Msg
editView model =
    Grid.grid []
        [ Grid.cell [ Grid.size Grid.All 3 ]
            [ Options.styled p [ Typo.title ] [ text "Edit" ] ]
        , Grid.cell [ Grid.offset Grid.All 8, Grid.size Grid.All 1 ]
            [ Chip.span
                [ Chip.deleteIcon "cancel" ]
                [ Chip.content []
                    [ text "Cancel" ]
                ]
            ]
        ]
