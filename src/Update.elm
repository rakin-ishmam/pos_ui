module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Menu.Update as MenuUpdate
import User.Update as UserUpdate
import Role.Update as RoleUpdate
import Login.Update as LoginUpdate
import Material
import Config
import Lib.NewCmd as NewCmd
import Lib.Storage as Storage
import Menu.Msg as MenuMsg
import User.Msg as UserMsg
import Role.Msg as RoleMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model

        Msg.Menu menuMsg ->
            let
                ( md, ms ) =
                    MenuUpdate.update menuMsg model.menu
            in
                ( { model | menu = md }, Cmd.batch [ Cmd.map Msg.Menu ms, initMsg menuMsg ] )

        Msg.User userMsg ->
            let
                ( md, ms ) =
                    UserUpdate.update model.token userMsg model.user
            in
                ( { model | user = md }, Cmd.map Msg.User ms )

        Msg.Role roleMsg ->
            let
                ( md, ms ) =
                    RoleUpdate.update model.token roleMsg model.role
            in
                ( { model | role = md }, Cmd.map Msg.Role ms )

        Msg.Login loginMsg ->
            let
                ( md, ms ) =
                    LoginUpdate.update loginMsg model Msg.Login
            in
                ( md, ms )

        Msg.Token val ->
            let
                tmp =
                    Storage.set Config.token val
            in
                ( { model | token = val }, Cmd.none )

        _ ->
            ( model, Cmd.none )


initMsg : MenuMsg.Msg -> Cmd Msg
initMsg msg =
    case msg of
        MenuMsg.User ->
            NewCmd.cmd <| Msg.User UserMsg.init

        MenuMsg.Role ->
            NewCmd.cmd <| Msg.Role RoleMsg.init

        _ ->
            Cmd.none
