module Tab.Model exposing (..)

import Material


type alias Model =
    { mdl : Material.Model
    , tab : Int
    }


init : Model
init =
    { mdl = Material.model
    , tab = 0
    }