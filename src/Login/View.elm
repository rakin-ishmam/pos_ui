module Login.View exposing (..)

import Login.Model as Model exposing (Model)
import Login.Msg as Msg exposing (Msg)
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options
import Material.Elevation as Elevation
import Material.Textfield as Textfield
import Material.Typography as Typo
import Material.Button as Button
import RemoteData


view : Model -> Html Msg
view model =
    Options.div
        [ Options.css "padding-top" "80px"
        , Options.css "width" "100%"
        , Options.center
        ]
        [ Options.div
            [ Elevation.e2
            , Options.css "width" "30%"
            , Options.css "padding" "20px"
            ]
            [ Options.styled p
                [ Typo.display2 ]
                [ text "Login" ]
            , Textfield.render Msg.Mdl
                [ 0 ]
                model.mdl
                [ Textfield.label "Username"
                , Textfield.floatingLabel
                , Textfield.text_
                , Options.onInput Msg.Username
                , Options.css "width" "100%"
                ]
                []
            , Textfield.render Msg.Mdl
                [ 1 ]
                model.mdl
                [ Textfield.label "Password"
                , Textfield.floatingLabel
                , Options.css "width" "100%"
                , Options.onInput Msg.Password
                , Textfield.text_
                ]
                []
            , Button.render Msg.Mdl
                [ 2 ]
                model.mdl
                [ Button.raised
                , Button.colored
                , Button.ripple
                , Options.onClick Msg.Login
                ]
                [ text "Login" ]
            , div []
                [ case model.token of
                    RemoteData.Success token ->
                        text token.token
                    _ ->
                        text "test"
                ]
            ]
        ]
