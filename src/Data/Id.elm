module Data.Id exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Json.Encode as Encode


type alias Id =
    { id : String
    }


id : Id
id =
    Id ""


encoder : Id -> Encode.Value
encoder id =
    Encode.object [ ( "id", Encode.string id.id ) ]


decoder : Decode.Decoder Id
decoder =
    decode Id
        |> required "id" Decode.string
