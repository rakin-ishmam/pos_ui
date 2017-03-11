module Update exposing (..)

import Message
import Model exposing (Model)
import Drawer.Update as DrawerUpdate
import Tab.Update as TabUpdate
import Tab.Message as TabMessage
import Material


update : Message.Msg -> Model -> ( Model, Cmd Message.Msg )
update msg model =
    case msg of
        Message.SelectTab ind ->
            let
                ( md, ms ) =
                    TabUpdate.update (TabMessage.SelectTab ind) model.tab
            in
                ( { model | tab = md }, Cmd.map Message.Tab ms )

        Message.Mdl msg_ ->
            Material.update Message.Mdl msg_ model

        Message.Tab tabMsg ->
            let
                ( md, ms ) =
                    TabUpdate.update tabMsg model.tab
            in
                ( { model | tab = md }, Cmd.map Message.Tab ms )
            
        Message.Drawer drawerMsg ->
            let
                ( md, ms ) =
                    DrawerUpdate.update drawerMsg model.drawer
            
            in
                ( { model | drawer = md }, Cmd.map Message.Drawer ms )


        _ ->
            ( model, Cmd.none )
