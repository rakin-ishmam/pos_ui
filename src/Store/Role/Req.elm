module Store.Role.Req exposing (fetchList, create)

import Store.Role.Msg as Msg exposing (..)
import Store.Role.Query as Query exposing (Query)
import Data.Role as Role exposing (Role)
import Http
import Lib.Request as Request
import RemoteData
import Data.Id as Id exposing (Id)


listUrl : Query -> String
listUrl query =
    "/api/role/list?" ++ (Query.toURL query)


createUrl : String
createUrl =
    "/api/role"


editUrl : String -> String
editUrl id =
    "/api/role/" ++ id


create : String -> Role -> Cmd Msg
create token role =
    createReq token role
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnCreate


createReq : String -> Role -> Http.Request Id
createReq token role =
    Request.post
        [ ( "Authorization", token ) ]
        (Http.jsonBody <| Role.encoder role)
        (Http.expectJson Id.decoder)
        createUrl


fetchList : Query -> String -> Cmd Msg
fetchList query token =
    fetchListRequest query token
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnList


fetchListRequest : Query -> String -> Http.Request (List Role)
fetchListRequest query token =
    Request.get [ ( "Authorization", token ) ] (Http.expectJson Role.listDecoder) (listUrl query)
