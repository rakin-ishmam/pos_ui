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


drawerList : List String
drawerList =
    [ role, me, user, logout ]


filter : String -> (String -> Bool)
filter who =
    \to -> to == who
