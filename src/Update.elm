module Update exposing (..)

import Msg exposing(Msg)
import Model exposing (Model)
import Menu.Update as MenuUpdate
import User.Update as UserUpdate
import Material


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
                ( { model | menu = md }, Cmd.map Msg.Menu ms )

        Msg.User userMsg ->
            let
                ( md, ms ) =
                    UserUpdate.update userMsg model.user
            in
                ( { model | user = md }, Cmd.map Msg.User ms )

        _ ->
            ( model, Cmd.none )
