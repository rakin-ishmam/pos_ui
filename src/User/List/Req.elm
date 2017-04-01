module User.List.Req exposing (fetchList)

import User.List.Msg as Msg exposing (..)
import User.List.Query as Query exposing (Query)
import Data.User as User exposing (User)
import Http
import Lib.Request as Request
import RemoteData


loginUrl : Query -> String
loginUrl query =
    "/api/user/list?" ++ (Query.toURL query)


fetchList : Query -> String -> Cmd Msg
fetchList query token =
    fetchListRequest query token
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnList


fetchListRequest : Query -> String -> Http.Request (List User)
fetchListRequest query token =
    Request.get [ ( "Authorization", token ) ] (Http.expectJson User.listDecoder) (loginUrl query)
