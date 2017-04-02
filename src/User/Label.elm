module User.Label exposing (..)

import Array
import Lib.Array as LibArray


create : String
create =
    "Create"


list : String
list =
    "List"


detail : String
detail =
    "Detail"


edit : String
edit =
    "Edit"


tabList : List String
tabList =
    [ list, create ]


tabInd : String -> Maybe Int
tabInd val =
    LibArray.index (filter val) 0 <|
        (Array.fromList tabList)


tabVal : Int -> Maybe String
tabVal ind =
    Array.get ind <|
        Array.fromList <|
            tabList


filter : String -> (String -> Bool)
filter who =
    \to -> to == who
