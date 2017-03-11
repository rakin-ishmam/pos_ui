module Drawer.Data exposing (..)


role : String
role =
    "role"


me : String
me =
    "me"


user : String
user =
    "user"


logout : String
logout =
    "logout"

list : List String
list =
    [role, me, user, logout]

filter : String -> (String -> Bool)
filter who =
    \ to -> to == who