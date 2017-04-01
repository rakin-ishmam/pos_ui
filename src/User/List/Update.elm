module User.List.Update exposing (..)

import User.List.Msg as Msg exposing (Msg)
import User.List.Model as Model exposing (Model)
import Material


update : Msg -> Model.Container c -> (Msg -> a) -> ( Model.Container c, Cmd a )
update msg model msgMap =
    case msg of
        Msg.Mdl msg_ ->
            let
                ( mdl, ms ) =
                    Material.update Msg.Mdl msg_ model.list
            in
                ( { model | list = mdl }, Cmd.map msgMap ms )

        Msg.Ontoken msg_ ->
            
        _ ->
            ( model, Cmd.none )
