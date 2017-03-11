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
import Tab.View as TabView
import Tab.Message as TabMessage
import Drawer.View as DrawerView
import Drawer.Message as DrawerMessage
import List

view : Model -> Html Msg
view model =
    Scheme.topWithScheme Color.Teal Color.Red (myView model)


myView model =
    Layout.render Message.Mdl model.mdl
  [ Layout.fixedHeader
  , Layout.fixedTabs
  , Layout.selectedTab model.tab.tab
  , Layout.onSelectTab Message.SelectTab
  ]
  { header = [ Layout.row [] [ Layout.title [] [text "POS"] ] ]
  , drawer = List.map test2 (DrawerView.view model.drawer) 
  , tabs = (List.map test (TabView.view model.tab), [ Color.background (Color.color Color.Teal Color.S400) ])
  , main = [  ]
  }


test a =
    Html.map Message.Tab a

test2 a =
    Html.map Message.Drawer a
