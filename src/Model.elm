module Model exposing (..)

import Msg exposing (Msg)
import Menu.Model as MenuModel
import Material
import User.Model as UserModel
import Role.Model as RoleModel
import Login.Model as LoginModel
import Native.Storage
import Config


type alias Model =
    { menu : MenuModel.Model
    , user : UserModel.Model
    , role : RoleModel.Model
    , login : LoginModel.Model
    , mdl : Material.Model
    , token : String
    }


model : ( Model, Cmd Msg )
model =
    ( { menu = MenuModel.init
      , user = UserModel.init
      , role = RoleModel.init
      , login = LoginModel.model
      , mdl = Material.model
      , token = Native.Storage.get Config.token
      }
    , Cmd.none
    )
