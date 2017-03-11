module Tab.Message exposing (..)

import Material

type Msg
    = SelectTab Int
    | SelectView ViewSelection
    | Mdl (Material.Msg Msg)

type ViewSelection
    = None
    | Product
    | Sell
    | Order
    | Report