module Lib.Storage exposing (..)

import Native.Storage


set : String -> String -> Bool
set key value =
    Native.Storage.set key value


get : String -> String
get key =
    Native.Storage.get key


remove : String -> Bool
remove key =
    Native.Storage.remove key
