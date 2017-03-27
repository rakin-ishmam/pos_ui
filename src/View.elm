module View exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Html.Attributes exposing (class)
import Material.Grid exposing (grid, cell, offset, size, Device(..))
import Material.Scheme as Scheme
import Material.Color as Color
import Material.Spinner as Loading
import Material.Progress as Loading
import Material.Layout as Layout
import Menu.Msg as MenuMsg
import Menu.View as MenuView
import User.View as UserView
import Menu.Model as MenuModel
import Menu.Label as MenuLabel
import Login.View as LoginView
import List
import String


view : Model -> Html Msg
view model =
    if String.length model.token > 0 then
        Scheme.topWithScheme Color.Teal Color.Red (appView model)
    else
        Scheme.topWithScheme Color.Teal Color.Red <|
            loginView <|
                model


loginView : Model -> Html Msg
loginView model =
    Layout.render Msg.Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.fixedTabs
        ]
        { header = [ Layout.row [] [ Layout.title [] [ text "Karkhana" ] ] ]
        , drawer = []
        , tabs = ( [], [] )
        , main =
            [ LoginView.view model Msg.Login
            ]
        }


appView model =
    Layout.render Msg.Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.fixedTabs
        , Layout.selectedTab <|
            MenuModel.tabInd model.menu
        , Layout.onSelectTab selectTab
        ]
        { header = [ Layout.row [] [ Layout.title [] [ text "Karkhana" ] ] ]
        , drawer =
            List.map (Html.map Msg.Menu) <|
                MenuView.drawerView model.menu
        , tabs =
            ( List.map (Html.map Msg.Menu) <|
                MenuView.tabView model.menu
            , [ Color.background <|
                    Color.color Color.Teal Color.S400
              ]
            )
        , main =
            [ pickView model
            ]
        }


pickView : Model -> Html Msg
pickView model =
    let
        cur =
            model.menu.current
    in
        if cur == MenuLabel.user then
            Html.map Msg.User (UserView.view model.user)
        else
            div [] []


selectTab : Int -> Msg
selectTab ind =
    Msg.Menu <|
        MenuMsg.SelectTab ind
