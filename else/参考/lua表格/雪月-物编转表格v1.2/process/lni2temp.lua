local mt = {

}


function mt:copy( path_w3x )
    local path_temp = path_temp

    local len = path_w3x:len()
    local code = table.new(
        {
            'echo %cd%',
            '@cd /d "' .. path_temp .. '"',
        }
    )

    for _, folder in ipairs(dir_list( path_w3x, true, '/ad' )) do

        folder = folder:sub( len + 2 )
        code:insert(
            '@mkdir "' .. folder .. '" 2>nul'
        )

    end

    for _, filename in ipairs(dir_list( path_w3x, true, '/a-d' )) do

        local source = filename

        local target = filename:sub( len + 2 )

        code:insert( '@mklink "'
            .. target .. '" "'
            .. source .. '" '
            .. '2>nul'
        )

    end

    local ret = executeCMD( code:concat( '\n' ) )


    _error( ret, '复制Lni格式地图文件结构失败!!!' )


end

return mt