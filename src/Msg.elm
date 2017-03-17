module Msg exposing (..)

import Menu.Msg as MenuMsg
import User.Msg as UserMsg
import Material


type Msg
    = Menu MenuMsg.Msg
    | User UserMsg.Msg
    | Mdl (Material.Msg Msg)
    | NoOp
