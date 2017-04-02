module Role.Update exposing (..)

import Role.Model as Model exposing (Model)
import Role.Msg as Msg exposing (Msg)
import Role.Label as Label
import Material
import Role.List.Model as RoleModel
import Role.List.Msg as RoleMsg
import Role.List.Update as RoleUpdate


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model

        Msg.Create ->
            ( { model | view = Label.create }, Cmd.none )

        Msg.Lst ->
            ( { model | view = Label.list, list = RoleModel.model }
            , Cmd.map Msg.RoleList <| RoleMsg.init
            )

        Msg.RoleList msg ->
            updateList token msg model

        Msg.Detail id ->
            ( { model | view = Label.detail }, Cmd.none )

        Msg.Edit id ->
            ( { model | view = Label.edit }, Cmd.none )

        _ ->
            ( model, Cmd.none )


updateList : String -> RoleMsg.Msg -> Model -> ( Model, Cmd Msg )
updateList token msg model =
    let
        ( mdl, usrMsg ) =
            RoleUpdate.update token msg model.list
    in
        ( { model | list = mdl }, Cmd.map Msg.RoleList usrMsg )
