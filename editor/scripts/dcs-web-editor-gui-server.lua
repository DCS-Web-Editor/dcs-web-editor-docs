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
  __TS__ArrayFilter = __TS__ArrayFilter
}
 end,
["package"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
return {
    name = "gui-server",
    version = "1.0.0",
    description = "GUI Server Component",
    main = "dist/dcs-web-editor-gui-server.lua",
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
        ["@flying-dice/tslua-dcs-gui-types"] = "^0.29.0",
        ["@flying-dice/tslua-rxi-json"] = "^0.29.0",
        ["@turf/helpers"] = "^6.5.0",
        ["dcs-web-editor-common"] = "1.0.0"
    },
    devDependencies = {
        ["lua-types"] = "^2.13.1",
        madge = "^6.1.0",
        rimraf = "^5.0.5",
        traverse = "^0.6.8",
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
    trace = function(____, message) return log.info(message) end,
    debug = function(____, message) return log.info(message) end,
    info = function(____, message) return log.info(message) end,
    warn = function(____, message) return log.warning(message, true) end,
    error = function(____, message) return log.error(message, true) end
}
____exports.config = {bindAddress = "127.0.0.1", port = 31480, logLevel = LogLevel.TRACE, missionServerInstallPath = "Scripts\\dcs-web-editor-mission-server.lua"}
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
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local JsonApiApplication = ____dcs_2Dweb_2Deditor_2Dcommon.JsonApiApplication
local oas31 = ____dcs_2Dweb_2Deditor_2Dcommon.oas31
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
["src.dtos.operation-result.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.dtos.set-camera.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.enums.command"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.Command = Command or ({})
____exports.Command.CAMERA_FREE = 158
____exports.Command[____exports.Command.CAMERA_FREE] = "CAMERA_FREE"
____exports.Command.TIME_ACCELERATE = 53
____exports.Command[____exports.Command.TIME_ACCELERATE] = "TIME_ACCELERATE"
____exports.Command.TIME_DECELERATE = 191
____exports.Command[____exports.Command.TIME_DECELERATE] = "TIME_DECELERATE"
____exports.Command.TIME_NORMAL = 246
____exports.Command[____exports.Command.TIME_NORMAL] = "TIME_NORMAL"
____exports.Command.VIEW_CENTER = 36
____exports.Command[____exports.Command.VIEW_CENTER] = "VIEW_CENTER"
return ____exports
 end,
["src.services.mission.service"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____config = require("src.config")
local config = ____config.config
local logger = __TS__New(Logger, "MissionService")
____exports.MissionService = __TS__Class()
local MissionService = ____exports.MissionService
MissionService.name = "MissionService"
function MissionService.prototype.____constructor(self)
    self.serverRunning = false
end
function MissionService.prototype.isMissionRunning(self)
    return DCS.getModelTime() > 0
end
function MissionService.prototype.isMissionServerRunning(self)
    return self.serverRunning
end
function MissionService.prototype.onSimulationStart(self)
end
function MissionService.prototype.onSimulationStop(self)
    self.serverRunning = false
end
function MissionService.prototype.startMissionServer(self)
    do
        local function ____catch(____error)
            log.error(
                "Error bootstrapping WebEditor Mission Server: " .. tostring(____error),
                true
            )
        end
        local ____try, ____hasReturned = pcall(function()
            local missionServerFile = string.gsub(
                lfs.writedir() .. config.missionServerInstallPath,
                "\\",
                "/"
            )
            logger:info("Bootstrapping Mission Server using file " .. missionServerFile)
            local getScriptFromFile = ("dofile('" .. missionServerFile) .. "')"
            logger:info("getScriptFromFile: " .. getScriptFromFile)
            net.dostring_in("mission", ("a_do_script(\"dofile('" .. missionServerFile) .. "')\")")
            logger:info("Mission Server bootstrapped")
            self.serverRunning = true
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
end
____exports.missionService = __TS__New(____exports.MissionService)
return ____exports
 end,
["src.middleware.mission-running-guard"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local HttpStatus = ____dcs_2Dweb_2Deditor_2Dcommon.HttpStatus
local ____mission_2Eservice = require("src.services.mission.service")
local missionService = ____mission_2Eservice.missionService
____exports.missionRunningGuard = function(____, req, res, next)
    if not missionService:isMissionRunning() then
        res:status(HttpStatus.NOT_FOUND):send("Mission not running")
        return
    end
    next(nil)
end
return ____exports
 end,
["src.routes.camera"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local json = require("lua_modules.@flying-dice.tslua-rxi-json.index")
local ____dcs_2Dweb_2Deditor_2Dcommon = require("lua_modules.dcs-web-editor-common.dist.index")
local HttpStatus = ____dcs_2Dweb_2Deditor_2Dcommon.HttpStatus
local body = ____dcs_2Dweb_2Deditor_2Dcommon.body
local responses = ____dcs_2Dweb_2Deditor_2Dcommon.responses
local ____app = require("src.app")
local app = ____app.app
local ____command = require("src.enums.command")
local Command = ____command.Command
local ____mission_2Drunning_2Dguard = require("src.middleware.mission-running-guard")
local missionRunningGuard = ____mission_2Drunning_2Dguard.missionRunningGuard
local logger = __TS__New(Logger, "CameraRouter")
local function applyRotation(____, a, b, angle)
    local ax, ay, az, bx, by, bz = a.x, a.y, a.z, b.x, b.y, b.z
    a.x = math.cos(angle) * ax + math.sin(angle) * bx
    a.y = math.cos(angle) * ay + math.sin(angle) * by
    a.z = math.cos(angle) * az + math.sin(angle) * bz
    b.x = math.cos(angle) * bx - math.sin(angle) * ax
    b.y = math.cos(angle) * by - math.sin(angle) * ay
    b.z = math.cos(angle) * bz - math.sin(angle) * az
end
local function getOrientation(____, roll, pitch, heading)
    local h = math.rad(heading)
    local p = math.rad(pitch)
    local r = math.rad(roll)
    local o = {x = {x = 1, y = 0, z = 0}, y = {x = 0, y = 1, z = 0}, z = {x = 0, y = 0, z = 1}}
    applyRotation(nil, o.x, o.z, h)
    applyRotation(nil, o.x, o.y, p)
    applyRotation(nil, o.z, o.y, r)
    return o
end
app:post(
    "/set-camera-position",
    {
        operationId = "setCameraPosition",
        requestBody = body(nil, "SetCameraDto"),
        responses = responses(nil, {[HttpStatus.OK] = {{description = "Result"}, "OperationResultDto"}})
    },
    missionRunningGuard,
    function(____, req, res)
        logger:debug("Setting Camera Position")
        local ____json_decode_result_0 = json.decode(req.body)
        local position = ____json_decode_result_0.position
        local roll = ____json_decode_result_0.roll
        local pitch = ____json_decode_result_0.pitch
        local heading = ____json_decode_result_0.heading
        local agl = ____json_decode_result_0.agl
        logger:debug("Calculating Vector 3 and new Orientation: " .. json.encode({position = position, roll = roll, pitch = pitch, heading = heading}))
        local x, z = terrain.convertLatLonToMeters(position[2], position[1])
        local y = position[3]
        if agl then
            y = y + terrain.GetHeight(x, z)
        end
        local orientation = getOrientation(nil, roll, pitch, heading)
        logger:debug("Executing Request in server env: " .. json.encode(orientation))
        Export.LoSetCommand(Command.CAMERA_FREE)
        Export.LoSetCommand(Command.VIEW_CENTER)
        Export.LoSetCameraPosition({x = orientation.x, y = orientation.y, z = orientation.z, p = {x = x, y = y, z = z}})
        res:json({success = true})
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
local ____mission_2Eservice = require("src.services.mission.service")
local missionService = ____mission_2Eservice.missionService
app:get(
    "/health",
    {
        operationId = "getHealth",
        responses = responses(nil, {[HttpStatus.OK] = {{description = "OK"}, "HealthDto"}})
    },
    function(____, req, res)
        res:json({
            status = "OK",
            _APP_VERSION = _APP_VERSION,
            _VERSION = _VERSION,
            _ARCHITECTURE = _ARCHITECTURE,
            missionRunning = missionService:isMissionRunning(),
            missionServerRunning = missionService:isMissionServerRunning(),
            realTime = DCS.getRealTime(),
            modelTime = DCS.getModelTime()
        })
    end
)
return ____exports
 end,
["src.routes.mission"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____app = require("src.app")
local app = ____app.app
local ____mission_2Drunning_2Dguard = require("src.middleware.mission-running-guard")
local missionRunningGuard = ____mission_2Drunning_2Dguard.missionRunningGuard
local ____mission_2Eservice = require("src.services.mission.service")
local missionService = ____mission_2Eservice.missionService
local logger = __TS__New(Logger, "MissionServerRouter")
app:post(
    "/start-mission-server",
    {tags = {"mission"}, operationId = "startMissionServer", responses = {default = {description = "OK"}}},
    missionRunningGuard,
    function(____, req, res)
        missionService:startMissionServer()
        res:send("OK")
    end
)
return ____exports
 end,
["src.routes.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
require("src.routes.camera")
require("src.routes.health")
require("src.routes.mission")
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
local ____mission_2Eservice = require("src.services.mission.service")
local missionService = ____mission_2Eservice.missionService
local logger = __TS__New(Logger, "WebEditorGUIServer")
if __dcs_web_editor_app ~= nil then
    logger:info("Closing existing app")
    __dcs_web_editor_app:close()
end
logger:info("Starting app")
__dcs_web_editor_app = app
DCS.setUserCallbacks({
    onSimulationStart = function(self)
        missionService:onSimulationStart()
    end,
    onSimulationStop = function(self)
        missionService:onSimulationStop()
    end,
    onSimulationFrame = function(self)
        __dcs_web_editor_app:acceptNextClient()
    end
})
logger:info(((("GUI Server Listening on http://" .. config.bindAddress) .. ":") .. tostring(config.port)) .. "/")
return ____exports
 end,
["src.dtos.error.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.dtos.mission.dto"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
return ____exports
 end,
["src.enums.game-speed"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
____exports.GameSpeed = GameSpeed or ({})
____exports.GameSpeed.X1 = 1
____exports.GameSpeed[____exports.GameSpeed.X1] = "X1"
____exports.GameSpeed.X2 = 2
____exports.GameSpeed[____exports.GameSpeed.X2] = "X2"
____exports.GameSpeed.X4 = 4
____exports.GameSpeed[____exports.GameSpeed.X4] = "X4"
____exports.GameSpeed.X8 = 8
____exports.GameSpeed[____exports.GameSpeed.X8] = "X8"
____exports.GameSpeed.X16 = 16
____exports.GameSpeed[____exports.GameSpeed.X16] = "X16"
____exports.GameSpeed.X30 = 30
____exports.GameSpeed[____exports.GameSpeed.X30] = "X30"
____exports.GameSpeed.X60 = 60
____exports.GameSpeed[____exports.GameSpeed.X60] = "X60"
return ____exports
 end,
}
local __TS__SourceMapTraceBack = require("lualib_bundle").__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["410"] = {line = 1, file = "package.json"},["411"] = {line = 2, file = "package.json"},["412"] = {line = 3, file = "package.json"},["413"] = {line = 4, file = "package.json"},["414"] = {line = 5, file = "package.json"},["415"] = {line = 6, file = "package.json"},["416"] = {line = 7, file = "package.json"},["417"] = {line = 8, file = "package.json"},["418"] = {line = 9, file = "package.json"},["419"] = {line = 10, file = "package.json"},["420"] = {line = 11, file = "package.json"},["421"] = {line = 12, file = "package.json"},["422"] = {line = 13, file = "package.json"},["423"] = {line = 7, file = "package.json"},["424"] = {line = 15, file = "package.json"},["425"] = {line = 16, file = "package.json"},["426"] = {line = 17, file = "package.json"},["427"] = {line = 18, file = "package.json"},["428"] = {line = 19, file = "package.json"},["429"] = {line = 20, file = "package.json"},["430"] = {line = 15, file = "package.json"},["431"] = {line = 22, file = "package.json"},["432"] = {line = 23, file = "package.json"},["433"] = {line = 24, file = "package.json"},["434"] = {line = 25, file = "package.json"},["435"] = {line = 26, file = "package.json"},["436"] = {line = 27, file = "package.json"},["437"] = {line = 28, file = "package.json"},["438"] = {line = 29, file = "package.json"},["439"] = {line = 22, file = "package.json"},["440"] = {line = 1, file = "package.json"},["446"] = {line = 1, file = "config.ts"},["447"] = {line = 1, file = "config.ts"},["448"] = {line = 1, file = "config.ts"},["449"] = {line = 3, file = "config.ts"},["450"] = {line = 4, file = "config.ts"},["451"] = {line = 5, file = "config.ts"},["452"] = {line = 6, file = "config.ts"},["453"] = {line = 7, file = "config.ts"},["454"] = {line = 8, file = "config.ts"},["455"] = {line = 9, file = "config.ts"},["456"] = {line = 4, file = "config.ts"},["457"] = {line = 12, file = "config.ts"},["556"] = {line = 1, file = "dto.openapi.json"},["563"] = {line = 1, file = "app.ts"},["564"] = {line = 1, file = "app.ts"},["565"] = {line = 1, file = "app.ts"},["566"] = {line = 2, file = "app.ts"},["567"] = {line = 2, file = "app.ts"},["568"] = {line = 2, file = "app.ts"},["569"] = {line = 2, file = "app.ts"},["570"] = {line = 3, file = "app.ts"},["571"] = {line = 3, file = "app.ts"},["572"] = {line = 4, file = "app.ts"},["573"] = {line = 6, file = "app.ts"},["574"] = {line = 18, file = "app.ts"},["3187"] = {line = 1, file = "command.ts"},["3188"] = {line = 2, file = "command.ts"},["3189"] = {line = 2, file = "command.ts"},["3190"] = {line = 7, file = "command.ts"},["3191"] = {line = 7, file = "command.ts"},["3192"] = {line = 12, file = "command.ts"},["3193"] = {line = 12, file = "command.ts"},["3194"] = {line = 17, file = "command.ts"},["3195"] = {line = 17, file = "command.ts"},["3196"] = {line = 22, file = "command.ts"},["3197"] = {line = 22, file = "command.ts"},["3206"] = {line = 1, file = "mission.service.ts"},["3207"] = {line = 1, file = "mission.service.ts"},["3208"] = {line = 2, file = "mission.service.ts"},["3209"] = {line = 2, file = "mission.service.ts"},["3210"] = {line = 4, file = "mission.service.ts"},["3211"] = {line = 6, file = "mission.service.ts"},["3212"] = {line = 6, file = "mission.service.ts"},["3213"] = {line = 6, file = "mission.service.ts"},["3215"] = {line = 7, file = "mission.service.ts"},["3216"] = {line = 6, file = "mission.service.ts"},["3217"] = {line = 9, file = "mission.service.ts"},["3218"] = {line = 10, file = "mission.service.ts"},["3219"] = {line = 9, file = "mission.service.ts"},["3220"] = {line = 13, file = "mission.service.ts"},["3221"] = {line = 14, file = "mission.service.ts"},["3222"] = {line = 13, file = "mission.service.ts"},["3223"] = {line = 17, file = "mission.service.ts"},["3224"] = {line = 17, file = "mission.service.ts"},["3225"] = {line = 19, file = "mission.service.ts"},["3226"] = {line = 20, file = "mission.service.ts"},["3227"] = {line = 19, file = "mission.service.ts"},["3228"] = {line = 23, file = "mission.service.ts"},["3231"] = {line = 45, file = "mission.service.ts"},["3232"] = {line = 45, file = "mission.service.ts"},["3233"] = {line = 45, file = "mission.service.ts"},["3234"] = {line = 45, file = "mission.service.ts"},["3237"] = {line = 25, file = "mission.service.ts"},["3238"] = {line = 26, file = "mission.service.ts"},["3239"] = {line = 27, file = "mission.service.ts"},["3240"] = {line = 28, file = "mission.service.ts"},["3241"] = {line = 25, file = "mission.service.ts"},["3242"] = {line = 31, file = "mission.service.ts"},["3243"] = {line = 35, file = "mission.service.ts"},["3244"] = {line = 36, file = "mission.service.ts"},["3245"] = {line = 38, file = "mission.service.ts"},["3246"] = {line = 42, file = "mission.service.ts"},["3247"] = {line = 43, file = "mission.service.ts"},["3253"] = {line = 23, file = "mission.service.ts"},["3254"] = {line = 50, file = "mission.service.ts"},["3261"] = {line = 1, file = "mission-running-guard.ts"},["3262"] = {line = 1, file = "mission-running-guard.ts"},["3263"] = {line = 2, file = "mission-running-guard.ts"},["3264"] = {line = 2, file = "mission-running-guard.ts"},["3265"] = {line = 4, file = "mission-running-guard.ts"},["3266"] = {line = 5, file = "mission-running-guard.ts"},["3267"] = {line = 6, file = "mission-running-guard.ts"},["3270"] = {line = 9, file = "mission-running-guard.ts"},["3271"] = {line = 4, file = "mission-running-guard.ts"},["3279"] = {line = 1, file = "camera.ts"},["3280"] = {line = 1, file = "camera.ts"},["3281"] = {line = 2, file = "camera.ts"},["3282"] = {line = 3, file = "camera.ts"},["3283"] = {line = 3, file = "camera.ts"},["3284"] = {line = 3, file = "camera.ts"},["3285"] = {line = 3, file = "camera.ts"},["3286"] = {line = 4, file = "camera.ts"},["3287"] = {line = 4, file = "camera.ts"},["3288"] = {line = 7, file = "camera.ts"},["3289"] = {line = 7, file = "camera.ts"},["3290"] = {line = 8, file = "camera.ts"},["3291"] = {line = 8, file = "camera.ts"},["3292"] = {line = 10, file = "camera.ts"},["3293"] = {line = 14, file = "camera.ts"},["3294"] = {line = 15, file = "camera.ts"},["3295"] = {line = 16, file = "camera.ts"},["3296"] = {line = 17, file = "camera.ts"},["3297"] = {line = 18, file = "camera.ts"},["3298"] = {line = 19, file = "camera.ts"},["3299"] = {line = 20, file = "camera.ts"},["3300"] = {line = 21, file = "camera.ts"},["3301"] = {line = 14, file = "camera.ts"},["3302"] = {line = 24, file = "camera.ts"},["3303"] = {line = 26, file = "camera.ts"},["3304"] = {line = 27, file = "camera.ts"},["3305"] = {line = 28, file = "camera.ts"},["3306"] = {line = 30, file = "camera.ts"},["3307"] = {line = 36, file = "camera.ts"},["3308"] = {line = 37, file = "camera.ts"},["3309"] = {line = 38, file = "camera.ts"},["3310"] = {line = 40, file = "camera.ts"},["3311"] = {line = 24, file = "camera.ts"},["3312"] = {line = 43, file = "camera.ts"},["3313"] = {line = 44, file = "camera.ts"},["3314"] = {line = 45, file = "camera.ts"},["3315"] = {line = 46, file = "camera.ts"},["3316"] = {line = 47, file = "camera.ts"},["3317"] = {line = 48, file = "camera.ts"},["3318"] = {line = 45, file = "camera.ts"},["3319"] = {line = 52, file = "camera.ts"},["3320"] = {line = 53, file = "camera.ts"},["3321"] = {line = 54, file = "camera.ts"},["3322"] = {line = 55, file = "camera.ts"},["3323"] = {line = 55, file = "camera.ts"},["3324"] = {line = 55, file = "camera.ts"},["3325"] = {line = 55, file = "camera.ts"},["3326"] = {line = 55, file = "camera.ts"},["3327"] = {line = 55, file = "camera.ts"},["3328"] = {line = 59, file = "camera.ts"},["3329"] = {line = 68, file = "camera.ts"},["3330"] = {line = 69, file = "camera.ts"},["3331"] = {line = 71, file = "camera.ts"},["3332"] = {line = 72, file = "camera.ts"},["3334"] = {line = 75, file = "camera.ts"},["3335"] = {line = 77, file = "camera.ts"},["3336"] = {line = 81, file = "camera.ts"},["3337"] = {line = 82, file = "camera.ts"},["3338"] = {line = 83, file = "camera.ts"},["3339"] = {line = 90, file = "camera.ts"},["3340"] = {line = 53, file = "camera.ts"},["3341"] = {line = 43, file = "camera.ts"},["3743"] = {line = 1, file = "health.ts"},["3744"] = {line = 1, file = "health.ts"},["3745"] = {line = 1, file = "health.ts"},["3746"] = {line = 2, file = "health.ts"},["3747"] = {line = 2, file = "health.ts"},["3748"] = {line = 4, file = "health.ts"},["3749"] = {line = 4, file = "health.ts"},["3750"] = {line = 6, file = "health.ts"},["3751"] = {line = 7, file = "health.ts"},["3752"] = {line = 8, file = "health.ts"},["3753"] = {line = 9, file = "health.ts"},["3754"] = {line = 10, file = "health.ts"},["3755"] = {line = 8, file = "health.ts"},["3756"] = {line = 14, file = "health.ts"},["3757"] = {line = 15, file = "health.ts"},["3758"] = {line = 16, file = "health.ts"},["3759"] = {line = 17, file = "health.ts"},["3760"] = {line = 18, file = "health.ts"},["3761"] = {line = 19, file = "health.ts"},["3762"] = {line = 20, file = "health.ts"},["3763"] = {line = 21, file = "health.ts"},["3764"] = {line = 22, file = "health.ts"},["3765"] = {line = 23, file = "health.ts"},["3766"] = {line = 15, file = "health.ts"},["3767"] = {line = 14, file = "health.ts"},["3768"] = {line = 6, file = "health.ts"},["3776"] = {line = 1, file = "mission.ts"},["3777"] = {line = 1, file = "mission.ts"},["3778"] = {line = 3, file = "mission.ts"},["3779"] = {line = 3, file = "mission.ts"},["3780"] = {line = 4, file = "mission.ts"},["3781"] = {line = 4, file = "mission.ts"},["3782"] = {line = 5, file = "mission.ts"},["3783"] = {line = 5, file = "mission.ts"},["3784"] = {line = 7, file = "mission.ts"},["3785"] = {line = 9, file = "mission.ts"},["3786"] = {line = 10, file = "mission.ts"},["3787"] = {line = 11, file = "mission.ts"},["3788"] = {line = 18, file = "mission.ts"},["3789"] = {line = 19, file = "mission.ts"},["3790"] = {line = 20, file = "mission.ts"},["3791"] = {line = 21, file = "mission.ts"},["3792"] = {line = 19, file = "mission.ts"},["3793"] = {line = 9, file = "mission.ts"},["3800"] = {line = 1, file = "index.ts"},["3801"] = {line = 2, file = "index.ts"},["3802"] = {line = 3, file = "index.ts"},["3810"] = {line = 1, file = "index.ts"},["3811"] = {line = 1, file = "index.ts"},["3812"] = {line = 2, file = "index.ts"},["3813"] = {line = 2, file = "index.ts"},["3814"] = {line = 3, file = "index.ts"},["3815"] = {line = 3, file = "index.ts"},["3816"] = {line = 4, file = "index.ts"},["3817"] = {line = 5, file = "index.ts"},["3818"] = {line = 5, file = "index.ts"},["3819"] = {line = 7, file = "index.ts"},["3820"] = {line = 9, file = "index.ts"},["3821"] = {line = 10, file = "index.ts"},["3822"] = {line = 11, file = "index.ts"},["3824"] = {line = 14, file = "index.ts"},["3825"] = {line = 15, file = "index.ts"},["3826"] = {line = 17, file = "index.ts"},["3827"] = {line = 18, file = "index.ts"},["3828"] = {line = 19, file = "index.ts"},["3829"] = {line = 18, file = "index.ts"},["3830"] = {line = 21, file = "index.ts"},["3831"] = {line = 22, file = "index.ts"},["3832"] = {line = 21, file = "index.ts"},["3833"] = {line = 24, file = "index.ts"},["3834"] = {line = 25, file = "index.ts"},["3835"] = {line = 24, file = "index.ts"},["3836"] = {line = 17, file = "index.ts"},["3837"] = {line = 29, file = "index.ts"},["3856"] = {line = 1, file = "game-speed.ts"},["3857"] = {line = 2, file = "game-speed.ts"},["3858"] = {line = 2, file = "game-speed.ts"},["3859"] = {line = 3, file = "game-speed.ts"},["3860"] = {line = 3, file = "game-speed.ts"},["3861"] = {line = 4, file = "game-speed.ts"},["3862"] = {line = 4, file = "game-speed.ts"},["3863"] = {line = 5, file = "game-speed.ts"},["3864"] = {line = 5, file = "game-speed.ts"},["3865"] = {line = 6, file = "game-speed.ts"},["3866"] = {line = 6, file = "game-speed.ts"},["3867"] = {line = 7, file = "game-speed.ts"},["3868"] = {line = 7, file = "game-speed.ts"},["3869"] = {line = 8, file = "game-speed.ts"},["3870"] = {line = 8, file = "game-speed.ts"}});
return require("src.index", ...)
