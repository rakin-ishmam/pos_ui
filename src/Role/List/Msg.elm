module Role.List.Msg exposing (..)

import Material
import RemoteData exposing (WebData)
import Data.Role as Role exposing (Role)
import Lib.NewCmd as NewCmd


type Msg
    = None
    | Mdl (Material.Msg Msg)
    | OnList (WebData (List Role))
    | FetchList


init : Cmd Msg
init =
    NewCmd.cmd FetchList
