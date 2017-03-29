module User.Update exposing (..)

import User.Model as Model exposing (Model)
import User.Msg as Msg exposing (Msg)
import User.Label as Label
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model

        Msg.Create ->
            ( { model | view = Label.create }, Cmd.none )

        Msg.Lst ->
            ( { model | view = Label.list }, Cmd.none )

        Msg.Detail id ->
            ( { model | view = Label.detail }, Cmd.none )

        Msg.Edit id ->
            ( { model | view = Label.edit }, Cmd.none )

        _ ->
            ( model, Cmd.none )
