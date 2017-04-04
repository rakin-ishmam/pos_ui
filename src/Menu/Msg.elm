module Menu.Msg exposing (..)

import Material


type Msg
    = Product
    | Sell
    | Order
    | Report
    | Role
    | Logout
    | User
    | Me
    | Mdl (Material.Msg Msg)
