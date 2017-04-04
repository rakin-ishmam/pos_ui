module User.Model exposing (..)

import Material
import User.Label as Label
import User.List.Model as ListModel


type alias Model =
    { view : String
    , mdl : Material.Model
    , list : ListModel.Model
    }


init : Model
init =
    { view = Label.list
    , mdl = Material.model
    , list = ListModel.model
    }
