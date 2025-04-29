---@diagnostic disable: missing-parameter, undefined-field
--[[
    雪月 ini 配置文件读写模块
    支持 lni
    1.1 修复了一个BUG 如果项目下一行跟着节点会发生错误
        修改了读取open方法使得 ini 不存在时不会报错
    1.2 修复了因为字符串中含有{}导致的错误

]]
local load = load
local tostring = tostring
local tonumber = tonumber
local table_insert = table_insert
local xPairs = xPairs

local mt = {}
---@class cIni
---@field _ini table
local class = {

}

local __env__ = {
    _arg = nil
}

local escape = {
    n = '\n',
    t = '\t',
    ['\\'] = '\\',
}
--- 读取一行中的字符串
---@param line string 一行字符串
---@param operator string 操作符：单引号 双引号
local readstring_line = function (line, operator)
    operator = operator or '"'
    local ret = ''
    local posStart,posEnd = line:find(  [[.-=%s*]] .. operator  )
    if not posStart then
        return ret
    end

    local pos = posEnd + 1
    local len = line:len()
    while pos <= len do
        local chr = line:sub(pos,pos)
        if chr == operator then
            ret = line:sub( posEnd+1, pos-1 )
            break
        elseif chr == '\\'  then
            local nextchr = line:sub(pos+1,pos+1)
            len = len - 1
            if escape[nextchr] then
                --对字符进行转义
                line = line:sub(1,pos-1) .. escape[nextchr]  .. line:sub(pos+2)
            else
                --保留转义符与转义字
                line = line:sub(1,pos) .. nextchr .. line:sub(pos+2)
            end
        end
        pos = pos + 1
    end
    return ret

end

local function load_item(file, ini, node, line)
    while true do
        --local line = file:read("*l")
        if not line then break end
        local item,value = line:match('^(.-)%s-=%s+(.+)$')

        if not item then
            break
        end

        if value:match("%[=*%[") then --匹配lua多行字符串
            local ec = value:match("%[=*%["):replace('[',']') --生成匹配结束符
            local tb = ''
            while true do
                local pS,pE = value:find(ec, 1, true)
                if pS then --发现结束标识
                    tb = tb .. value:sub( 1, pE ) .. '\n'
                    break
                else
                    tb = tb .. value .. '\n'
                end
                value = file:read("*l")
                if not value then break end
            end
            local f = load('_arg = ' .. tb , nil, 'bt', __env__) --发生错误 说明 ini 项目中 [=[  ]=] 没有配对结束符
            if not f then
                error( ('ini 项目中 [=[  ]=] 没有配对结束符:\n\t代码块:%s\n\t节点:%s\n\t行:%s'):format(tb, node, line) )
            end
            f()
            ini[node][item] = __env__._arg
        elseif line:match([[.-=%s*"]]) then --匹配lua "字符串"
            ini[node][item] = readstring_line(line,[["]])
        elseif value:match([[.-=%s*']]) then --匹配lua '字符串'
                ini[node][item] = readstring_line(line,[[']])
        elseif tostring(value):match("%-?%s*%d+%.?%d+") == value then --number
            ini[node][item] = tonumber(value)
        elseif value:match("{") then
            local tb = ''
            while true do
                if value:match('%d+%s-=') then
                    value = ('[%s] = %s'):format( value:match('(.-)=(.+)') )
                end
                tb = tb .. value .. '\n'
                if value:match("}") then
                    break
                end
                value = file:read("*l")
                if not value then break end
            end
            local f = load('_arg = ' .. tb , nil, 'bt', __env__)
            if not f then
                error( ('ini 项目中 { } 没有配对结束符:\n\t代码块:%s\n\t节点:%s\n\t行:%s\n'):format(tb, node, line) )
            end
            f()
            ini[node][item] = __env__._arg
        else    --普通ini格式
            ini[node][item] = value
        end
        break --直接跳出项目匹配 先进行返回进行节点，若无新节点再由其进入项目匹配
    end

end

--打开一个ini配置文件
--UTF8路径
--返回table{_ini={}} 配置项表在_ini中直接读改
---@return ini
function mt:open(filename)
    local file = io.open(filename,'a+')  --可读追加模式 不存在时会创建文件而不会报错
    ---@class ini : cIni
    local ini = setmetatable({},{
        __index = function (t,key)
            if key then
                t[key] = {}
                return t[key]
            else
                assert(false, debug.traceback('err: 传入了一个nil作为key') )
            end
        end,
    })
    if file then
        --解析ini 为table
        local node =  nil
        while true do
            local line = file:read("*l")
            if not line then break end
            local newnode = line:match("^%[([^%[%]]+)%]$")  --匹配节点
            if newnode then
                node = newnode
                ini[node] = {}
            end
            if node then
                load_item(file, ini, node, line)
            end
        end
        file:close()
    else
        print('ini配置文件打开失败', filename)
    end
    local data = {
        _ini = ini,
        _filename = filename,
    }
    local t = {}
    return setmetatable(
        {},
        {
            __index = function (_,k)
                return class[k] or data[k]
            end,
        }
    )
end

--- 从这个来代替paris直接从_ini中读，避免返回一些空表导致的错误
--- lni物编专用
---使用方法 for k,v in xslk.unit.lni:forEach() do
function class:forEach()
    local mkey = {}
    local value = {}
    local count = 0
    local index = 0
    for key, tbl in pairs(self._ini) do
        if not tbl._parent then
            goto next
        end
        count = count + 1
        mkey[count] = key
        value[count] = tbl
        ::next::
    end
    return function ()
        index = index + 1
        if index <= count then
            --  返回迭代器的当前元素
            return mkey[index],value[index]
        end
    end
end


---@param tb table
---@param isTable bool 是否被包含在table中
local function convert_table( tb, isTable )
    local str = {  }
    if isTable then table_insert(str, '{\n') end
    for item, value in pairs(tb) do --项目 = xxxx   |   { xxx }
        local tp = type(value)
        local tpI = type(item)

        if isTable then

            if tpI == 'number' then
                item = ('%s = '):format(item)
                table_insert(str, item)
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
            if value:match('\n') then
                table_insert(str, ('[==[%s]==]'):format(value) )
            else
                table_insert(str, ('"%s"'):format(  value:replace('\\\\','\\'):replace('\\','\\\\') ) ) --还原双斜杠 实在不行用[=[ ]=]了
            end
        else
            table_insert(str, ('%s'):format(value) )
        end
        if isTable then table_insert(str, ',') end
        table_insert(str, '\n')
        
    end

    if isTable then table_insert(str, '}\n') end
    return table.concat(str)
end


--ini_obj:save()
--保存
function class:save( )
    local str = {}
    for node, tb_node in xPairs( self._ini ) do --root[node]
        local strTable = convert_table( tb_node )
        if strTable:len()>0 then
            table_insert(str, '['..node..']\n' )
            table_insert(str, strTable  )
        end
    end
    local file = io.open(self._filename,'w+')
    assert(file, ("ini保存时打开失败:%s"):format(self._filename) )
    file:write(table.concat(str))
    file:close()
end

mt.convert_table = convert_table

return mt