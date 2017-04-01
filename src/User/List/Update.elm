module User.List.Update exposing (..)

import User.List.Msg as Msg exposing (Msg)
import User.List.Model as Model exposing (Model)
import Material
import User.List.Req as Req
import RemoteData


update : String -> Msg -> Model.Container c -> (Msg -> a) -> ( Model.Container c, Cmd a )
update token msg model msgMap =
    case msg of
        Msg.Mdl msg_ ->
            let
                ( mdl, ms ) =
                    Material.update Msg.Mdl msg_ model.list
            in
                ( { model | list = mdl }, Cmd.map msgMap ms )

        Msg.FetchList ->
            if model.list.status == Model.Loading then
                ( model, Cmd.none )
            else
                ( { model | list = Model.loading model.list }
                , Cmd.map msgMap <|
                    Req.fetchList model.list.query token
                )

        Msg.OnList dt ->
            case dt of
                RemoteData.Success lst ->
                    ( { model | list = Model.addUsers model.list lst }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )
