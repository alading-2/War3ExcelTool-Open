local ini = require 'module.ini'
local fs = require 'bee.filesystem'
local ini2slk = require 'process.ini2csv'

---常用全局变量局部化

local print = print
local type = type
local io_write = io.write
cout = function (...)
    io_write( table.concat({...}) )
end
local cout = cout

path_temp = ''
path_output = ''


local mt = {}

function mt:exec()

    local time_start = os.clock()

    path_temp = path_scr .. '\\temp\\' .. os.date('%m_%d_%H_%M_%S_', os.time()) .. math.random(100)
    path_output = path_scr .. '\\output'

    local path_w3x = get_path_w3x()
    local path_temp = path_temp

    --:parent_path()
    local fs_w3x = fs.path(  path_w3x  )
    --local fs_temp = fs.path( path_temp )
    _error
    (
        path_w3x ~= ''
            and not fs.is_directory( fs_w3x )
            and fs.exists(fs_w3x) ,
        "输入的地图路径错误!!!"
    )

    local count = 0

    print '\n创建临时目录...'
    mkdir( path_temp )
    mkdir( path_output )

    local time = os.clock()

    if path_w3x:sub(-5) == '\\.w3x' then
        print '\n复制Lni地图结构...'
        require 'process.lni2temp':copy( path_w3x:sub(1, -6) )
    else
        print '\n解压地图...'
        w2l('lni', path_w3x, path_temp )
    end
    print ( '  - 解压耗时:' .. (os.clock() - time) .. ' 秒')

    print '读取配置文件...'
    local cfg = ini:open( path_scr .. '\\config.ini' )

    --枚举物编类型
    for _, slk_type in ipairs(config.slks) do

        if isSlkChoosed( slk_type ) then

            print ''
            local echo = '生成csv:' .. slk_type .. '...'
            local str
            cout( echo )

            local st = cfg._ini._sort[slk_type]

            time = os.clock()

            local result, row, col = ini2slk:conv(
                path_temp .. '\\table\\' .. slk_type .. '.ini'
                , path_output .. '\\' .. slk_type .. '.csv'
                , type(st) == "table" and st or nil
            )
            cout(('\8'):rep(#echo))

            if result then
                str = ('√ 生成完成csv: %s 行: %d 列: %d\n'):format(slk_type, row, col)
                echo = str .. (' '):rep(  #echo - #str )
            else
                str = ('x 生成失败csv: %s\n'):format(slk_type, row, col)
                echo = str .. (' '):rep( #echo - #str )
            end
            cout( echo )
            print ( '  - 耗时:' .. (os.clock() - time) .. ' 秒')

        end

    end

    print ''
    print '============================================================='
    print ( '  ◇ 总耗时:' .. (os.clock() - time_start) .. ' 秒')
    print '   请自行打开output文件夹查看转换结果'
    print '   选择WPS或Excel打开csv文件,复制到物编表格即可(注意对齐列)'
    print '============================================================='

end


return mt