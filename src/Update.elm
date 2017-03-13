module Update exposing (..)

import Message
import Model exposing (Model)
import Menu.Update as MenuUpdate
import Material


update : Message.Msg -> Model -> ( Model, Cmd Message.Msg )
update msg model =
    case msg of
        Message.Mdl msg_ ->
            Material.update Message.Mdl msg_ model

        Message.Menu menuMsg ->
            let
                ( md, ms ) =
                    MenuUpdate.update menuMsg model.menu
            in
                ( { model | menu = md }, Cmd.map Message.Menu ms )

        _ ->
            ( model, Cmd.none )
