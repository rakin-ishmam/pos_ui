module Menu.Msg exposing (..)
import Material

type Msg
    = SelectTab Int
    | Role
    | Logout
    | User
    | Me
    | Mdl (Material.Msg Msg)