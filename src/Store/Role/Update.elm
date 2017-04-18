module Store.Role.Update exposing (..)

import Store.Role.Msg as Msg exposing (Msg)
import Store.Role.Model as Model exposing (Model)
import Store.Role.Req as Req
import RemoteData


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
        Msg.FetchList ->
            if model.status == Model.Loading then
                ( model, Cmd.none )
            else
                ( Model.loading model, Req.fetchList model.query token )

        Msg.Create role ->
            if model.status == Model.Loading then
                ( model, Cmd.none )
            else
                ( Model.loading model, Req.create token role )

        Msg.OnCreate dt ->
            case dt of
                RemoteData.Success id ->
                    ( Model.addCreateId model id, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Msg.OnList dt ->
            case dt of
                RemoteData.Success lst ->
                    ( Model.addRoles model lst, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Msg.None ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )
