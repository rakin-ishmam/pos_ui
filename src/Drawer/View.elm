module Drawer.View exposing (..)

import Drawer.Model as Model
import Drawer.Message as Message
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options exposing (css)
import Material.Layout as Layout
import Material.Typography as Typo
import Material.Color as Color
import Drawer.Data as Data


view : Model.Model -> List (Html Message.Msg)
view model =
    [ Layout.title [] [ text "POS" ]
    , Layout.navigation
        []
        [ Layout.link
            (attr model Message.Me)
            [ text "Me" ]
        , Layout.link
            (attr model Message.User)
            [ text "User" ]
        , Layout.link
            (attr model Message.Role)
            [ text "Role" ]
        , Layout.link
            (attr model Message.Logout)
            [ text "Logout" ]
        ]
    ]


attr : Model.Model -> Message.Msg -> List (Options.Property c Message.Msg)
attr model msg =
    [ Typo.body1
    , Options.onClick msg
    , case msg of
        Message.Me ->
            if model.selected == Data.me then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.User ->
            if model.selected == Data.user then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.Role ->
            if model.selected == Data.role then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Message.Logout ->
            if model.selected == Data.logout then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        _ ->
            Options.nop
    ]
