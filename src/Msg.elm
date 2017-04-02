module Msg exposing (..)

import Menu.Msg as MenuMsg
import User.Msg as UserMsg
import Role.Msg as RoleMsg
import Login.Msg as LoginMsg
import Material


type Msg
    = Menu MenuMsg.Msg
    | User UserMsg.Msg
    | Role RoleMsg.Msg
    | Login LoginMsg.Msg
    | Mdl (Material.Msg Msg)
    | Token String
    | NoOp
