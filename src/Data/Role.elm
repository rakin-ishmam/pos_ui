module Data.Role exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode


type alias Role =
    { id : String
    , name : String
    , userAccess : List String
    , roleAccess : List String
    , categoryAccess : List String
    , customerAccess : List String
    , inventoryAccess : List String
    , productAccess : List String
    , sellAccess : List String
    , paymentAccess : List String
    , fileAccess : List String
    , deleted : Bool
    , createdAt : String
    , createdBy : String
    , modifiedAt : String
    , modifiedBy : String
    }


encoder : Role -> Encode.Value
encoder role =
    let
        attrs =
            [ ( "id", Encode.string role.id )
            , ( "name", Encode.string role.name )
            , ( "user_acces", Encode.list (List.map Encode.string role.userAccess) )
            , ( "role_acces", Encode.list (List.map Encode.string role.roleAccess) )
            , ( "category_access", Encode.list (List.map Encode.string role.categoryAccess) )
            , ( "customer_access", Encode.list (List.map Encode.string role.customerAccess) )
            , ( "inventory_access", Encode.list (List.map Encode.string role.inventoryAccess) )
            , ( "product_access", Encode.list (List.map Encode.string role.productAccess) )
            , ( "sell_access", Encode.list (List.map Encode.string role.sellAccess) )
            , ( "payment_access", Encode.list (List.map Encode.string role.paymentAccess) )
            , ( "file_access", Encode.list (List.map Encode.string role.fileAccess) )
            ]
    in
        Encode.object attrs


decoder : Decode.Decoder Role
decoder =
    decode Role
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "user_acces" (Decode.list Decode.string)
        |> required "role_acces" (Decode.list Decode.string)
        |> required "category_access" (Decode.list Decode.string)
        |> required "customer_access" (Decode.list Decode.string)
        |> required "inventory_access" (Decode.list Decode.string)
        |> required "product_access" (Decode.list Decode.string)
        |> required "sell_access" (Decode.list Decode.string)
        |> required "payment_access" (Decode.list Decode.string)
        |> required "file_access" (Decode.list Decode.string)
        |> required "deleted" Decode.bool
        |> required "created_at" Decode.string
        |> required "created_by" Decode.string
        |> required "modified_at" Decode.string
        |> required "modified_by" Decode.string
