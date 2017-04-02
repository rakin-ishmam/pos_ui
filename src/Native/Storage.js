var _user$project$Native_Storage = function() {
        var set = function (key, value) {
        if(typeof(value) !== "string") {
            return false;
        }

        localStorage.setItem(key, value);
        return true;
    };

    var remove = function (key) {
        var val = localStorage.removeItem(key);
        return true;
    }

    var get = function (key) {
        var val = localStorage[key];
        if(!val) {
            return "";
        }

        return val;
    };

    return {
        get : get,
        remove : remove,
        set : F2(set)
    }
}();