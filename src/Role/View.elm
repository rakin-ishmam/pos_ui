module Role.View exposing (..)

import Role.Msg as Msg exposing (Msg)
import Role.Model as Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Material.Tabs as Tabs
import Material.Typography as Typo
import Material.Options as Options
import Role.Label as Label
import Material.Grid as Grid
import Material.Chip as Chip
import Role.List.View as RoleView


view : Model -> Html Msg
view model =
    if model.view == Label.create then
        tabView model <| div [] [ text "create" ]
    else if model.view == Label.list then
        tabView model <|
            Html.map Msg.RoleList <|
                RoleView.view model.list
    else if model.view == Label.detail then
        detailView model
    else if model.view == Label.edit then
        editView model
    else
        div [] []


tabView : Model -> Html Msg -> Html Msg
tabView model child =
    Tabs.render Msg.Mdl
        [ 0 ]
        model.mdl
        [ Tabs.ripple
        , Tabs.onSelectTab selectTab
        , Tabs.activeTab (activeTab model)
        ]
        [ Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text Label.list ]
        , Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text Label.create ]
        ]
        [ child ]


activeTab : Model -> Int
activeTab model =
    Model.tabInd model


selectTab : Int -> Msg
selectTab ind =
    case Label.tabVal ind of
        Just val ->
            if val == Label.list then
                Msg.Lst
            else if val == Label.create then
                Msg.Create
            else
                Msg.None

        _ ->
            Msg.None


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
