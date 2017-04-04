module Menu.Update exposing (..)

import Menu.Msg as Msg exposing (Msg)
import Menu.Model as Model exposing (Model)
import Menu.Label as Label
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Role ->
            ( { model | current = Label.role }, Cmd.none )

        Msg.Me ->
            ( { model | current = Label.me }, Cmd.none )

        Msg.User ->
            ( { model | current = Label.user }, Cmd.none )

        Msg.Logout ->
            ( { model | current = Label.logout }, Cmd.none )

        Msg.Product ->
            ( { model | current = Label.product }, Cmd.none )

        Msg.Order ->
            ( { model | current = Label.order }, Cmd.none )

        Msg.Report ->
            ( { model | current = Label.report }, Cmd.none )

        Msg.Sell ->
            ( { model | current = Label.sell }, Cmd.none )

        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model
