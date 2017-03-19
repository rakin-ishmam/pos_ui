module Login.Msg exposing (..)

import Material


type Msg
    = None
    | MdlUsername (Material.Msg Msg)
    | MdlPassword (Material.Msg Msg)
