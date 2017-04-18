module Store.Role.Msg exposing (..)

import RemoteData exposing (WebData)
import Data.Role as Role exposing (Role)
import Lib.NewCmd as NewCmd
import Data.Id as Id exposing (Id)


type Msg
    = None
    | OnList (WebData (List Role))
    | OnCreate (WebData Id)
    | OnEdit (WebData Id)
    | FetchList
    | Create Role
    | Edit Role


init : Cmd Msg
init =
    NewCmd.cmd FetchList
