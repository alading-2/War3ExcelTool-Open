local type = type
local math_type = math.type
local assert = assert
local table_concat = table.concat
local table_unpack = table.unpack
local debug = debug
local math = math
local char = string.char

if not math.ldexp then
    math.ldexp = function (value, exp)
        return  value * ( 2^exp )
    end
end


---@class mMemory
local module = {
    type_STRING = 1,
    type_NUMBER = 2,

}

---@class cMemory
---@field read fun(self:memory, size:int) :any
local class = {
    pos = 0,    -- 已读的长度 / 位置
    len = 0,
    data = nil, -- string || table

}
class.__index = class

-----------------------------------------------------------------
--                  Class : memory
-----------------------------------------------------------------
---@param self memory
---@param size int
---@return any
local function _c_readFormFile( self, size )
    assert( type(size) == "number" ,  "#1 参数类型不是数值" )

    if size == 0 then
        return
    end

    if self.pos + size > self.len then
        print('warming: 即将读取的位置超出已有长度', self.pos, size, self.len )
        size = self.len - self.pos
    end

    self.pos = self.pos + size

    ---@type file*
    local data = self.data

    local ret = data:read(size)

    return ret:byte(1, ret:len())
end

---@param self memory
---@param size int
---@return any
local function _c_readFormString( self, size )
    assert( type(size) == "number" ,  "#1 参数类型不是数值" )

    local start = self.pos

    if self.pos + size > self.len then
        print('warming: 即将读取的位置超出已有长度',self.pos, size, self.len )
        size = self.len - self.pos
    end

    self.pos = self.pos + size

    return self.data:byte( start + 1, self.pos )
end

---@param self memory
---@param size int
---@return any
local function _c_readFormTable( self, size )
    assert( type(size) == "number" ,  "#1 参数类型不是数值" )

    local start = self.pos

    if self.pos + size > self.len then
        print('warming: 即将读取的位置超出已有长度',self.pos, size, self.len )
        size = self.len - self.pos
       
    end

    self.pos = self.pos + size

    local ret = {}
    for i = 1, size do
        ret[i] = self.data[ start + i ]:byte(1,1)
    end

    ret = table_concat(ret)

    return table_unpack( ret )
end

---------------------------------
--       内存读取部分
---------------------------------
function class:skip( size )
    self.data:seek("cur", size)
    self.pos = self.pos + size
end

function class:read_int8()
    local b1 = self:read(1)
    return module:read_int32( b1, 0, 0, 0 )
end

function class:read_int16()
    local b1,b2 = self:read(2)
    return module:read_int32( b1, b2, 0, 0 )
end

function class:read_int32()
    return module:read_int32( self:read(4) )
end

-- 自动读取4字节 进行二进制转十进制 转化为浮点数返回
---@return number
function class:read_float16()
    local b1,b2 = self:read(2)
    return module:read_float32( b1, b2, 0, 0 )
end

-- 自动读取4字节 进行二进制转十进制 转化为浮点数返回
---@return number
function class:read_float32()
    return module:read_float32( self:read(4) )
end

---读一段字符串，读到\0即截止
---@return string
---@return int 读出的字符串长度
function class:read_string()
    local chr
    local i = 1
    local str = {}
    while true do
        chr = self:read(1)

        if chr == 0  then
            break
        end

        str[i] = char(chr)

        i = i + 1

    end

    return table_concat(str), i
end

---从buf中读一段字符串, 截取到\0 但是实际还是会跳过指定的长度
---@param l int
---@return string
---@return int 读出的字符串长度
function class:read_string_len(l)
    local chr
    local i = 1
    local str = {}

    while true do
        chr = self:read(1)

        if chr == 0  then
            break
        end

        str[i] = char(chr)

        i = i + 1

    end

    if l > i then
        self:skip(l - i)
    end

    return table_concat(str), l
end

-- 是否到达结束位置
---@return bool
function class:isEnd()
    return self.pos >= self.len
end


-----------------------------------------------------------------
--                  Module : memory
-----------------------------------------------------------------
---@param file file*
---@return memory
function module:loadFormFile( file )
    assert( file ,  debug.traceback("file 为空！") )

    ---@class memory : cMemory
    local o = {
        data = file,
        len = file:seek("end"),
        read = _c_readFormFile,
    }
    file:seek("set", 0)
    return setmetatable(o, class)
end

---@param data string
---@return memory
function module:loadFormString( data )
    assert( type(data) == "string" ,  "#1 参数类型不是string" )
    local len = data:len()
    ---@class memory : cMemory
    local o = {
        data = data,
        len = len,
        read = _c_readFormString,
    }

    return setmetatable(o, class)
end

---@param data table
---@return memory
function module:loadFormTable( data )
    assert( type(data) == "table" ,  "#1 参数类型不是table" )
    local len = data:len()
    ---@class memory : cMemory
    local o = {
        data = data,
        len = len,
        read = _c_readFormTable,
    }

    return setmetatable(o, class)
end
function module:read_int8(b1)
    local x = 0
    x = x*0x100 + b1
    return x
end

function module:read_int16(b1, b2)
    local x = 0
    x = x*0x100 + b2
    x = x*0x100 + b1
    return x
end

function module:read_int32(b1, b2, b3, b4)
    local x = 0
    assert(b4 and b3 and b2 and b1, debug.traceback("read_int32:缺少参数！"))
    x = x*0x100 + b4
    x = x*0x100 + b3
    x = x*0x100 + b2
    x = x*0x100 + b1
    return x
end

function module:read_float32(b1, b2, b3, b4)
    local sign = b4 > 0x7F  --符号位
    local expo = (b4 % 0x80) * 0x02 + math.floor(b3 / 0x80)  --整数部分
    local mant =  ((b3%0x80)*0x100+b2)*0x100+b1 --小数部分
    if sign then
        sign = -1
    else
        sign = 1
    end
    local n
    if mant == 0 and expo == 0 then
        n = sign * 0.0
    elseif expo == 0xFF then
        if mant == 0 then
            n = sign * math.huge
        else
            n = 0.0/0.0
        end
    else
        if (expo>0) and (expo<0xFF) then
            n = sign * math.ldexp(1.0 + mant / 8388608, expo - 0x7F)
        else
            n = sign * math.ldexp(0.0 + mant / 8388608, - 0x7E)
        end
    end
    return n
end

return module