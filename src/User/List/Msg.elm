module User.List.Msg exposing (..)

import Material
import Store.User.Msg as StoreMsg


type Msg
    = None
    | Mdl (Material.Msg Msg)
    | Store StoreMsg.Msg


init : Cmd Msg
init =
    Cmd.map Store StoreMsg.init
