module Store.User.Req exposing (fetchList)

import Store.User.Msg as Msg exposing (..)
import Store.User.Query as Query exposing (Query)
import Data.User as User exposing (User)
import Http
import Lib.Request as Request
import RemoteData


listUrl : Query -> String
listUrl query =
    "/api/user/list?" ++ (Query.toURL query)


fetchList : Query -> String -> Cmd Msg
fetchList query token =
    fetchListRequest query token
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnList


fetchListRequest : Query -> String -> Http.Request (List User)
fetchListRequest query token =
    Request.get [ ( "Authorization", token ) ] (Http.expectJson User.listDecoder) (listUrl query)
