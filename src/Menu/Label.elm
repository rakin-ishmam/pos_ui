module Menu.Label exposing (..)

import Array
import Lib.Array as LibArray


role : String
role =
    "Role"


me : String
me =
    "Me"


user : String
user =
    "User"


logout : String
logout =
    "Logout"


none : String
none =
    "none"


product : String
product =
    "Product"


sell : String
sell =
    "Sell"


order : String
order =
    "Order"


report : String
report =
    "Report"


tabInd : String -> Maybe Int
tabInd val =
    LibArray.index (filter val) 0 (Array.fromList tabList)


tabVal : Int -> Maybe String
tabVal ind =
    Array.get ind (Array.fromList tabList)


tabList : List String
tabList =
    [ sell, order, product, report ]


drawerList : List String
drawerList =
    [ role, me, user, logout ]


filter : String -> (String -> Bool)
filter who =
    \to -> to == who
