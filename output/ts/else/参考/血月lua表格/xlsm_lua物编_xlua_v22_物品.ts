export const xlsm_inte_keys_lua物编_xlua_v22_物品 = [
"留空则自动生成ID","item","abilList","Requires","Requiresamount","Name","Description","Tip","Ubertip","Hotkey","Art","scale","file","Buttonpos","Buttonpos","colorR","colorB","colorG","oldLevel","Level","class","goldcost","HP","stockStart","stockRegen","lumbercost","stockMax","prio","cooldownID","ignoreCD","morph","drop","powerup","sellable","pawnable","droppable","pickRandom","uses","perishable","usable"
];

export interface xlsm_inte_lua物编_xlua_v22_物品 {
    [key: string]: {
        "留空则自动生成ID"?: string;    // 自定义ID
        "item"?: string;    // 模板
        "abilList"?: string;    // 技能
        "Requires"?: string;    // 科技树-需求
        "Requiresamount"?: string;    // 科技树-需求值
        "Name"?: string;    // 名字
        "Description"?: string;    // 说明
        "Tip"?: string;    // 提示工具-基础
        "Ubertip"?: string;    // 提示工具扩展
        "Hotkey"?: any;    // 热键
        "Art"?: any;    // 界面图标
        "scale"?: any;    // 模型缩放
        "file"?: any;    // 使用模型
        "Buttonpos"?: any;    // 按钮位置x
        "Buttonpos"?: any;    // 按钮位置y
        "colorR"?: any;    // 颜色红
        "colorB"?: any;    // 颜色蓝
        "colorG"?: any;    // 颜色绿
        "oldLevel"?: any;    // 等级旧版
        "Level"?: number;    // 等级新版
        "class"?: string;    // 物品分类
        "goldcost"?: any;    // 黄金消耗
        "HP"?: any;    // 生命值
        "stockStart"?: any;    // 购买开始时间
        "stockRegen"?: any;    // 购买时间间隔
        "lumbercost"?: any;    // 木材消耗
        "stockMax"?: any;    // 最大库存量
        "prio"?: any;    // 优先权
        "cooldownID"?: any;    // CD间隔组
        "ignoreCD"?: any;    // 无视CD间隔
        "morph"?: any;    // 有效的物品转换
        "drop"?: any;    // 持有者死亡掉落
        "powerup"?: any;    // 捡取时自动使用
        "sellable"?: any;    // 可被市场出售
        "pawnable"?: any;    // 可以被抵押
        "droppable"?: any;    // 可以丢弃
        "pickRandom"?: any;    // 可以作为随机物品
        "uses"?: any;    // 使用次数
        "perishable"?: any;    // 使用完全消失
        "usable"?: any;    // 主动使用
    }
}

export const xlsm_data_lua物编_xlua_v22_物品: xlsm_inte_lua物编_xlua_v22_物品 = {
    "A000":{
        "留空则自动生成ID": "A000",
        "item": "afac",
        "abilList": "#",
        "Requires": "#",
        "Requiresamount": "#",
        "Name": "物品1",
        "Description": "[装备]\n品质：A\n\n[基础属性]\n物理暴击 + 5%\n物暴伤害 + 35%\n\n唯一被动:增加周围友军12%攻击力\n\n三件同级别装备可以合成更高级装备",
        "Tip": "物品1",
        "Ubertip": "[装备]\n品质：A\n\n[基础属性]\n物理暴击 + 5%\n物暴伤害 + 35%\n\n唯一被动:增加周围友军12%攻击力\n\n三件同级别装备可以合成更高级装备",
        "Level": 1,
        "class": "Artifact"
    },
    "A001":{
        "留空则自动生成ID": "A001",
        "item": "afac",
        "abilList": "#",
        "Requires": "#",
        "Requiresamount": "#",
        "Name": "物品2",
        "Description": "[装备]\n品质：A\n\n[基础属性]\n物理暴击 + 5%\n物暴伤害 + 35%\n\n唯一被动:增加周围友军13%攻击力\n\n三件同级别装备可以合成更高级装备",
        "Tip": "物品2",
        "Ubertip": "[装备]\n品质：A\n\n[基础属性]\n物理暴击 + 5%\n物暴伤害 + 35%\n\n唯一被动:增加周围友军13%攻击力\n\n三件同级别装备可以合成更高级装备",
        "Level": 2,
        "class": "Artifact"
    },
};

export class xlsm_lua物编_xlua_v22_物品 {
    static Start() {
        const data=xlsm_data_lua物编_xlua_v22_物品;
    }
}
