module User.List.Model exposing (..)

import Data.User as User exposing (User)


type Status
    = Loading
    | Nothing


type alias Model =
    { users : List User
    , skip : Int
    , status : Status
    }


model : Model
model =
    { users = []
    , skip = 0
    , status = Nothing
    }


addUsers : Model -> List User -> Model
addUsers model users =
    { model | users = List.append model.users users }


addSkip : Model -> Int -> Model
addSkip model skip =
    { model | skip = model.skip + skip }
