module User.List.Update exposing (..)

import User.List.Msg as Msg exposing (Msg)
import User.List.Model as Model exposing (Model)
import Material
import Store.User.Update as StoreUpdate


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
        Msg.Mdl msg_ ->
            let
                ( mdl, ms ) =
                    Material.update Msg.Mdl msg_ model
            in
                ( mdl, ms )

        Msg.Store msg_ ->
            let
                ( mdl, ms ) =
                    StoreUpdate.update token msg_ model.store
            in
                ( { model | store = mdl }, Cmd.map Msg.Store ms )

        _ ->
            ( model, Cmd.none )
