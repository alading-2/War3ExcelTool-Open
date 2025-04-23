config = {
    slks = {
        'unit',
        'item',
        'ability',
        'destructable',
        'doodad',
        'upgrade',
        'buff',

        ['unit'] = '单位',
        ['item'] = '物品',
        ['ability'] = '技能',
        ['destructable'] = '可破坏物',
        ['doodad'] = '装饰物',
        ['upgrade'] = '科技',
        ['buff'] = '魔法效果',
    },
}

local _count_get_slk = 1
function config:get_slk( localization, next )
    if next  then
        _count_get_slk = _count_get_slk + 1
    end
    local ret = self.slks[_count_get_slk]
    if localization then
        ret = self.slks[ ret ]
    end
    return ret
end