module Message exposing (..)

import Tab.Message as TabMessage
import Drawer.Message as DrawerMessage
import Material


type Msg
    = Tab TabMessage.Msg
    | Drawer DrawerMessage.Msg
    | SelectTab Int
    | Mdl (Material.Msg Msg)
    | NoOp
