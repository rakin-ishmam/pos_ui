module Lib.Request exposing (..)

import Http


get : List ( String, String ) -> Http.Expect a -> String -> Http.Request a
get headers expect url =
    Http.request
        { method = "GET"
        , headers = List.map toHeader headers
        , url = url
        , body = Http.emptyBody
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


post : List ( String, String ) -> Http.Body -> Http.Expect a -> String -> Http.Request a
post headers body expect url =
    Http.request
        { method = "POST"
        , headers = List.map toHeader headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


put : List ( String, String ) -> Http.Body -> Http.Expect a -> String -> Http.Request a
put headers body expect url =
    Http.request
        { method = "PUT"
        , headers = List.map toHeader headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


delete : List ( String, String ) -> Http.Body -> Http.Expect a -> String -> Http.Request a
delete headers body expect url =
    Http.request
        { method = "DELETE"
        , headers = List.map toHeader headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


toHeader : ( String, String ) -> Http.Header
toHeader header =
    Http.header (Tuple.first header) (Tuple.second header)
