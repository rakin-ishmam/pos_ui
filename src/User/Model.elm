module User.Model exposing (..)

import Material


type alias Model =
    { view : String
    , mdl : Material.Model
    }


init : Model
init =
    { view = listView
    , mdl = Material.model
    }


createView : String
createView =
    "Create"


listView : String
listView =
    "List"


detailView : String
detailView =
    "Detail"


editView : String
editView =
    "Edit"
