module Main exposing (..)

import Route 
import RouteUrl exposing (RouteUrlProgram)
import Model exposing(Model)
import Update
import View
import Msg exposing(Msg)


main : RouteUrlProgram Never Model Msg
main =
    RouteUrl.program
        { delta2url = Route.delta2url
        , location2messages = Route.url2messages
        , init = Model.model
        , update = Update.update
        , view = View.view
        , subscriptions = always Sub.none
        }