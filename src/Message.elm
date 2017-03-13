module Message exposing (..)

import Menu.Message as MenuMessage
import Material


type Msg
    = Menu MenuMessage.Msg
    | Mdl (Material.Msg Msg)
    | NoOp
