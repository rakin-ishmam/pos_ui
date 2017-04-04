module Store.Role.Req exposing (fetchList)

import Store.Role.Msg as Msg exposing (..)
import Store.Role.Query as Query exposing (Query)
import Data.Role as Role exposing (Role)
import Http
import Lib.Request as Request
import RemoteData


listUrl : Query -> String
listUrl query =
    "/api/role/list?" ++ (Query.toURL query)


fetchList : Query -> String -> Cmd Msg
fetchList query token =
    fetchListRequest query token
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnList


fetchListRequest : Query -> String -> Http.Request (List Role)
fetchListRequest query token =
    Request.get [ ( "Authorization", token ) ] (Http.expectJson Role.listDecoder) (listUrl query)
