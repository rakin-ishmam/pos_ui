module Tab.View exposing (..)

import Tab.Message as Message
import Tab.Model exposing (Model)
import Html exposing (Html, div, ul, li, text, a, h3, td, map, span)
import Html.Attributes exposing (class)
import Material.Tabs as Tabs
import Material.Options as Options
import Material.Icon as Icon
import Material.Color as Color
import Tab.Data as Data
import Array

view : Model -> List (Html Message.Msg) 
view model =
    Array.toList
        <| Array.map dataToView Data.tabList


dataToView tab =
    text tab.name
