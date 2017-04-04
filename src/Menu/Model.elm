module Menu.Model exposing (..)

import Menu.Label as Label
import Material


type alias Model =
    { current : String
    , mdl : Material.Model
    }


init : Model
init =
    { current = Label.sell
    , mdl = Material.model
    }
