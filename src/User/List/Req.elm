module User.List.Req exposing (..)

import User.List.Msg as Msg exposing (..)
import User.List.Query as Query exposing (Query)
import Data.User as User exposing (User)
import Http
import Lib.Request as Request


loginUrl : Query -> String
loginUrl query =
    "/api/user/list?" ++ (Query.toURL query)


fetchList : Query -> Cmd Msg
fetchList query =


fetchListRequest : Query -> Http.Request (List User)
fetchListRequest query =
    Request.get [] (Http.expectJson User.listDecoder) (loginUrl query)
