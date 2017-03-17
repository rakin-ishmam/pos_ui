module Route exposing (..)

import Model exposing (Model)
import Msg exposing (Msg)
import Menu.Msg as MenuMsg
import Menu.Model as MenuModel
import RouteUrl exposing (UrlChange)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import Navigation exposing (Location)
import Menu.Data as MenuData
import User.Route as UserRoute
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
        if view == MenuData.user then
            UserRoute.delta2builder pre.user cur.user
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
                if first == MenuData.role then
                    [ Msg.Menu MenuMsg.Role ]
                else if first == MenuData.logout then
                    [ Msg.Menu MenuMsg.Logout ]
                else if first == MenuData.user then
                    List.append [ Msg.Menu MenuMsg.User ]
                        <| List.map Msg.User
                        <| UserRoute.builder2messages subBuilder
                else if first == MenuData.me then
                    [ Msg.Menu MenuMsg.Me ]
                else if first == MenuData.sell then
                    [ Msg.Menu <|
                        MenuMsg.SelectTab <|
                            tabInd MenuData.sell
                    ]
                else if first == MenuData.report then
                    [ Msg.Menu <|
                        MenuMsg.SelectTab <|
                            tabInd MenuData.report
                    ]
                else if first == MenuData.product then
                    [ Msg.Menu <|
                        MenuMsg.SelectTab <|
                            tabInd MenuData.product
                    ]
                else if first == MenuData.order then
                    [ Msg.Menu <|
                        MenuMsg.SelectTab <|
                            tabInd MenuData.order
                    ]
                else
                    []

        _ ->
            []


tabInd : String -> Int
tabInd val =
    case MenuData.tabInd val of
        Just ind ->
            ind

        _ ->
            -1