module Message exposing (..)

import Menu.Message as MenuMessage
import User.Message as UserMessage
import Material


type Msg
    = Menu MenuMessage.Msg
    | User UserMessage.Msg
    | Mdl (Material.Msg Msg)
    | NoOp
