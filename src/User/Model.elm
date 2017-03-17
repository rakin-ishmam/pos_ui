module User.Model exposing (..)

import Material
import User.Data as UserData


type alias Model =
    { view : String
    , mdl : Material.Model
    }


init : Model
init =
    { view = UserData.list
    , mdl = Material.model
    }


tabInd : Model -> Int
tabInd model =
    case UserData.tabInd model.view of
        Just ind ->
            ind
        _ -> 
            -1