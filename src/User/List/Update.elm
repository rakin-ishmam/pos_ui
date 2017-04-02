module User.List.Update exposing (..)

import User.List.Msg as Msg exposing (Msg)
import User.List.Model as Model exposing (Model)
import Material
import User.List.Req as Req
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
                    ( Model.addUsers model lst, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )
