local ini = require 'module.ini'
local m2d = require 'module.2d-table'
local tostring = tostring
local ipairs = ipairs
local pairs = pairs
local mt = {}

function mt:conv( in_path_ini, out_path_slk, _sort )
    
    local slk_head = table.new()
    local slk_body = table.new()
    local slk_ini = ini:open( in_path_ini )
    local row, col = 0, 0

    local slk2d = m2d:new()
    local _ = _sort and slk2d:setSort(_sort)
    for id, lslk in pairs(slk_ini._ini) do
        --row = row + 1

        slk2d:convert( id ,lslk )

    end

    local f = io.open( out_path_slk, 'w+' )
    if not f then
        print( '预创建文件失败:', out_path_slk )
        return false
    end

    slk_head:insert(
        'C;X1;Y1;K"id"\n'
    )
    col = 1
    for _, key in ipairs(slk2d._sort) do
        col = col + 1
        slk_head:insert(
            'C;X',  col,
            ';K"',  key,
            '"\n'
        )
    end
    row = 1
    for id, v in pairs( slk2d ) do
        row = row + 1
        col = 1
        slk_body:insert(
            'C;X',  col,  -- col
            ';Y' .. row, -- row
            ';K',  id ,
            '\n'
        )

        for index, key in ipairs(slk2d._sort) do
            col = col + 1
            local k = type(v[key]) == 'nil' and ('""') or (v[key]..'')
            k = k:gsub('\n','1b 20 3a'):gsub(';',';;')
            slk_body:insert(
                'C;X',  col,  -- col
                '', -- row
                ';K',  k ,
                '\n'
            )
            --print(key, v[key])
        end

    end

    f:write(
        'ID;PWXL;N;E\n',
        'B;X',  col,  ';Y',    row,  ';D0\n'
    )

    f:write(
        slk_head:concat(),
        slk_body:concat(),
        (slk_body[0]>0 and 'E' or '\nE')
    )


   f:close()


    return true, row, col
end

return mt