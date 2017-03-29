module User.Model exposing (..)

import Material
import User.Label as Label


type alias Model =
    { view : String
    , mdl : Material.Model
    }


init : Model
init =
    { view = Label.list
    , mdl = Material.model
    }


tabInd : Model -> Int
tabInd model =
    case Label.tabInd model.view of
        Just ind ->
            ind
        _ -> 
            -1