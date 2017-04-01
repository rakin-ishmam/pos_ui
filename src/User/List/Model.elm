module User.List.Model exposing (..)

import Data.User as User exposing (User)
import Material
import User.List.Query as Query exposing (Query)


type Status
    = Loading
    | Nothing


type alias Model =
    { users : List User
    , query : Query
    , status : Status
    , mdl : Material.Model
    }


model : Model
model =
    { users = []
    , query = Query.query
    , status = Nothing
    , mdl = Material.model
    }


type alias Container c =
    { c
        | list : Model
    }


addUsers : Model -> List User -> Model
addUsers model users =
    { model | users = List.append model.users users }
