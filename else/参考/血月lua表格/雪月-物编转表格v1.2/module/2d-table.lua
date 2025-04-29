local mt = {}

---@class m2d-table
local m2d = {

}
m2d.__index = m2d

---@return m2d-table
function mt:new()
    ---@class m2d-table
    local o = {
        
    }
    local _st = table.new{

    }
    setmetatable(o,
        {
            __index = function (t, k)
                local ret = m2d[k]
                if ret then
                    return ret
                end
                if k == '_sort' then
                    return _st
                end
                local n = table.new{}
                t[k] = n
                return n
            end,

        }
    )

    return o
end

function m2d:setSort( tb )
    for _, key in ipairs(tb) do
        self._sort:insert( key )
        self._sort[key] = true
    end
end

---@param tb table
---@param isTable bool 是否被包含在table中
local function convert_table( tb, isTable )
    local str = {  }
    if isTable then table_insert(str, '{') end
    for item, value in pairs(tb) do --项目 = xxxx   |   { xxx }
        local tp = type(value)
        local tpI = type(item)

        if isTable then

            if tpI == 'number' then
                --item = ('%s = '):format(item)
                --table_insert(str, item)
            else
                item = ('"%s" = '):format(item)
                table_insert(str, item)
            end

        else

            item = ('%s = '):format(item)
            table_insert(str, item)

        end

        if tp == 'table' then
            table_insert(str, convert_table(value, true) )
        elseif tp == 'function' then
        elseif tostring(value):match('%d+') == value then --number
            table_insert(str, ('%s'):format(  value) )
        elseif tp == 'string' then
            value = value:u2a()
            if value:match('\n') then
                table_insert(str, ('[==[%s]==]'):format(value) )
            else
                table_insert(str, ('"%s"'):format(  value:replace('\\\\','\\'):replace('\\','\\\\') ) ) --还原双斜杠 实在不行用[=[ ]=]了
            end
        else
            table_insert(str, ('%s'):format(value) )
        end
        if isTable then table_insert(str, ',') end
        --table_insert(str, '\n')

    end

    if isTable then table_insert(str, '}') end
    return table.concat(str)
end

local function process( v )
    if v ~= nil then

        if v == '' then
            v = '#'
        else
            local t = type(v)
            if t == "string" then
                v = '"' ..  v:u2a() .. '"'
            elseif t == 'table' then
                v = '"' ..  convert_table(v, true):gsub('"','""') .. '"'
            elseif t ~= "number" then
                v = ''
            end
        end
    else
        v = ''
    end

    return v
end

function m2d:convert( id, tb )
    local tmp = {}
    for k, v in pairs(tb) do
        tmp[k] = true
    end
    for i, key in ipairs(self._sort) do
        local v = tb[key]
        if v ~= nil then
            tmp[key] = nil
        end
        v = process(v)
        self[id][key] = v
    end

    for key,_ in pairs(tmp) do

        local v = tb[key]

        self._sort:insert( key )
        self._sort[key] = true
        v = process(v)

        self[id][key] = v
        --print(key,v)
    end
    


end


return mt