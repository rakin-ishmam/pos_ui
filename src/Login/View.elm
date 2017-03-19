module Login.View exposing (..)

import Login.Model as Model exposing (Model)
import Login.Msg as Msg exposing (Msg)
import Html exposing (Html, p, div, ul, li, text, a, h3, td, map, span)
import Material.Options as Options
import Material.Elevation as Elevation
import Material.Textfield as Textfield
import Material.Typography as Typo


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
            , Textfield.render Msg.MdlUsername
                [ 2 ]
                model.mdlUsername.mdl
                [ Textfield.label "Username"
                , Textfield.floatingLabel
                , Textfield.text_
                , Options.css "width" "100%"
                ]
                []
            , Textfield.render Msg.MdlPassword
                [ 2 ]
                model.mdlPassword.mdl
                [ Textfield.label "Password"
                , Textfield.floatingLabel
                , Options.css "width" "100%"
                , Textfield.text_
                ]
                []
            ]
        ]
