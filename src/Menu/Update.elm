module Menu.Update exposing (..)

import Menu.Message as Message
import Menu.Model as Model
import Menu.Data as Data
import Material


update : Message.Msg -> Model.Model -> ( Model.Model, Cmd Message.Msg )
update msg model =
    case msg of
        Message.SelectTab ind ->
            ( { model | current = Model.tabVal ind }, Cmd.none )

        Message.Role ->
            ( { model | current = Data.role }, Cmd.none )

        Message.Me ->
            ( { model | current = Data.me }, Cmd.none )

        Message.User ->
            ( { model | current = Data.user }, Cmd.none )

        Message.Logout ->
            ( { model | current = Data.logout }, Cmd.none )

        Message.Mdl msg_ ->
            Material.update Message.Mdl msg_ model
