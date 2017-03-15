module User.Update exposing (..)

import User.Model as Model exposing (Model)
import User.Message as Message exposing (Msg)
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Message.Mdl msg_ ->
            Material.update Message.Mdl msg_ model

        Message.Create ->
            ( { model | view = Model.createView }, Cmd.none )

        Message.Lst ->
            ( { model | view = Model.listView }, Cmd.none )

        Message.Detail id ->
            ( { model | view = Model.detailView }, Cmd.none )

        Message.Edit id ->
            ( { model | view = Model.editView }, Cmd.none )

        _ ->
            ( model, Cmd.none )
