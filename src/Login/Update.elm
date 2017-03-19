module Login.Update exposing (..)

import Login.Msg as Msg exposing (Msg)
import Login.Model as Model exposing (Model)
import Material

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of 
        Msg.MdlUsername msg_ ->
            let
                (md, cmd) = Material.update Msg.MdlUsername msg_ model.mdlUsername
            in
                ( { model | mdlUsername = { mdl = md.mdl } }, cmd )

        Msg.MdlPassword msg_ ->
            let
                (md, cmd) = Material.update Msg.MdlPassword msg_ model.mdlPassword
            in
                ( { model | mdlPassword = { mdl = md.mdl } }, cmd )

        _ -> 
            ( model, Cmd.none )
