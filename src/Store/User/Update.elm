module Store.User.Update exposing (..)

import Store.User.Msg as Msg exposing (Msg)
import Store.User.Model as Model exposing (Model)
import Store.User.Req as Req
import RemoteData


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
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

        Msg.None ->
            ( model, Cmd.none )
