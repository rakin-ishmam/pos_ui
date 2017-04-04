module Role.Label exposing (..)


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


filter : String -> (String -> Bool)
filter who =
    \to -> to == who
