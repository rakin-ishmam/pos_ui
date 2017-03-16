module User.View exposing (..)

import User.Message as Message exposing (Msg)
import User.Model as Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Material.Tabs as Tabs
import Material.Options as Options


view : Model -> Html Msg
view model =
    if model.view == Model.createView then
        tabView model
    else if model.view == Model.listView then
        tabView model
    else if model.view == Model.detailView then
        detailView model
    else if model.view == Model.editView then
        tabView model
    else
        div [] []



-- style={{width: 200, float: 'left'}}


tabView : Model -> Html Msg
tabView model =
    Tabs.render Message.Mdl
        [ 0 ]
        model.mdl
        [ Tabs.ripple
        , Tabs.onSelectTab selectTab
        , Tabs.activeTab (activeTab model)
        ]
        [ Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text Model.listView ]
        , Tabs.label
            [ Options.center, Options.css "width" "50%" ]
            [ text Model.createView ]
        ]
        []


activeTab : Model -> Int
activeTab model =
    if model.view == Model.createView || model.view == Model.editView then
        1
    else
        0


selectTab : Int -> Msg
selectTab ind =
    case ind of
        0 ->
            Message.Lst

        1 ->
            Message.Create

        _ ->
            Message.None


detailView : Model -> Html Msg
detailView model =
    div [] [ text "detail view" ]
