module Role.List.Msg exposing (..)

import Material
import Store.Role.Msg as StoreMsg


type Msg
    = None
    | Mdl (Material.Msg Msg)
    | Store StoreMsg.Msg


init : Cmd Msg
init =
    Cmd.map Store StoreMsg.init
