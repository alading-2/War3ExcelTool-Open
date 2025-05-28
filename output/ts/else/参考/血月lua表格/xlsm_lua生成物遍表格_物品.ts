export const xlsm_inte_keys_lua生成物遍表格_物品 = [
"item","abilList","Name","Description","Tip","Ubertip","Hotkey","Art","scale","file","Buttonpos","Buttonpos","colorR","colorB","colorG","oldLevel","Level","class","goldcost","HP","stockStart","stockRegen","lumbercost","stockMax","prio","cooldownID","ignoreCD","morph","drop","powerup","sellable","pawnable","droppable","pickRandom","uses","perishable","usable"
];

export interface xlsm_inte_lua生成物遍表格_物品 {
    [key: string]: {
        "item"?: string;    // 模板
        "abilList"?: string;    // 技能
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
        "Level"?: any;    // 等级新版
        "class"?: any;    // 物品分类
        "goldcost"?: number;    // 黄金消耗
        "HP"?: any;    // 生命值
        "stockStart"?: any;    // 购买开始时间
        "stockRegen"?: any;    // 购买时间间隔
        "lumbercost"?: any;    // 木材消耗
        "stockMax"?: number;    // 最大库存量
        "prio"?: any;    // 优先权
        "cooldownID"?: any;    // CD间隔组
        "ignoreCD"?: any;    // 无视CD间隔
        "morph"?: any;    // 有效的物品转换
        "drop"?: any;    // 持有者死亡掉落
        "powerup"?: any;    // 捡取时自动使用
        "sellable"?: any;    // 可被市场出售
        "pawnable"?: any;    // 可以被抵押
        "droppable"?: number;    // 可以丢弃
        "pickRandom"?: any;    // 可以作为随机物品
        "uses"?: any;    // 使用次数
        "perishable"?: any;    // 使用完全消失
        "usable"?: any;    // 主动使用
    }
}

