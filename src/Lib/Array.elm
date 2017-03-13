module Lib.Array exposing(..)

import Array

index : (a -> Bool) -> Int -> Array.Array a -> Maybe Int
index filter start array =
    if start >= Array.length array then
        Nothing
    else 
        case Array.get start array of
            Just val ->
                if filter val then
                    Just start
                else
                    index filter (start + 1) array

            _ ->
                Nothing