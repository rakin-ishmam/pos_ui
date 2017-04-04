module User.Msg exposing (..)

import Material
import User.List.Msg as UserMsg


type Msg
    = None
    | Create
    | Lst
    | Detail String
    | Edit String
    | Mdl (Material.Msg Msg)
    | UserList UserMsg.Msg


init : Msg
init =
    Lst
