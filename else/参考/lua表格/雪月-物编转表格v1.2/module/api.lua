local table_concat = table.concat
local table_remove = table.remove
local unicode = require 'ffi.unicode'

local io = io
local print = print
---@class xTable
local mt_xTable = {
    type = 'xTable',

    insert = function (self, ...)
        local idx = (self[0] or 0)
        for _, v in ipairs({...}) do

            idx = idx + 1
            self[ idx ] = v

        end
        self[0] = idx
        return idx
    end,

    remove = function (self, index)
        if not self[0] or self[0] < 1 then
            return
        end
        self[0] = (self[0] or 0) - 1
        table_remove(self, index)
    end,

    ---用法与table.concat一致
    --提供一个列表，其所有元素都是字符串或数字，返回字符串 `list[i]..sep..list[i+1] ··· sep..list[j]`。
    ---@param self xTable
    ---@param sep? string 分隔符
    ---@param i? int
    ---@param j? int
    ---@return string
    concat = function (self, sep, i, j)
        return table_concat(self, sep, i, j)
    end,

    del = function (self)

        local mt = getmetatable(self)
        mt.__mode = 'kv'

    end,

}
---返回一个xTable
---自带元方法 insert/remove/del 用法与 table.inset相同，可连续插入
---使用该方法插入可使用 tb[0] 快速查看数组长度
---@param tb? table  自带元方法 insert/remove/del 用法与 table.inset相同，可连续插入
---@param copyNew? bool 复制原表返回一个新表
---@return xTable
function table.new( tb, copyNew )
    local count = 0
    local ret = copyNew and {} or (tb or {})
    if tb then
        if copyNew then

            for _,_ in ipairs(tb) do
                count = count + 1
                ret[count] = tb[count]
            end

        else

            for _,_ in ipairs(tb) do
                count = count + 1
            end

        end
    end
    ---metatable
    local m = {}
    m.__index = function (t,k)
        if k == 0 then
            return count or 0
        end
        return mt_xTable[k]
    end
    m.__newindex = function (t, k, v)
        if k == 0 then
            count = v or 0
            return
        end
        rawset(t,k,v)
    end
    ---@type xTable
    return setmetatable( ret, m )
end

function table_insert(tb,val)
    local c = (tb[0] or 0) + 1
    tb[0] = c
    tb[c] = val
end

local table = table
local pairs = pairs

---排序遍历迭代器
function xPairs( tb )
    local keys = {}
    local count = 0
    for k, v in pairs(tb) do
        count = count + 1
        keys[count] = k
    end
    table.sort(keys)
    local i = 0
    return function ()
        i = i + 1
        local k = keys[i]
        if i <= count then
            return k, tb[ k ]
        end
    end
end


--UTF8 => ANSI
function string.u2a(str)
    return unicode.u2a(str)
end
--ANSI => UTF8
function string.a2u(str)
    return unicode.a2u(str)
end

--去首尾空
function string.lighter(s)
    return s:match("^[%s]*(.-)[%s]*$")
end

