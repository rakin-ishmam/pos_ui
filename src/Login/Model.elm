module Login.Model exposing (Model, model, Token, Login)

import Material
import RemoteData exposing (WebData)


type alias Login =
    { username : String
    , password : String
    }


login : Login
login =
    { username = ""
    , password = ""
    }


type alias Token =
    { token : String }


type alias Model =
    { login : Login
    , mdl : Material.Model
    , token : WebData Token
    }


model : Model
model =
    { login = login
    , mdl = Material.model
    , token = RemoteData.NotAsked
    }
