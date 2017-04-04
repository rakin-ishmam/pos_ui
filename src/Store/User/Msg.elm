module Store.User.Msg exposing (..)

import RemoteData exposing (WebData)
import Data.User as User exposing (User)
import Lib.NewCmd as NewCmd


type Msg
    = None
    | OnList (WebData (List User))
    | FetchList


init : Cmd Msg
init =
    NewCmd.cmd FetchList
