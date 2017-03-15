module Model exposing (..)

import Message exposing (Msg)
import Menu.Model as MenuModel
import Material
import User.Model as UserModel


type alias Model =
    { menu : MenuModel.Model
    , user : UserModel.Model
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { menu = MenuModel.init
      , user = UserModel.init
      , mdl = Material.model
      }
    , Cmd.none
    )
