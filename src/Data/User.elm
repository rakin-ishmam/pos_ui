module Data.User exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode


type alias User =
    { name : String
    , username : String
    , language : String
    , avtFileId : String
    , roleId : String
    , email : String
    , address : String
    , gender : String
    , phone : List String
    , password : String
    }


loginEncoder : User -> Encode.Value
loginEncoder user =
    let
        attrs =
            [ ( "username", Encode.string user.username )
            , ( "name", Encode.string user.name )
            , ( "language", Encode.string user.language )
            , ( "avt_file_id", Encode.string user.avtFileId )
            , ( "role_id", Encode.string user.roleId )
            , ( "email", Encode.string user.email )
            , ( "address", Encode.string user.address )
            , ( "gender", Encode.string user.gender )
            , ( "phone", Encode.list (List.map Encode.string user.phone) )
            , ( "password", Encode.string user.password )
            ]
    in
        Encode.object attrs


tokenDecoder : Decode.Decoder User
tokenDecoder =
    decode User
        |> required "username" Decode.string
        |> required "name" Decode.string
        |> required "language" Decode.string
        |> required "avt_file_id" Decode.string
        |> required "role_id" Decode.string
        |> required "email" Decode.string
        |> required "address" Decode.string
        |> required "gender" Decode.string
        |> required "phone" (Decode.list Decode.string)
        |> required "password" Decode.string
