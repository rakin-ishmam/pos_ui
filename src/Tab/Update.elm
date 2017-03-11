module Tab.Update exposing (..)

import Tab.Model exposing (Model)
import Tab.Message as Message
import Material


update : Message.Msg -> Model -> ( Model, Cmd Message.Msg )
update msg model =
    case msg of
        Message.SelectTab ind ->
            ( { model | tab = ind }, Cmd.none )

        Message.Mdl msg_ ->
            Material.update Message.Mdl msg_ model

        _ ->
            ( model, Cmd.none )
