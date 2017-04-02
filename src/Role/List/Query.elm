module Role.List.Query exposing (..)

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


increaseSkip : Query -> Query
increaseSkip query =
    { query | skip = query.skip + Config.limit }


toURL : Query -> String
toURL query =
    "skip=" ++ (toString query.skip) ++ "&limit=" ++ (toString query.limit)
