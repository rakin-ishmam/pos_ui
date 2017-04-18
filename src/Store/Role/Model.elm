module Store.Role.Model exposing (..)

import Data.Role as Role exposing (Role)
import Data.Id as Id exposing (Id)
import Store.Role.Query as Query exposing (Query)


type Status
    = Loading
    | Nothing


type alias Model =
    { roles : List Role
    , createId : Id
    , updateId : Id
    , query : Query
    , status : Status
    }


model : Model
model =
    { roles = []
    , createId = Id.id
    , updateId = Id.id
    , query = Query.query
    , status = Nothing
    }


nextChunk : Model -> Model
nextChunk modle =
    { model | query = Query.nextChunk model.query }


addRoles : Model -> List Role -> Model
addRoles model roles =
    { model | roles = List.append model.roles roles, status = Nothing }


addCreateId : Model -> Id -> Model
addCreateId model id =
    { model | createId = id, status = Nothing }


loading : Model -> Model
loading model =
    { model | status = Loading }
