module User.List.Msg exposing (..)

import Material
import RemoteData exposing (WebData)
import Data.User as User exposing (User)


type Msg
    = None
    | Mdl (Material.Msg Msg)
    | OnList (WebData (List User))
    | FetchList
