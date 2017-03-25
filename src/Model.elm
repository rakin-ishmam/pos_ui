module Model exposing (..)

import Msg exposing (Msg)
import Menu.Model as MenuModel
import Material
import User.Model as UserModel
import Login.Model as LoginModel


type alias Model =
    { menu : MenuModel.Model
    , user : UserModel.Model
    , login : LoginModel.Model
    , mdl : Material.Model
    }


model : ( Model, Cmd Msg )
model =
    ( { menu = MenuModel.init
      , user = UserModel.init
      , login = LoginModel.model
      , mdl = Material.model
      }
    , Cmd.none
    )
