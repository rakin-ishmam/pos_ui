module Menu.View exposing (..)

import Menu.Msg as Msg exposing (Msg)
import Menu.Model as Model exposing (Model)
import Menu.Label as Label
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options exposing (css)
import Material.Layout as Layout
import Material.Typography as Typo
import Material.Color as Color


drawerView : Model.Model -> List (Html Msg)
drawerView model =
    [ Layout.title [] []
    , Layout.navigation
        []
        [ Layout.link
            (drawerAttr model Msg.Sell)
            [ text Label.sell ]
        , Layout.link
            (drawerAttr model Msg.Order)
            [ text Label.order ]
        , Layout.link
            (drawerAttr model Msg.Product)
            [ text Label.product ]
        , Layout.link
            (drawerAttr model Msg.Report)
            [ text Label.report ]
        , Layout.link
            (drawerAttr model Msg.Me)
            [ text Label.me ]
        , Layout.link
            (drawerAttr model Msg.User)
            [ text Label.user ]
        , Layout.link
            (drawerAttr model Msg.Role)
            [ text Label.role ]
        , Layout.link
            (drawerAttr model Msg.Logout)
            [ text Label.logout ]
        ]
    ]


drawerAttr : Model -> Msg -> List (Options.Property c Msg)
drawerAttr model msg =
    [ Typo.body1
    , Options.onClick msg
    , case msg of
        Msg.Product ->
            if model.current == Label.product then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Me ->
            if model.current == Label.me then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.User ->
            if model.current == Label.user then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Role ->
            if model.current == Label.role then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Logout ->
            if model.current == Label.logout then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Sell ->
            if model.current == Label.sell then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Order ->
            if model.current == Label.order then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Report ->
            if model.current == Label.report then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        _ ->
            Options.nop
    ]
