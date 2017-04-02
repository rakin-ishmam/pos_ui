module User.Update exposing (..)

import User.Model as Model exposing (Model)
import User.Msg as Msg exposing (Msg)
import User.Label as Label
import Material
import User.List.Model as UserModel
import User.List.Msg as UserMsg
import User.List.Update as UserUpdate


update : String -> Msg -> Model -> ( Model, Cmd Msg )
update token msg model =
    case msg of
        Msg.Mdl msg_ ->
            Material.update Msg.Mdl msg_ model

        Msg.Create ->
            ( { model | view = Label.create }, Cmd.none )

        Msg.Lst ->
            ( { model | view = Label.list, list = UserModel.model }
            , Cmd.map Msg.UserList <| UserMsg.init
            )

        Msg.UserList msg ->
            updateList token msg model

        Msg.Detail id ->
            ( { model | view = Label.detail }, Cmd.none )

        Msg.Edit id ->
            ( { model | view = Label.edit }, Cmd.none )

        _ ->
            ( model, Cmd.none )


updateList : String -> UserMsg.Msg -> Model -> ( Model, Cmd Msg )
updateList token msg model =
    let
        ( mdl, usrMsg ) =
            UserUpdate.update token msg model.list
    in
        ( { model | list = mdl }, Cmd.map Msg.UserList usrMsg )
