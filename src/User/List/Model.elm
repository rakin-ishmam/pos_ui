module User.List.Model exposing (..)

import Material
import Store.User.Model as Store


type alias Model =
    { store : Store.Model
    , mdl : Material.Model
    }


model : Model
model =
    { store = Store.model
    , mdl = Material.model
    }