---从字符串str后方寻找k
---然后k后面的字符串全部删掉
---b 为true 时 连同k一起删掉
---用于路径处理 如 C:\a\b\c\1.txt sub2('\')结果为C:\a\b\c\
function string.sub2(str, k, b)
    --反转字符串str
    local ts = str:reverse()
    local _, i = ts:find( k, nil, true)--获取k在反转后的str字符串ts的位置
    if not i then
        return ''
    end
    local m = ts:len() - i + 1--获取k在字符串str中的位置

    --去掉寻找的字符串 k
    if b then
        b=k:len()
    else
        b = 0
    end
    return str:sub(1, m-b)--返回字符串str字符k之前的部分
end


--分割字符串
---@param str string 完整的字符串
---@param split_char string 分隔符
---@param withEmpty bool 是否接受末端空字符串，如果末端有个分隔符则 最后的空字符串''
---@return table 返回一个xTable
function string.split(str, split_char, withEmpty)
    local sub_str_tab = table.new()
    if not(str and split_char) then return sub_str_tab end

    local st = 1
    local len = str:len() + (withEmpty and 1 or 0)

    while st <= len do
        local pos1, pos2 = str:find( split_char, st, true ) --四号参数 设为true 则作为普通文本处理 而不是模式匹配

        --剩下的字符串
        if not pos1 then
            sub_str_tab:insert( str:sub( st )  )
            break
        end

        ---有分隔的字符串

        sub_str_tab:insert( str:sub( st, pos1 - 1 )  )

        st = pos2 + 1

    end

    return sub_str_tab
end

---获取扩展名 不包含点
---@return string
function string.get_extension(str)
    --反转字符串str
    local ts = str:reverse()

    local _, st = ts:find( '.', nil, true)
    if not st then
        return ''
    end

    st = str:len() - st + 2

    return str:sub(st)
end

function string.replace( str, s, newStr )
    local offset = newStr:len() - s:len()
    local pS,pE = str:find( s, 1, true )
    while pS do
        str = str:sub(1,pS-1) .. newStr .. str:sub( pE + 1 )

        pS,pE = str:find( s, pE + offset+1, true )
    end
    return str
end

---确保条件成立，否则报错并打印message
---@param condition any
---@param message any
---@param traceback? bool 是否打印回溯信息
function _error( condition, message, traceback )
    if condition then
        return
    end
    assert( false,  debug.traceback('\n\n\n\t错误:\n\t\t' .. message:gsub('\n','\n\t\t') .. '\n\n\n'))
end

---确保条件成立，否则提示警告并打印message
---@param condition any
---@param message any
---@param traceback? bool 是否打印回溯信息
function _warning( condition, message, traceback )
    if condition then
        return
    end
    local msg = message
    if traceback then
        msg = debug.traceback( message:gsub('\n','\n\t\t') )
    end
    print( '警告: ', msg )
end

--创建文件夹 支持多层级
---@param path string
---@return bool
function mkdir(path)
    local sOut = io.popen('mkdir "'..path:u2a()..'" 2>nul', "r")
    local ret = sOut:read('*a'):len() == 0
    sOut:close()

    return ret
end

--判断文件(夹)是否存在 Path UTF8
---@param path string
---@return bool
function file_exist(path)
    local pipe = io.popen(
        '@if exist "' .. path:u2a() .. '" (@echo *)' ,
        'r'
    )
    local res = pipe:read("*a")
    pipe:close()

    return res:find('*',nil,true) ~= nil
end

---@return bool
function copy(input, output)
    local command = table_concat({
        "copy",
        '/y',
        '"'..input:u2a()..'"',
        '"'..output:u2a()..'"',
        '2>nul',
    },' ')
    local sOut = io.popen(command, "r")
    local ret = sOut:read('*a'):match('%d')
    sOut:close()

    return ret ~= nil
end

---复制文件夹
function xcopy(input,output)
    local command = table_concat({
        "xcopy",
        '/y /e',
        '"'..input:u2a()..'"',
        '"'..output:u2a()..'\\"',
        '2>nul',
    },' ')
    local sOut = io.popen(command, "r")
    local data = sOut:read("*a")
    sOut:close()
    return data
end

--删文件夹
---@param path string UTF8
function rd(path)
    os.execute(
        ('rd /q /s "%s" 2>nul'):format( path )
    )
end


--删文件
function delete(path)
    os.execute(
        ('del /f /q /s "%s" >nul'):format( path )
    )
end

-- 运行命令行代码
---@param command string 命令行
---@param isExecute bool os.execute 或是 io.popen 根据选择可能会需要转化命令行的编码
---@return bool 是否执行成功
function runCMD(command, isExecute )
    local file
    local suc
    if isExecute then
        suc = os.execute(
           command
        )
    else
        file = io.popen(command, "r")
        if file then
            suc = true
            file:close()
        end

    end
    return suc
end

--移动文件
---@param source string 要移动的文件/目录
---@param destination string 目的地
---@return bool
function move(source, destination)
    local command = {
        "move",
        '/y',
        '"' .. (source:u2a() or '') .. '"',
        '"' .. (destination:u2a() or '') .. '"',
        '2>nul'
    }

    local sOut = io.popen(table_concat(command,' '), "r")
    local sData = (sOut:read("*a") or ''):a2u()
    sOut:close()
    if sData:match('%d') then --1 个
        return true
    end
    return false
end

--列出文件列表
---@param path string 目录
---@param subdirectory bool 是否包含子目录
---@param extCMD string 附加命令 /Ad 目录 /A-d 非目录 /L 小写
---@return table<int,string> 仅文件名，包含子目录的话将是完整路径
function dir_list(path , subdirectory, extCMD)
    local command = {
        'cd /d "' .. path:u2a() .. '" &',
        "dir",
        '/b',
        (subdirectory and '/s' or ''),
        extCMD or '',
        '2>nul',
    }
    local ret = {}
    local sOut = io.popen(table_concat(command,' '), "r")

    while true do
        local line = sOut:read("*l")
        if not line then
            break
        end
        table_insert(ret, line)
    end
    --local sData = sOut:read("*a") or ''
    --local ret = sData:sub(1,-2):split("\n")
    --ret[ #ret ] = nil
    sOut:close()
    
    return ret
end

--executeCMD 多行
---@param cmd string UTF8 编码
function executeCMD( cmd )
    local command = {
        '@echo off',
        '@chcp 65001',
        cmd,
    }

    local file = io.open( path_scr .. '\\temp.cmd' ,'w+' )

    if not file then
        return
    end

    file:write( table.concat(command, '\n') )
    file:close()

    local pipe = io.popen( '@echo off & "'.. path_scr:u2a() .. '\\temp.cmd"'..' && del "' .. path_scr:u2a() .. '\\temp.cmd"', "r")
    if not pipe then
        return
    end

    local ret = pipe:read('*a') or ''
    pipe:close()

    return ret
end

function w2l(mode, input, output)
    local command = table.concat({
        path_w2l:u2a() .. "\\w2l.exe",
        mode,
        '"' .. input:u2a() .. '"',
        '"' .. output:u2a() .. '"',
        '2>nul',
    },' ')
    local sOut = io.popen(command, "r")
    local sData = sOut:read("*a")
    sOut:close()
    return sData
end

---@param source string
---@param target string
function mklink( source, target, is_directory )
    local command = {
        "mklink",
        is_directory and '/d' or '',
        '"'..target:u2a()..'"',
        '"'..source:u2a()..'"',
        '2>nul',
    }

    local sOut = io.popen(table_concat(command,' '), "r")
    local sData = sOut:read("*a")
    sOut:close()
    --print( sData )
    return sData:sub(1,-2):split("\n")
end