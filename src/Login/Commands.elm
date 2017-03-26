module Login.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Login.Msg as Msg exposing (Msg)
import Login.Model as Model
import RemoteData
import Json.Encode as Encode
import Login.Login as Login exposing (Login)


login : Login -> Cmd Msg
login data =
    loginRequest data
        |> RemoteData.sendRequest
        |> Cmd.map Msg.OnToken


loginRequest : Login -> Http.Request Model.Token
loginRequest login =
    Http.request
        { body = loginEncoder login |> Http.jsonBody
        , expect = Http.expectJson tokenDecoder
        , headers = []
        , method = "POST"
        , timeout = Nothing
        , url = loginUrl
        , withCredentials = False
        }


loginUrl : String
loginUrl =
    "/api/login"


loginEncoder : Login -> Encode.Value
loginEncoder login =
    let
        attrs =
            [ ( "username", Encode.string login.username )
            , ( "password", Encode.string login.password )
            ]
    in
        Encode.object attrs


tokenDecoder : Decode.Decoder Model.Token
tokenDecoder =
    decode Model.Token
        |> required "token" Decode.string
