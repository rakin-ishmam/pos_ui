module Tab.Data exposing (..)

import Tab.Message as Message
import Array


type alias Tab =
    { name : String
    , msg : Message.ViewSelection
    }


tabList : Array.Array Tab
tabList =
    Array.fromList
        [ { name = "Sell"
          , msg = Message.Sell
          }
        , { name = "Product"
          , msg = Message.Product
          }
        , { name = "Order"
          , msg = Message.Order
          }
        , { name = "Report"
          , msg = Message.Report
          }
        ]


getMessage : Array.Array Tab -> Int -> Message.ViewSelection
getMessage array ind =
    case Array.get ind array of
        Just v ->
            v.msg

        _ ->
            Message.None
