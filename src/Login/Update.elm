module Login.Update exposing (..)

import Login.Msg as Msg exposing (Msg)
import Login.Model as Model exposing (Model)
import Material
import Login.Commands as Commands
import Msg as AppMsg
import RemoteData
import Tuple
import Lib.NewCmd as NewCmd


update : Msg -> Model -> (Msg -> AppMsg.Msg) -> ( Model, Cmd AppMsg.Msg )
update msg model conv =
    case msg of
        Msg.Mdl msg_ ->
            Tuple.mapSecond (Cmd.map conv) (Material.update Msg.Mdl msg_ model)

        Msg.Username val ->
            let
                login =
                    model.login
            in
                ( { model | login = { login | username = val } }, Cmd.map conv Cmd.none )

        Msg.Password val ->
            let
                login =
                    model.login
            in
                ( { model | login = { login | password = val } }, Cmd.map conv Cmd.none )

        Msg.Login ->
            ( model, Cmd.map conv (Commands.login model.login) )

        Msg.OnToken val ->
            let
                cmd =
                    case val of
                        RemoteData.Success token ->
                            NewCmd.cmd (AppMsg.Token token.token)

                        _ ->
                            Cmd.map conv Cmd.none
            in
                ( { model | token = val }, cmd )

        _ ->
            ( model, Cmd.map conv Cmd.none )
