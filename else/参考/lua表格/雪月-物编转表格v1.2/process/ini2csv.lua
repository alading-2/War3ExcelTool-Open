local ini = require 'module.ini'
local m2d = require 'module.2d-table'
local tostring = tostring
local ipairs = ipairs
local pairs = pairs
local mt = {}
--生存CSV
function mt:conv( in_path_ini, out_path_slk, _sort )
    
    local head = table.new()
    local body = table.new()
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

    col = 1
    head:insert( 'id,' )
    for _, key in ipairs(slk2d._sort) do
        col = col + 1
        head:insert( key, ',' )
    end
    head:insert( '\n' )
    row = 1
    for id, v in pairs( slk2d ) do
        row = row + 1
        col = 1
        body:insert( '"', id , '",' )

        for index, key in ipairs(slk2d._sort) do
            col = col + 1
            local k = type(v[key]) == 'nil' and ('""') or (v[key]..'')
            --k = k:gsub('"', '""')
            body:insert( k ,',')

            --print(key, v[key])
        end
        body:insert( '\n' )

    end

    f:write(
        head:concat(),
        body:concat()
    )


   f:close()


    return true, row, col
end

return mt