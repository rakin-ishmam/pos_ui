module View exposing (..)

import Message exposing (Msg)
import Model exposing (Model)
import Html exposing (Html, h5, div, p, text, table, tr, td, map)
import Html.Attributes exposing (class)
import Material.Grid exposing (grid, cell, offset, size, Device(..))
import Material.Scheme as Scheme
import Material.Color as Color
import Material.Spinner as Loading
import Material.Progress as Loading
import Material.Layout as Layout
import Menu.Message as MenuMessage
import Menu.View as MenuView
import Menu.Model as MenuModel
import List



view : Model -> Html Msg
view model =
    Scheme.topWithScheme Color.Teal Color.Red (myView model)


myView model =
    Layout.render Message.Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.fixedTabs
        , Layout.selectedTab 
            <| MenuModel.tabInd model.menu
        , Layout.onSelectTab selectTab
        ]
        { header = [ Layout.row [] [ Layout.title [] [ text "POS" ] ] ]
        , drawer = List.map test (MenuView.drawerView model.menu)
        , tabs = ( List.map test (MenuView.tabView model.menu), [ Color.background (Color.color Color.Teal Color.S400) ] )
        , main = []
        }


selectTab : Int -> Msg
selectTab ind =
    Message.Menu <|
        MenuMessage.SelectTab ind


test a =
    Html.map Message.Menu a
