module User.Route exposing (..)

import User.Model as Model exposing (Model)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import User.Data as Data
import User.Msg as Msg exposing (Msg)


delta2builder : Model -> Model -> Maybe Builder
delta2builder pre cur =
    Just <|
        Builder.replacePath [ cur.view ] <|
            Builder.builder


builder2messages : Builder -> List Msg
builder2messages builder =
    case Builder.path builder of
        first :: rest ->
            if first == Data.create then
                [ Msg.Create ]
            else if first == Data.list then
                [ Msg.Lst ]
            else if first == Data.detail then
                [ Msg.Detail "test" ]
            else if first == Data.edit then
                [ Msg.Edit "test" ]
            else
                []

        _ ->
            []
