module Data.User exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode


type alias User =
    { id : String
    , name : String
    , username : String
    , language : String
    , avtFileId : String
    , roleId : String
    , email : String
    , address : String
    , gender : String
    , phone : List String
    , password : String
    , deleted : Bool
    , createdAt : String
    , createdBy : String
    , modifiedAt : String
    , modifiedBy : String
    }


encoder : User -> Encode.Value
encoder user =
    let
        attrs =
            [ ( "id", Encode.string user.id )
            , ( "username", Encode.string user.username )
            , ( "name", Encode.string user.name )
            , ( "language", Encode.string user.language )
            , ( "avt_file_id", Encode.string user.avtFileId )
            , ( "role_id", Encode.string user.roleId )
            , ( "email", Encode.string user.email )
            , ( "address", Encode.string user.address )
            , ( "gender", Encode.string user.gender )
            , ( "phone", Encode.list (List.map Encode.string user.phone) )
            , ( "password", Encode.string user.password )
            , ( "created_at", Encode.string user.createdAt )
            , ( "created_by", Encode.string user.createdBy )
            , ( "modified_at", Encode.string user.modifiedAt )
            , ( "modified_by", Encode.string user.modifiedBy )
            ]
    in
        Encode.object attrs


listDecoder : Decode.Decoder (List User)
listDecoder =
    Decode.list decoder


decoder : Decode.Decoder User
decoder =
    decode User
        |> required "id" Decode.string
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
        |> required "deleted" Decode.bool
        |> required "created_at" Decode.string
        |> required "created_by" Decode.string
        |> required "modified_at" Decode.string
        |> required "modified_by" Decode.string
