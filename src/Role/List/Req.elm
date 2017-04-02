module Role.List.Req exposing (fetchList)

import Role.List.Msg as Msg exposing (..)
import Role.List.Query as Query exposing (Query)
import Data.Role as Role exposing (Role)
import Http
import Lib.Request as Request
import RemoteData


loginUrl : Query -> String
loginUrl query =
    "/api/role/list?" ++ (Query.toURL query)


fetchList : Query -> String -> Cmd Msg
fetchList query token =
    fetchListRequest query token
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnList


fetchListRequest : Query -> String -> Http.Request (List Role)
fetchListRequest query token =
    Request.get [ ( "Authorization", token ) ] (Http.expectJson Role.listDecoder) (loginUrl query)
