module Lib.Request exposing (..)

import Http


get : List Http.Header -> Http.Expect a -> String -> Http.Request a
get headers expect url =
    Http.request
        { method = "GET"
        , headers = headers
        , url = url
        , body = Http.emptyBody
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


post : List Http.Header -> Http.Body -> Http.Expect a -> String -> Http.Request a
post headers body expect url =
    Http.request
        { method = "POST"
        , headers = headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


put : List Http.Header -> Http.Body -> Http.Expect a -> String -> Http.Request a
put headers body expect url =
    Http.request
        { method = "PUT"
        , headers = headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }


delete : List Http.Header -> Http.Body -> Http.Expect a -> String -> Http.Request a
delete headers body expect url =
    Http.request
        { method = "DELETE"
        , headers = headers
        , url = url
        , body = body
        , expect = expect
        , timeout = Nothing
        , withCredentials = False
        }
