module Lib.NewCmd exposing (..)

import Task 

cmd : msg -> Cmd msg
cmd msg =
    Task.perform (\a -> msg) (Task.succeed ())    

