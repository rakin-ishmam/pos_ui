module Menu.View exposing (..)

import Menu.Message as Message
import Menu.Model as Model
import Menu.Data as Data
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options exposing (css)
import Material.Layout as Layout
import Material.Typography as Typo
import Material.Color as Color


tabView : Model.Model -> List (Html Message.Msg)
tabView model =
    List.map dataToView Data.tabList


dataToView tab =
    text tab


drawerView : Model.Model -> List (Html Message.Msg)
drawerView model =
    [ Layout.title [] [ text "Karkhana" ]
    , Layout.navigation
        []
        [ Layout.link
            (drawerAttr model Message.Me)
            [ text Data.me ]
        , Layout.link
            (drawerAttr model Message.User)
            [ text Data.user ]
        , Layout.link
            (drawerAttr model Message.Role)
            [ text Data.role ]
        , Layout.link
            (drawerAttr model Message.Logout)
            [ text Data.logout ]
        ]
    ]


drawerAttr : Model.Model -> Message.Msg -> List (Options.Property c Message.Msg)
drawerAttr model msg =
    [ Typo.body1
    , Options.onClick msg
    , case msg of
        Message.Me ->
            if model.current == Data.me then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.User ->
            if model.current == Data.user then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.Role ->
            if model.current == Data.role then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.Logout ->
            if model.current == Data.logout then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        _ ->
            Options.nop
    ]
