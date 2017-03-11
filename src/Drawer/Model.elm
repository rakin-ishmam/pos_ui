module Drawer.Model exposing (..)


type alias Model =
    { selected : String }


init : Model
init =
    { selected = "" }
