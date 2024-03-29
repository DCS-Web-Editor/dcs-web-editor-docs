--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local __TS__Match = string.match

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. tostring(message))
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local chunkName = (__TS__Match(file, "%[string \"([^\"]+)\"%]"))
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        if debug == nil then
            return nil
        end
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch ~= nil then
                base = 16
                numberString = (__TS__Match(hexMatch, "-")) and "-" .. __TS__StringSubstring(numberString, #hexMatch) or __TS__StringSubstring(numberString, #hexMatch)
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local allowedDigits = base <= 10 and __TS__StringSubstring(parseIntBasePattern, 0, base) or __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber((__TS__Match(numberString, pattern)), base)
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local __TS__Unpack = table.unpack or unpack

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

return {
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Class = __TS__Class,
  __TS__New = __TS__New,
  __TS__StringStartsWith = __TS__StringStartsWith,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Unpack = __TS__Unpack,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__StringSplit = __TS__StringSplit,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__StringTrim = __TS__StringTrim,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread
}
 end,
["package"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
return {
    name = "mission-server",
    version = "1.0.0",
    description = "Mission Server Component",
    main = "dist/dcs-web-editor-mission-server.lua",
    private = true,
    scripts = {
        prebuild = "ts-json-schema-generator -p src/**/*.dto.ts -o src/dtos/dto.schema.json && node scripts/jsonschema-to-oas31.js",
        clean = "rimraf dist",
        build = "rimraf dist && tstl -p tsconfig.tstl.json",
        deploy = "node scripts/deploy.js",
        ["build-and-deploy"] = "npm run build && npm run deploy",
        ["detect-circular"] = "madge --circular --extensions js,ts src"
    },
    dependencies = {
        ["@flying-dice/tslua-common"] = "^0.29.0",
        ["@flying-dice/tslua-dcs-mission-types"] = "^0.29.0",
        ["@flying-dice/tslua-rxi-json"] = "^0.29.0",
        ["@turf/helpers"] = "^6.5.0",
        ["dcs-web-editor-common"] = "1.0.0"
    },
    devDependencies = {
        ["lua-types"] = "^2.13.1",
        madge = "^6.1.0",
        rimraf = "^5.0.5",
        traverse = "^0.6.7",
        ["ts-json-schema-generator"] = "^1.4.1",
        typescript = "^5.2.2",
        ["typescript-to-lua"] = "^1.22.0"
    }
}
 end,
["src.config"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local LogLevel = ____tslua_2Dcommon.LogLevel
local Logger = ____tslua_2Dcommon.Logger
Logger.level = LogLevel.TRACE
Logger.transports = {
    trace = function(____, message) return env.info(message) end,
    debug = function(____, message) return env.info(message) end,
    info = function(____, message) return env.info(message) end,
    warn = function(____, message) return env.warning(message, true) end,
    error = function(____, message) return env.error(message, true) end
}
____exports.config = {bindAddress = "127.0.0.1", port = 31481, httpErrors = {NOT_FOUND = 404, INTERNAL_SERVER_ERROR = 500, INVALID_REQUEST = 400, FORBIDDEN = 403}}
return ____exports
 end,
["lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 10,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 14,["23"] = 14,["35"] = 50,["36"] = 50,["37"] = 50,["38"] = 61,["39"] = 61,["40"] = 61,["41"] = 73,["42"] = 74,["43"] = 75,["45"] = 73,["46"] = 89,["47"] = 90,["48"] = 91,["50"] = 89,["51"] = 105,["52"] = 106,["53"] = 107,["55"] = 105,["56"] = 121,["57"] = 122,["58"] = 123,["60"] = 121,["61"] = 137,["62"] = 138,["63"] = 139,["65"] = 137,["66"] = 154,["67"] = 154,["68"] = 51,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53});
local ____exports = {}
--- LogLevel represents the different severity levels that can be used to log messages.
-- 
-- The levels are TRACE, DEBUG, INFO, WARN, ERROR, and OFF.
-- 
-- OFF is a special level that can be used to disable logging.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 10
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 20
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 30
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 40
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 50
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
____exports.LogLevel.OFF = 100
____exports.LogLevel[____exports.LogLevel.OFF] = "OFF"
--- Represents a logger that can be used to log messages with different severity levels.
-- 
-- Change the static level property to change the severity level of messages that are logged.
-- 
-- Change the static transports property to change the way messages are logged.
-- 
-- Use Logger.ignore to ignore a severity level.
-- 
-- @example const logger = new Logger("MyLogger");
-- Logger.level = LogLevel.DEBUG;
-- Logger.transports = { debug: print, info: print, warn: print, error: print };
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.trace(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.TRACE then
        ____exports.Logger.transports:trace((("[TRACE] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.debug(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.DEBUG then
        ____exports.Logger.transports:debug((("[DEBUG] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.info(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.INFO then
        ____exports.Logger.transports:info((("[INFO] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.warn(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.WARN then
        ____exports.Logger.transports:warn((("[WARN] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.error(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.ERROR then
        ____exports.Logger.transports:error((("[ERROR] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.ignore(self)
end
Logger.level = ____exports.LogLevel.INFO
Logger.transports = {
    trace = ____exports.Logger.ignore,
    debug = ____exports.Logger.ignore,
    info = ____exports.Logger.ignore,
    warn = ____exports.Logger.ignore,
    error = ____exports.Logger.ignore
}
return ____exports
 end,
["src.dtos.dto.openapi"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
return {openapi = "3.1.0", info = {title = "DTOs", version = "1.0.0"}, paths = {}, components = {schemas = {ErrorDto = {additionalProperties = false, properties = {error = {type = "string"}}, required = {"error"}, type = "object"}}}}
 end,
["src.app"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dopenapi = require("lua_modules.@flying-dice.tslua-openapi.dist.index")
local oas31 = ____tslua_2Dopenapi.oas31
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local JsonApiApplication = ____dcs_2Dweb_2Deditor_2Dcommon.JsonApiApplication
local ____package_2Ejson = require("package")
local description = ____package_2Ejson.description
local name = ____package_2Ejson.name
local version = ____package_2Ejson.version
local ____config = require("src.config")
local config = ____config.config
local componentsApiSpec = require("src.dtos.dto.openapi")
____exports.apispec = oas31.OpenApiBuilder:create({openapi = "3.1.0", info = {title = name, description = description, version = version}, paths = {}, components = {schemas = componentsApiSpec.components.schemas}})
____exports.app = __TS__New(JsonApiApplication, config.bindAddress, config.port, ____exports.apispec)
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.middleware.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.json-api-application")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.utils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["7"] = 2,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2});
local ____exports = {}
____exports.oas31 = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.oas31")
do
    local ____server = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server")
    local Server = ____server.Server
    local ServerVariable = ____server.ServerVariable
    ____exports.Server = Server
    ____exports.ServerVariable = ServerVariable
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 11,["10"] = 12,["11"] = 13,["12"] = 14,["13"] = 11,["14"] = 16,["15"] = 17,["16"] = 16,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 28,["21"] = 32,["22"] = 33,["23"] = 34,["24"] = 27});
local ____exports = {}
____exports.Server = __TS__Class()
local Server = ____exports.Server
Server.name = "Server"
function Server.prototype.____constructor(self, url, desc)
    self.url = url
    self.description = desc
    self.variables = {}
end
function Server.prototype.addVariable(self, name, variable)
    self.variables[name] = variable
end
____exports.ServerVariable = __TS__Class()
local ServerVariable = ____exports.ServerVariable
ServerVariable.name = "ServerVariable"
function ServerVariable.prototype.____constructor(self, defaultValue, enums, description)
    self.default = defaultValue
    self.enum = enums
    self.description = description
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.oas31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2,["22"] = 3,["23"] = 3,["24"] = 3,["25"] = 3,["26"] = 3});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.dsl.openapi-builder31")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.openapi31")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____server = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server")
    local Server = ____server.Server
    local ServerVariable = ____server.ServerVariable
    ____exports.Server = Server
    ____exports.ServerVariable = ServerVariable
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.openapi31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 7,["6"] = 9,["8"] = 12,["15"] = 78,["16"] = 82,["17"] = 83,["19"] = 85,["20"] = 78,["25"] = 262,["26"] = 263,["27"] = 262,["35"] = 339,["36"] = 342,["37"] = 339});
local ____exports = {}
local ____specification_2Dextension = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension")
local SpecificationExtension = ____specification_2Dextension.SpecificationExtension
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.oas-common")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
function ____exports.getPath(self, pathsObject, path)
    if SpecificationExtension:isValidExtension(path) then
        return nil
    end
    return pathsObject and pathsObject[path] or nil
end
--- A type guard to check if the given value is a `ReferenceObject`.
-- See https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-guards-and-differentiating-types
-- 
-- @param obj The value to check.
function ____exports.isReferenceObject(self, obj)
    return Object.prototype.hasOwnProperty(obj, "$ref")
end
--- A type guard to check if the given object is a `SchemaObject`.
-- Useful to distinguish from `ReferenceObject` values that can be used
-- in most places where `SchemaObject` is allowed.
-- 
-- See https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-guards-and-differentiating-types
-- 
-- @param schema The value to check.
function ____exports.isSchemaObject(self, schema)
    return not Object.prototype.hasOwnProperty(schema, "$ref")
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.oas-common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 6,["7"] = 20,["8"] = 24,["9"] = 25,["11"] = 27,["12"] = 28,["14"] = 30,["15"] = 20,["16"] = 32,["17"] = 37,["18"] = 38,["20"] = 32});
local ____exports = {}
local ____specification_2Dextension = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension")
local SpecificationExtension = ____specification_2Dextension.SpecificationExtension
function ____exports.getExtension(self, obj, extensionName)
    if not obj then
        return nil
    end
    if SpecificationExtension:isValidExtension(extensionName) then
        return obj[extensionName]
    end
    return nil
end
function ____exports.addExtension(self, obj, extensionName, extension)
    if obj and SpecificationExtension:isValidExtension(extensionName) then
        obj[extensionName] = extension
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 15,["15"] = 15,["16"] = 15,["18"] = 15,["19"] = 18,["20"] = 19,["21"] = 18,["22"] = 22,["23"] = 23,["25"] = 24,["29"] = 28,["30"] = 29,["32"] = 31,["33"] = 22,["34"] = 33,["35"] = 34,["37"] = 35,["41"] = 39,["42"] = 33,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["52"] = 50,["53"] = 41});
local ____exports = {}
____exports.SpecificationExtension = __TS__Class()
local SpecificationExtension = ____exports.SpecificationExtension
SpecificationExtension.name = "SpecificationExtension"
function SpecificationExtension.prototype.____constructor(self)
end
function SpecificationExtension.isValidExtension(self, extensionName)
    return __TS__StringStartsWith(extensionName, "x-")
end
function SpecificationExtension.prototype.getExtension(self, extensionName)
    if not ____exports.SpecificationExtension:isValidExtension(extensionName) then
        error(
            __TS__New(Error, ("Invalid specification extension: '" .. extensionName) .. "'. Extensions must start with prefix 'x-"),
            0
        )
    end
    if self[extensionName] then
        return self[extensionName]
    end
    return nil
end
function SpecificationExtension.prototype.addExtension(self, extensionName, payload)
    if not ____exports.SpecificationExtension:isValidExtension(extensionName) then
        error(
            __TS__New(Error, ("Invalid specification extension: '" .. extensionName) .. "'. Extensions must start with prefix 'x-"),
            0
        )
    end
    self[extensionName] = payload
end
function SpecificationExtension.prototype.listExtensions(self)
    local res = {}
    for propName in pairs(self) do
        if Object.prototype.hasOwnProperty(self, propName) then
            if ____exports.SpecificationExtension:isValidExtension(propName) then
                res[#res + 1] = propName
            end
        end
    end
    return res
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.dsl.openapi-builder31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 13,["12"] = 14,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 21,["25"] = 21,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 13,["31"] = 9,["32"] = 10,["33"] = 9,["34"] = 37,["35"] = 38,["36"] = 37,["37"] = 41,["38"] = 42,["39"] = 43,["40"] = 41,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 45,["45"] = 49,["46"] = 50,["47"] = 51,["48"] = 49,["49"] = 53,["50"] = 54,["51"] = 55,["52"] = 53,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 57,["57"] = 61,["58"] = 62,["59"] = 63,["60"] = 61,["61"] = 65,["62"] = 66,["63"] = 67,["64"] = 65,["65"] = 69,["66"] = 70,["67"] = 71,["68"] = 69,["69"] = 73,["70"] = 74,["71"] = 75,["72"] = 79,["73"] = 73,["74"] = 81,["75"] = 85,["76"] = 86,["77"] = 87,["78"] = 88,["79"] = 81,["80"] = 90,["81"] = 94,["82"] = 95,["83"] = 96,["84"] = 97,["85"] = 90,["86"] = 99,["87"] = 103,["88"] = 104,["89"] = 106,["90"] = 107,["91"] = 99,["92"] = 109,["93"] = 113,["94"] = 114,["95"] = 115,["96"] = 116,["97"] = 109,["98"] = 118,["99"] = 122,["100"] = 123,["101"] = 125,["102"] = 126,["103"] = 118,["104"] = 128,["105"] = 132,["106"] = 133,["107"] = 134,["108"] = 135,["109"] = 128,["110"] = 137,["111"] = 141,["112"] = 142,["113"] = 144,["114"] = 145,["115"] = 137,["116"] = 147,["117"] = 151,["118"] = 152,["119"] = 153,["120"] = 154,["121"] = 147,["122"] = 156,["123"] = 160,["124"] = 161,["125"] = 162,["126"] = 163,["127"] = 156,["128"] = 165,["129"] = 166,["130"] = 167,["131"] = 167,["132"] = 168,["133"] = 165,["134"] = 170,["135"] = 171,["136"] = 172,["137"] = 172,["138"] = 173,["139"] = 170,["140"] = 175,["141"] = 176,["142"] = 177,["143"] = 175,["144"] = 179,["145"] = 180,["146"] = 180,["147"] = 180,["149"] = 181,["150"] = 182,["151"] = 179});
local ____exports = {}
____exports.OpenApiBuilder = __TS__Class()
local OpenApiBuilder = ____exports.OpenApiBuilder
OpenApiBuilder.name = "OpenApiBuilder"
function OpenApiBuilder.prototype.____constructor(self, doc)
    self.rootDoc = doc or ({
        openapi = "3.1.0",
        info = {title = "app", version = "version"},
        paths = {},
        components = {
            schemas = {},
            responses = {},
            parameters = {},
            examples = {},
            requestBodies = {},
            headers = {},
            securitySchemes = {},
            links = {},
            callbacks = {}
        },
        tags = {},
        servers = {}
    })
end
function OpenApiBuilder.create(self, doc)
    return __TS__New(____exports.OpenApiBuilder, doc)
end
function OpenApiBuilder.prototype.getSpec(self)
    return self.rootDoc
end
function OpenApiBuilder.prototype.addOpenApiVersion(self, openApiVersion)
    self.rootDoc.openapi = openApiVersion
    return self
end
function OpenApiBuilder.prototype.addInfo(self, info)
    self.rootDoc.info = info
    return self
end
function OpenApiBuilder.prototype.addContact(self, contact)
    self.rootDoc.info.contact = contact
    return self
end
function OpenApiBuilder.prototype.addLicense(self, license)
    self.rootDoc.info.license = license
    return self
end
function OpenApiBuilder.prototype.addTitle(self, title)
    self.rootDoc.info.title = title
    return self
end
function OpenApiBuilder.prototype.addDescription(self, description)
    self.rootDoc.info.description = description
    return self
end
function OpenApiBuilder.prototype.addTermsOfService(self, termsOfService)
    self.rootDoc.info.termsOfService = termsOfService
    return self
end
function OpenApiBuilder.prototype.addVersion(self, version)
    self.rootDoc.info.version = version
    return self
end
function OpenApiBuilder.prototype.addPath(self, path, pathItem)
    self.rootDoc.paths = self.rootDoc.paths or ({})
    self.rootDoc.paths[path] = __TS__ObjectAssign({}, self.rootDoc.paths[path] or ({}), pathItem)
    return self
end
function OpenApiBuilder.prototype.addSchema(self, name, schema)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.schemas = self.rootDoc.components.schemas or ({})
    self.rootDoc.components.schemas[name] = schema
    return self
end
function OpenApiBuilder.prototype.addResponse(self, name, response)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.responses = self.rootDoc.components.responses or ({})
    self.rootDoc.components.responses[name] = response
    return self
end
function OpenApiBuilder.prototype.addParameter(self, name, parameter)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.parameters = self.rootDoc.components.parameters or ({})
    self.rootDoc.components.parameters[name] = parameter
    return self
end
function OpenApiBuilder.prototype.addExample(self, name, example)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.examples = self.rootDoc.components.examples or ({})
    self.rootDoc.components.examples[name] = example
    return self
end
function OpenApiBuilder.prototype.addRequestBody(self, name, reqBody)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.requestBodies = self.rootDoc.components.requestBodies or ({})
    self.rootDoc.components.requestBodies[name] = reqBody
    return self
end
function OpenApiBuilder.prototype.addHeader(self, name, header)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.headers = self.rootDoc.components.headers or ({})
    self.rootDoc.components.headers[name] = header
    return self
end
function OpenApiBuilder.prototype.addSecurityScheme(self, name, secScheme)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.securitySchemes = self.rootDoc.components.securitySchemes or ({})
    self.rootDoc.components.securitySchemes[name] = secScheme
    return self
end
function OpenApiBuilder.prototype.addLink(self, name, link)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.links = self.rootDoc.components.links or ({})
    self.rootDoc.components.links[name] = link
    return self
end
function OpenApiBuilder.prototype.addCallback(self, name, callback)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.callbacks = self.rootDoc.components.callbacks or ({})
    self.rootDoc.components.callbacks[name] = callback
    return self
end
function OpenApiBuilder.prototype.addServer(self, server)
    self.rootDoc.servers = self.rootDoc.servers or ({})
    local ____self_rootDoc_servers_0 = self.rootDoc.servers
    ____self_rootDoc_servers_0[#____self_rootDoc_servers_0 + 1] = server
    return self
end
function OpenApiBuilder.prototype.addTag(self, tag)
    self.rootDoc.tags = self.rootDoc.tags or ({})
    local ____self_rootDoc_tags_1 = self.rootDoc.tags
    ____self_rootDoc_tags_1[#____self_rootDoc_tags_1 + 1] = tag
    return self
end
function OpenApiBuilder.prototype.addExternalDocs(self, extDoc)
    self.rootDoc.externalDocs = extDoc
    return self
end
function OpenApiBuilder.prototype.addWebhook(self, webhook, webhookItem)
    local ____self_rootDoc_2, ____webhooks_3 = self.rootDoc, "webhooks"
    if ____self_rootDoc_2[____webhooks_3] == nil then
        ____self_rootDoc_2[____webhooks_3] = {}
    end
    self.rootDoc.webhooks[webhook] = webhookItem
    return self
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-openapi.dist.utils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 4,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["20"] = 13,["21"] = 14,["22"] = 9,["23"] = 9,["24"] = 24,["25"] = 4,["26"] = 27});
local ____exports = {}
____exports.responses = function(____, responseRefs)
    local res = {}
    __TS__ArrayForEach(
        __TS__ObjectKeys(responseRefs),
        function(____, key)
            local httpStatus = __TS__ParseInt(key)
            local responseRef = responseRefs[httpStatus]
            if not responseRef then
                return
            end
            local response, ref = __TS__Unpack(responseRef)
            res[tostring(key)] = __TS__ObjectAssign({}, response, {content = {["application/json"] = {schema = {["$ref"] = "#/components/schemas/" .. ref}}}})
        end
    )
    return res
end
____exports.body = function(____, schema) return {content = {["application/json"] = {schema = {["$ref"] = "#/components/schemas/" .. schema}}}} end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 2,["18"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.server")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
    local HttpStatus = ____constants.HttpStatus
    local StatusText = ____constants.StatusText
    ____exports.HttpStatus = HttpStatus
    ____exports.StatusText = StatusText
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.constants"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 5,["8"] = 11,["9"] = 11,["10"] = 17,["11"] = 17,["12"] = 23,["13"] = 23,["14"] = 29,["15"] = 29,["16"] = 39,["17"] = 39,["18"] = 45,["19"] = 45,["20"] = 51,["21"] = 51,["22"] = 57,["23"] = 57,["24"] = 63,["25"] = 63,["26"] = 69,["27"] = 69,["28"] = 75,["29"] = 75,["30"] = 81,["31"] = 81,["32"] = 87,["33"] = 87,["34"] = 93,["35"] = 93,["36"] = 99,["37"] = 99,["38"] = 105,["39"] = 105,["40"] = 111,["41"] = 111,["42"] = 118,["43"] = 118,["44"] = 124,["45"] = 124,["46"] = 130,["47"] = 130,["48"] = 136,["49"] = 136,["50"] = 142,["51"] = 142,["52"] = 148,["53"] = 148,["54"] = 154,["55"] = 154,["56"] = 160,["57"] = 160,["58"] = 166,["59"] = 166,["60"] = 172,["61"] = 172,["62"] = 178,["63"] = 178,["64"] = 184,["65"] = 184,["66"] = 190,["67"] = 190,["68"] = 196,["69"] = 196,["70"] = 202,["71"] = 202,["72"] = 208,["73"] = 208,["74"] = 214,["75"] = 214,["76"] = 220,["77"] = 220,["78"] = 226,["79"] = 226,["80"] = 232,["81"] = 232,["82"] = 238,["83"] = 238,["84"] = 244,["85"] = 244,["86"] = 250,["87"] = 250,["88"] = 257,["89"] = 257,["90"] = 263,["91"] = 263,["92"] = 269,["93"] = 269,["94"] = 275,["95"] = 275,["96"] = 281,["97"] = 281,["98"] = 287,["99"] = 287,["100"] = 293,["101"] = 293,["102"] = 299,["103"] = 299,["104"] = 305,["105"] = 305,["106"] = 311,["107"] = 311,["108"] = 317,["109"] = 317,["110"] = 323,["111"] = 323,["112"] = 329,["113"] = 329,["114"] = 335,["115"] = 335,["116"] = 341,["117"] = 341,["118"] = 347,["119"] = 347,["120"] = 353,["121"] = 353,["122"] = 359,["123"] = 359,["124"] = 362,["125"] = 362,["126"] = 362,["127"] = 362,["128"] = 362,["129"] = 362,["130"] = 362,["131"] = 362,["132"] = 362,["133"] = 362,["134"] = 362,["135"] = 362,["136"] = 362,["137"] = 362,["138"] = 362,["139"] = 362,["140"] = 362,["141"] = 362,["142"] = 362,["143"] = 362,["144"] = 362,["145"] = 362,["146"] = 362,["147"] = 362,["148"] = 362,["149"] = 362,["150"] = 362,["151"] = 362,["152"] = 362,["153"] = 362,["154"] = 362,["155"] = 362,["156"] = 362,["157"] = 362,["158"] = 362,["159"] = 362,["160"] = 362,["161"] = 362,["162"] = 362,["163"] = 362,["164"] = 362,["165"] = 362,["166"] = 362,["167"] = 362,["168"] = 362,["169"] = 362,["170"] = 362,["171"] = 362,["172"] = 362,["173"] = 362,["174"] = 362,["175"] = 362,["176"] = 362,["177"] = 362,["178"] = 362,["179"] = 362,["180"] = 362,["181"] = 362,["182"] = 362,["183"] = 362});
local ____exports = {}
____exports.EMPTY_LINE = ""
____exports.CRLF = "\r\n"
____exports.HttpStatus = HttpStatus or ({})
____exports.HttpStatus.CONTINUE = 100
____exports.HttpStatus[____exports.HttpStatus.CONTINUE] = "CONTINUE"
____exports.HttpStatus.SWITCHING_PROTOCOLS = 101
____exports.HttpStatus[____exports.HttpStatus.SWITCHING_PROTOCOLS] = "SWITCHING_PROTOCOLS"
____exports.HttpStatus.PROCESSING = 102
____exports.HttpStatus[____exports.HttpStatus.PROCESSING] = "PROCESSING"
____exports.HttpStatus.EARLY_HINTS = 103
____exports.HttpStatus[____exports.HttpStatus.EARLY_HINTS] = "EARLY_HINTS"
____exports.HttpStatus.OK = 200
____exports.HttpStatus[____exports.HttpStatus.OK] = "OK"
____exports.HttpStatus.CREATED = 201
____exports.HttpStatus[____exports.HttpStatus.CREATED] = "CREATED"
____exports.HttpStatus.ACCEPTED = 202
____exports.HttpStatus[____exports.HttpStatus.ACCEPTED] = "ACCEPTED"
____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION = 203
____exports.HttpStatus[____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION] = "NON_AUTHORITATIVE_INFORMATION"
____exports.HttpStatus.NO_CONTENT = 204
____exports.HttpStatus[____exports.HttpStatus.NO_CONTENT] = "NO_CONTENT"
____exports.HttpStatus.RESET_CONTENT = 205
____exports.HttpStatus[____exports.HttpStatus.RESET_CONTENT] = "RESET_CONTENT"
____exports.HttpStatus.PARTIAL_CONTENT = 206
____exports.HttpStatus[____exports.HttpStatus.PARTIAL_CONTENT] = "PARTIAL_CONTENT"
____exports.HttpStatus.MULTI_STATUS = 207
____exports.HttpStatus[____exports.HttpStatus.MULTI_STATUS] = "MULTI_STATUS"
____exports.HttpStatus.MULTIPLE_CHOICES = 300
____exports.HttpStatus[____exports.HttpStatus.MULTIPLE_CHOICES] = "MULTIPLE_CHOICES"
____exports.HttpStatus.MOVED_PERMANENTLY = 301
____exports.HttpStatus[____exports.HttpStatus.MOVED_PERMANENTLY] = "MOVED_PERMANENTLY"
____exports.HttpStatus.MOVED_TEMPORARILY = 302
____exports.HttpStatus[____exports.HttpStatus.MOVED_TEMPORARILY] = "MOVED_TEMPORARILY"
____exports.HttpStatus.SEE_OTHER = 303
____exports.HttpStatus[____exports.HttpStatus.SEE_OTHER] = "SEE_OTHER"
____exports.HttpStatus.NOT_MODIFIED = 304
____exports.HttpStatus[____exports.HttpStatus.NOT_MODIFIED] = "NOT_MODIFIED"
____exports.HttpStatus.USE_PROXY = 305
____exports.HttpStatus[____exports.HttpStatus.USE_PROXY] = "USE_PROXY"
____exports.HttpStatus.TEMPORARY_REDIRECT = 307
____exports.HttpStatus[____exports.HttpStatus.TEMPORARY_REDIRECT] = "TEMPORARY_REDIRECT"
____exports.HttpStatus.PERMANENT_REDIRECT = 308
____exports.HttpStatus[____exports.HttpStatus.PERMANENT_REDIRECT] = "PERMANENT_REDIRECT"
____exports.HttpStatus.BAD_REQUEST = 400
____exports.HttpStatus[____exports.HttpStatus.BAD_REQUEST] = "BAD_REQUEST"
____exports.HttpStatus.UNAUTHORIZED = 401
____exports.HttpStatus[____exports.HttpStatus.UNAUTHORIZED] = "UNAUTHORIZED"
____exports.HttpStatus.PAYMENT_REQUIRED = 402
____exports.HttpStatus[____exports.HttpStatus.PAYMENT_REQUIRED] = "PAYMENT_REQUIRED"
____exports.HttpStatus.FORBIDDEN = 403
____exports.HttpStatus[____exports.HttpStatus.FORBIDDEN] = "FORBIDDEN"
____exports.HttpStatus.NOT_FOUND = 404
____exports.HttpStatus[____exports.HttpStatus.NOT_FOUND] = "NOT_FOUND"
____exports.HttpStatus.METHOD_NOT_ALLOWED = 405
____exports.HttpStatus[____exports.HttpStatus.METHOD_NOT_ALLOWED] = "METHOD_NOT_ALLOWED"
____exports.HttpStatus.NOT_ACCEPTABLE = 406
____exports.HttpStatus[____exports.HttpStatus.NOT_ACCEPTABLE] = "NOT_ACCEPTABLE"
____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED = 407
____exports.HttpStatus[____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED] = "PROXY_AUTHENTICATION_REQUIRED"
____exports.HttpStatus.REQUEST_TIMEOUT = 408
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TIMEOUT] = "REQUEST_TIMEOUT"
____exports.HttpStatus.CONFLICT = 409
____exports.HttpStatus[____exports.HttpStatus.CONFLICT] = "CONFLICT"
____exports.HttpStatus.GONE = 410
____exports.HttpStatus[____exports.HttpStatus.GONE] = "GONE"
____exports.HttpStatus.LENGTH_REQUIRED = 411
____exports.HttpStatus[____exports.HttpStatus.LENGTH_REQUIRED] = "LENGTH_REQUIRED"
____exports.HttpStatus.PRECONDITION_FAILED = 412
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_FAILED] = "PRECONDITION_FAILED"
____exports.HttpStatus.REQUEST_TOO_LONG = 413
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TOO_LONG] = "REQUEST_TOO_LONG"
____exports.HttpStatus.REQUEST_URI_TOO_LONG = 414
____exports.HttpStatus[____exports.HttpStatus.REQUEST_URI_TOO_LONG] = "REQUEST_URI_TOO_LONG"
____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE = 415
____exports.HttpStatus[____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE] = "UNSUPPORTED_MEDIA_TYPE"
____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE = 416
____exports.HttpStatus[____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE] = "REQUESTED_RANGE_NOT_SATISFIABLE"
____exports.HttpStatus.EXPECTATION_FAILED = 417
____exports.HttpStatus[____exports.HttpStatus.EXPECTATION_FAILED] = "EXPECTATION_FAILED"
____exports.HttpStatus.IM_A_TEAPOT = 418
____exports.HttpStatus[____exports.HttpStatus.IM_A_TEAPOT] = "IM_A_TEAPOT"
____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE = 419
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE] = "INSUFFICIENT_SPACE_ON_RESOURCE"
____exports.HttpStatus.METHOD_FAILURE = 420
____exports.HttpStatus[____exports.HttpStatus.METHOD_FAILURE] = "METHOD_FAILURE"
____exports.HttpStatus.MISDIRECTED_REQUEST = 421
____exports.HttpStatus[____exports.HttpStatus.MISDIRECTED_REQUEST] = "MISDIRECTED_REQUEST"
____exports.HttpStatus.UNPROCESSABLE_ENTITY = 422
____exports.HttpStatus[____exports.HttpStatus.UNPROCESSABLE_ENTITY] = "UNPROCESSABLE_ENTITY"
____exports.HttpStatus.LOCKED = 423
____exports.HttpStatus[____exports.HttpStatus.LOCKED] = "LOCKED"
____exports.HttpStatus.FAILED_DEPENDENCY = 424
____exports.HttpStatus[____exports.HttpStatus.FAILED_DEPENDENCY] = "FAILED_DEPENDENCY"
____exports.HttpStatus.UPGRADE_REQUIRED = 426
____exports.HttpStatus[____exports.HttpStatus.UPGRADE_REQUIRED] = "UPGRADE_REQUIRED"
____exports.HttpStatus.PRECONDITION_REQUIRED = 428
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_REQUIRED] = "PRECONDITION_REQUIRED"
____exports.HttpStatus.TOO_MANY_REQUESTS = 429
____exports.HttpStatus[____exports.HttpStatus.TOO_MANY_REQUESTS] = "TOO_MANY_REQUESTS"
____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE = 431
____exports.HttpStatus[____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE] = "REQUEST_HEADER_FIELDS_TOO_LARGE"
____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS = 451
____exports.HttpStatus[____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS] = "UNAVAILABLE_FOR_LEGAL_REASONS"
____exports.HttpStatus.INTERNAL_SERVER_ERROR = 500
____exports.HttpStatus[____exports.HttpStatus.INTERNAL_SERVER_ERROR] = "INTERNAL_SERVER_ERROR"
____exports.HttpStatus.NOT_IMPLEMENTED = 501
____exports.HttpStatus[____exports.HttpStatus.NOT_IMPLEMENTED] = "NOT_IMPLEMENTED"
____exports.HttpStatus.BAD_GATEWAY = 502
____exports.HttpStatus[____exports.HttpStatus.BAD_GATEWAY] = "BAD_GATEWAY"
____exports.HttpStatus.SERVICE_UNAVAILABLE = 503
____exports.HttpStatus[____exports.HttpStatus.SERVICE_UNAVAILABLE] = "SERVICE_UNAVAILABLE"
____exports.HttpStatus.GATEWAY_TIMEOUT = 504
____exports.HttpStatus[____exports.HttpStatus.GATEWAY_TIMEOUT] = "GATEWAY_TIMEOUT"
____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED = 505
____exports.HttpStatus[____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED] = "HTTP_VERSION_NOT_SUPPORTED"
____exports.HttpStatus.INSUFFICIENT_STORAGE = 507
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_STORAGE] = "INSUFFICIENT_STORAGE"
____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED = 511
____exports.HttpStatus[____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED] = "NETWORK_AUTHENTICATION_REQUIRED"
____exports.StatusText = {
    [____exports.HttpStatus.CONTINUE] = "Continue",
    [____exports.HttpStatus.SWITCHING_PROTOCOLS] = "Switching protocols",
    [____exports.HttpStatus.PROCESSING] = "Processing",
    [103] = "Early Hints",
    [200] = "OK",
    [201] = "Created",
    [202] = "Accepted",
    [203] = "Non-Authoritative Information",
    [204] = "No Content",
    [205] = "Reset Content",
    [206] = "Partial Content",
    [207] = "Multi-Status",
    [300] = "Multiple Choices",
    [301] = "Moved Permanently",
    [302] = "Found (Previously \"Moved Temporarily\")",
    [303] = "See Other",
    [304] = "Not Modified",
    [305] = "Use Proxy",
    [307] = "Temporary Redirect",
    [308] = "Permanent Redirect",
    [400] = "Bad Request",
    [401] = "Unauthorized",
    [402] = "Payment Required",
    [403] = "Forbidden",
    [404] = "Not Found",
    [405] = "Method Not Allowed",
    [406] = "Not Acceptable",
    [407] = "Proxy Authentication Required",
    [408] = "Request Timeout",
    [409] = "Conflict",
    [410] = "Gone",
    [411] = "Length Required",
    [412] = "Precondition Failed",
    [413] = "Payload Too Large",
    [414] = "URI Too Long",
    [415] = "Unsupported Media Type",
    [416] = "Range Not Satisfiable",
    [417] = "Expectation Failed",
    [418] = "I'm a Teapot",
    [419] = "INSUFFICIENT_SPACE_ON_RESOURCE",
    [420] = "METHOD_FAILURE",
    [421] = "Misdirected Request",
    [422] = "Unprocessable Entity",
    [423] = "Locked",
    [424] = "Failed Dependency",
    [426] = "Upgrade Required",
    [428] = "Precondition Required",
    [429] = "Too Many Requests",
    [431] = "Request Header Fields Too Large",
    [451] = "Unavailable For Legal Reasons",
    [500] = "Internal Server Error",
    [501] = "Not Implemented",
    [502] = "Bad Gateway",
    [503] = "Service Unavailable",
    [504] = "Gateway Timeout",
    [505] = "HTTP Version Not Supported",
    [507] = "Insufficient Storage",
    [511] = "Network Authentication Required"
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.server"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 42,["36"] = 44,["37"] = 46,["38"] = 48,["39"] = 49,["40"] = 41,["41"] = 52,["42"] = 53,["43"] = 52,["44"] = 64,["45"] = 66,["46"] = 67,["49"] = 72,["52"] = 69,["53"] = 70,["59"] = 74,["60"] = 75,["64"] = 64,["65"] = 92,["66"] = 93,["67"] = 94,["68"] = 95,["69"] = 96,["72"] = 99,["73"] = 100,["74"] = 101,["76"] = 103,["77"] = 104,["79"] = 105,["84"] = 107,["85"] = 109,["86"] = 110,["87"] = 110,["88"] = 110,["89"] = 110,["90"] = 112,["91"] = 113,["92"] = 114,["93"] = 115,["94"] = 119,["95"] = 120,["97"] = 123,["98"] = 124,["99"] = 129,["100"] = 130,["101"] = 132,["102"] = 133,["103"] = 92});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local socket = require("socket")
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____request = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.request")
local readRequestHead = ____request.readRequestHead
local ____response = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.response")
local assembleResponseString = ____response.assembleResponseString
--- Represents an HTTP server.
-- This class encapsulates the functionality required for creating and
-- managing an HTTP server, including binding to a network address,
-- accepting client connections, and handling client requests.
-- 
-- @example // Example of creating and starting an HttpServer with a handler which returns 200 for all requests
-- const httpServer = new HttpServer('127.0.0.1', 8080, (req, res) => { res.status = 200; return res; });
-- while(true) {
--   httpServer.acceptNextClient();
-- }
____exports.HttpServer = __TS__Class()
local HttpServer = ____exports.HttpServer
HttpServer.name = "HttpServer"
function HttpServer.prototype.____constructor(self, bindAddress, port, handler)
    self.handler = handler
    self.logger = __TS__New(Logger, "HttpServer")
    self.server = socket.bind(bindAddress, port)
    self.server:settimeout(0)
end
function HttpServer.prototype.close(self)
    self.server:close()
end
function HttpServer.prototype.acceptNextClient(self)
    local client = self.server:accept()
    if client then
        do
            local function ____catch(e)
                self.logger:error("Error handling client: " .. tostring(e))
            end
            local ____try, ____hasReturned = pcall(function()
                self.logger:debug("Handling client")
                self:handleClient(client)
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
            do
                self.logger:debug("Closing client")
                client:close()
            end
        end
    end
end
function HttpServer.prototype.handleClient(self, client)
    local requestHeadLines = {}
    local lastReceived
    self.logger:debug("Handling client")
    client:settimeout(2)
    repeat
        do
            local received = client:receive("*l")
            if type(received) == "string" then
                requestHeadLines[#requestHeadLines + 1] = received
            end
            lastReceived = received
            if received == nil then
                error(
                    __TS__New(Error, "Client returned unexpected value, terminating"),
                    0
                )
            end
        end
    until not (lastReceived ~= "")
    self.logger:debug("Received request head")
    local request = readRequestHead(
        nil,
        table.concat(requestHeadLines, CRLF or ",")
    )
    local contentLength = request.headers["Content-Length"]
    local contentLengthNum = tonumber(contentLength)
    if contentLengthNum and contentLengthNum > 0 then
        self.logger:debug("Fetching request body " .. request.headers["Content-Length"])
        client:settimeout(2)
        request.body = client:receive(contentLengthNum)
    end
    self.logger:debug("Handling request")
    local response = self:handler(request, {status = 404, headers = {}})
    self.logger:debug("Assembling response")
    local responseString = assembleResponseString(nil, response)
    self.logger:debug("Sending response")
    client:send(responseString)
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.response"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["35"] = 64,["36"] = 65,["37"] = 68,["38"] = 70,["39"] = 70,["40"] = 70,["41"] = 71,["42"] = 70,["43"] = 70,["44"] = 74,["45"] = 76,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 77,["52"] = 77,["53"] = 77,["54"] = 77,["56"] = 84,["57"] = 84,["58"] = 84,["59"] = 84,["60"] = 84,["61"] = 84,["62"] = 84,["63"] = 84,["64"] = 84,["66"] = 92,["67"] = 64});
local ____exports = {}
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local EMPTY_LINE = ____constants.EMPTY_LINE
local StatusText = ____constants.StatusText
--- Assembles an HTTP response string based on the provided HttpResponse object.
-- 
-- This function constructs a valid HTTP response string using the status code,
-- headers, and body (if provided) from the HttpResponse object. It includes a
-- default server header indicating the server is "Lua HTTP/1.1". If the status
-- code is not recognized, it defaults to "Unknown Status".
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param response - The HttpResponse object containing the necessary
--   information to construct the response string.
--   It must include a status and headers, with an
--   optional body.
-- @returns The complete HTTP response string, ready to be sent over the network.
-- This string includes the start line (status line), headers, and
-- the response body if provided. Each section is separated by CRLF
-- (Carriage Return and Line Feed) characters.
-- @example const response: HttpResponse = {
--     status: 200,
--     body: 'Hello, world!',
--     headers: {
--         'Content-Type': 'text/plain'
--     }
-- };
-- const responseString = assembleResponseString(response);
function ____exports.assembleResponseString(self, response)
    local startLine = (("HTTP/1.1 " .. tostring(response.status)) .. " ") .. (StatusText[response.status] or "Unknown Status")
    local headers = {"Server: Lua HTTP/1.1"}
    __TS__ArrayForEach(
        __TS__ObjectKeys(response.headers),
        function(____, key)
            headers[#headers + 1] = (key .. ": ") .. response.headers[key]
        end
    )
    local responseString
    if response.body then
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                response.body
            },
            CRLF or ","
        )
    else
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                EMPTY_LINE
            },
            CRLF or ","
        )
    end
    return responseString
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.request"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["25"] = 61,["26"] = 62,["27"] = 62,["28"] = 62,["29"] = 63,["30"] = 65,["31"] = 65,["32"] = 65,["33"] = 65,["34"] = 65,["35"] = 65,["36"] = 65,["37"] = 65,["38"] = 74,["39"] = 75,["42"] = 76,["43"] = 77,["45"] = 80,["46"] = 61});
local ____exports = {}
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____query_2Dparams = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.query-params")
local getQueryParams = ____query_2Dparams.getQueryParams
--- Parses an HTTP request string and constructs an HttpRequest object.
-- 
-- This function takes a raw HTTP request payload as a string and parses it to
-- construct an HttpRequest object. It splits the request into its constituent
-- parts: start line, headers, and potentially a body.
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param requestPayload - The complete HTTP request payload as a string.
-- @returns The HttpRequest object representing the parsed request.
-- 
-- The function assumes that the request payload follows the standard HTTP request
-- format, with a start line, followed by headers, an empty line, and an optional body.
____exports.readRequestHead = function(____, requestPayload)
    local ____TS__StringSplit_result_0 = __TS__StringSplit(requestPayload, CRLF)
    local startLine = ____TS__StringSplit_result_0[1]
    local headerLines = __TS__ArraySlice(____TS__StringSplit_result_0, 1)
    local method, originalUrl, protocol = __TS__Unpack(__TS__StringSplit(startLine, " "))
    local httpRequest = {
        method = method,
        path = __TS__StringSplit(originalUrl, "?")[1],
        protocol = protocol,
        headers = {},
        originalUrl = originalUrl,
        parameters = getQueryParams(nil, originalUrl)
    }
    for ____, headerLine in ipairs(headerLines) do
        if headerLine == "" then
            break
        end
        local key, value = __TS__Unpack(__TS__StringSplit(headerLine, ":"))
        httpRequest.headers[__TS__StringTrim(key)] = __TS__StringTrim(value)
    end
    return httpRequest
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.query-params"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["25"] = 24,["26"] = 25,["27"] = 27,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 32,["34"] = 36,["35"] = 24});
local ____exports = {}
--- Extracts query parameters from a given URL and returns them as an object.
-- 
-- This function parses the query string part of a URL and converts it into an object
-- where each key-value pair corresponds to a query parameter and its value.
-- 
-- Note:
-- - If the URL does not have query parameters, the function returns an empty object.
-- - The function does not handle array-like query parameters (e.g., "param[]=value1&param[]=value2").
-- - There is no URL validation; if the input is not a string or does not contain valid query parameters,
--   the behavior is undefined.
-- - Special characters in query parameters are not decoded (e.g., "%20" will not be converted to a space).
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL
-- @param url - The URL from which to extract the query parameters.
-- @returns An object containing the query parameters as key-value pairs.
-- @example // If the URL is "http://example.com/page?param1=value1&param2=value2"
-- const queryParams = getQueryParams("http://example.com/page?param1=value1&param2=value2");
-- // The function will return: { param1: "value1", param2: "value2" }
function ____exports.getQueryParams(self, url)
    local _, parametersPart = __TS__Unpack(__TS__StringSplit(url, "?"))
    local parameters = {}
    if parametersPart then
        for ____, parameter in ipairs(__TS__StringSplit(parametersPart, "&")) do
            local name, value = __TS__Unpack(__TS__StringSplit(parameter, "="))
            parameters[name] = value
        end
    end
    return parameters
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 10,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 14,["23"] = 14,["35"] = 50,["36"] = 50,["37"] = 50,["38"] = 61,["39"] = 61,["40"] = 61,["41"] = 73,["42"] = 74,["43"] = 75,["45"] = 73,["46"] = 89,["47"] = 90,["48"] = 91,["50"] = 89,["51"] = 105,["52"] = 106,["53"] = 107,["55"] = 105,["56"] = 121,["57"] = 122,["58"] = 123,["60"] = 121,["61"] = 137,["62"] = 138,["63"] = 139,["65"] = 137,["66"] = 154,["67"] = 154,["68"] = 51,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53});
local ____exports = {}
--- LogLevel represents the different severity levels that can be used to log messages.
-- 
-- The levels are TRACE, DEBUG, INFO, WARN, ERROR, and OFF.
-- 
-- OFF is a special level that can be used to disable logging.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 10
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 20
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 30
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 40
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 50
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
____exports.LogLevel.OFF = 100
____exports.LogLevel[____exports.LogLevel.OFF] = "OFF"
--- Represents a logger that can be used to log messages with different severity levels.
-- 
-- Change the static level property to change the severity level of messages that are logged.
-- 
-- Change the static transports property to change the way messages are logged.
-- 
-- Use Logger.ignore to ignore a severity level.
-- 
-- @example const logger = new Logger("MyLogger");
-- Logger.level = LogLevel.DEBUG;
-- Logger.transports = { debug: print, info: print, warn: print, error: print };
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.trace(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.TRACE then
        ____exports.Logger.transports:trace((("[TRACE] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.debug(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.DEBUG then
        ____exports.Logger.transports:debug((("[DEBUG] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.info(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.INFO then
        ____exports.Logger.transports:info((("[INFO] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.warn(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.WARN then
        ____exports.Logger.transports:warn((("[WARN] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.error(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.ERROR then
        ____exports.Logger.transports:error((("[ERROR] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.ignore(self)
end
Logger.level = ____exports.LogLevel.INFO
Logger.transports = {
    trace = ____exports.Logger.ignore,
    debug = ____exports.Logger.ignore,
    info = ____exports.Logger.ignore,
    warn = ____exports.Logger.ignore,
    error = ____exports.Logger.ignore
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.application")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.errors")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.errors"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 3,["14"] = 3,["15"] = 3,["16"] = 3,["17"] = 5,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 4});
local ____exports = {}
____exports.HttpError = __TS__Class()
local HttpError = ____exports.HttpError
HttpError.name = "HttpError"
__TS__ClassExtends(HttpError, Error)
function HttpError.prototype.____constructor(self, status, message)
    Error.prototype.____constructor(self, message)
    self.status = status
    self.message = message
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.application"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["16"] = 1,["17"] = 1,["18"] = 2,["19"] = 5,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 10,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 18,["31"] = 18,["32"] = 16,["33"] = 18,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 27,["38"] = 40,["39"] = 41,["40"] = 42,["41"] = 43,["42"] = 40,["43"] = 54,["44"] = 55,["45"] = 56,["46"] = 57,["47"] = 54,["48"] = 69,["49"] = 70,["50"] = 71,["51"] = 69,["53"] = 90,["54"] = 90,["55"] = 90,["56"] = 90,["57"] = 106,["58"] = 90,["59"] = 107,["60"] = 107,["61"] = 107,["62"] = 107,["63"] = 107,["64"] = 110,["65"] = 111,["66"] = 112,["67"] = 113,["68"] = 112,["69"] = 106,["70"] = 124,["71"] = 124,["72"] = 125,["73"] = 125,["74"] = 125,["75"] = 126,["77"] = 126,["78"] = 126,["79"] = 125,["80"] = 125,["81"] = 124,["82"] = 130,["83"] = 131,["84"] = 130,["85"] = 139,["86"] = 139,["87"] = 140,["88"] = 140,["89"] = 140,["90"] = 141,["92"] = 141,["93"] = 141,["94"] = 140,["95"] = 140,["96"] = 139,["97"] = 148,["98"] = 148,["99"] = 149,["100"] = 149,["101"] = 149,["102"] = 150,["104"] = 150,["105"] = 150,["106"] = 149,["107"] = 149,["108"] = 148,["109"] = 157,["110"] = 157,["111"] = 158,["112"] = 158,["113"] = 158,["114"] = 159,["116"] = 159,["117"] = 159,["118"] = 158,["119"] = 158,["120"] = 157,["121"] = 166,["122"] = 166,["123"] = 167,["124"] = 167,["125"] = 167,["126"] = 168,["128"] = 168,["129"] = 168,["130"] = 167,["131"] = 167,["132"] = 166,["133"] = 175,["134"] = 175,["135"] = 176,["136"] = 176,["137"] = 176,["138"] = 177,["140"] = 177,["141"] = 177,["142"] = 176,["143"] = 176,["144"] = 175,["145"] = 184,["146"] = 184,["147"] = 185,["148"] = 185,["149"] = 185,["150"] = 186,["152"] = 186,["153"] = 186,["154"] = 185,["155"] = 185,["156"] = 184,["157"] = 196,["158"] = 197,["159"] = 200,["160"] = 200,["161"] = 200,["162"] = 200,["163"] = 205,["164"] = 208,["165"] = 209,["167"] = 212,["170"] = 230,["173"] = 215,["174"] = 215,["175"] = 216,["176"] = 217,["177"] = 218,["178"] = 218,["179"] = 218,["180"] = 218,["181"] = 219,["182"] = 220,["184"] = 222,["186"] = 218,["187"] = 218,["189"] = 215,["190"] = 228,["191"] = 228,["198"] = 233,["199"] = 196});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____tslua_2Dhttp = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.index")
local HttpServer = ____tslua_2Dhttp.HttpServer
local HttpStatus = ____tslua_2Dhttp.HttpStatus
local StatusText = ____tslua_2Dhttp.StatusText
local json = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-rxi-json.index")
local ____path = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.path")
local getPathParameters = ____path.getPathParameters
local isMatch = ____path.isMatch
--- A class representing an HTTP response, extending the functionality of HttpResponse.
____exports.AppHttpResponse = __TS__Class()
local AppHttpResponse = ____exports.AppHttpResponse
AppHttpResponse.name = "AppHttpResponse"
function AppHttpResponse.prototype.____constructor(self, res)
    self.res = res
    self.logger = __TS__New(Logger, "AppHttpResponse")
end
function AppHttpResponse.prototype.status(self, status)
    self.res.status = status
    return self
end
function AppHttpResponse.prototype.send(self, data)
    self.res.headers["Content-Type"] = "text/plain"
    self.res.body = data
    return self
end
function AppHttpResponse.prototype.json(self, value)
    self.res.headers["Content-Type"] = "application/json"
    self.res.body = json.encode(value)
    return self
end
function AppHttpResponse.prototype.setHeader(self, key, value)
    self.res.headers[key] = value
    return self
end
--- A class representing a web application, extending the functionality of HttpServer.
____exports.Application = __TS__Class()
local Application = ____exports.Application
Application.name = "Application"
__TS__ClassExtends(Application, HttpServer)
function Application.prototype.____constructor(self, bindAddress, port)
    HttpServer.prototype.____constructor(
        self,
        bindAddress,
        port,
        function(____, req, res) return self:handleRequest(req, res) end
    )
    self.logger = __TS__New(Logger, ____exports.Application.name)
    self.requestHandlers = {}
    self.errorMiddleware = function(____, err, req, res)
        res:status(HttpStatus.INTERNAL_SERVER_ERROR):send(StatusText[HttpStatus.INTERNAL_SERVER_ERROR])
    end
end
function Application.prototype.use(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_0 = self.requestHandlers
            local ____temp_1 = #____self_requestHandlers_0 + 1
            ____self_requestHandlers_0[____temp_1] = {route = route, middleware = it}
            return ____temp_1
        end
    )
end
function Application.prototype.useGlobalErrorHandler(self, middleware)
    self.errorMiddleware = middleware
end
function Application.prototype.get(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_2 = self.requestHandlers
            local ____temp_3 = #____self_requestHandlers_2 + 1
            ____self_requestHandlers_2[____temp_3] = {route = route, middleware = it, method = "GET"}
            return ____temp_3
        end
    )
end
function Application.prototype.put(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_4 = self.requestHandlers
            local ____temp_5 = #____self_requestHandlers_4 + 1
            ____self_requestHandlers_4[____temp_5] = {route = route, middleware = it, method = "PUT"}
            return ____temp_5
        end
    )
end
function Application.prototype.post(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_6 = self.requestHandlers
            local ____temp_7 = #____self_requestHandlers_6 + 1
            ____self_requestHandlers_6[____temp_7] = {route = route, middleware = it, method = "POST"}
            return ____temp_7
        end
    )
end
function Application.prototype.delete(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_8 = self.requestHandlers
            local ____temp_9 = #____self_requestHandlers_8 + 1
            ____self_requestHandlers_8[____temp_9] = {route = route, middleware = it, method = "DELETE"}
            return ____temp_9
        end
    )
end
function Application.prototype.patch(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_10 = self.requestHandlers
            local ____temp_11 = #____self_requestHandlers_10 + 1
            ____self_requestHandlers_10[____temp_11] = {route = route, middleware = it, method = "PATCH"}
            return ____temp_11
        end
    )
end
function Application.prototype.options(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_12 = self.requestHandlers
            local ____temp_13 = #____self_requestHandlers_12 + 1
            ____self_requestHandlers_12[____temp_13] = {route = route, middleware = it, method = "OPTIONS"}
            return ____temp_13
        end
    )
end
function Application.prototype.handleRequest(self, req, res)
    self.logger:debug("Handling Request")
    local stack = __TS__ArrayFilter(
        self.requestHandlers,
        function(____, it) return (not it.method or it.method == req.method) and isMatch(nil, it.route, req.path) end
    )
    self.logger:debug(("Found " .. tostring(#stack)) .. " handlers to process")
    if #stack > 0 then
        res.status = HttpStatus.OK
    end
    local appResponse = __TS__New(____exports.AppHttpResponse, res)
    do
        local function ____catch(e)
            self:errorMiddleware(e, req, appResponse)
        end
        local ____try, ____hasReturned = pcall(function()
            local runStackItem
            runStackItem = function(____, idx)
                if idx < #stack then
                    req.parameters = getPathParameters(nil, stack[idx + 1].route, req.path)
                    stack[idx + 1]:middleware(
                        req,
                        appResponse,
                        function(____, err)
                            if not err then
                                runStackItem(nil, idx + 1)
                            else
                                error(err, 0)
                            end
                        end
                    )
                end
            end
            if #stack > 0 then
                runStackItem(nil, 0)
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    return appResponse.res
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.path"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 22,["22"] = 23,["23"] = 15,["24"] = 26,["25"] = 27,["26"] = 29,["27"] = 34,["28"] = 35,["29"] = 26,["30"] = 38,["31"] = 39,["32"] = 39,["33"] = 39,["34"] = 39,["35"] = 41,["36"] = 38,["37"] = 44,["38"] = 45,["39"] = 46,["40"] = 48,["41"] = 49,["42"] = 50,["44"] = 53,["45"] = 44,["46"] = 56,["47"] = 60,["48"] = 61,["49"] = 63,["50"] = 64,["51"] = 66,["52"] = 67,["53"] = 69,["54"] = 69,["55"] = 69,["56"] = 70,["57"] = 74,["58"] = 75,["60"] = 69,["61"] = 69,["62"] = 79,["63"] = 56,["64"] = 82,["65"] = 83,["66"] = 84,["67"] = 85,["68"] = 86,["69"] = 82});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local logger = __TS__New(Logger, "Path")
--- The set of characters considered "safe" in URLs is defined by the URL specifications, specifically RFC 3986.
-- According to this specification, the characters that are safe and do not need to be percent-encoded in the path segment of a URL are:
-- 
-- Alphanumeric characters: A-Z a-z 0-9
-- Unreserved characters: - _ . ~
-- Sub-delimiters: ! $ & ' ( ) * + , ; =
-- 
-- @param route
____exports.gSubPathParamsToPattern = function(____, route)
    logger:debug("Replacing Path Params for Pattern matcher " .. route)
    local result = {string.gsub(route, ":[%w_]+", "([%%w_%%%%-%%.~!$&'()*+,;=]+)")}
    logger:debug("Replaced Path Params for Pattern matcher " .. result[1])
    return result[1]
end
____exports.gSubEscapeReservedChars = function(____, route)
    logger:debug("Escaping Path matcher " .. route)
    local patternRoute = string.gsub(route, "([%%w_%%%%-%%.~!$&'()*+,;=])", "%%%1")
    logger:debug("Escaping Path matcher " .. patternRoute)
    return patternRoute
end
____exports.routeToPattern = function(____, route)
    local patternRoute = ____exports.gSubPathParamsToPattern(
        nil,
        ____exports.gSubEscapeReservedChars(nil, route)
    )
    return ("^" .. patternRoute) .. "$"
end
____exports.getParamNames = function(____, route)
    logger:debug("Getting Param names from " .. route)
    local names = {}
    for name in string.gmatch(route, ":(%w+)") do
        logger:debug(("Adding " .. name) .. " to params array")
        names[#names + 1] = name
    end
    return names
end
____exports.getPathParameters = function(____, route, path)
    logger:debug("Getting Param names")
    local paramNames = ____exports.getParamNames(nil, route)
    logger:debug("Getting Route Pattern")
    local pattern = ____exports.routeToPattern(nil, route)
    logger:debug("Assembling Parameters")
    local matches = {}
    __TS__ArrayForEach(
        {string.match(path, pattern)},
        function(____, match, idx)
            logger:debug((("Adding Parameter " .. (paramNames[idx + 1] or "nil")) .. " from match ") .. match)
            if paramNames[idx + 1] then
                matches[paramNames[idx + 1]] = match
            end
        end
    )
    return matches
end
____exports.isMatch = function(____, route, path)
    local pattern = ____exports.routeToPattern(nil, route)
    logger:debug(((("checking if \"" .. pattern) .. "\" matches \"") .. path) .. "\"")
    local res = {string.match(path, pattern)}
    return (res and res[1]) ~= nil
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 10,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 14,["23"] = 14,["35"] = 50,["36"] = 50,["37"] = 50,["38"] = 61,["39"] = 61,["40"] = 61,["41"] = 73,["42"] = 74,["43"] = 75,["45"] = 73,["46"] = 89,["47"] = 90,["48"] = 91,["50"] = 89,["51"] = 105,["52"] = 106,["53"] = 107,["55"] = 105,["56"] = 121,["57"] = 122,["58"] = 123,["60"] = 121,["61"] = 137,["62"] = 138,["63"] = 139,["65"] = 137,["66"] = 154,["67"] = 154,["68"] = 51,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53});
local ____exports = {}
--- LogLevel represents the different severity levels that can be used to log messages.
-- 
-- The levels are TRACE, DEBUG, INFO, WARN, ERROR, and OFF.
-- 
-- OFF is a special level that can be used to disable logging.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 10
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 20
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 30
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 40
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 50
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
____exports.LogLevel.OFF = 100
____exports.LogLevel[____exports.LogLevel.OFF] = "OFF"
--- Represents a logger that can be used to log messages with different severity levels.
-- 
-- Change the static level property to change the severity level of messages that are logged.
-- 
-- Change the static transports property to change the way messages are logged.
-- 
-- Use Logger.ignore to ignore a severity level.
-- 
-- @example const logger = new Logger("MyLogger");
-- Logger.level = LogLevel.DEBUG;
-- Logger.transports = { debug: print, info: print, warn: print, error: print };
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.trace(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.TRACE then
        ____exports.Logger.transports:trace((("[TRACE] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.debug(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.DEBUG then
        ____exports.Logger.transports:debug((("[DEBUG] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.info(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.INFO then
        ____exports.Logger.transports:info((("[INFO] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.warn(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.WARN then
        ____exports.Logger.transports:warn((("[WARN] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.error(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.ERROR then
        ____exports.Logger.transports:error((("[ERROR] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.ignore(self)
end
Logger.level = ____exports.LogLevel.INFO
Logger.transports = {
    trace = ____exports.Logger.ignore,
    debug = ____exports.Logger.ignore,
    info = ____exports.Logger.ignore,
    warn = ____exports.Logger.ignore,
    error = ____exports.Logger.ignore
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-rxi-json.index"] = function(...) 
--
-- json.lua
--
-- Copyright (c) 2020 rxi
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

local json = { _version = "0.1.2" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
    [ "\\" ] = "\\",
    [ "\"" ] = "\"",
    [ "\b" ] = "b",
    [ "\f" ] = "f",
    [ "\n" ] = "n",
    [ "\r" ] = "r",
    [ "\t" ] = "t",
}

local escape_char_map_inv = { [ "/" ] = "/" }
for k, v in pairs(escape_char_map) do
    escape_char_map_inv[v] = k
end


local function escape_char(c)
    return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
end


local function encode_nil(val)
    return "null"
end


local function encode_table(val, stack)
    local res = {}
    stack = stack or {}

    -- Circular reference?
    if stack[val] then error("circular reference") end

    stack[val] = true

    if rawget(val, 1) ~= nil or next(val) == nil then
        -- Treat as array -- check keys are valid and it is not sparse
        local n = 0
        for k in pairs(val) do
            if type(k) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end
            n = n + 1
        end
        if n ~= #val then
            error("invalid table: sparse array")
        end
        -- Encode
        for i, v in ipairs(val) do
            table.insert(res, encode(v, stack))
        end
        stack[val] = nil
        return "[" .. table.concat(res, ",") .. "]"

    else
        -- Treat as an object
        for k, v in pairs(val) do
            if type(k) ~= "string" then
                error("invalid table: mixed or invalid key types")
            end
            table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
        end
        stack[val] = nil
        return "{" .. table.concat(res, ",") .. "}"
    end
end


local function encode_string(val)
    return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
    -- Check for NaN, -inf and inf
    if val ~= val or val <= -math.huge or val >= math.huge then
        error("unexpected number value '" .. tostring(val) .. "'")
    end
    return string.format("%.14g", val)
end


local type_func_map = {
    [ "nil"     ] = encode_nil,
    [ "table"   ] = encode_table,
    [ "string"  ] = encode_string,
    [ "number"  ] = encode_number,
    [ "boolean" ] = tostring,
}


encode = function(val, stack)
    local t = type(val)
    local f = type_func_map[t]
    if f then
        return f(val, stack)
    end
    error("unexpected type '" .. t .. "'")
end


function json.encode(val)
    return ( encode(val) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...)
    local res = {}
    for i = 1, select("#", ...) do
        res[ select(i, ...) ] = true
    end
    return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
    [ "true"  ] = true,
    [ "false" ] = false,
    [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
    for i = idx, #str do
        if set[str:sub(i, i)] ~= negate then
            return i
        end
    end
    return #str + 1
end


local function decode_error(str, idx, msg)
    local line_count = 1
    local col_count = 1
    for i = 1, idx - 1 do
        col_count = col_count + 1
        if str:sub(i, i) == "\n" then
            line_count = line_count + 1
            col_count = 1
        end
    end
    error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
    -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
    local f = math.floor
    if n <= 0x7f then
        return string.char(n)
    elseif n <= 0x7ff then
        return string.char(f(n / 64) + 192, n % 64 + 128)
    elseif n <= 0xffff then
        return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
    elseif n <= 0x10ffff then
        return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                f(n % 4096 / 64) + 128, n % 64 + 128)
    end
    error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
    local n1 = tonumber( s:sub(1, 4),  16 )
    local n2 = tonumber( s:sub(7, 10), 16 )
    -- Surrogate pair?
    if n2 then
        return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
    else
        return codepoint_to_utf8(n1)
    end
end


local function parse_string(str, i)
    local res = ""
    local j = i + 1
    local k = j

    while j <= #str do
        local x = str:byte(j)

        if x < 32 then
            decode_error(str, j, "control character in string")

        elseif x == 92 then -- `\`: Escape
            res = res .. str:sub(k, j - 1)
            j = j + 1
            local c = str:sub(j, j)
            if c == "u" then
                local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                        or str:match("^%x%x%x%x", j + 1)
                        or decode_error(str, j - 1, "invalid unicode escape in string")
                res = res .. parse_unicode_escape(hex)
                j = j + #hex
            else
                if not escape_chars[c] then
                    decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
                end
                res = res .. escape_char_map_inv[c]
            end
            k = j + 1

        elseif x == 34 then -- `"`: End of string
            res = res .. str:sub(k, j - 1)
            return res, j + 1
        end

        j = j + 1
    end

    decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
    local x = next_char(str, i, delim_chars)
    local s = str:sub(i, x - 1)
    local n = tonumber(s)
    if not n then
        decode_error(str, i, "invalid number '" .. s .. "'")
    end
    return n, x
end


local function parse_literal(str, i)
    local x = next_char(str, i, delim_chars)
    local word = str:sub(i, x - 1)
    if not literals[word] then
        decode_error(str, i, "invalid literal '" .. word .. "'")
    end
    return literal_map[word], x
end


local function parse_array(str, i)
    local res = {}
    local n = 1
    i = i + 1
    while 1 do
        local x
        i = next_char(str, i, space_chars, true)
        -- Empty / end of array?
        if str:sub(i, i) == "]" then
            i = i + 1
            break
        end
        -- Read token
        x, i = parse(str, i)
        res[n] = x
        n = n + 1
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "]" then break end
        if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
    end
    return res, i
end


local function parse_object(str, i)
    local res = {}
    i = i + 1
    while 1 do
        local key, val
        i = next_char(str, i, space_chars, true)
        -- Empty / end of object?
        if str:sub(i, i) == "}" then
            i = i + 1
            break
        end
        -- Read key
        if str:sub(i, i) ~= '"' then
            decode_error(str, i, "expected string for key")
        end
        key, i = parse(str, i)
        -- Read ':' delimiter
        i = next_char(str, i, space_chars, true)
        if str:sub(i, i) ~= ":" then
            decode_error(str, i, "expected ':' after key")
        end
        i = next_char(str, i + 1, space_chars, true)
        -- Read value
        val, i = parse(str, i)
        -- Set
        res[key] = val
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "}" then break end
        if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
    end
    return res, i
end


local char_func_map = {
    [ '"' ] = parse_string,
    [ "0" ] = parse_number,
    [ "1" ] = parse_number,
    [ "2" ] = parse_number,
    [ "3" ] = parse_number,
    [ "4" ] = parse_number,
    [ "5" ] = parse_number,
    [ "6" ] = parse_number,
    [ "7" ] = parse_number,
    [ "8" ] = parse_number,
    [ "9" ] = parse_number,
    [ "-" ] = parse_number,
    [ "t" ] = parse_literal,
    [ "f" ] = parse_literal,
    [ "n" ] = parse_literal,
    [ "[" ] = parse_array,
    [ "{" ] = parse_object,
}


parse = function(str, idx)
    local chr = str:sub(idx, idx)
    local f = char_func_map[chr]
    if f then
        return f(str, idx)
    end
    decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
    if type(str) ~= "string" then
        error("expected argument of type string, got " .. type(str))
    end
    local res, idx = parse(str, next_char(str, 1, space_chars, true))
    idx = next_char(str, idx, space_chars, true)
    if idx <= #str then
        decode_error(str, idx, "trailing garbage")
    end
    return res
end


return json end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 2,["18"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.server")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
    local HttpStatus = ____constants.HttpStatus
    local StatusText = ____constants.StatusText
    ____exports.HttpStatus = HttpStatus
    ____exports.StatusText = StatusText
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 5,["8"] = 11,["9"] = 11,["10"] = 17,["11"] = 17,["12"] = 23,["13"] = 23,["14"] = 29,["15"] = 29,["16"] = 39,["17"] = 39,["18"] = 45,["19"] = 45,["20"] = 51,["21"] = 51,["22"] = 57,["23"] = 57,["24"] = 63,["25"] = 63,["26"] = 69,["27"] = 69,["28"] = 75,["29"] = 75,["30"] = 81,["31"] = 81,["32"] = 87,["33"] = 87,["34"] = 93,["35"] = 93,["36"] = 99,["37"] = 99,["38"] = 105,["39"] = 105,["40"] = 111,["41"] = 111,["42"] = 118,["43"] = 118,["44"] = 124,["45"] = 124,["46"] = 130,["47"] = 130,["48"] = 136,["49"] = 136,["50"] = 142,["51"] = 142,["52"] = 148,["53"] = 148,["54"] = 154,["55"] = 154,["56"] = 160,["57"] = 160,["58"] = 166,["59"] = 166,["60"] = 172,["61"] = 172,["62"] = 178,["63"] = 178,["64"] = 184,["65"] = 184,["66"] = 190,["67"] = 190,["68"] = 196,["69"] = 196,["70"] = 202,["71"] = 202,["72"] = 208,["73"] = 208,["74"] = 214,["75"] = 214,["76"] = 220,["77"] = 220,["78"] = 226,["79"] = 226,["80"] = 232,["81"] = 232,["82"] = 238,["83"] = 238,["84"] = 244,["85"] = 244,["86"] = 250,["87"] = 250,["88"] = 257,["89"] = 257,["90"] = 263,["91"] = 263,["92"] = 269,["93"] = 269,["94"] = 275,["95"] = 275,["96"] = 281,["97"] = 281,["98"] = 287,["99"] = 287,["100"] = 293,["101"] = 293,["102"] = 299,["103"] = 299,["104"] = 305,["105"] = 305,["106"] = 311,["107"] = 311,["108"] = 317,["109"] = 317,["110"] = 323,["111"] = 323,["112"] = 329,["113"] = 329,["114"] = 335,["115"] = 335,["116"] = 341,["117"] = 341,["118"] = 347,["119"] = 347,["120"] = 353,["121"] = 353,["122"] = 359,["123"] = 359,["124"] = 362,["125"] = 362,["126"] = 362,["127"] = 362,["128"] = 362,["129"] = 362,["130"] = 362,["131"] = 362,["132"] = 362,["133"] = 362,["134"] = 362,["135"] = 362,["136"] = 362,["137"] = 362,["138"] = 362,["139"] = 362,["140"] = 362,["141"] = 362,["142"] = 362,["143"] = 362,["144"] = 362,["145"] = 362,["146"] = 362,["147"] = 362,["148"] = 362,["149"] = 362,["150"] = 362,["151"] = 362,["152"] = 362,["153"] = 362,["154"] = 362,["155"] = 362,["156"] = 362,["157"] = 362,["158"] = 362,["159"] = 362,["160"] = 362,["161"] = 362,["162"] = 362,["163"] = 362,["164"] = 362,["165"] = 362,["166"] = 362,["167"] = 362,["168"] = 362,["169"] = 362,["170"] = 362,["171"] = 362,["172"] = 362,["173"] = 362,["174"] = 362,["175"] = 362,["176"] = 362,["177"] = 362,["178"] = 362,["179"] = 362,["180"] = 362,["181"] = 362,["182"] = 362,["183"] = 362});
local ____exports = {}
____exports.EMPTY_LINE = ""
____exports.CRLF = "\r\n"
____exports.HttpStatus = HttpStatus or ({})
____exports.HttpStatus.CONTINUE = 100
____exports.HttpStatus[____exports.HttpStatus.CONTINUE] = "CONTINUE"
____exports.HttpStatus.SWITCHING_PROTOCOLS = 101
____exports.HttpStatus[____exports.HttpStatus.SWITCHING_PROTOCOLS] = "SWITCHING_PROTOCOLS"
____exports.HttpStatus.PROCESSING = 102
____exports.HttpStatus[____exports.HttpStatus.PROCESSING] = "PROCESSING"
____exports.HttpStatus.EARLY_HINTS = 103
____exports.HttpStatus[____exports.HttpStatus.EARLY_HINTS] = "EARLY_HINTS"
____exports.HttpStatus.OK = 200
____exports.HttpStatus[____exports.HttpStatus.OK] = "OK"
____exports.HttpStatus.CREATED = 201
____exports.HttpStatus[____exports.HttpStatus.CREATED] = "CREATED"
____exports.HttpStatus.ACCEPTED = 202
____exports.HttpStatus[____exports.HttpStatus.ACCEPTED] = "ACCEPTED"
____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION = 203
____exports.HttpStatus[____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION] = "NON_AUTHORITATIVE_INFORMATION"
____exports.HttpStatus.NO_CONTENT = 204
____exports.HttpStatus[____exports.HttpStatus.NO_CONTENT] = "NO_CONTENT"
____exports.HttpStatus.RESET_CONTENT = 205
____exports.HttpStatus[____exports.HttpStatus.RESET_CONTENT] = "RESET_CONTENT"
____exports.HttpStatus.PARTIAL_CONTENT = 206
____exports.HttpStatus[____exports.HttpStatus.PARTIAL_CONTENT] = "PARTIAL_CONTENT"
____exports.HttpStatus.MULTI_STATUS = 207
____exports.HttpStatus[____exports.HttpStatus.MULTI_STATUS] = "MULTI_STATUS"
____exports.HttpStatus.MULTIPLE_CHOICES = 300
____exports.HttpStatus[____exports.HttpStatus.MULTIPLE_CHOICES] = "MULTIPLE_CHOICES"
____exports.HttpStatus.MOVED_PERMANENTLY = 301
____exports.HttpStatus[____exports.HttpStatus.MOVED_PERMANENTLY] = "MOVED_PERMANENTLY"
____exports.HttpStatus.MOVED_TEMPORARILY = 302
____exports.HttpStatus[____exports.HttpStatus.MOVED_TEMPORARILY] = "MOVED_TEMPORARILY"
____exports.HttpStatus.SEE_OTHER = 303
____exports.HttpStatus[____exports.HttpStatus.SEE_OTHER] = "SEE_OTHER"
____exports.HttpStatus.NOT_MODIFIED = 304
____exports.HttpStatus[____exports.HttpStatus.NOT_MODIFIED] = "NOT_MODIFIED"
____exports.HttpStatus.USE_PROXY = 305
____exports.HttpStatus[____exports.HttpStatus.USE_PROXY] = "USE_PROXY"
____exports.HttpStatus.TEMPORARY_REDIRECT = 307
____exports.HttpStatus[____exports.HttpStatus.TEMPORARY_REDIRECT] = "TEMPORARY_REDIRECT"
____exports.HttpStatus.PERMANENT_REDIRECT = 308
____exports.HttpStatus[____exports.HttpStatus.PERMANENT_REDIRECT] = "PERMANENT_REDIRECT"
____exports.HttpStatus.BAD_REQUEST = 400
____exports.HttpStatus[____exports.HttpStatus.BAD_REQUEST] = "BAD_REQUEST"
____exports.HttpStatus.UNAUTHORIZED = 401
____exports.HttpStatus[____exports.HttpStatus.UNAUTHORIZED] = "UNAUTHORIZED"
____exports.HttpStatus.PAYMENT_REQUIRED = 402
____exports.HttpStatus[____exports.HttpStatus.PAYMENT_REQUIRED] = "PAYMENT_REQUIRED"
____exports.HttpStatus.FORBIDDEN = 403
____exports.HttpStatus[____exports.HttpStatus.FORBIDDEN] = "FORBIDDEN"
____exports.HttpStatus.NOT_FOUND = 404
____exports.HttpStatus[____exports.HttpStatus.NOT_FOUND] = "NOT_FOUND"
____exports.HttpStatus.METHOD_NOT_ALLOWED = 405
____exports.HttpStatus[____exports.HttpStatus.METHOD_NOT_ALLOWED] = "METHOD_NOT_ALLOWED"
____exports.HttpStatus.NOT_ACCEPTABLE = 406
____exports.HttpStatus[____exports.HttpStatus.NOT_ACCEPTABLE] = "NOT_ACCEPTABLE"
____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED = 407
____exports.HttpStatus[____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED] = "PROXY_AUTHENTICATION_REQUIRED"
____exports.HttpStatus.REQUEST_TIMEOUT = 408
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TIMEOUT] = "REQUEST_TIMEOUT"
____exports.HttpStatus.CONFLICT = 409
____exports.HttpStatus[____exports.HttpStatus.CONFLICT] = "CONFLICT"
____exports.HttpStatus.GONE = 410
____exports.HttpStatus[____exports.HttpStatus.GONE] = "GONE"
____exports.HttpStatus.LENGTH_REQUIRED = 411
____exports.HttpStatus[____exports.HttpStatus.LENGTH_REQUIRED] = "LENGTH_REQUIRED"
____exports.HttpStatus.PRECONDITION_FAILED = 412
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_FAILED] = "PRECONDITION_FAILED"
____exports.HttpStatus.REQUEST_TOO_LONG = 413
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TOO_LONG] = "REQUEST_TOO_LONG"
____exports.HttpStatus.REQUEST_URI_TOO_LONG = 414
____exports.HttpStatus[____exports.HttpStatus.REQUEST_URI_TOO_LONG] = "REQUEST_URI_TOO_LONG"
____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE = 415
____exports.HttpStatus[____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE] = "UNSUPPORTED_MEDIA_TYPE"
____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE = 416
____exports.HttpStatus[____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE] = "REQUESTED_RANGE_NOT_SATISFIABLE"
____exports.HttpStatus.EXPECTATION_FAILED = 417
____exports.HttpStatus[____exports.HttpStatus.EXPECTATION_FAILED] = "EXPECTATION_FAILED"
____exports.HttpStatus.IM_A_TEAPOT = 418
____exports.HttpStatus[____exports.HttpStatus.IM_A_TEAPOT] = "IM_A_TEAPOT"
____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE = 419
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE] = "INSUFFICIENT_SPACE_ON_RESOURCE"
____exports.HttpStatus.METHOD_FAILURE = 420
____exports.HttpStatus[____exports.HttpStatus.METHOD_FAILURE] = "METHOD_FAILURE"
____exports.HttpStatus.MISDIRECTED_REQUEST = 421
____exports.HttpStatus[____exports.HttpStatus.MISDIRECTED_REQUEST] = "MISDIRECTED_REQUEST"
____exports.HttpStatus.UNPROCESSABLE_ENTITY = 422
____exports.HttpStatus[____exports.HttpStatus.UNPROCESSABLE_ENTITY] = "UNPROCESSABLE_ENTITY"
____exports.HttpStatus.LOCKED = 423
____exports.HttpStatus[____exports.HttpStatus.LOCKED] = "LOCKED"
____exports.HttpStatus.FAILED_DEPENDENCY = 424
____exports.HttpStatus[____exports.HttpStatus.FAILED_DEPENDENCY] = "FAILED_DEPENDENCY"
____exports.HttpStatus.UPGRADE_REQUIRED = 426
____exports.HttpStatus[____exports.HttpStatus.UPGRADE_REQUIRED] = "UPGRADE_REQUIRED"
____exports.HttpStatus.PRECONDITION_REQUIRED = 428
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_REQUIRED] = "PRECONDITION_REQUIRED"
____exports.HttpStatus.TOO_MANY_REQUESTS = 429
____exports.HttpStatus[____exports.HttpStatus.TOO_MANY_REQUESTS] = "TOO_MANY_REQUESTS"
____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE = 431
____exports.HttpStatus[____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE] = "REQUEST_HEADER_FIELDS_TOO_LARGE"
____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS = 451
____exports.HttpStatus[____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS] = "UNAVAILABLE_FOR_LEGAL_REASONS"
____exports.HttpStatus.INTERNAL_SERVER_ERROR = 500
____exports.HttpStatus[____exports.HttpStatus.INTERNAL_SERVER_ERROR] = "INTERNAL_SERVER_ERROR"
____exports.HttpStatus.NOT_IMPLEMENTED = 501
____exports.HttpStatus[____exports.HttpStatus.NOT_IMPLEMENTED] = "NOT_IMPLEMENTED"
____exports.HttpStatus.BAD_GATEWAY = 502
____exports.HttpStatus[____exports.HttpStatus.BAD_GATEWAY] = "BAD_GATEWAY"
____exports.HttpStatus.SERVICE_UNAVAILABLE = 503
____exports.HttpStatus[____exports.HttpStatus.SERVICE_UNAVAILABLE] = "SERVICE_UNAVAILABLE"
____exports.HttpStatus.GATEWAY_TIMEOUT = 504
____exports.HttpStatus[____exports.HttpStatus.GATEWAY_TIMEOUT] = "GATEWAY_TIMEOUT"
____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED = 505
____exports.HttpStatus[____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED] = "HTTP_VERSION_NOT_SUPPORTED"
____exports.HttpStatus.INSUFFICIENT_STORAGE = 507
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_STORAGE] = "INSUFFICIENT_STORAGE"
____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED = 511
____exports.HttpStatus[____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED] = "NETWORK_AUTHENTICATION_REQUIRED"
____exports.StatusText = {
    [____exports.HttpStatus.CONTINUE] = "Continue",
    [____exports.HttpStatus.SWITCHING_PROTOCOLS] = "Switching protocols",
    [____exports.HttpStatus.PROCESSING] = "Processing",
    [103] = "Early Hints",
    [200] = "OK",
    [201] = "Created",
    [202] = "Accepted",
    [203] = "Non-Authoritative Information",
    [204] = "No Content",
    [205] = "Reset Content",
    [206] = "Partial Content",
    [207] = "Multi-Status",
    [300] = "Multiple Choices",
    [301] = "Moved Permanently",
    [302] = "Found (Previously \"Moved Temporarily\")",
    [303] = "See Other",
    [304] = "Not Modified",
    [305] = "Use Proxy",
    [307] = "Temporary Redirect",
    [308] = "Permanent Redirect",
    [400] = "Bad Request",
    [401] = "Unauthorized",
    [402] = "Payment Required",
    [403] = "Forbidden",
    [404] = "Not Found",
    [405] = "Method Not Allowed",
    [406] = "Not Acceptable",
    [407] = "Proxy Authentication Required",
    [408] = "Request Timeout",
    [409] = "Conflict",
    [410] = "Gone",
    [411] = "Length Required",
    [412] = "Precondition Failed",
    [413] = "Payload Too Large",
    [414] = "URI Too Long",
    [415] = "Unsupported Media Type",
    [416] = "Range Not Satisfiable",
    [417] = "Expectation Failed",
    [418] = "I'm a Teapot",
    [419] = "INSUFFICIENT_SPACE_ON_RESOURCE",
    [420] = "METHOD_FAILURE",
    [421] = "Misdirected Request",
    [422] = "Unprocessable Entity",
    [423] = "Locked",
    [424] = "Failed Dependency",
    [426] = "Upgrade Required",
    [428] = "Precondition Required",
    [429] = "Too Many Requests",
    [431] = "Request Header Fields Too Large",
    [451] = "Unavailable For Legal Reasons",
    [500] = "Internal Server Error",
    [501] = "Not Implemented",
    [502] = "Bad Gateway",
    [503] = "Service Unavailable",
    [504] = "Gateway Timeout",
    [505] = "HTTP Version Not Supported",
    [507] = "Insufficient Storage",
    [511] = "Network Authentication Required"
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.server"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 42,["36"] = 44,["37"] = 46,["38"] = 48,["39"] = 49,["40"] = 41,["41"] = 52,["42"] = 53,["43"] = 52,["44"] = 64,["45"] = 66,["46"] = 67,["49"] = 72,["52"] = 69,["53"] = 70,["59"] = 74,["60"] = 75,["64"] = 64,["65"] = 92,["66"] = 93,["67"] = 94,["68"] = 95,["69"] = 96,["72"] = 99,["73"] = 100,["74"] = 101,["76"] = 103,["77"] = 104,["79"] = 105,["84"] = 107,["85"] = 109,["86"] = 110,["87"] = 110,["88"] = 110,["89"] = 110,["90"] = 112,["91"] = 113,["92"] = 114,["93"] = 115,["94"] = 119,["95"] = 120,["97"] = 123,["98"] = 124,["99"] = 129,["100"] = 130,["101"] = 132,["102"] = 133,["103"] = 92});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local socket = require("socket")
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____request = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.request")
local readRequestHead = ____request.readRequestHead
local ____response = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.response")
local assembleResponseString = ____response.assembleResponseString
--- Represents an HTTP server.
-- This class encapsulates the functionality required for creating and
-- managing an HTTP server, including binding to a network address,
-- accepting client connections, and handling client requests.
-- 
-- @example // Example of creating and starting an HttpServer with a handler which returns 200 for all requests
-- const httpServer = new HttpServer('127.0.0.1', 8080, (req, res) => { res.status = 200; return res; });
-- while(true) {
--   httpServer.acceptNextClient();
-- }
____exports.HttpServer = __TS__Class()
local HttpServer = ____exports.HttpServer
HttpServer.name = "HttpServer"
function HttpServer.prototype.____constructor(self, bindAddress, port, handler)
    self.handler = handler
    self.logger = __TS__New(Logger, "HttpServer")
    self.server = socket.bind(bindAddress, port)
    self.server:settimeout(0)
end
function HttpServer.prototype.close(self)
    self.server:close()
end
function HttpServer.prototype.acceptNextClient(self)
    local client = self.server:accept()
    if client then
        do
            local function ____catch(e)
                self.logger:error("Error handling client: " .. tostring(e))
            end
            local ____try, ____hasReturned = pcall(function()
                self.logger:debug("Handling client")
                self:handleClient(client)
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
            do
                self.logger:debug("Closing client")
                client:close()
            end
        end
    end
end
function HttpServer.prototype.handleClient(self, client)
    local requestHeadLines = {}
    local lastReceived
    self.logger:debug("Handling client")
    client:settimeout(2)
    repeat
        do
            local received = client:receive("*l")
            if type(received) == "string" then
                requestHeadLines[#requestHeadLines + 1] = received
            end
            lastReceived = received
            if received == nil then
                error(
                    __TS__New(Error, "Client returned unexpected value, terminating"),
                    0
                )
            end
        end
    until not (lastReceived ~= "")
    self.logger:debug("Received request head")
    local request = readRequestHead(
        nil,
        table.concat(requestHeadLines, CRLF or ",")
    )
    local contentLength = request.headers["Content-Length"]
    local contentLengthNum = tonumber(contentLength)
    if contentLengthNum and contentLengthNum > 0 then
        self.logger:debug("Fetching request body " .. request.headers["Content-Length"])
        client:settimeout(2)
        request.body = client:receive(contentLengthNum)
    end
    self.logger:debug("Handling request")
    local response = self:handler(request, {status = 404, headers = {}})
    self.logger:debug("Assembling response")
    local responseString = assembleResponseString(nil, response)
    self.logger:debug("Sending response")
    client:send(responseString)
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.response"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["35"] = 64,["36"] = 65,["37"] = 68,["38"] = 70,["39"] = 70,["40"] = 70,["41"] = 71,["42"] = 70,["43"] = 70,["44"] = 74,["45"] = 76,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 77,["52"] = 77,["53"] = 77,["54"] = 77,["56"] = 84,["57"] = 84,["58"] = 84,["59"] = 84,["60"] = 84,["61"] = 84,["62"] = 84,["63"] = 84,["64"] = 84,["66"] = 92,["67"] = 64});
local ____exports = {}
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local EMPTY_LINE = ____constants.EMPTY_LINE
local StatusText = ____constants.StatusText
--- Assembles an HTTP response string based on the provided HttpResponse object.
-- 
-- This function constructs a valid HTTP response string using the status code,
-- headers, and body (if provided) from the HttpResponse object. It includes a
-- default server header indicating the server is "Lua HTTP/1.1". If the status
-- code is not recognized, it defaults to "Unknown Status".
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param response - The HttpResponse object containing the necessary
--   information to construct the response string.
--   It must include a status and headers, with an
--   optional body.
-- @returns The complete HTTP response string, ready to be sent over the network.
-- This string includes the start line (status line), headers, and
-- the response body if provided. Each section is separated by CRLF
-- (Carriage Return and Line Feed) characters.
-- @example const response: HttpResponse = {
--     status: 200,
--     body: 'Hello, world!',
--     headers: {
--         'Content-Type': 'text/plain'
--     }
-- };
-- const responseString = assembleResponseString(response);
function ____exports.assembleResponseString(self, response)
    local startLine = (("HTTP/1.1 " .. tostring(response.status)) .. " ") .. (StatusText[response.status] or "Unknown Status")
    local headers = {"Server: Lua HTTP/1.1"}
    __TS__ArrayForEach(
        __TS__ObjectKeys(response.headers),
        function(____, key)
            headers[#headers + 1] = (key .. ": ") .. response.headers[key]
        end
    )
    local responseString
    if response.body then
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                response.body
            },
            CRLF or ","
        )
    else
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                EMPTY_LINE
            },
            CRLF or ","
        )
    end
    return responseString
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.request"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["25"] = 61,["26"] = 62,["27"] = 62,["28"] = 62,["29"] = 63,["30"] = 65,["31"] = 65,["32"] = 65,["33"] = 65,["34"] = 65,["35"] = 65,["36"] = 65,["37"] = 65,["38"] = 74,["39"] = 75,["42"] = 76,["43"] = 77,["45"] = 80,["46"] = 61});
local ____exports = {}
local ____constants = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____query_2Dparams = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.query-params")
local getQueryParams = ____query_2Dparams.getQueryParams
--- Parses an HTTP request string and constructs an HttpRequest object.
-- 
-- This function takes a raw HTTP request payload as a string and parses it to
-- construct an HttpRequest object. It splits the request into its constituent
-- parts: start line, headers, and potentially a body.
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param requestPayload - The complete HTTP request payload as a string.
-- @returns The HttpRequest object representing the parsed request.
-- 
-- The function assumes that the request payload follows the standard HTTP request
-- format, with a start line, followed by headers, an empty line, and an optional body.
____exports.readRequestHead = function(____, requestPayload)
    local ____TS__StringSplit_result_0 = __TS__StringSplit(requestPayload, CRLF)
    local startLine = ____TS__StringSplit_result_0[1]
    local headerLines = __TS__ArraySlice(____TS__StringSplit_result_0, 1)
    local method, originalUrl, protocol = __TS__Unpack(__TS__StringSplit(startLine, " "))
    local httpRequest = {
        method = method,
        path = __TS__StringSplit(originalUrl, "?")[1],
        protocol = protocol,
        headers = {},
        originalUrl = originalUrl,
        parameters = getQueryParams(nil, originalUrl)
    }
    for ____, headerLine in ipairs(headerLines) do
        if headerLine == "" then
            break
        end
        local key, value = __TS__Unpack(__TS__StringSplit(headerLine, ":"))
        httpRequest.headers[__TS__StringTrim(key)] = __TS__StringTrim(value)
    end
    return httpRequest
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.query-params"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["25"] = 24,["26"] = 25,["27"] = 27,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 32,["34"] = 36,["35"] = 24});
local ____exports = {}
--- Extracts query parameters from a given URL and returns them as an object.
-- 
-- This function parses the query string part of a URL and converts it into an object
-- where each key-value pair corresponds to a query parameter and its value.
-- 
-- Note:
-- - If the URL does not have query parameters, the function returns an empty object.
-- - The function does not handle array-like query parameters (e.g., "param[]=value1&param[]=value2").
-- - There is no URL validation; if the input is not a string or does not contain valid query parameters,
--   the behavior is undefined.
-- - Special characters in query parameters are not decoded (e.g., "%20" will not be converted to a space).
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL
-- @param url - The URL from which to extract the query parameters.
-- @returns An object containing the query parameters as key-value pairs.
-- @example // If the URL is "http://example.com/page?param1=value1&param2=value2"
-- const queryParams = getQueryParams("http://example.com/page?param1=value1&param2=value2");
-- // The function will return: { param1: "value1", param2: "value2" }
function ____exports.getQueryParams(self, url)
    local _, parametersPart = __TS__Unpack(__TS__StringSplit(url, "?"))
    local parameters = {}
    if parametersPart then
        for ____, parameter in ipairs(__TS__StringSplit(parametersPart, "&")) do
            local name, value = __TS__Unpack(__TS__StringSplit(parameter, "="))
            parameters[name] = value
        end
    end
    return parameters
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 10,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 14,["23"] = 14,["35"] = 50,["36"] = 50,["37"] = 50,["38"] = 61,["39"] = 61,["40"] = 61,["41"] = 73,["42"] = 74,["43"] = 75,["45"] = 73,["46"] = 89,["47"] = 90,["48"] = 91,["50"] = 89,["51"] = 105,["52"] = 106,["53"] = 107,["55"] = 105,["56"] = 121,["57"] = 122,["58"] = 123,["60"] = 121,["61"] = 137,["62"] = 138,["63"] = 139,["65"] = 137,["66"] = 154,["67"] = 154,["68"] = 51,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53});
local ____exports = {}
--- LogLevel represents the different severity levels that can be used to log messages.
-- 
-- The levels are TRACE, DEBUG, INFO, WARN, ERROR, and OFF.
-- 
-- OFF is a special level that can be used to disable logging.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 10
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 20
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 30
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 40
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 50
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
____exports.LogLevel.OFF = 100
____exports.LogLevel[____exports.LogLevel.OFF] = "OFF"
--- Represents a logger that can be used to log messages with different severity levels.
-- 
-- Change the static level property to change the severity level of messages that are logged.
-- 
-- Change the static transports property to change the way messages are logged.
-- 
-- Use Logger.ignore to ignore a severity level.
-- 
-- @example const logger = new Logger("MyLogger");
-- Logger.level = LogLevel.DEBUG;
-- Logger.transports = { debug: print, info: print, warn: print, error: print };
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.trace(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.TRACE then
        ____exports.Logger.transports:trace((("[TRACE] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.debug(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.DEBUG then
        ____exports.Logger.transports:debug((("[DEBUG] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.info(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.INFO then
        ____exports.Logger.transports:info((("[INFO] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.warn(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.WARN then
        ____exports.Logger.transports:warn((("[WARN] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.error(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.ERROR then
        ____exports.Logger.transports:error((("[ERROR] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.ignore(self)
end
Logger.level = ____exports.LogLevel.INFO
Logger.transports = {
    trace = ____exports.Logger.ignore,
    debug = ____exports.Logger.ignore,
    info = ____exports.Logger.ignore,
    warn = ____exports.Logger.ignore,
    error = ____exports.Logger.ignore
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.json-api-application"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____tslua_2Dhttp_2Dapi = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http-api.dist.index")
local Application = ____tslua_2Dhttp_2Dapi.Application
local ____middleware = require("lua_modules.dcs-web-editor-common.dist.middleware.index")
local cors = ____middleware.cors
local jsonError = ____middleware.jsonError
local function apiSpecUrl(self, path)
    local res = string.gsub(path, ":([%w-_]+)", "{%1}")
    return res
end
____exports.JsonApiApplication = __TS__Class()
local JsonApiApplication = ____exports.JsonApiApplication
JsonApiApplication.name = "JsonApiApplication"
function JsonApiApplication.prototype.____constructor(self, bindAddress, port, apispec)
    self.bindAddress = bindAddress
    self.port = port
    self.apispec = apispec
    self.app = __TS__New(Application, bindAddress, port)
    self.app:get(
        "/v3/api-docs",
        function(____, req, res)
            res:json(apispec:getSpec())
        end
    )
    self.app:useGlobalErrorHandler(jsonError)
end
function JsonApiApplication.prototype.get(self, route, operation, ...)
    self.apispec:addPath(
        apiSpecUrl(nil, route),
        {get = operation}
    )
    self.app:options(route, cors)
    return self.app:get(route, cors, ...)
end
function JsonApiApplication.prototype.put(self, route, operation, ...)
    self.apispec:addPath(
        apiSpecUrl(nil, route),
        {put = operation}
    )
    self.app:options(route, cors)
    return self.app:put(route, cors, ...)
end
function JsonApiApplication.prototype.patch(self, route, operation, ...)
    self.apispec:addPath(
        apiSpecUrl(nil, route),
        {patch = operation}
    )
    self.app:options(route, cors)
    return self.app:patch(route, cors, ...)
end
function JsonApiApplication.prototype.post(self, route, operation, ...)
    self.apispec:addPath(
        apiSpecUrl(nil, route),
        {post = operation}
    )
    self.app:options(route, cors)
    return self.app:post(route, cors, ...)
end
function JsonApiApplication.prototype.delete(self, route, operation, ...)
    self.apispec:addPath(
        apiSpecUrl(nil, route),
        {delete = operation}
    )
    self.app:options(route, cors)
    return self.app:delete(route, cors, ...)
end
function JsonApiApplication.prototype.close(self)
    self.app:close()
end
function JsonApiApplication.prototype.acceptNextClient(self)
    self.app:acceptNextClient()
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.middleware.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.middleware.cors")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.middleware.json-error")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.middleware.json-error"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____tslua_2Dhttp = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-http.dist.index")
local HttpStatus = ____tslua_2Dhttp.HttpStatus
local logger = __TS__New(Logger, "jsonErrorMiddleware")
____exports.jsonError = function(____, err, req, res)
    logger:error("Error handling request: " .. tostring(err))
    res:status(err and err.status or HttpStatus.INTERNAL_SERVER_ERROR):json({
        code = err and err.status or HttpStatus.INTERNAL_SERVER_ERROR,
        error = tostring(err)
    })
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 8,["12"] = 9,["13"] = 9,["14"] = 10,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 14,["23"] = 14,["35"] = 50,["36"] = 50,["37"] = 50,["38"] = 61,["39"] = 61,["40"] = 61,["41"] = 73,["42"] = 74,["43"] = 75,["45"] = 73,["46"] = 89,["47"] = 90,["48"] = 91,["50"] = 89,["51"] = 105,["52"] = 106,["53"] = 107,["55"] = 105,["56"] = 121,["57"] = 122,["58"] = 123,["60"] = 121,["61"] = 137,["62"] = 138,["63"] = 139,["65"] = 137,["66"] = 154,["67"] = 154,["68"] = 51,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53});
local ____exports = {}
--- LogLevel represents the different severity levels that can be used to log messages.
-- 
-- The levels are TRACE, DEBUG, INFO, WARN, ERROR, and OFF.
-- 
-- OFF is a special level that can be used to disable logging.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.TRACE = 10
____exports.LogLevel[____exports.LogLevel.TRACE] = "TRACE"
____exports.LogLevel.DEBUG = 20
____exports.LogLevel[____exports.LogLevel.DEBUG] = "DEBUG"
____exports.LogLevel.INFO = 30
____exports.LogLevel[____exports.LogLevel.INFO] = "INFO"
____exports.LogLevel.WARN = 40
____exports.LogLevel[____exports.LogLevel.WARN] = "WARN"
____exports.LogLevel.ERROR = 50
____exports.LogLevel[____exports.LogLevel.ERROR] = "ERROR"
____exports.LogLevel.OFF = 100
____exports.LogLevel[____exports.LogLevel.OFF] = "OFF"
--- Represents a logger that can be used to log messages with different severity levels.
-- 
-- Change the static level property to change the severity level of messages that are logged.
-- 
-- Change the static transports property to change the way messages are logged.
-- 
-- Use Logger.ignore to ignore a severity level.
-- 
-- @example const logger = new Logger("MyLogger");
-- Logger.level = LogLevel.DEBUG;
-- Logger.transports = { debug: print, info: print, warn: print, error: print };
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.trace(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.TRACE then
        ____exports.Logger.transports:trace((("[TRACE] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.debug(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.DEBUG then
        ____exports.Logger.transports:debug((("[DEBUG] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.info(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.INFO then
        ____exports.Logger.transports:info((("[INFO] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.warn(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.WARN then
        ____exports.Logger.transports:warn((("[WARN] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.prototype.error(self, message)
    if ____exports.Logger.level <= ____exports.LogLevel.ERROR then
        ____exports.Logger.transports:error((("[ERROR] [" .. self.name) .. "] - ") .. message)
    end
end
function Logger.ignore(self)
end
Logger.level = ____exports.LogLevel.INFO
Logger.transports = {
    trace = ____exports.Logger.ignore,
    debug = ____exports.Logger.ignore,
    info = ____exports.Logger.ignore,
    warn = ____exports.Logger.ignore,
    error = ____exports.Logger.ignore
}
return ____exports
 end,
["lua_modules.dcs-web-editor-common.dist.middleware.cors"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.cors = function(____, req, res, next)
    res:setHeader("Access-Control-Allow-Origin", "*")
    res:setHeader("Access-Control-Allow-Methods", "GET,PUT,PATCH,POST,DELETE")
    res:setHeader("Access-Control-Allow-Headers", "Content-Type")
    next(nil)
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-openapi.dist.utils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["7"] = 2,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2});
local ____exports = {}
____exports.oas31 = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.oas31")
do
    local ____server = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server")
    local Server = ____server.Server
    local ServerVariable = ____server.ServerVariable
    ____exports.Server = Server
    ____exports.ServerVariable = ServerVariable
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 5,["9"] = 11,["10"] = 12,["11"] = 13,["12"] = 14,["13"] = 11,["14"] = 16,["15"] = 17,["16"] = 16,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 28,["21"] = 32,["22"] = 33,["23"] = 34,["24"] = 27});
local ____exports = {}
____exports.Server = __TS__Class()
local Server = ____exports.Server
Server.name = "Server"
function Server.prototype.____constructor(self, url, desc)
    self.url = url
    self.description = desc
    self.variables = {}
end
function Server.prototype.addVariable(self, name, variable)
    self.variables[name] = variable
end
____exports.ServerVariable = __TS__Class()
local ServerVariable = ____exports.ServerVariable
ServerVariable.name = "ServerVariable"
function ServerVariable.prototype.____constructor(self, defaultValue, enums, description)
    self.default = defaultValue
    self.enum = enums
    self.description = description
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.oas31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2,["22"] = 3,["23"] = 3,["24"] = 3,["25"] = 3,["26"] = 3});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.dsl.openapi-builder31")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.openapi31")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____server = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.server")
    local Server = ____server.Server
    local ServerVariable = ____server.ServerVariable
    ____exports.Server = Server
    ____exports.ServerVariable = ServerVariable
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.openapi31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 7,["6"] = 9,["8"] = 12,["15"] = 78,["16"] = 82,["17"] = 83,["19"] = 85,["20"] = 78,["25"] = 262,["26"] = 263,["27"] = 262,["35"] = 339,["36"] = 342,["37"] = 339});
local ____exports = {}
local ____specification_2Dextension = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension")
local SpecificationExtension = ____specification_2Dextension.SpecificationExtension
do
    local ____export = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.oas-common")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
function ____exports.getPath(self, pathsObject, path)
    if SpecificationExtension:isValidExtension(path) then
        return nil
    end
    return pathsObject and pathsObject[path] or nil
end
--- A type guard to check if the given value is a `ReferenceObject`.
-- See https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-guards-and-differentiating-types
-- 
-- @param obj The value to check.
function ____exports.isReferenceObject(self, obj)
    return Object.prototype.hasOwnProperty(obj, "$ref")
end
--- A type guard to check if the given object is a `SchemaObject`.
-- Useful to distinguish from `ReferenceObject` values that can be used
-- in most places where `SchemaObject` is allowed.
-- 
-- See https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-guards-and-differentiating-types
-- 
-- @param schema The value to check.
function ____exports.isSchemaObject(self, schema)
    return not Object.prototype.hasOwnProperty(schema, "$ref")
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.oas-common"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 6,["7"] = 20,["8"] = 24,["9"] = 25,["11"] = 27,["12"] = 28,["14"] = 30,["15"] = 20,["16"] = 32,["17"] = 37,["18"] = 38,["20"] = 32});
local ____exports = {}
local ____specification_2Dextension = require("lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension")
local SpecificationExtension = ____specification_2Dextension.SpecificationExtension
function ____exports.getExtension(self, obj, extensionName)
    if not obj then
        return nil
    end
    if SpecificationExtension:isValidExtension(extensionName) then
        return obj[extensionName]
    end
    return nil
end
function ____exports.addExtension(self, obj, extensionName, extension)
    if obj and SpecificationExtension:isValidExtension(extensionName) then
        obj[extensionName] = extension
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.model.specification-extension"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 15,["15"] = 15,["16"] = 15,["18"] = 15,["19"] = 18,["20"] = 19,["21"] = 18,["22"] = 22,["23"] = 23,["25"] = 24,["29"] = 28,["30"] = 29,["32"] = 31,["33"] = 22,["34"] = 33,["35"] = 34,["37"] = 35,["41"] = 39,["42"] = 33,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["52"] = 50,["53"] = 41});
local ____exports = {}
____exports.SpecificationExtension = __TS__Class()
local SpecificationExtension = ____exports.SpecificationExtension
SpecificationExtension.name = "SpecificationExtension"
function SpecificationExtension.prototype.____constructor(self)
end
function SpecificationExtension.isValidExtension(self, extensionName)
    return __TS__StringStartsWith(extensionName, "x-")
end
function SpecificationExtension.prototype.getExtension(self, extensionName)
    if not ____exports.SpecificationExtension:isValidExtension(extensionName) then
        error(
            __TS__New(Error, ("Invalid specification extension: '" .. extensionName) .. "'. Extensions must start with prefix 'x-"),
            0
        )
    end
    if self[extensionName] then
        return self[extensionName]
    end
    return nil
end
function SpecificationExtension.prototype.addExtension(self, extensionName, payload)
    if not ____exports.SpecificationExtension:isValidExtension(extensionName) then
        error(
            __TS__New(Error, ("Invalid specification extension: '" .. extensionName) .. "'. Extensions must start with prefix 'x-"),
            0
        )
    end
    self[extensionName] = payload
end
function SpecificationExtension.prototype.listExtensions(self)
    local res = {}
    for propName in pairs(self) do
        if Object.prototype.hasOwnProperty(self, propName) then
            if ____exports.SpecificationExtension:isValidExtension(propName) then
                res[#res + 1] = propName
            end
        end
    end
    return res
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.openapi3-ts.dsl.openapi-builder31"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 13,["12"] = 14,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 21,["25"] = 21,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 13,["31"] = 9,["32"] = 10,["33"] = 9,["34"] = 37,["35"] = 38,["36"] = 37,["37"] = 41,["38"] = 42,["39"] = 43,["40"] = 41,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 45,["45"] = 49,["46"] = 50,["47"] = 51,["48"] = 49,["49"] = 53,["50"] = 54,["51"] = 55,["52"] = 53,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 57,["57"] = 61,["58"] = 62,["59"] = 63,["60"] = 61,["61"] = 65,["62"] = 66,["63"] = 67,["64"] = 65,["65"] = 69,["66"] = 70,["67"] = 71,["68"] = 69,["69"] = 73,["70"] = 74,["71"] = 75,["72"] = 79,["73"] = 73,["74"] = 81,["75"] = 85,["76"] = 86,["77"] = 87,["78"] = 88,["79"] = 81,["80"] = 90,["81"] = 94,["82"] = 95,["83"] = 96,["84"] = 97,["85"] = 90,["86"] = 99,["87"] = 103,["88"] = 104,["89"] = 106,["90"] = 107,["91"] = 99,["92"] = 109,["93"] = 113,["94"] = 114,["95"] = 115,["96"] = 116,["97"] = 109,["98"] = 118,["99"] = 122,["100"] = 123,["101"] = 125,["102"] = 126,["103"] = 118,["104"] = 128,["105"] = 132,["106"] = 133,["107"] = 134,["108"] = 135,["109"] = 128,["110"] = 137,["111"] = 141,["112"] = 142,["113"] = 144,["114"] = 145,["115"] = 137,["116"] = 147,["117"] = 151,["118"] = 152,["119"] = 153,["120"] = 154,["121"] = 147,["122"] = 156,["123"] = 160,["124"] = 161,["125"] = 162,["126"] = 163,["127"] = 156,["128"] = 165,["129"] = 166,["130"] = 167,["131"] = 167,["132"] = 168,["133"] = 165,["134"] = 170,["135"] = 171,["136"] = 172,["137"] = 172,["138"] = 173,["139"] = 170,["140"] = 175,["141"] = 176,["142"] = 177,["143"] = 175,["144"] = 179,["145"] = 180,["146"] = 180,["147"] = 180,["149"] = 181,["150"] = 182,["151"] = 179});
local ____exports = {}
____exports.OpenApiBuilder = __TS__Class()
local OpenApiBuilder = ____exports.OpenApiBuilder
OpenApiBuilder.name = "OpenApiBuilder"
function OpenApiBuilder.prototype.____constructor(self, doc)
    self.rootDoc = doc or ({
        openapi = "3.1.0",
        info = {title = "app", version = "version"},
        paths = {},
        components = {
            schemas = {},
            responses = {},
            parameters = {},
            examples = {},
            requestBodies = {},
            headers = {},
            securitySchemes = {},
            links = {},
            callbacks = {}
        },
        tags = {},
        servers = {}
    })
end
function OpenApiBuilder.create(self, doc)
    return __TS__New(____exports.OpenApiBuilder, doc)
end
function OpenApiBuilder.prototype.getSpec(self)
    return self.rootDoc
end
function OpenApiBuilder.prototype.addOpenApiVersion(self, openApiVersion)
    self.rootDoc.openapi = openApiVersion
    return self
end
function OpenApiBuilder.prototype.addInfo(self, info)
    self.rootDoc.info = info
    return self
end
function OpenApiBuilder.prototype.addContact(self, contact)
    self.rootDoc.info.contact = contact
    return self
end
function OpenApiBuilder.prototype.addLicense(self, license)
    self.rootDoc.info.license = license
    return self
end
function OpenApiBuilder.prototype.addTitle(self, title)
    self.rootDoc.info.title = title
    return self
end
function OpenApiBuilder.prototype.addDescription(self, description)
    self.rootDoc.info.description = description
    return self
end
function OpenApiBuilder.prototype.addTermsOfService(self, termsOfService)
    self.rootDoc.info.termsOfService = termsOfService
    return self
end
function OpenApiBuilder.prototype.addVersion(self, version)
    self.rootDoc.info.version = version
    return self
end
function OpenApiBuilder.prototype.addPath(self, path, pathItem)
    self.rootDoc.paths = self.rootDoc.paths or ({})
    self.rootDoc.paths[path] = __TS__ObjectAssign({}, self.rootDoc.paths[path] or ({}), pathItem)
    return self
end
function OpenApiBuilder.prototype.addSchema(self, name, schema)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.schemas = self.rootDoc.components.schemas or ({})
    self.rootDoc.components.schemas[name] = schema
    return self
end
function OpenApiBuilder.prototype.addResponse(self, name, response)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.responses = self.rootDoc.components.responses or ({})
    self.rootDoc.components.responses[name] = response
    return self
end
function OpenApiBuilder.prototype.addParameter(self, name, parameter)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.parameters = self.rootDoc.components.parameters or ({})
    self.rootDoc.components.parameters[name] = parameter
    return self
end
function OpenApiBuilder.prototype.addExample(self, name, example)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.examples = self.rootDoc.components.examples or ({})
    self.rootDoc.components.examples[name] = example
    return self
end
function OpenApiBuilder.prototype.addRequestBody(self, name, reqBody)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.requestBodies = self.rootDoc.components.requestBodies or ({})
    self.rootDoc.components.requestBodies[name] = reqBody
    return self
end
function OpenApiBuilder.prototype.addHeader(self, name, header)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.headers = self.rootDoc.components.headers or ({})
    self.rootDoc.components.headers[name] = header
    return self
end
function OpenApiBuilder.prototype.addSecurityScheme(self, name, secScheme)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.securitySchemes = self.rootDoc.components.securitySchemes or ({})
    self.rootDoc.components.securitySchemes[name] = secScheme
    return self
end
function OpenApiBuilder.prototype.addLink(self, name, link)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.links = self.rootDoc.components.links or ({})
    self.rootDoc.components.links[name] = link
    return self
end
function OpenApiBuilder.prototype.addCallback(self, name, callback)
    self.rootDoc.components = self.rootDoc.components or ({})
    self.rootDoc.components.callbacks = self.rootDoc.components.callbacks or ({})
    self.rootDoc.components.callbacks[name] = callback
    return self
end
function OpenApiBuilder.prototype.addServer(self, server)
    self.rootDoc.servers = self.rootDoc.servers or ({})
    local ____self_rootDoc_servers_0 = self.rootDoc.servers
    ____self_rootDoc_servers_0[#____self_rootDoc_servers_0 + 1] = server
    return self
end
function OpenApiBuilder.prototype.addTag(self, tag)
    self.rootDoc.tags = self.rootDoc.tags or ({})
    local ____self_rootDoc_tags_1 = self.rootDoc.tags
    ____self_rootDoc_tags_1[#____self_rootDoc_tags_1 + 1] = tag
    return self
end
function OpenApiBuilder.prototype.addExternalDocs(self, extDoc)
    self.rootDoc.externalDocs = extDoc
    return self
end
function OpenApiBuilder.prototype.addWebhook(self, webhook, webhookItem)
    local ____self_rootDoc_2, ____webhooks_3 = self.rootDoc, "webhooks"
    if ____self_rootDoc_2[____webhooks_3] == nil then
        ____self_rootDoc_2[____webhooks_3] = {}
    end
    self.rootDoc.webhooks[webhook] = webhookItem
    return self
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-openapi.dist.utils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 4,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["20"] = 13,["21"] = 14,["22"] = 9,["23"] = 9,["24"] = 24,["25"] = 4,["26"] = 27});
local ____exports = {}
____exports.responses = function(____, responseRefs)
    local res = {}
    __TS__ArrayForEach(
        __TS__ObjectKeys(responseRefs),
        function(____, key)
            local httpStatus = __TS__ParseInt(key)
            local responseRef = responseRefs[httpStatus]
            if not responseRef then
                return
            end
            local response, ref = __TS__Unpack(responseRef)
            res[tostring(key)] = __TS__ObjectAssign({}, response, {content = {["application/json"] = {schema = {["$ref"] = "#/components/schemas/" .. ref}}}})
        end
    )
    return res
end
____exports.body = function(____, schema) return {content = {["application/json"] = {schema = {["$ref"] = "#/components/schemas/" .. schema}}}} end
return ____exports
 end,
["src.dtos.static-object.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.utils.getHeading"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
--- Calculates the heading of the item based on its position.
-- 
-- @param it The item to calculate the heading for.
-- @returns The heading of the object in degrees.
function ____exports.getHeading(self, it)
    local pos = it:getPosition()
    local headingRadians = math.atan2(pos.x.z, pos.x.x)
    if headingRadians < 0 then
        return headingRadians + 2 * math.pi
    end
    return headingRadians * 180 / math.pi
end
--- Converts the degrees heading (0-360) to radians (0-2pi).
-- 
-- @param degrees The heading in degrees.
-- @returns The heading in radians.
function ____exports.getHeadingRadians(self, degrees)
    if degrees < 0 then
        return (degrees + 360) * (math.pi / 180)
    end
    return degrees * (math.pi / 180)
end
return ____exports
 end,
["src.utils.land"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.LandUtils = {
    getLineStringPathOnRoads = function(self, start, dest)
        return __TS__ArrayMap(
            self:getVec2PathOnRoads(
                self:positionToVec2(start),
                self:positionToVec2(dest)
            ),
            function(____, vec2) return self:vec2ToPosition(vec2) end
        )
    end,
    positionToVec3 = function(self, pos)
        return coord.LLtoLO(pos[2], pos[1], pos[3])
    end,
    vec2ToPosition = function(self, vec2)
        return self:vec3ToPosition({x = vec2.x, y = 0, z = vec2.y})
    end,
    positionToVec2 = function(self, pos)
        return self:vec3ToVec2(self:positionToVec3(pos))
    end,
    getVec2PathOnRoads = function(self, start, dest)
        return land.findPathOnRoads(
            "roads",
            start.x,
            start.y,
            dest.x,
            dest.y
        )
    end,
    vec3ToPosition = function(self, vec3)
        local lat, lon, alt = coord.LOtoLL(vec3)
        return {lon, lat, alt}
    end,
    vec3ToVec2 = function(self, vec3)
        local ____vec3_0 = vec3
        local x = ____vec3_0.x
        local y = ____vec3_0.y
        local z = ____vec3_0.z
        return {x = x, y = z}
    end,
    getClosestPointOnRoads = function(self, vec2)
        local x, y = land.getClosestPointOnRoads("roads", vec2.x, vec2.y)
        return {x = x, y = y}
    end,
    getClosestPointOnRailroads = function(self, vec2)
        local x, y = land.getClosestPointOnRoads("railroads", vec2.x, vec2.y)
        return {x = x, y = y}
    end
}
return ____exports
 end,
["src.services.static-object.service"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____getHeading = require("src.utils.getHeading")
local getHeading = ____getHeading.getHeading
local getHeadingRadians = ____getHeading.getHeadingRadians
local ____land = require("src.utils.land")
local LandUtils = ____land.LandUtils
____exports.StaticObjectService = __TS__Class()
local StaticObjectService = ____exports.StaticObjectService
StaticObjectService.name = "StaticObjectService"
function StaticObjectService.prototype.____constructor(self)
    self.staticObjectIdToNameCache = {}
end
function StaticObjectService.prototype.findById(self, id, withFallbackToScan)
    if withFallbackToScan == nil then
        withFallbackToScan = true
    end
    local cachedName = self.staticObjectIdToNameCache[tostring(id)]
    if cachedName then
        local staticObject = StaticObject.getByName(cachedName)
        if not staticObject then
            self.staticObjectIdToNameCache[tostring(id)] = nil
        end
        return staticObject
    end
    if withFallbackToScan then
        local staticObject = __TS__ArrayFind(
            self:getStaticObjects(),
            function(____, it) return tostring(it:getID()) == tostring(id) end
        )
        if staticObject then
            self.staticObjectIdToNameCache[tostring(id)] = staticObject:getName()
        end
        return staticObject
    end
    return nil
end
function StaticObjectService.prototype.findByName(self, name)
    local staticObject = Unit.getByName(name)
    return staticObject
end
function StaticObjectService.prototype.addStaticObject(self, createStaticObjectDto)
    do
        local function ____catch(____error)
            return true, false
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            local linkUnit
            local linkUnitPos
            if createStaticObjectDto.linkUnitName then
                linkUnit = Unit.getByName(createStaticObjectDto.linkUnitName)
                linkUnitPos = linkUnit and LandUtils:vec3ToVec2(linkUnit and linkUnit:getPoint())
            end
            local ____temp_2 = LandUtils:positionToVec2(createStaticObjectDto.position)
            local x = ____temp_2.x
            local y = ____temp_2.y
            local heading = getHeadingRadians(nil, createStaticObjectDto.heading)
            local staticObject = coalition.addStaticObject(
                createStaticObjectDto.country,
                {
                    heading = heading,
                    type = createStaticObjectDto.type,
                    name = createStaticObjectDto.name,
                    category = tostring(createStaticObjectDto.category),
                    shape_name = createStaticObjectDto.shapeName,
                    x = x,
                    y = y,
                    alt = createStaticObjectDto.position[3],
                    alt_type = AI.Task.AltitudeType.BARO,
                    linkUnit = linkUnit and linkUnit:getID(),
                    offsets = linkUnit and linkUnitPos and ({
                        x = x - linkUnitPos.x,
                        y = y - linkUnitPos.y,
                        angle = heading - getHeadingRadians(
                            nil,
                            getHeading(nil, linkUnit)
                        )
                    }) or nil
                }
            )
            self.staticObjectIdToNameCache[tostring(staticObject:getID())] = staticObject:getName()
            return true, staticObject
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function StaticObjectService.prototype.removeStaticObject(self, id)
    local existingStaticObject = self:findById(id)
    if existingStaticObject then
        local getStaticObjectGraveyard = LandUtils:positionToVec2({0, 0})
        coalition.addStaticObject(
            existingStaticObject:getCountry(),
            __TS__ObjectAssign(
                {
                    heading = 0,
                    name = existingStaticObject:getName()
                },
                getStaticObjectGraveyard
            )
        )
        if self.staticObjectIdToNameCache[tostring(id)] then
            self.staticObjectIdToNameCache[tostring(id)] = nil
        end
    end
    return existingStaticObject
end
function StaticObjectService.prototype.getStaticObjects(self)
    local ____array_5 = __TS__SparseArrayNew(unpack(coalition.getStaticObjects(coalition.side.RED)))
    __TS__SparseArrayPush(
        ____array_5,
        unpack(coalition.getStaticObjects(coalition.side.BLUE))
    )
    __TS__SparseArrayPush(
        ____array_5,
        unpack(coalition.getStaticObjects(coalition.side.NEUTRAL))
    )
    return {__TS__SparseArraySpread(____array_5)}
end
____exports.staticObjectsService = __TS__New(____exports.StaticObjectService)
return ____exports
 end,
["src.routes.coalition"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local json = require("lua_modules.@flying-dice.tslua-rxi-json.index")
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local HttpError = ____dcs_2Dweb_2Deditor_2Dcommon.HttpError
local HttpStatus = ____dcs_2Dweb_2Deditor_2Dcommon.HttpStatus
local body = ____dcs_2Dweb_2Deditor_2Dcommon.body
local responses = ____dcs_2Dweb_2Deditor_2Dcommon.responses
local ____app = require("src.app")
local app = ____app.app
local ____static_2Dobject_2Eservice = require("src.services.static-object.service")
local staticObjectsService = ____static_2Dobject_2Eservice.staticObjectsService
local ____getHeading = require("src.utils.getHeading")
local getHeading = ____getHeading.getHeading
local ____land = require("src.utils.land")
local LandUtils = ____land.LandUtils
local logger = __TS__New(Logger, "StaticRouter")
--- Converts a static object to a StaticObjectDto.
-- 
-- @param staticObject - The static object to convert.
-- @returns The converted DTO object.
local function toDto(____, staticObject)
    return {
        id = staticObject:getID(),
        heading = getHeading(nil, staticObject),
        type = staticObject:getTypeName(),
        name = staticObject:getName(),
        position = LandUtils:vec3ToPosition(staticObject:getPoint()),
        coalition = staticObject:getCoalition(),
        country = staticObject:getCountry()
    }
end
app:get(
    "/static-objects",
    {
        tags = {"static-objects"},
        operationId = "getStaticObjects",
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectsDto"}})
    },
    function(____, req, res)
        logger:info("Getting Static Objects")
        local staticObjects = staticObjectsService:getStaticObjects()
        res:json(__TS__ArrayMap(staticObjects, toDto))
    end
)
app:post(
    "/static-objects",
    {
        tags = {"static-objects"},
        operationId = "addStaticObjects",
        requestBody = body(nil, "CreateStaticObjectsDto"),
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectsDto"}})
    },
    function(____, req, res)
        if not req.body then
            error(
                __TS__New(HttpError, HttpStatus.BAD_REQUEST, "Missing body"),
                0
            )
        end
        logger:info("Adding Static Objects")
        local createStaticObjectsDto = json.decode(req.body)
        local staticObjects = __TS__ArrayFilter(
            __TS__ArrayMap(
                createStaticObjectsDto,
                function(____, createStaticObjectDto) return staticObjectsService:addStaticObject(createStaticObjectDto) end
            ),
            function(____, i) return i ~= false end
        )
        res:json(__TS__ArrayMap(
            staticObjects,
            function(____, it) return toDto(nil, it) end
        ))
    end
)
app:get(
    "/static-objects/:id",
    {
        tags = {"static-objects"},
        operationId = "getStaticObject",
        parameters = {{name = "id", ["in"] = "path", required = true, schema = {type = "number"}}},
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectDto"}})
    },
    function(____, req, res)
        if not req.parameters.id then
            error(
                __TS__New(HttpError, HttpStatus.BAD_REQUEST, "Missing id"),
                0
            )
        end
        logger:info("Getting Static Object")
        local staticObject = staticObjectsService:findById(req.parameters.id)
        if not staticObject then
            error(
                __TS__New(HttpError, HttpStatus.NOT_FOUND, ("Static Object with id " .. req.parameters.id) .. " not found"),
                0
            )
        end
        res:json(toDto(nil, staticObject))
    end
)
app:delete(
    "/static-objects",
    {
        tags = {"static-objects"},
        operationId = "removeStaticObjects",
        requestBody = body(nil, "BulkDeleteStaticObjectsDto"),
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectsDto"}})
    },
    function(____, req, res)
        logger:info("Deleting Static Objects")
        if not req.body then
            error(
                __TS__New(HttpError, HttpStatus.BAD_REQUEST, "Missing body"),
                0
            )
        end
        local bulkDeleteStaticObjectsDto = json.decode(req.body)
        local staticObjects = {}
        __TS__ArrayForEach(
            bulkDeleteStaticObjectsDto.ids,
            function(____, id)
                do
                    pcall(function()
                        local staticObject = staticObjectsService:removeStaticObject(id)
                        if staticObject then
                            staticObjects[#staticObjects + 1] = staticObject
                        end
                    end)
                end
            end
        )
        res:json(__TS__ArrayMap(
            staticObjects,
            function(____, it) return toDto(nil, it) end
        ))
    end
)
app:delete(
    "/clear-all",
    {
        tags = {"static-objects"},
        operationId = "clearStaticObjects",
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectsDto"}})
    },
    function(____, req, res)
        logger:info("Clearing All Static Objects")
        local clearObjects = staticObjectsService:getStaticObjects()
        __TS__ArrayForEach(
            clearObjects,
            function(____, obj)
                local staticObject = staticObjectsService:removeStaticObject(obj:getID())
            end
        )
        res:json({CLEAR = "OK"})
    end
)
return ____exports
 end,
["lua_modules.@flying-dice.tslua-rxi-json.index"] = function(...) 
--
-- json.lua
--
-- Copyright (c) 2020 rxi
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

local json = { _version = "0.1.2" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
    [ "\\" ] = "\\",
    [ "\"" ] = "\"",
    [ "\b" ] = "b",
    [ "\f" ] = "f",
    [ "\n" ] = "n",
    [ "\r" ] = "r",
    [ "\t" ] = "t",
}

local escape_char_map_inv = { [ "/" ] = "/" }
for k, v in pairs(escape_char_map) do
    escape_char_map_inv[v] = k
end


local function escape_char(c)
    return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
end


local function encode_nil(val)
    return "null"
end


local function encode_table(val, stack)
    local res = {}
    stack = stack or {}

    -- Circular reference?
    if stack[val] then error("circular reference") end

    stack[val] = true

    if rawget(val, 1) ~= nil or next(val) == nil then
        -- Treat as array -- check keys are valid and it is not sparse
        local n = 0
        for k in pairs(val) do
            if type(k) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end
            n = n + 1
        end
        if n ~= #val then
            error("invalid table: sparse array")
        end
        -- Encode
        for i, v in ipairs(val) do
            table.insert(res, encode(v, stack))
        end
        stack[val] = nil
        return "[" .. table.concat(res, ",") .. "]"

    else
        -- Treat as an object
        for k, v in pairs(val) do
            if type(k) ~= "string" then
                error("invalid table: mixed or invalid key types")
            end
            table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
        end
        stack[val] = nil
        return "{" .. table.concat(res, ",") .. "}"
    end
end


local function encode_string(val)
    return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
    -- Check for NaN, -inf and inf
    if val ~= val or val <= -math.huge or val >= math.huge then
        error("unexpected number value '" .. tostring(val) .. "'")
    end
    return string.format("%.14g", val)
end


local type_func_map = {
    [ "nil"     ] = encode_nil,
    [ "table"   ] = encode_table,
    [ "string"  ] = encode_string,
    [ "number"  ] = encode_number,
    [ "boolean" ] = tostring,
}


encode = function(val, stack)
    local t = type(val)
    local f = type_func_map[t]
    if f then
        return f(val, stack)
    end
    error("unexpected type '" .. t .. "'")
end


function json.encode(val)
    return ( encode(val) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...)
    local res = {}
    for i = 1, select("#", ...) do
        res[ select(i, ...) ] = true
    end
    return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
    [ "true"  ] = true,
    [ "false" ] = false,
    [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
    for i = idx, #str do
        if set[str:sub(i, i)] ~= negate then
            return i
        end
    end
    return #str + 1
end


local function decode_error(str, idx, msg)
    local line_count = 1
    local col_count = 1
    for i = 1, idx - 1 do
        col_count = col_count + 1
        if str:sub(i, i) == "\n" then
            line_count = line_count + 1
            col_count = 1
        end
    end
    error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
    -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
    local f = math.floor
    if n <= 0x7f then
        return string.char(n)
    elseif n <= 0x7ff then
        return string.char(f(n / 64) + 192, n % 64 + 128)
    elseif n <= 0xffff then
        return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
    elseif n <= 0x10ffff then
        return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                f(n % 4096 / 64) + 128, n % 64 + 128)
    end
    error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
    local n1 = tonumber( s:sub(1, 4),  16 )
    local n2 = tonumber( s:sub(7, 10), 16 )
    -- Surrogate pair?
    if n2 then
        return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
    else
        return codepoint_to_utf8(n1)
    end
end


local function parse_string(str, i)
    local res = ""
    local j = i + 1
    local k = j

    while j <= #str do
        local x = str:byte(j)

        if x < 32 then
            decode_error(str, j, "control character in string")

        elseif x == 92 then -- `\`: Escape
            res = res .. str:sub(k, j - 1)
            j = j + 1
            local c = str:sub(j, j)
            if c == "u" then
                local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                        or str:match("^%x%x%x%x", j + 1)
                        or decode_error(str, j - 1, "invalid unicode escape in string")
                res = res .. parse_unicode_escape(hex)
                j = j + #hex
            else
                if not escape_chars[c] then
                    decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
                end
                res = res .. escape_char_map_inv[c]
            end
            k = j + 1

        elseif x == 34 then -- `"`: End of string
            res = res .. str:sub(k, j - 1)
            return res, j + 1
        end

        j = j + 1
    end

    decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
    local x = next_char(str, i, delim_chars)
    local s = str:sub(i, x - 1)
    local n = tonumber(s)
    if not n then
        decode_error(str, i, "invalid number '" .. s .. "'")
    end
    return n, x
end


local function parse_literal(str, i)
    local x = next_char(str, i, delim_chars)
    local word = str:sub(i, x - 1)
    if not literals[word] then
        decode_error(str, i, "invalid literal '" .. word .. "'")
    end
    return literal_map[word], x
end


local function parse_array(str, i)
    local res = {}
    local n = 1
    i = i + 1
    while 1 do
        local x
        i = next_char(str, i, space_chars, true)
        -- Empty / end of array?
        if str:sub(i, i) == "]" then
            i = i + 1
            break
        end
        -- Read token
        x, i = parse(str, i)
        res[n] = x
        n = n + 1
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "]" then break end
        if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
    end
    return res, i
end


local function parse_object(str, i)
    local res = {}
    i = i + 1
    while 1 do
        local key, val
        i = next_char(str, i, space_chars, true)
        -- Empty / end of object?
        if str:sub(i, i) == "}" then
            i = i + 1
            break
        end
        -- Read key
        if str:sub(i, i) ~= '"' then
            decode_error(str, i, "expected string for key")
        end
        key, i = parse(str, i)
        -- Read ':' delimiter
        i = next_char(str, i, space_chars, true)
        if str:sub(i, i) ~= ":" then
            decode_error(str, i, "expected ':' after key")
        end
        i = next_char(str, i + 1, space_chars, true)
        -- Read value
        val, i = parse(str, i)
        -- Set
        res[key] = val
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "}" then break end
        if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
    end
    return res, i
end


local char_func_map = {
    [ '"' ] = parse_string,
    [ "0" ] = parse_number,
    [ "1" ] = parse_number,
    [ "2" ] = parse_number,
    [ "3" ] = parse_number,
    [ "4" ] = parse_number,
    [ "5" ] = parse_number,
    [ "6" ] = parse_number,
    [ "7" ] = parse_number,
    [ "8" ] = parse_number,
    [ "9" ] = parse_number,
    [ "-" ] = parse_number,
    [ "t" ] = parse_literal,
    [ "f" ] = parse_literal,
    [ "n" ] = parse_literal,
    [ "[" ] = parse_array,
    [ "{" ] = parse_object,
}


parse = function(str, idx)
    local chr = str:sub(idx, idx)
    local f = char_func_map[chr]
    if f then
        return f(str, idx)
    end
    decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
    if type(str) ~= "string" then
        error("expected argument of type string, got " .. type(str))
    end
    local res, idx = parse(str, next_char(str, 1, space_chars, true))
    idx = next_char(str, idx, space_chars, true)
    if idx <= #str then
        decode_error(str, idx, "trailing garbage")
    end
    return res
end


return json end,
["src.dtos.health.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.routes.health"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local HttpStatus = ____dcs_2Dweb_2Deditor_2Dcommon.HttpStatus
local responses = ____dcs_2Dweb_2Deditor_2Dcommon.responses
local ____app = require("src.app")
local app = ____app.app
app:get(
    "/health",
    {
        operationId = "getHealth",
        responses = responses(nil, {[HttpStatus.OK] = {{description = "OK"}, "HealthDto"}})
    },
    function(____, req, res)
        res:json({status = "OK", _APP_VERSION = _APP_VERSION, _VERSION = _VERSION, _ARCHITECTURE = _ARCHITECTURE})
    end
)
return ____exports
 end,
["src.routes.livemap"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local HttpError = ____dcs_2Dweb_2Deditor_2Dcommon.HttpError
local HttpStatus = ____dcs_2Dweb_2Deditor_2Dcommon.HttpStatus
local responses = ____dcs_2Dweb_2Deditor_2Dcommon.responses
local ____app = require("src.app")
local app = ____app.app
local ____static_2Dobject_2Eservice = require("src.services.static-object.service")
local staticObjectsService = ____static_2Dobject_2Eservice.staticObjectsService
local ____getHeading = require("src.utils.getHeading")
local getHeading = ____getHeading.getHeading
local ____land = require("src.utils.land")
local LandUtils = ____land.LandUtils
local logger = __TS__New(Logger, "LiveMapRouter")
--- Converts a static object to a StaticObjectDto.
-- 
-- @param staticObject - The static object to convert.
-- @returns The converted DTO object.
local function toDto(____, staticObject)
    return {
        id = staticObject:getID(),
        heading = getHeading(nil, staticObject),
        type = staticObject:getTypeName(),
        name = staticObject:getName(),
        position = LandUtils:vec3ToPosition(staticObject:getPoint()),
        coalition = staticObject:getCoalition(),
        country = staticObject:getCountry()
    }
end
app:get(
    "/position/:name",
    {
        operationId = "getPosition",
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "StaticObjectDto"}})
    },
    function(____, req, res)
        logger:info("Getting Unit by Name")
        local unit = staticObjectsService:findByName(req.parameters.name)
        if not unit then
            error(
                __TS__New(HttpError, HttpStatus.NOT_FOUND, ("Static Object with name " .. req.parameters.name) .. " not found"),
                0
            )
        end
        res:json(toDto(nil, unit))
    end
)
return ____exports
 end,
["src.routes.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
require("src.routes.coalition")
require("src.routes.health")
require("src.routes.livemap")
return ____exports
 end,
["src.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____app = require("src.app")
local app = ____app.app
local ____config = require("src.config")
local config = ____config.config
require("src.routes.index")
local logger = __TS__New(Logger, "WebEditorMissionServer")
if __dcs_web_editor_app ~= nil then
    logger:info("Closing existing app")
    __dcs_web_editor_app:close()
end
logger:info("Starting app")
__dcs_web_editor_app = app
if __dcs_web_editor_app_function_id ~= nil then
    logger:info("Removing existing function " .. tostring(__dcs_web_editor_app_function_id))
    timer.removeFunction(__dcs_web_editor_app_function_id)
end
__dcs_web_editor_app_function_id = timer.scheduleFunction(
    function()
        do
            local function ____catch(e)
                env.error("Error accepting client: " .. tostring(e))
            end
            local ____try, ____hasReturned = pcall(function()
                app:acceptNextClient()
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
        return timer.getTime() + 0.01
    end,
    {},
    timer.getTime() + 0.01
)
logger:info("Started server loop with functionId " .. tostring(__dcs_web_editor_app_function_id))
logger:info(((("Mission Server Listening on http://" .. config.bindAddress) .. ":") .. tostring(config.port)) .. "/")
return ____exports
 end,
["src.dtos.error.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.dtos.unit.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.services.unit.service"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____getHeading = require("src.utils.getHeading")
local getHeadingRadians = ____getHeading.getHeadingRadians
local ____land = require("src.utils.land")
local LandUtils = ____land.LandUtils
____exports.UnitService = __TS__Class()
local UnitService = ____exports.UnitService
UnitService.name = "UnitService"
function UnitService.prototype.____constructor(self)
end
function UnitService.prototype.findByName(self, name)
    local unit = Unit.getByName(name)
    return unit
end
function UnitService.prototype.addUnit(self, createUnitDto)
    do
        local function ____catch(____error)
            return true, false
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            local unit = coalition.addGroup(
                createUnitDto.country,
                Group.Category.AIRPLANE,
                __TS__ObjectAssign(
                    {
                        heading = getHeadingRadians(nil, createUnitDto.heading),
                        type = createUnitDto.type,
                        name = createUnitDto.name,
                        category = tostring(createUnitDto.category),
                        shape_name = createUnitDto.shapeName
                    },
                    LandUtils:positionToVec2(createUnitDto.position)
                )
            )
            return true, unit
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
____exports.unitsService = __TS__New(____exports.UnitService)
return ____exports
 end,
["src.utils.getSpeed"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
--- Calculates the speed of the item based on its velocity.
-- 
-- @param it The item to calculate the speed for.
-- @returns The speed of the unit in meters per second.
function ____exports.getSpeed(self, it)
    local velocity = it:getVelocity()
    return math.sqrt(velocity.x ^ 2 + velocity.y ^ 2 + velocity.z ^ 2)
end
return ____exports
 end,
}
local __TS__SourceMapTraceBack = require("lualib_bundle").__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["458"] = {line = 1, file = "package.json"},["459"] = {line = 2, file = "package.json"},["460"] = {line = 3, file = "package.json"},["461"] = {line = 4, file = "package.json"},["462"] = {line = 5, file = "package.json"},["463"] = {line = 6, file = "package.json"},["464"] = {line = 7, file = "package.json"},["465"] = {line = 8, file = "package.json"},["466"] = {line = 9, file = "package.json"},["467"] = {line = 10, file = "package.json"},["468"] = {line = 11, file = "package.json"},["469"] = {line = 12, file = "package.json"},["470"] = {line = 13, file = "package.json"},["471"] = {line = 7, file = "package.json"},["472"] = {line = 15, file = "package.json"},["473"] = {line = 16, file = "package.json"},["474"] = {line = 17, file = "package.json"},["475"] = {line = 18, file = "package.json"},["476"] = {line = 19, file = "package.json"},["477"] = {line = 20, file = "package.json"},["478"] = {line = 15, file = "package.json"},["479"] = {line = 22, file = "package.json"},["480"] = {line = 23, file = "package.json"},["481"] = {line = 24, file = "package.json"},["482"] = {line = 25, file = "package.json"},["483"] = {line = 26, file = "package.json"},["484"] = {line = 27, file = "package.json"},["485"] = {line = 28, file = "package.json"},["486"] = {line = 29, file = "package.json"},["487"] = {line = 22, file = "package.json"},["488"] = {line = 1, file = "package.json"},["494"] = {line = 1, file = "config.ts"},["495"] = {line = 1, file = "config.ts"},["496"] = {line = 1, file = "config.ts"},["497"] = {line = 3, file = "config.ts"},["498"] = {line = 4, file = "config.ts"},["499"] = {line = 5, file = "config.ts"},["500"] = {line = 6, file = "config.ts"},["501"] = {line = 7, file = "config.ts"},["502"] = {line = 8, file = "config.ts"},["503"] = {line = 9, file = "config.ts"},["504"] = {line = 4, file = "config.ts"},["505"] = {line = 12, file = "config.ts"},["604"] = {line = 1, file = "dto.openapi.json"},["611"] = {line = 1, file = "app.ts"},["612"] = {line = 1, file = "app.ts"},["613"] = {line = 2, file = "app.ts"},["614"] = {line = 2, file = "app.ts"},["615"] = {line = 3, file = "app.ts"},["616"] = {line = 3, file = "app.ts"},["617"] = {line = 3, file = "app.ts"},["618"] = {line = 3, file = "app.ts"},["619"] = {line = 4, file = "app.ts"},["620"] = {line = 4, file = "app.ts"},["621"] = {line = 5, file = "app.ts"},["622"] = {line = 7, file = "app.ts"},["623"] = {line = 19, file = "app.ts"},["3631"] = {line = 13, file = "getHeading.ts"},["3632"] = {line = 14, file = "getHeading.ts"},["3633"] = {line = 15, file = "getHeading.ts"},["3634"] = {line = 17, file = "getHeading.ts"},["3635"] = {line = 18, file = "getHeading.ts"},["3637"] = {line = 21, file = "getHeading.ts"},["3638"] = {line = 13, file = "getHeading.ts"},["3643"] = {line = 30, file = "getHeading.ts"},["3644"] = {line = 31, file = "getHeading.ts"},["3645"] = {line = 32, file = "getHeading.ts"},["3647"] = {line = 35, file = "getHeading.ts"},["3648"] = {line = 30, file = "getHeading.ts"},["3656"] = {line = 4, file = "land.ts"},["3657"] = {line = 15, file = "land.ts"},["3658"] = {line = 16, file = "land.ts"},["3659"] = {line = 16, file = "land.ts"},["3660"] = {line = 17, file = "land.ts"},["3661"] = {line = 18, file = "land.ts"},["3662"] = {line = 16, file = "land.ts"},["3663"] = {line = 19, file = "land.ts"},["3664"] = {line = 16, file = "land.ts"},["3665"] = {line = 15, file = "land.ts"},["3666"] = {line = 28, file = "land.ts"},["3667"] = {line = 29, file = "land.ts"},["3668"] = {line = 28, file = "land.ts"},["3669"] = {line = 38, file = "land.ts"},["3670"] = {line = 39, file = "land.ts"},["3671"] = {line = 38, file = "land.ts"},["3672"] = {line = 48, file = "land.ts"},["3673"] = {line = 49, file = "land.ts"},["3674"] = {line = 48, file = "land.ts"},["3675"] = {line = 60, file = "land.ts"},["3676"] = {line = 61, file = "land.ts"},["3677"] = {line = 62, file = "land.ts"},["3678"] = {line = 63, file = "land.ts"},["3679"] = {line = 64, file = "land.ts"},["3680"] = {line = 65, file = "land.ts"},["3681"] = {line = 66, file = "land.ts"},["3682"] = {line = 61, file = "land.ts"},["3683"] = {line = 60, file = "land.ts"},["3684"] = {line = 76, file = "land.ts"},["3685"] = {line = 77, file = "land.ts"},["3686"] = {line = 78, file = "land.ts"},["3687"] = {line = 76, file = "land.ts"},["3688"] = {line = 87, file = "land.ts"},["3689"] = {line = 88, file = "land.ts"},["3690"] = {line = 88, file = "land.ts"},["3691"] = {line = 88, file = "land.ts"},["3692"] = {line = 88, file = "land.ts"},["3693"] = {line = 89, file = "land.ts"},["3694"] = {line = 87, file = "land.ts"},["3695"] = {line = 98, file = "land.ts"},["3696"] = {line = 99, file = "land.ts"},["3697"] = {line = 100, file = "land.ts"},["3698"] = {line = 98, file = "land.ts"},["3699"] = {line = 109, file = "land.ts"},["3700"] = {line = 110, file = "land.ts"},["3701"] = {line = 111, file = "land.ts"},["3702"] = {line = 109, file = "land.ts"},["3703"] = {line = 4, file = "land.ts"},["3717"] = {line = 7, file = "static-object.service.ts"},["3718"] = {line = 7, file = "static-object.service.ts"},["3719"] = {line = 7, file = "static-object.service.ts"},["3720"] = {line = 8, file = "static-object.service.ts"},["3721"] = {line = 8, file = "static-object.service.ts"},["3722"] = {line = 10, file = "static-object.service.ts"},["3723"] = {line = 10, file = "static-object.service.ts"},["3724"] = {line = 10, file = "static-object.service.ts"},["3726"] = {line = 11, file = "static-object.service.ts"},["3727"] = {line = 10, file = "static-object.service.ts"},["3728"] = {line = 13, file = "static-object.service.ts"},["3729"] = {line = 15, file = "static-object.service.ts"},["3730"] = {line = 15, file = "static-object.service.ts"},["3732"] = {line = 17, file = "static-object.service.ts"},["3733"] = {line = 18, file = "static-object.service.ts"},["3734"] = {line = 19, file = "static-object.service.ts"},["3735"] = {line = 22, file = "static-object.service.ts"},["3736"] = {line = 23, file = "static-object.service.ts"},["3738"] = {line = 26, file = "static-object.service.ts"},["3740"] = {line = 29, file = "static-object.service.ts"},["3741"] = {line = 31, file = "static-object.service.ts"},["3742"] = {line = 31, file = "static-object.service.ts"},["3743"] = {line = 32, file = "static-object.service.ts"},["3744"] = {line = 31, file = "static-object.service.ts"},["3745"] = {line = 36, file = "static-object.service.ts"},["3746"] = {line = 37, file = "static-object.service.ts"},["3748"] = {line = 43, file = "static-object.service.ts"},["3750"] = {line = 46, file = "static-object.service.ts"},["3751"] = {line = 13, file = "static-object.service.ts"},["3752"] = {line = 49, file = "static-object.service.ts"},["3753"] = {line = 50, file = "static-object.service.ts"},["3754"] = {line = 51, file = "static-object.service.ts"},["3755"] = {line = 49, file = "static-object.service.ts"},["3756"] = {line = 54, file = "static-object.service.ts"},["3759"] = {line = 98, file = "static-object.service.ts"},["3762"] = {line = 58, file = "static-object.service.ts"},["3763"] = {line = 59, file = "static-object.service.ts"},["3764"] = {line = 61, file = "static-object.service.ts"},["3765"] = {line = 62, file = "static-object.service.ts"},["3766"] = {line = 63, file = "static-object.service.ts"},["3768"] = {line = 66, file = "static-object.service.ts"},["3769"] = {line = 66, file = "static-object.service.ts"},["3770"] = {line = 66, file = "static-object.service.ts"},["3771"] = {line = 67, file = "static-object.service.ts"},["3772"] = {line = 69, file = "static-object.service.ts"},["3773"] = {line = 70, file = "static-object.service.ts"},["3774"] = {line = 71, file = "static-object.service.ts"},["3775"] = {line = 72, file = "static-object.service.ts"},["3776"] = {line = 73, file = "static-object.service.ts"},["3777"] = {line = 74, file = "static-object.service.ts"},["3778"] = {line = 75, file = "static-object.service.ts"},["3779"] = {line = 76, file = "static-object.service.ts"},["3780"] = {line = 77, file = "static-object.service.ts"},["3781"] = {line = 78, file = "static-object.service.ts"},["3782"] = {line = 79, file = "static-object.service.ts"},["3783"] = {line = 80, file = "static-object.service.ts"},["3784"] = {line = 81, file = "static-object.service.ts"},["3785"] = {line = 82, file = "static-object.service.ts"},["3786"] = {line = 85, file = "static-object.service.ts"},["3787"] = {line = 86, file = "static-object.service.ts"},["3788"] = {line = 87, file = "static-object.service.ts"},["3789"] = {line = 87, file = "static-object.service.ts"},["3790"] = {line = 87, file = "static-object.service.ts"},["3791"] = {line = 87, file = "static-object.service.ts"},["3792"] = {line = 84, file = "static-object.service.ts"},["3793"] = {line = 71, file = "static-object.service.ts"},["3794"] = {line = 69, file = "static-object.service.ts"},["3795"] = {line = 92, file = "static-object.service.ts"},["3796"] = {line = 96, file = "static-object.service.ts"},["3802"] = {line = 57, file = "static-object.service.ts"},["3805"] = {line = 54, file = "static-object.service.ts"},["3806"] = {line = 102, file = "static-object.service.ts"},["3807"] = {line = 103, file = "static-object.service.ts"},["3808"] = {line = 105, file = "static-object.service.ts"},["3809"] = {line = 106, file = "static-object.service.ts"},["3810"] = {line = 108, file = "static-object.service.ts"},["3811"] = {line = 108, file = "static-object.service.ts"},["3812"] = {line = 108, file = "static-object.service.ts"},["3814"] = {line = 109, file = "static-object.service.ts"},["3815"] = {line = 110, file = "static-object.service.ts"},["3816"] = {line = 108, file = "static-object.service.ts"},["3817"] = {line = 111, file = "static-object.service.ts"},["3818"] = {line = 108, file = "static-object.service.ts"},["3819"] = {line = 108, file = "static-object.service.ts"},["3820"] = {line = 117, file = "static-object.service.ts"},["3821"] = {line = 118, file = "static-object.service.ts"},["3824"] = {line = 122, file = "static-object.service.ts"},["3825"] = {line = 102, file = "static-object.service.ts"},["3826"] = {line = 125, file = "static-object.service.ts"},["3827"] = {line = 127, file = "static-object.service.ts"},["3830"] = {line = 128, file = "static-object.service.ts"},["3834"] = {line = 129, file = "static-object.service.ts"},["3836"] = {line = 126, file = "static-object.service.ts"},["3837"] = {line = 125, file = "static-object.service.ts"},["3838"] = {line = 134, file = "static-object.service.ts"},["3849"] = {line = 1, file = "coalition.ts"},["3850"] = {line = 1, file = "coalition.ts"},["3851"] = {line = 3, file = "coalition.ts"},["3852"] = {line = 4, file = "coalition.ts"},["3853"] = {line = 6, file = "coalition.ts"},["3854"] = {line = 8, file = "coalition.ts"},["3855"] = {line = 9, file = "coalition.ts"},["3856"] = {line = 10, file = "coalition.ts"},["3857"] = {line = 12, file = "coalition.ts"},["3858"] = {line = 12, file = "coalition.ts"},["3859"] = {line = 19, file = "coalition.ts"},["3860"] = {line = 19, file = "coalition.ts"},["3861"] = {line = 20, file = "coalition.ts"},["3862"] = {line = 20, file = "coalition.ts"},["3863"] = {line = 21, file = "coalition.ts"},["3864"] = {line = 21, file = "coalition.ts"},["3865"] = {line = 23, file = "coalition.ts"},["3870"] = {line = 30, file = "coalition.ts"},["3871"] = {line = 30, file = "coalition.ts"},["3872"] = {line = 31, file = "coalition.ts"},["3873"] = {line = 32, file = "coalition.ts"},["3874"] = {line = 33, file = "coalition.ts"},["3875"] = {line = 34, file = "coalition.ts"},["3876"] = {line = 35, file = "coalition.ts"},["3877"] = {line = 36, file = "coalition.ts"},["3878"] = {line = 37, file = "coalition.ts"},["3879"] = {line = 30, file = "coalition.ts"},["3880"] = {line = 30, file = "coalition.ts"},["3881"] = {line = 40, file = "coalition.ts"},["3882"] = {line = 41, file = "coalition.ts"},["3883"] = {line = 42, file = "coalition.ts"},["3884"] = {line = 43, file = "coalition.ts"},["3885"] = {line = 44, file = "coalition.ts"},["3886"] = {line = 45, file = "coalition.ts"},["3887"] = {line = 42, file = "coalition.ts"},["3888"] = {line = 49, file = "coalition.ts"},["3889"] = {line = 50, file = "coalition.ts"},["3890"] = {line = 52, file = "coalition.ts"},["3891"] = {line = 54, file = "coalition.ts"},["3892"] = {line = 49, file = "coalition.ts"},["3893"] = {line = 40, file = "coalition.ts"},["3894"] = {line = 58, file = "coalition.ts"},["3895"] = {line = 59, file = "coalition.ts"},["3896"] = {line = 60, file = "coalition.ts"},["3897"] = {line = 61, file = "coalition.ts"},["3898"] = {line = 62, file = "coalition.ts"},["3899"] = {line = 63, file = "coalition.ts"},["3900"] = {line = 64, file = "coalition.ts"},["3901"] = {line = 60, file = "coalition.ts"},["3902"] = {line = 68, file = "coalition.ts"},["3903"] = {line = 69, file = "coalition.ts"},["3905"] = {line = 70, file = "coalition.ts"},["3909"] = {line = 73, file = "coalition.ts"},["3910"] = {line = 74, file = "coalition.ts"},["3911"] = {line = 78, file = "coalition.ts"},["3912"] = {line = 78, file = "coalition.ts"},["3913"] = {line = 78, file = "coalition.ts"},["3914"] = {line = 79, file = "coalition.ts"},["3915"] = {line = 78, file = "coalition.ts"},["3916"] = {line = 82, file = "coalition.ts"},["3917"] = {line = 78, file = "coalition.ts"},["3918"] = {line = 84, file = "coalition.ts"},["3919"] = {line = 84, file = "coalition.ts"},["3920"] = {line = 84, file = "coalition.ts"},["3921"] = {line = 84, file = "coalition.ts"},["3922"] = {line = 68, file = "coalition.ts"},["3923"] = {line = 58, file = "coalition.ts"},["3924"] = {line = 88, file = "coalition.ts"},["3925"] = {line = 89, file = "coalition.ts"},["3926"] = {line = 90, file = "coalition.ts"},["3927"] = {line = 91, file = "coalition.ts"},["3928"] = {line = 92, file = "coalition.ts"},["3929"] = {line = 93, file = "coalition.ts"},["3930"] = {line = 96, file = "coalition.ts"},["3931"] = {line = 90, file = "coalition.ts"},["3932"] = {line = 100, file = "coalition.ts"},["3933"] = {line = 101, file = "coalition.ts"},["3935"] = {line = 102, file = "coalition.ts"},["3939"] = {line = 105, file = "coalition.ts"},["3940"] = {line = 107, file = "coalition.ts"},["3941"] = {line = 109, file = "coalition.ts"},["3943"] = {line = 110, file = "coalition.ts"},["3947"] = {line = 116, file = "coalition.ts"},["3948"] = {line = 100, file = "coalition.ts"},["3949"] = {line = 88, file = "coalition.ts"},["3950"] = {line = 120, file = "coalition.ts"},["3951"] = {line = 121, file = "coalition.ts"},["3952"] = {line = 122, file = "coalition.ts"},["3953"] = {line = 123, file = "coalition.ts"},["3954"] = {line = 124, file = "coalition.ts"},["3955"] = {line = 125, file = "coalition.ts"},["3956"] = {line = 126, file = "coalition.ts"},["3957"] = {line = 122, file = "coalition.ts"},["3958"] = {line = 130, file = "coalition.ts"},["3959"] = {line = 131, file = "coalition.ts"},["3960"] = {line = 133, file = "coalition.ts"},["3962"] = {line = 134, file = "coalition.ts"},["3966"] = {line = 137, file = "coalition.ts"},["3967"] = {line = 141, file = "coalition.ts"},["3968"] = {line = 143, file = "coalition.ts"},["3969"] = {line = 143, file = "coalition.ts"},["3970"] = {line = 143, file = "coalition.ts"},["3973"] = {line = 145, file = "coalition.ts"},["3974"] = {line = 147, file = "coalition.ts"},["3975"] = {line = 148, file = "coalition.ts"},["3979"] = {line = 143, file = "coalition.ts"},["3980"] = {line = 143, file = "coalition.ts"},["3981"] = {line = 153, file = "coalition.ts"},["3982"] = {line = 153, file = "coalition.ts"},["3983"] = {line = 153, file = "coalition.ts"},["3984"] = {line = 153, file = "coalition.ts"},["3985"] = {line = 130, file = "coalition.ts"},["3986"] = {line = 120, file = "coalition.ts"},["3987"] = {line = 157, file = "coalition.ts"},["3988"] = {line = 158, file = "coalition.ts"},["3989"] = {line = 159, file = "coalition.ts"},["3990"] = {line = 160, file = "coalition.ts"},["3991"] = {line = 161, file = "coalition.ts"},["3992"] = {line = 162, file = "coalition.ts"},["3993"] = {line = 159, file = "coalition.ts"},["3994"] = {line = 166, file = "coalition.ts"},["3995"] = {line = 167, file = "coalition.ts"},["3996"] = {line = 169, file = "coalition.ts"},["3997"] = {line = 172, file = "coalition.ts"},["3998"] = {line = 172, file = "coalition.ts"},["3999"] = {line = 172, file = "coalition.ts"},["4000"] = {line = 173, file = "coalition.ts"},["4001"] = {line = 172, file = "coalition.ts"},["4002"] = {line = 172, file = "coalition.ts"},["4003"] = {line = 176, file = "coalition.ts"},["4004"] = {line = 166, file = "coalition.ts"},["4005"] = {line = 157, file = "coalition.ts"},["4407"] = {line = 1, file = "health.ts"},["4408"] = {line = 1, file = "health.ts"},["4409"] = {line = 1, file = "health.ts"},["4410"] = {line = 2, file = "health.ts"},["4411"] = {line = 2, file = "health.ts"},["4412"] = {line = 5, file = "health.ts"},["4413"] = {line = 6, file = "health.ts"},["4414"] = {line = 7, file = "health.ts"},["4415"] = {line = 8, file = "health.ts"},["4416"] = {line = 9, file = "health.ts"},["4417"] = {line = 7, file = "health.ts"},["4418"] = {line = 13, file = "health.ts"},["4419"] = {line = 14, file = "health.ts"},["4420"] = {line = 13, file = "health.ts"},["4421"] = {line = 5, file = "health.ts"},["4429"] = {line = 1, file = "livemap.ts"},["4430"] = {line = 1, file = "livemap.ts"},["4431"] = {line = 3, file = "livemap.ts"},["4432"] = {line = 5, file = "livemap.ts"},["4433"] = {line = 7, file = "livemap.ts"},["4434"] = {line = 9, file = "livemap.ts"},["4435"] = {line = 11, file = "livemap.ts"},["4436"] = {line = 11, file = "livemap.ts"},["4437"] = {line = 13, file = "livemap.ts"},["4438"] = {line = 13, file = "livemap.ts"},["4439"] = {line = 14, file = "livemap.ts"},["4440"] = {line = 14, file = "livemap.ts"},["4441"] = {line = 15, file = "livemap.ts"},["4442"] = {line = 15, file = "livemap.ts"},["4443"] = {line = 17, file = "livemap.ts"},["4448"] = {line = 24, file = "livemap.ts"},["4449"] = {line = 24, file = "livemap.ts"},["4450"] = {line = 25, file = "livemap.ts"},["4451"] = {line = 26, file = "livemap.ts"},["4452"] = {line = 27, file = "livemap.ts"},["4453"] = {line = 28, file = "livemap.ts"},["4454"] = {line = 29, file = "livemap.ts"},["4455"] = {line = 30, file = "livemap.ts"},["4456"] = {line = 31, file = "livemap.ts"},["4457"] = {line = 24, file = "livemap.ts"},["4458"] = {line = 24, file = "livemap.ts"},["4459"] = {line = 34, file = "livemap.ts"},["4460"] = {line = 35, file = "livemap.ts"},["4461"] = {line = 36, file = "livemap.ts"},["4462"] = {line = 37, file = "livemap.ts"},["4463"] = {line = 38, file = "livemap.ts"},["4464"] = {line = 36, file = "livemap.ts"},["4465"] = {line = 42, file = "livemap.ts"},["4466"] = {line = 43, file = "livemap.ts"},["4467"] = {line = 45, file = "livemap.ts"},["4468"] = {line = 47, file = "livemap.ts"},["4470"] = {line = 48, file = "livemap.ts"},["4474"] = {line = 54, file = "livemap.ts"},["4475"] = {line = 42, file = "livemap.ts"},["4476"] = {line = 34, file = "livemap.ts"},["4483"] = {line = 1, file = "index.ts"},["4484"] = {line = 2, file = "index.ts"},["4485"] = {line = 3, file = "index.ts"},["4493"] = {line = 1, file = "index.ts"},["4494"] = {line = 1, file = "index.ts"},["4495"] = {line = 2, file = "index.ts"},["4496"] = {line = 2, file = "index.ts"},["4497"] = {line = 3, file = "index.ts"},["4498"] = {line = 3, file = "index.ts"},["4499"] = {line = 4, file = "index.ts"},["4500"] = {line = 6, file = "index.ts"},["4501"] = {line = 8, file = "index.ts"},["4502"] = {line = 9, file = "index.ts"},["4503"] = {line = 10, file = "index.ts"},["4505"] = {line = 13, file = "index.ts"},["4506"] = {line = 14, file = "index.ts"},["4507"] = {line = 16, file = "index.ts"},["4508"] = {line = 17, file = "index.ts"},["4509"] = {line = 18, file = "index.ts"},["4511"] = {line = 21, file = "index.ts"},["4512"] = {line = 22, file = "index.ts"},["4515"] = {line = 26, file = "index.ts"},["4518"] = {line = 24, file = "index.ts"},["4524"] = {line = 29, file = "index.ts"},["4525"] = {line = 22, file = "index.ts"},["4526"] = {line = 31, file = "index.ts"},["4527"] = {line = 32, file = "index.ts"},["4528"] = {line = 21, file = "index.ts"},["4529"] = {line = 35, file = "index.ts"},["4530"] = {line = 39, file = "index.ts"},["4552"] = {line = 3, file = "unit.service.ts"},["4553"] = {line = 3, file = "unit.service.ts"},["4554"] = {line = 4, file = "unit.service.ts"},["4555"] = {line = 4, file = "unit.service.ts"},["4556"] = {line = 6, file = "unit.service.ts"},["4557"] = {line = 6, file = "unit.service.ts"},["4558"] = {line = 6, file = "unit.service.ts"},["4560"] = {line = 6, file = "unit.service.ts"},["4561"] = {line = 7, file = "unit.service.ts"},["4562"] = {line = 8, file = "unit.service.ts"},["4563"] = {line = 9, file = "unit.service.ts"},["4564"] = {line = 7, file = "unit.service.ts"},["4565"] = {line = 11, file = "unit.service.ts"},["4568"] = {line = 33, file = "unit.service.ts"},["4571"] = {line = 13, file = "unit.service.ts"},["4572"] = {line = 14, file = "unit.service.ts"},["4573"] = {line = 15, file = "unit.service.ts"},["4574"] = {line = 16, file = "unit.service.ts"},["4576"] = {line = 17, file = "unit.service.ts"},["4577"] = {line = 18, file = "unit.service.ts"},["4578"] = {line = 19, file = "unit.service.ts"},["4579"] = {line = 20, file = "unit.service.ts"},["4580"] = {line = 21, file = "unit.service.ts"},["4581"] = {line = 16, file = "unit.service.ts"},["4582"] = {line = 22, file = "unit.service.ts"},["4583"] = {line = 16, file = "unit.service.ts"},["4584"] = {line = 13, file = "unit.service.ts"},["4585"] = {line = 31, file = "unit.service.ts"},["4591"] = {line = 12, file = "unit.service.ts"},["4594"] = {line = 11, file = "unit.service.ts"},["4595"] = {line = 38, file = "unit.service.ts"},["4606"] = {line = 13, file = "getSpeed.ts"},["4607"] = {line = 14, file = "getSpeed.ts"},["4608"] = {line = 15, file = "getSpeed.ts"},["4609"] = {line = 13, file = "getSpeed.ts"}});
return require("src.index", ...)
