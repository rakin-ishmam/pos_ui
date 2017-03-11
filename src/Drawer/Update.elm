module Drawer.Update exposing (..)

import Drawer.Message as Message
import Drawer.Model as Model
import Drawer.Data as Data
import Debug

update : Message.Msg -> Model.Model -> ( Model.Model, Cmd Message.Msg )
update msg model =
    case Debug.log "messae" msg of
        Message.Role ->
            ( { model | selected = Data.role }, Cmd.none )

        Message.Me ->
            ( { model | selected = Data.me }, Cmd.none )

        Message.User ->
            ( { model | selected = Data.user }, Cmd.none )

        Message.Logout ->
            ( { model | selected = Data.logout }, Cmd.none )

        _ ->
            ( model, Cmd.none )
