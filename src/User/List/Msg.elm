module User.List.Msg exposing (..)

import Material
import RemoteData exposing (WebData)
import Data.User as User exposing (User)
import Lib.NewCmd as NewCmd


type Msg
    = None
    | Mdl (Material.Msg Msg)
    | OnList (WebData (List User))
    | FetchList


init : Cmd Msg
init =
    NewCmd.cmd FetchList
