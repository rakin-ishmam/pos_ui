module Login.Model exposing (Model, init)

import Material


type alias ProxyMdl =
    { mdl : Material.Model
    }


proxyInit : ProxyMdl
proxyInit =
    { mdl = Material.model
    }


type alias Model =
    { username : String
    , mdlUsername : ProxyMdl
    , mdlPassword : ProxyMdl
    , password : String
    }


init : Model
init =
    { username = ""
    , password = ""
    , mdlUsername = proxyInit
    , mdlPassword = proxyInit
    }
