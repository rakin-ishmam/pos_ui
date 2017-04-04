module Store.User.Query exposing (..)

import Config


type alias Query =
    { skip : Int
    , limit : Int
    }


query : Query
query =
    { skip = 0
    , limit = Config.limit
    }


nextChunk : Query -> Query
nextChunk query =
    { query | skip = query.skip + Config.limit }


toURL : Query -> String
toURL query =
    "skip=" ++ (toString query.skip) ++ "&limit=" ++ (toString query.limit)
