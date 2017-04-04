module Route exposing (..)

import Model exposing (Model)
import Msg exposing (Msg)
import Menu.Msg as MenuMsg
import Menu.Model as MenuModel
import RouteUrl exposing (UrlChange)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import Navigation exposing (Location)
import Menu.Label as MenuLabel
import User.Route as UserRoute
import Role.Route as RoleRoute
import User.Msg as UserMsg


delta2url : Model -> Model -> Maybe UrlChange
delta2url pre cur =
    Maybe.map Builder.toHashChange <|
        delta2builder pre cur


delta2builder : Model -> Model -> Maybe Builder
delta2builder pre cur =
    let
        view =
            cur.menu.current
    in
        if view == MenuLabel.user then
            UserRoute.delta2builder pre.user cur.user
                |> Maybe.map (Builder.prependToPath [ cur.menu.current ])
        else if view == MenuLabel.role then
            RoleRoute.delta2builder pre.role cur.role
                |> Maybe.map (Builder.prependToPath [ cur.menu.current ])
        else
            Just <|
                Builder.replacePath [ cur.menu.current ] <|
                    Builder.builder


url2messages : Location -> List Msg
url2messages location =
    builder2messages (Builder.fromHash location.href)


builder2messages : Builder -> List Msg
builder2messages builder =
    case Builder.path builder of
        first :: rest ->
            let
                subBuilder =
                    Builder.replacePath rest builder
            in
                if first == MenuLabel.role then
                    [ Msg.Menu MenuMsg.Role ]
                else if first == MenuLabel.logout then
                    [ Msg.Menu MenuMsg.Logout ]
                else if first == MenuLabel.user then
                    List.append [ Msg.Menu MenuMsg.User ] <|
                        List.map Msg.User <|
                            UserRoute.builder2messages subBuilder
                else if first == MenuLabel.me then
                    [ Msg.Menu MenuMsg.Me ]
                else if first == MenuLabel.sell then
                    [ Msg.Menu MenuMsg.Sell ]
                else if first == MenuLabel.report then
                    [ Msg.Menu MenuMsg.Report ]
                else if first == MenuLabel.product then
                    [ Msg.Menu MenuMsg.Product ]
                else if first == MenuLabel.order then
                    [ Msg.Menu MenuMsg.Order ]
                else
                    []

        _ ->
            []
