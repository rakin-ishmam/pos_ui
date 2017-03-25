module Login.Update exposing (..)

import Login.Msg as Msg exposing (Msg)
import Login.Model as Model exposing (Model)
import Material
import Debug
import Login.Commands as Commands


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model |> Just

        Msg.Username val ->
            let
                login =
                    model.login
            in
                ( { model | login = { login | username = val } }, Cmd.none )

        Msg.Password val ->
            let
                login =
                    model.login
            in
                ( { model | login = { login | password = val } }, Cmd.none )

        Msg.Login ->
            ( model, Commands.login model.login )

        Msg.OnToken val ->
            ( { model | token = val }, Cmd.none )

        _ ->
            ( model, Cmd.none )
