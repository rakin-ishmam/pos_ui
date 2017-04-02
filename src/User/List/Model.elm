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


addSkip : Model -> Model
addSkip modle =
    { model | query = Query.increaseSkip model.query }


addUsers : Model -> List User -> Model
addUsers model users =
    { model | users = List.append model.users users, status = Nothing }


loading : Model -> Model
loading model =
    { model | status = Loading }
