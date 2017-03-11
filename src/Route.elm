module Route exposing (..)

import Model exposing (Model)
import Message exposing (Msg) 
import RouteUrl exposing (UrlChange)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import Navigation exposing (Location)

delta2url : Model -> Model -> Maybe UrlChange
delta2url pre cur =
    Maybe.map Builder.toHashChange <|
        delta2builder pre cur


delta2builder : Model -> Model -> Maybe Builder  
delta2builder pre cur =
    Just builder


url2actions : Location -> List Msg
url2actions location =
    builder2actions (Builder.fromHash location.href)


builder2actions : Builder -> List Msg
builder2actions builder =
    []