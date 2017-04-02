module Login.Login exposing (..)


type alias Login =
    { username : String
    , password : String
    }


login : Login
login =
    { username = ""
    , password = ""
    }


setUsername : Login -> String -> Login
setUsername login username =
    { login | username = username }


setPassword : Login -> String -> Login
setPassword login password =
    { login | password = password }
