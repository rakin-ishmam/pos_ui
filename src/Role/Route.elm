module Role.Route exposing (..)

import Role.Model as Model exposing (Model)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import Role.Label as Label
import Role.Msg as Msg exposing (Msg)


delta2builder : Model -> Model -> Maybe Builder
delta2builder pre cur =
    Just <|
        Builder.replacePath [ cur.view ] <|
            Builder.builder


builder2messages : Builder -> List Msg
builder2messages builder =
    case Builder.path builder of
        first :: rest ->
            if first == Label.create then
                [ Msg.Create ]
            else if first == Label.list then
                [ Msg.Lst ]
            else if first == Label.detail then
                [ Msg.Detail "test" ]
            else if first == Label.edit then
                [ Msg.Edit "test" ]
            else
                []

        _ ->
            []
