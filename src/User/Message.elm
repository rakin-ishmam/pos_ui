module User.Message exposing (..)

import Material


type Msg
    = None
    | Create
    | Lst
    | Detail String
    | Edit String
    | Mdl (Material.Msg Msg)
