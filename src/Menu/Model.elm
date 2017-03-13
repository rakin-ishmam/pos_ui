module Menu.Model exposing (..)

import Menu.Data as Data
import Material


type alias Model =
    { current : String
    , mdl : Material.Model
    }


init : Model
init =
    { current = Data.sell
    , mdl = Material.model
    }


tabInd : Model -> Int
tabInd model =
    case Data.tabInd model.current of
        Just ind ->
            ind

        _ ->
            -1


tabVal : Int -> String
tabVal ind =
    case Data.tabVal ind of
        Just val ->
            val

        _ ->
            ""
