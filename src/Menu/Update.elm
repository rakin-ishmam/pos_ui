module Menu.Update exposing (..)

import Menu.Msg as Msg exposing(Msg)
import Menu.Model as Model exposing(Model)
import Menu.Data as Data
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.SelectTab ind ->
            ( { model | current = Model.tabVal ind }, Cmd.none )

        Msg.Role ->
            ( { model | current = Data.role }, Cmd.none )

        Msg.Me ->
            ( { model | current = Data.me }, Cmd.none )

        Msg.User ->
            ( { model | current = Data.user }, Cmd.none )

        Msg.Logout ->
            ( { model | current = Data.logout }, Cmd.none )

        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model
