module Role.List.Model exposing (..)

import Material
import Store.Role.Model as Store


type alias Model =
    { store : Store.Model
    , mdl : Material.Model
    }


model : Model
model =
    { store = Store.model
    , mdl = Material.model
    }
