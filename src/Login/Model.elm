module Login.Model exposing (..)

import Material
import RemoteData exposing (WebData)
import Login.Login as Login exposing (Login)


type alias Token =
    { token : String }


type alias Model =
    { login : Login
    , mdl : Material.Model
    , token : WebData Token
    }


model : Model
model =
    { login = Login.login
    , mdl = Material.model
    , token = RemoteData.NotAsked
    }


setLogin : Model -> Login -> Model
setLogin model login =
    { model | login = login }


setToken : Model -> WebData Token -> Model
setToken model token =
    { model | token = token }


type alias Container c =
    { c | login : Model }
