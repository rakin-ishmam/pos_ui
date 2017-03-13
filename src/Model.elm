module Model exposing (..)

import Message exposing (Msg)
import Menu.Model as MenuModel
import Material


type alias Model =
    { menu : MenuModel.Model
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { menu = MenuModel.init
      , mdl = Material.model
      }
    , Cmd.none
    )
