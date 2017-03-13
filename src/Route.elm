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
    Just
        <| Builder.replacePath [cur.menu.current]
        <| Builder.builder

url2messages : Location -> List Msg
url2messages location =
    builder2messages (Builder.fromHash location.href)


builder2messages : Builder -> List Msg
builder2messages builder =
    []