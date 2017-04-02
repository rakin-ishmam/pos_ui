module Role.List.Model exposing (..)

import Data.Role as Role exposing (Role)
import Material
import Role.List.Query as Query exposing (Query)


type Status
    = Loading
    | Nothing


type alias Model =
    { roles : List Role
    , query : Query
    , status : Status
    , mdl : Material.Model
    }


model : Model
model =
    { roles = []
    , query = Query.query
    , status = Nothing
    , mdl = Material.model
    }


addSkip : Model -> Model
addSkip modle =
    { model | query = Query.increaseSkip model.query }


addRoles : Model -> List Role -> Model
addRoles model roles =
    { model | roles = List.append model.roles roles, status = Nothing }


loading : Model -> Model
loading model =
    { model | status = Loading }
