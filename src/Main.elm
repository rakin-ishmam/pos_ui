module Main exposing (..)

import Route 
import RouteUrl exposing (RouteUrlProgram)
import Model
import Update
import View
import Message exposing(Msg)


main : RouteUrlProgram Never Model.Model Msg
main =
    RouteUrl.program
        { delta2url = Route.delta2url
        , location2messages = Route.url2actions
        , init = Model.init
        , update = Update.update
        , view = View.view
        , subscriptions = always Sub.none
        }