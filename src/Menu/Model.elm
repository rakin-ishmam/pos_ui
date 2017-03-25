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


tabInd : Model -> Int
tabInd model =
    case Label.tabInd model.current of
        Just ind ->
            ind

        _ ->
            -1


tabVal : Int -> String
tabVal ind =
    case Label.tabVal ind of
        Just val ->
            val

        _ ->
            ""
