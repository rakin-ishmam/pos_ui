module Route exposing (..)

import Model exposing (Model)
import Message exposing (Msg)
import Menu.Message as MenuMessage
import Menu.Model as MenuModel
import RouteUrl exposing (UrlChange)
import RouteUrl.Builder as Builder exposing (Builder, builder)
import Navigation exposing (Location)
import Menu.Data as MenuData
import Debug


delta2url : Model -> Model -> Maybe UrlChange
delta2url pre cur =
    Maybe.map Builder.toHashChange <|
        delta2builder pre cur


delta2builder : Model -> Model -> Maybe Builder
delta2builder pre cur =
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
            case (Debug.log "first" first) of
                "Role" ->
                    [ Message.Menu MenuMessage.Role ]

                "Logout" ->
                    [ Message.Menu MenuMessage.Logout ]

                "User" ->
                    [ Message.Menu MenuMessage.User ]

                "Me" ->
                    [ Message.Menu MenuMessage.Me ]

                "Sell" ->
                    [ Message.Menu <|
                        MenuMessage.SelectTab <|
                            tabInd "Sell"
                    ]

                "Product" ->
                    [ Message.Menu <|
                        MenuMessage.SelectTab <|
                            tabInd "Product"
                    ]

                "Order" ->
                    [ Message.Menu <|
                        MenuMessage.SelectTab <|
                            tabInd "Order"
                    ]

                "Report" ->
                    [ Message.Menu <|
                        MenuMessage.SelectTab <|
                            tabInd "Report"
                    ]

                _ ->
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
