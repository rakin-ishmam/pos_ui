module Msg exposing (..)

import Menu.Msg as MenuMsg
import User.Msg as UserMsg
import Login.Msg as LoginMsg
import Material


type Msg
    = Menu MenuMsg.Msg
    | User UserMsg.Msg
    | Login LoginMsg.Msg
    | Mdl (Material.Msg Msg)
    | NoOp
