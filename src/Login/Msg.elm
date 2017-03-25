module Login.Msg exposing (..)

import Material
import RemoteData exposing (WebData)
import Login.Model as Model

type Msg
    = None
    | Mdl (Material.Msg Msg)
    | Username String
    | Password String
    | Login
    | OnToken (WebData Model.Token)

