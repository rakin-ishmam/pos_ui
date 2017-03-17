module User.View exposing (..)

import User.Msg as Msg exposing (Msg)
import User.Model as Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Material.Tabs as Tabs
import Material.Options as Options
import User.Data as UserData


view : Model -> Html Msg
view model =
    if model.view == UserData.create then
        tabView model
    else if model.view == UserData.list then
        tabView model
    else if model.view == UserData.detail then
        detailView model
    else if model.view == UserData.edit then
        editView model
    else
        div [] []


tabView : Model -> Html Msg
tabView model =
    Tabs.render Msg.Mdl
        [ 0 ]
        model.mdl
        [ Tabs.ripple
        , Tabs.onSelectTab selectTab
        , Tabs.activeTab (activeTab model)
        ]
        [ Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text UserData.list ]
        , Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text UserData.create ]
        ]
        []


activeTab : Model -> Int
activeTab model =
    Model.tabInd model


selectTab : Int -> Msg
selectTab ind =
    case UserData.tabVal ind of
        Just val ->
            if val == UserData.list then
                Msg.Lst
            else if val == UserData.create then
                Msg.Create
            else
                Msg.None

        _ ->
            Msg.None


detailView : Model -> Html Msg
detailView model =
    div [] [ text "detail view" ]


editView : Model -> Html Msg
editView model =
    div [] [ text "edit view" ]
