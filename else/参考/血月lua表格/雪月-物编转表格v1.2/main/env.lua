--[[
    环境初始化
    by: 雪月灬雪歌
]]

---获取 lua script 所在目录
do
    ---通过判断自身文件是否存在，来判断是否cd在正确的路径上
    local pipe = io.popen('if exist "%cd%\\' .. arg[-1] .. '.lua" (echo "%cd%")','r')
    if pipe then

        local ret = pipe:read('*a'):match('"(.*)"')
        pipe:close()
        pipe = nil

        if ret then
            --去除 当cd在驱动器根目录时附带的\
            if ret:sub(-1) == '\\' then
                ret = ret:sub(1,-2)
            end
            path_scr = ret
        end

    else
        --管道不可用时使用命令行参数获取

        local r_slash = arg[0]:reverse():find('\\')

        assert(r_slash, '\n\n\n\n' .. '!!! 获取path_scr时发生错误: \n\t' .. '无法确认当前目录,请传入完整的lua文件路径!' .. '\n\n\n' )

        path_scr = arg[0]:sub(1, arg[0]:len() - r_slash  )

    end

end

---获取 w2l 所在目录
path_w2l = package.path:sub(1, package.path:find("\\bin",3,true)-1  ):gsub(";",'')


---扩展加载路径
do
    package.path = path_scr ..'\\?\\init.lua;' .. package.path
    package.path = path_scr ..'\\?.lua;' .. package.path

    package.path = package.path .. ';' .. path_w2l .. '\\script\\?.lua'
    package.path = package.path .. ';'.. path_w2l ..'\\?.lua'
end

---加载常用api
require 'module.api'


env = {
    ---@type string
    w3x = nil,

    ---@type string
    vmpq = nil,

    ---@type string
    mode = nil,

    ver = '1.0',
}
local env = env

function set_ver(v)
    env.ver = v
end

function get_ver()
    return env.ver
end

local lc
for index, cmd in ipairs(arg) do
    if lc == '-w3x' then
        env.w3x = cmd
    elseif lc == '-vmpq' then
        env.vmpq = cmd
    elseif lc == '-save' then
        env.mode = cmd
    elseif lc == '-ver' then
        env.ver = cmd
    end
    lc = cmd:lower()
end
