local gui = require 'yue.gui'
local ev = require 'gui.event'
local ca = require 'gui.new.common_attribute'

local function checkbox_button(t, data)
    local btn = gui.Button.create('')
    local lbl = gui.Label.create('')
    local lb2 = gui.Label.create('') -- for Choose effect
    btn:setstyle { 
        Width = 24, Height = 24, color = '#1A9B9B',

        --font = { size = 18, name = 'Cascadia Code',weight = 'bold' },
    }

    ca.font(btn, { font = { size = 21 } })
    ca.font(lb2, { font = { size = 36 } })

    btn:setbackgroundcolor('#404040')
    lbl:setstyle {
        Width = 16, Height = 16, Position = 'absolute', Left = 2, Top = 2 ,
    }
    lb2:setstyle {
        Width = 16, Height = 16, Position = 'absolute', Left = -5, Top = -16 ,
        color = "#1A9B9B",
    }

    lb2:settext (btn.value and '■' or '')
    local function update_color()
        if btn.value then
            lb2:setstyle {
                color = "#1A9B9B",
            }
        else
            --lb2:setvisible(false)
        end
    end

    local bind = {}
    if t.bind and t.bind.value then
        bind.value = data:bind(t.bind.value, 
            function()
                btn.value = bind.value:get()
                update_color()
            end
        )
        btn.value = bind.value:get()
        update_color()
    else
        if type(t.value) ~= 'nil' then
            btn.value = t.value
            update_color()
        else
            btn.value = false
            update_color()
        end
    end


    ca.button_color(btn, lbl, t, data, bind)
    return btn, lbl, lb2, function()
        btn.value = not btn.value
        lb2:settext (btn.value and '■' or '')
        update_color()
        if bind.value then
            bind.value:set(btn.value)
        end
    end
end

local function checkbox_label(t)
    local label = gui.Label.create(t.text)
    label:setcolor('#AAA')
    label:setalign 'start'
    label:setstyle { FlexGrow = 1 }
    ca.font(label, t)
    return label
end

return function (t, data)
    local o = gui.Container.create()
    o:setstyle { FlexDirection = 'row' }
    if t.style then
        o:setstyle(t.style)
    end
    local btn, lbl, lb2, onclick = checkbox_button(t, data)
    o:addchildview(btn)
    o:addchildview(lbl)
    o:addchildview(lb2)
    o:addchildview(
        checkbox_label(t)
    )
    ca.event(o, t, data, 'mouseenter')
    ca.event(o, t, data, 'mouseleave')
    function btn:onmousedown()
        onclick()
        o.value = btn.value
        if t.onclick then
            t.onclick()
        end
    end
    function o:onmousedown()
        onclick()
        o.value = btn.value
    end
    function o:onmouseenter()
        if o.value then
            lb2:setstyle {
                color = "#1a6363",
            }
        else
            lb2:settext ('■')
            lb2:setstyle {
                color = "#a1b5b4",
            }
        end
    end
    function o:onmouseleave()
        if o.value then
            lb2:setstyle {
                color = "#1A9B9B",
            }
        else
            lb2:settext ('')
        end
        
    end
    return o
end