export const xlsm_data_lua生成物遍表格_物品: xlsm_inte_lua生成物遍表格_物品 = {
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋武器LV1",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+20",
        "Tip": "简陋武器LV1",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+20",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋武器LV2",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+25",
        "Tip": "简陋武器LV2",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+25",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋武器LV3",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+30",
        "Tip": "简陋武器LV3",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+30",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋武器LV4",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+35",
        "Tip": "简陋武器LV4",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+35",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋武器LV5",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+40",
        "Tip": "简陋武器LV5",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻击力+40",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通武器LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+10%|n|cff00ccff〇|r攻击力+60",
        "Tip": "|cff00ccff普通武器LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+10%|n|cff00ccff〇|r攻击力+60",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通武器LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+15%|n|cff00ccff〇|r攻击力+75",
        "Tip": "|cff00ccff普通武器LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+15%|n|cff00ccff〇|r攻击力+75",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通武器LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+20%|n|cff00ccff〇|r攻击力+90",
        "Tip": "|cff00ccff普通武器LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+20%|n|cff00ccff〇|r攻击力+90",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通武器LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+25%|n|cff00ccff〇|r攻击力+105",
        "Tip": "|cff00ccff普通武器LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+25%|n|cff00ccff〇|r攻击力+105",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通武器LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+30%|n|cff00ccff〇|r攻击力+120",
        "Tip": "|cff00ccff普通武器LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+30%|n|cff00ccff〇|r攻击力+120",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良武器LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+35%|n|cff00ccff〇|r暴击率+5%|n|cff00ccff〇|r攻击力+180",
        "Tip": "|cffff00ff精良武器LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+35%|n|cff00ccff〇|r暴击率+5%|n|cff00ccff〇|r攻击力+180",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良武器LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+40%|n|cff00ccff〇|r暴击率+8%|n|cff00ccff〇|r攻击力+225",
        "Tip": "|cffff00ff精良武器LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+40%|n|cff00ccff〇|r暴击率+8%|n|cff00ccff〇|r攻击力+225",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良武器LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+45%|n|cff00ccff〇|r暴击率+11%|n|cff00ccff〇|r攻击力+270",
        "Tip": "|cffff00ff精良武器LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+45%|n|cff00ccff〇|r暴击率+11%|n|cff00ccff〇|r攻击力+270",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良武器LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+50%|n|cff00ccff〇|r暴击率+14%|n|cff00ccff〇|r攻击力+315",
        "Tip": "|cffff00ff精良武器LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+50%|n|cff00ccff〇|r暴击率+14%|n|cff00ccff〇|r攻击力+315",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良武器LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+55%|n|cff00ccff〇|r暴击率+17%|n|cff00ccff〇|r攻击力+360",
        "Tip": "|cffff00ff精良武器LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+55%|n|cff00ccff〇|r暴击率+17%|n|cff00ccff〇|r攻击力+360",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品武器LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+60%|n|cff00ccff〇|r暴击率+20%|n|cff00ccff〇|r暴击伤害+20%|n|cff00ccff〇|r攻击力+540",
        "Tip": "|cffff6600极品武器LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+60%|n|cff00ccff〇|r暴击率+20%|n|cff00ccff〇|r暴击伤害+20%|n|cff00ccff〇|r攻击力+540",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品武器LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+65%|n|cff00ccff〇|r暴击率+23%|n|cff00ccff〇|r暴击伤害+30%|n|cff00ccff〇|r攻击力+675",
        "Tip": "|cffff6600极品武器LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+65%|n|cff00ccff〇|r暴击率+23%|n|cff00ccff〇|r暴击伤害+30%|n|cff00ccff〇|r攻击力+675",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品武器LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+70%|n|cff00ccff〇|r暴击率+26%|n|cff00ccff〇|r暴击伤害+40%|n|cff00ccff〇|r攻击力+810",
        "Tip": "|cffff6600极品武器LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+70%|n|cff00ccff〇|r暴击率+26%|n|cff00ccff〇|r暴击伤害+40%|n|cff00ccff〇|r攻击力+810",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品武器LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+75%|n|cff00ccff〇|r暴击率+29%|n|cff00ccff〇|r暴击伤害+50%|n|cff00ccff〇|r攻击力+945",
        "Tip": "|cffff6600极品武器LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+75%|n|cff00ccff〇|r暴击率+29%|n|cff00ccff〇|r暴击伤害+50%|n|cff00ccff〇|r攻击力+945",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品武器LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+80%|n|cff00ccff〇|r暴击率+32%|n|cff00ccff〇|r暴击伤害+60%|n|cff00ccff〇|r攻击力+1080",
        "Tip": "|cffff6600极品武器LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r10%概率3倍范围伤害|n|cff00ccff〇|r攻速+80%|n|cff00ccff〇|r暴击率+32%|n|cff00ccff〇|r暴击伤害+60%|n|cff00ccff〇|r攻击力+1080",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "巨人腰带",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r力量+20",
        "Tip": "巨人腰带",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r力量+20",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "红水晶",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r生命值+800",
        "Tip": "红水晶",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r生命值+800",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "铁斧",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+40",
        "Tip": "铁斧",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+40",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "匕首",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击速度+15%",
        "Tip": "匕首",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击速度+15%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "蓝水晶",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r法力值+80",
        "Tip": "蓝水晶",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r法力值+80",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "桃木枝",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r技能强度+0.2",
        "Tip": "桃木枝",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r技能强度+0.2",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff强身护腕|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r力量+90",
        "Tip": "|cff00ccff强身护腕|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r力量+90",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff护身甲|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+1%",
        "Tip": "|cff00ccff护身甲|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+1%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff亮银枪|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击+180",
        "Tip": "|cff00ccff亮银枪|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击+180",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff虎爪|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击+120|n|cff00ccff〇|r敏捷+60",
        "Tip": "|cff00ccff虎爪|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击+120|n|cff00ccff〇|r敏捷+60",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff智慧之冠|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r智力+60|n|cff00ccff〇|r法力回复+2%",
        "Tip": "|cff00ccff智慧之冠|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r智力+60|n|cff00ccff〇|r法力回复+2%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff顺风斗篷|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r移速+25%|n|cff00ccff〇|r闪避+5%",
        "Tip": "|cff00ccff顺风斗篷|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r移速+25%|n|cff00ccff〇|r闪避+5%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff祝福项链|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r三围+60|n|cff00ccff〇|r生命回复+2%|n|cff00ccff〇|r法力回复+4%",
        "Tip": "|cffff00ff祝福项链|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r三围+60|n|cff00ccff〇|r生命回复+2%|n|cff00ccff〇|r法力回复+4%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff嗜血扳指|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r吸血+10%|n|cff00ccff〇|r杀敌5%+1随机属性",
        "Tip": "|cffff00ff嗜血扳指|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r吸血+10%|n|cff00ccff〇|r杀敌5%+1随机属性",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff震荡板甲|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r反伤15%",
        "Tip": "|cffff00ff震荡板甲|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r反伤15%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff切割者|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击+360|n|cff00ccff〇|r使被攻击者进入流血状态，每秒造成攻击*0.2的伤害持续3s",
        "Tip": "|cffff00ff切割者|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击+360|n|cff00ccff〇|r使被攻击者进入流血状态，每秒造成攻击*0.2的伤害持续3s",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff聚能法袍|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r技能强度+0.5|n|cff00ccff〇|r每次释放技能对周围敌人造成智力*3的伤害",
        "Tip": "|cffff00ff聚能法袍|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r技能强度+0.5|n|cff00ccff〇|r每次释放技能对周围敌人造成智力*3的伤害",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff劈山刀|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击+360|n|cff00ccff〇|r25%范围伤害",
        "Tip": "|cffff00ff劈山刀|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击+360|n|cff00ccff〇|r25%范围伤害",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600圣灵珠|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r三围+180，|n|cff00ccff〇|r每0.5s自动攻击周围敌人一次，造成三围*1的伤害",
        "Tip": "|cffff6600圣灵珠|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r三围+180，|n|cff00ccff〇|r每0.5s自动攻击周围敌人一次，造成三围*1的伤害",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600流影镜|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r三围+180，|n|cff00ccff〇|r主动技能分身：分裂一个与自己一模一样的镜像，造成50%伤害，承受200%伤害",
        "Tip": "|cffff6600流影镜|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r三围+180，|n|cff00ccff〇|r主动技能分身：分裂一个与自己一模一样的镜像，造成50%伤害，承受200%伤害",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600龙牙刺|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+1080|n|cff00ccff〇|r暴击率+10%|n|cff00ccff〇|r暴击伤害+50%",
        "Tip": "|cffff6600龙牙刺|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+1080|n|cff00ccff〇|r暴击率+10%|n|cff00ccff〇|r暴击伤害+50%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600胜利之剑|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+1080|n|cff00ccff〇|r攻速+50%|n|cff00ccff〇|r主动技能无敌2s",
        "Tip": "|cffff6600胜利之剑|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r攻击力+1080|n|cff00ccff〇|r攻速+50%|n|cff00ccff〇|r主动技能无敌2s",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600铁壁|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r减伤20%|n|cff00ccff〇|r生命值+21600|n|cff00ccff〇|r生命回复+3.5%|n|cff00ccff〇|r反伤30%",
        "Tip": "|cffff6600铁壁|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r减伤20%|n|cff00ccff〇|r生命值+21600|n|cff00ccff〇|r生命回复+3.5%|n|cff00ccff〇|r反伤30%",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600贤者之书|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r智力+540|n|cff00ccff〇|r法力值+2160|n|cff00ccff〇|r法力回复+7%|n|cff00ccff〇|r技能强度+1",
        "Tip": "|cffff6600贤者之书|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r智力+540|n|cff00ccff〇|r法力值+2160|n|cff00ccff〇|r法力回复+7%|n|cff00ccff〇|r技能强度+1",
        "goldcost": 100,
        "stockMax": 1
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋防具LV1",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+400",
        "Tip": "简陋防具LV1",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+400",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋防具LV2",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+500",
        "Tip": "简陋防具LV2",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+500",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋防具LV3",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+600",
        "Tip": "简陋防具LV3",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+600",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋防具LV4",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+700",
        "Tip": "简陋防具LV4",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+700",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "简陋防具LV5",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+800",
        "Tip": "简陋防具LV5",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+1|n|cff00ccff〇|r生命值+800",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通防具LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.5%|n|cff00ccff〇|r法力回复+1.0%",
        "Tip": "|cff00ccff普通防具LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.5%|n|cff00ccff〇|r法力回复+1.0%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通防具LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.6%|n|cff00ccff〇|r法力回复+1.2%",
        "Tip": "|cff00ccff普通防具LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.6%|n|cff00ccff〇|r法力回复+1.2%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通防具LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.7%|n|cff00ccff〇|r法力回复+1.4%",
        "Tip": "|cff00ccff普通防具LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.7%|n|cff00ccff〇|r法力回复+1.4%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通防具LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.8%|n|cff00ccff〇|r法力回复+1.6%",
        "Tip": "|cff00ccff普通防具LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+0.8%|n|cff00ccff〇|r法力回复+1.6%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cff00ccff普通防具LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+1%|n|cff00ccff〇|r法力回复+2%",
        "Tip": "|cff00ccff普通防具LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+2|n|cff00ccff〇|r生命回复+1%|n|cff00ccff〇|r法力回复+2%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良防具LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+3600|n|cff00ccff〇|r法力回复+2.4%|n|cff00ccff〇|r闪避+3%|n|cff00ccff〇|r生命回复+1.2%",
        "Tip": "|cffff00ff精良防具LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+3600|n|cff00ccff〇|r法力回复+2.4%|n|cff00ccff〇|r闪避+3%|n|cff00ccff〇|r生命回复+1.2%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良防具LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+4500|n|cff00ccff〇|r法力回复+2.8%|n|cff00ccff〇|r闪避+3.5%|n|cff00ccff〇|r生命回复+1.4%",
        "Tip": "|cffff00ff精良防具LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+4500|n|cff00ccff〇|r法力回复+2.8%|n|cff00ccff〇|r闪避+3.5%|n|cff00ccff〇|r生命回复+1.4%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良防具LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+5400|n|cff00ccff〇|r法力回复+3.2%|n|cff00ccff〇|r闪避+4%|n|cff00ccff〇|r生命回复+1.6%",
        "Tip": "|cffff00ff精良防具LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+5400|n|cff00ccff〇|r法力回复+3.2%|n|cff00ccff〇|r闪避+4%|n|cff00ccff〇|r生命回复+1.6%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良防具LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+6300|n|cff00ccff〇|r法力回复+3.6%|n|cff00ccff〇|r闪避+4.5%|n|cff00ccff〇|r生命回复+1.8%",
        "Tip": "|cffff00ff精良防具LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+6300|n|cff00ccff〇|r法力回复+3.6%|n|cff00ccff〇|r闪避+4.5%|n|cff00ccff〇|r生命回复+1.8%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff00ff精良防具LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+7200|n|cff00ccff〇|r法力回复+4%|n|cff00ccff〇|r闪避+5%|n|cff00ccff〇|r生命回复+2%",
        "Tip": "|cffff00ff精良防具LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+3|n|cff00ccff〇|r生命值+7200|n|cff00ccff〇|r法力回复+4%|n|cff00ccff〇|r闪避+5%|n|cff00ccff〇|r生命回复+2%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品防具LV1|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+10800|n|cff00ccff〇|r生命回复+2.3%|n|cff00ccff〇|r法力回复+4.6%|n|cff00ccff〇|r闪避+6%|n|cff00ccff〇|r吸血+5%",
        "Tip": "|cffff6600极品防具LV1|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+10800|n|cff00ccff〇|r生命回复+2.3%|n|cff00ccff〇|r法力回复+4.6%|n|cff00ccff〇|r闪避+6%|n|cff00ccff〇|r吸血+5%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品防具LV2|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+13500|n|cff00ccff〇|r生命回复+2.6%|n|cff00ccff〇|r法力回复+5.2%|n|cff00ccff〇|r闪避+7%|n|cff00ccff〇|r吸血+6%",
        "Tip": "|cffff6600极品防具LV2|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+13500|n|cff00ccff〇|r生命回复+2.6%|n|cff00ccff〇|r法力回复+5.2%|n|cff00ccff〇|r闪避+7%|n|cff00ccff〇|r吸血+6%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品防具LV3|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+16200|n|cff00ccff〇|r生命回复+2.9%|n|cff00ccff〇|r法力回复+5.8%|n|cff00ccff〇|r闪避+8%|n|cff00ccff〇|r吸血+7%",
        "Tip": "|cffff6600极品防具LV3|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+16200|n|cff00ccff〇|r生命回复+2.9%|n|cff00ccff〇|r法力回复+5.8%|n|cff00ccff〇|r闪避+8%|n|cff00ccff〇|r吸血+7%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品防具LV4|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+18900|n|cff00ccff〇|r生命回复+3.2%|n|cff00ccff〇|r法力回复+6.4%|n|cff00ccff〇|r闪避+9%|n|cff00ccff〇|r吸血+8%",
        "Tip": "|cffff6600极品防具LV4|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+18900|n|cff00ccff〇|r生命回复+3.2%|n|cff00ccff〇|r法力回复+6.4%|n|cff00ccff〇|r闪避+9%|n|cff00ccff〇|r吸血+8%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "ratc":{
        "item": "ratc",
        "abilList": "#",
        "Name": "|cffff6600极品防具LV5|r",
        "Description": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+21600|n|cff00ccff〇|r生命回复+3.5%|n|cff00ccff〇|r法力回复+7%|n|cff00ccff〇|r闪避+10%|n|cff00ccff〇|r吸血+9%",
        "Tip": "|cffff6600极品防具LV5|r",
        "Ubertip": "|cffff9900属性|r|n|cff00ccff〇|r护甲+4|n|cff00ccff〇|r生命值+21600|n|cff00ccff〇|r生命回复+3.5%|n|cff00ccff〇|r法力回复+7%|n|cff00ccff〇|r闪避+10%|n|cff00ccff〇|r吸血+9%",
        "goldcost": 100,
        "stockMax": 1,
        "droppable": 0
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro",
        "abilList": "A038"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
    "spro":{
        "item": "spro"
    },
};

export class xlsm_lua生成物遍表格_物品 {
    static Start() {
        const data=xlsm_data_lua生成物遍表格_物品;
    }
}
