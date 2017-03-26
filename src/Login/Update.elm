module Login.Update exposing (..)

import Login.Msg as Msg exposing (Msg)
import Login.Model as Model exposing (Model)
import Material
import Login.Commands as Commands
import Msg as AppMsg
import RemoteData
import Tuple
import Lib.NewCmd as NewCmd
import Login.Login as Login


update : Msg -> Model.Container c -> (Msg -> AppMsg.Msg) -> ( Model.Container c, Cmd AppMsg.Msg )
update msg model conv =
    case msg of
        Msg.Mdl msg_ ->
            let
                ( md, ms ) =
                    Tuple.mapSecond (Cmd.map conv) (Material.update Msg.Mdl msg_ model.login)
            in
                ( { model | login = md }, ms )

        Msg.Username val ->
            let
                login =
                    Login.setUsername model.login.login val
            in
                ( { model | login = Model.setLogin model.login login }, Cmd.map conv Cmd.none )

        Msg.Password val ->
            let
                login =
                    Login.setPassword model.login.login val
            in
                ( { model | login = Model.setLogin model.login login }, Cmd.map conv Cmd.none )

        Msg.Login ->
            ( model, Cmd.map conv (Commands.login model.login.login) )

        Msg.OnToken val ->
            let
                cmd =
                    case val of
                        RemoteData.Success token ->
                            NewCmd.cmd (AppMsg.Token token.token)

                        _ ->
                            Cmd.map conv Cmd.none

                token =
                    val
            in
                ( { model | login = Model.setToken model.login token }, cmd )

        _ ->
            ( model, Cmd.map conv Cmd.none )
