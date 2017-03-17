module Menu.View exposing (..)

import Menu.Msg as Msg exposing(Msg)
import Menu.Model as Model exposing(Model)
import Menu.Data as Data
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options exposing (css)
import Material.Layout as Layout
import Material.Typography as Typo
import Material.Color as Color


tabView : Model -> List (Html Msg)
tabView model =
    List.map dataToView Data.tabList


dataToView tab =
    text tab


drawerView : Model.Model -> List (Html Msg)
drawerView model =
    [ Layout.title [] [ text "Karkhana" ]
    , Layout.navigation
        []
        [ Layout.link
            (drawerAttr model Msg.Me)
            [ text Data.me ]
        , Layout.link
            (drawerAttr model Msg.User)
            [ text Data.user ]
        , Layout.link
            (drawerAttr model Msg.Role)
            [ text Data.role ]
        , Layout.link
            (drawerAttr model Msg.Logout)
            [ text Data.logout ]
        ]
    ]


drawerAttr : Model -> Msg -> List (Options.Property c Msg)
drawerAttr model msg =
    [ Typo.body1
    , Options.onClick msg
    , case msg of
        Msg.Me ->
            if model.current == Data.me then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.User ->
            if model.current == Data.user then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Role ->
            if model.current == Data.role then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        Msg.Logout ->
            if model.current == Data.logout then
                Color.background (Color.color Color.Grey Color.S300)
            else
                Options.nop

        _ ->
            Options.nop
    ]
