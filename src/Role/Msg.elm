module Role.Msg exposing (..)

import Material
import Role.List.Msg as RoleMsg


type Msg
    = None
    | Create
    | Lst
    | Detail String
    | Edit String
    | Mdl (Material.Msg Msg)
    | RoleList RoleMsg.Msg
