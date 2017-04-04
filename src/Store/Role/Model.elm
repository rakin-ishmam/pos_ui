module Store.Role.Model exposing (..)

import Data.Role as Role exposing (Role)
import Store.Role.Query as Query exposing (Query)


type Status
    = Loading
    | Nothing


type alias Model =
    { roles : List Role
    , query : Query
    , status : Status
    }


model : Model
model =
    { roles = []
    , query = Query.query
    , status = Nothing
    }


nextChunk : Model -> Model
nextChunk modle =
    { model | query = Query.nextChunk model.query }


addRoles : Model -> List Role -> Model
addRoles model roles =
    { model | roles = List.append model.roles roles, status = Nothing }


loading : Model -> Model
loading model =
    { model | status = Loading }
