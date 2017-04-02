module Data.User exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
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
        |> optional "id" Decode.string ""
        |> optional "username" Decode.string ""
        |> optional "name" Decode.string ""
        |> optional "language" Decode.string ""
        |> optional "avt_file_id" Decode.string ""
        |> optional "role_id" Decode.string ""
        |> optional "email" Decode.string ""
        |> optional "address" Decode.string ""
        |> optional "gender" Decode.string ""
        |> optional "phone" (Decode.list Decode.string) []
        |> optional "password" Decode.string ""
        |> optional "deleted" Decode.bool False
        |> optional "created_at" Decode.string ""
        |> optional "created_by" Decode.string ""
        |> optional "modified_at" Decode.string ""
        |> optional "modified_by" Decode.string ""
