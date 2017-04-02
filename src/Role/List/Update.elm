module Role.List.Update exposing (..)

import Role.List.Msg as Msg exposing (Msg)
import Role.List.Model as Model exposing (Model)
import Material
import Role.List.Req as Req
import RemoteData


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
        Msg.Mdl msg_ ->
            let
                ( mdl, ms ) =
                    Material.update Msg.Mdl msg_ model
            in
                ( mdl, ms )

        Msg.FetchList ->
            if model.status == Model.Loading then
                ( model, Cmd.none )
            else
                ( Model.loading model, Req.fetchList model.query token )

        Msg.OnList dt ->
            case dt of
                RemoteData.Success lst ->
                    ( Model.addRoles model lst, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )
