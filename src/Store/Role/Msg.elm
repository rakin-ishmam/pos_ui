module Store.Role.Msg exposing (..)

import RemoteData exposing (WebData)
import Data.Role as Role exposing (Role)
import Lib.NewCmd as NewCmd


type Msg
    = None
    | OnList (WebData (List Role))
    | FetchList


init : Cmd Msg
init =
    NewCmd.cmd FetchList
