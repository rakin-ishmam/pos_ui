module Model exposing (..)

import Message exposing (Msg)
import Tab.Model as TabModel
import Drawer.Model as DrawerModel
import Material


type alias Model =
    { tab : TabModel.Model
    , drawer : DrawerModel.Model
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { tab = TabModel.init
      , drawer = DrawerModel.init
      , mdl = Material.model
      }
    , Cmd.none
    )
