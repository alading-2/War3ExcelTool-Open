local ui = require 'gui.new.template'
require 'module.config'
local window = Wnds.main

local mode = 'lni'

local view, data

local rct = {
    _x = 0,
    _y = 0,
    _h = 0,
    _w = 0,


    x = function (self,offset)
        self._x = self._x + (offset or 0)
        local ret = self._x
        if offset and offset > 0 then
            
            ret = self._x + self._w
            --self._w = 0

        end
        return ret
    end,
    y = function (self,offset)
        self._y = self._y + (offset or 0)
        if offset and offset > 0 then
            
            self._y = self._y + self._h
            self._h = 0
            self._x = 0
            self._w = 0
        end
        return self._y
    end,
    w = function (self,offset)
        self._w = self._w + (offset or 0)
        return offset
    end,
    h = function (self,offset)
        self._h = offset or 0
        return offset
    end,

}

local interface = {
    style = { FlexGrow = 1, FlexDirection = 'row', AlignItems = 'center', JustifyContent = 'center' },
    
    ui.label {
        text = 'w3x:                        [拖入w3x]',--[[lang.ui.DRAG_MAP,]]
        style = { Position = 'absolute',Top = rct:y(0), Left = rct:x(5), Height = rct:h(40), AlignItems = 'center', JustifyContent = 'center'  },
        font = { size = 16 },
        text_color = '#ff66cc',
    },
    ui.edit {
        title = '',
        style = { Position = 'absolute', Top = rct:y(2), Left = rct:x(15), Height = rct:h(48), Width = 300 },
    },


    ui.label {
        text = '要提取的物编：',
        text_color = '#ffffff',
        font = { size = 17, weight = 'bold'  },
        style = { Position = 'absolute', Top = rct:y(2)  , Left = rct:x(5), Height = rct:h(48), Width = rct:w(100) },
    },

    ui.checkbox {
        text = config:get_slk(true,false),
        value = false,
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(2) , Left = rct:x(10), Height = rct:h(24), Width = rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(0) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(0) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(5) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(0) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(0) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.checkbox {
        text = config:get_slk(true,true),
        font = { size = 17 },
        style = { Position = 'absolute', Top = rct:y(1) , Left = rct:x(10), Height = rct:h(24), Width =  rct:w(100) },
    },
    ui.label {
        text = '雪月WE群:659453611',
        style = { Position = 'absolute', Bottom = 10, LEFT = 10, Height = 48, Width = 140, },
        text_color = "#ffffff",
        font = { size = 18, name = 'Cascadia Code',weight = 'bold' },
    },

    ui.button {
        title = '提取',
        style = { Position = 'absolute', Bottom = 10, Right = 15, Height = 48, Width = 120, },
        color = "#1A9B9B",
        on = {
            click = function()
                require 'main.extract':exec()
            end
        }
    },

}


local ev = require 'gui.event'
ev.on('update theme', function(color, title)
end)

local template = ui.container(interface)

ui.button {
        title = 'V1.0',
        color = '#333743',
        style = { Position = 'absolute', Bottom = 0, Right = 0, Width = 140 },
        on = {
            click = function()
                --window:show_page('about')
            end
        }
    }

view, data = ui.create(template, {
    color = '#222',
})

local edit_w3x = view:childat(2)
local cbxs = {
    view:childat(4),
    view:childat(5),
    view:childat(6),
    view:childat(7),
    view:childat(8),
    view:childat(9),
    view:childat(10),
}

function updateEdit_w3x(str)
    edit_w3x:settext(str)
end

function get_path_w3x()
    return edit_w3x:gettext()
end

local map_slk2id = {}
for idx, value in ipairs(config.slks) do
    map_slk2id[value] = idx
end

function isSlkChoosed( slk_type )
    return  cbxs[ map_slk2id[slk_type] ].value and true or false
end


return view
