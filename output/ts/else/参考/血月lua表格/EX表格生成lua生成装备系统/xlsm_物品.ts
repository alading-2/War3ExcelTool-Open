export const xlsm_inte_keys_物品 = [
"item","parent","abilList","Requires","Requiresamount","Name","Description","Tip","Ubertip","Hotkey","Art","scale","file","Buttonpos","Buttonpos","colorR","colorB","colorG","oldLevel","Level","class","goldcost","HP","stockStart","stockRegen","lumbercost","stockMax","prio","cooldownID","ignoreCD","morph","drop","powerup","sellable","pawnable","droppable","pickRandom","uses","perishable","usaable"
];

export interface xlsm_inte_物品 {
    [key: string]: {
        "item"?: string;    // 类型
        "parent"?: string;    // 父对象
        "abilList"?: string;    // 技能
        "Requires"?: string;    // 科技树-需求
        "Requiresamount"?: string;    // 科技树-需求值
        "Name"?: string;    // 名字
        "Description"?: string;    // 说明
        "Tip"?: string;    // 提示工具-基础
        "Ubertip"?: string;    // 提示工具扩展
        "Hotkey"?: string;    // 热键
        "Art"?: string;    // 界面图标
        "scale"?: string;    // 模型缩放
        "file"?: string;    // 使用模型
        "Buttonpos"?: string;    // 按钮位置x
        "Buttonpos"?: string;    // 按钮位置y
        "colorR"?: string;    // 颜色红
        "colorB"?: string;    // 颜色蓝
        "colorG"?: string;    // 颜色绿
        "oldLevel"?: string;    // 等级旧版
        "Level"?: string;    // 等级新版
        "class"?: string;    // 物品分类
        "goldcost"?: string;    // 黄金消耗
        "HP"?: string;    // 生命值
        "stockStart"?: string;    // 购买开始时间
        "stockRegen"?: string;    // 购买时间间隔
        "lumbercost"?: string;    // 木材消耗
        "stockMax"?: string;    // 最大库存量
        "prio"?: number;    // 优先权
        "cooldownID"?: string;    // CD间隔组
        "ignoreCD"?: string;    // 无视CD间隔
        "morph"?: string;    // 有效的物品转换
        "drop"?: string;    // 持有者死亡掉落
        "powerup"?: string;    // 捡取时自动使用
        "sellable"?: string;    // 可被市场出售
        "pawnable"?: string;    // 可以被抵押
        "droppable"?: string;    // 可以丢弃
        "pickRandom"?: string;    // 可以作为随机物品
        "uses"?: string;    // 使用次数
        "perishable"?: string;    // 使用完全消失
        "usaable"?: string;    // 主动使用
    }
}

export const xlsm_data_物品: xlsm_inte_物品 = {
    "item":{
        "item": "item",
        "parent": "afac",
        "abilList": "''",
        "Requires": "''",
        "Requiresamount": "''",
        "Name": "'武器'",
        "Description": "''",
        "Tip": "'武器'",
        "Ubertip": "'攻击+100|n攻击速度+200%|n暴击率+5%|n暴击倍率+50%|n伤害增幅+10%|n吸血+10%|n伤害减免+10%|n经验获取+5%|n技能增幅+5%'",
        "Hotkey": "''",
        "Art": "'ReplaceableTextures\\CommandButtons\\BTNAlleriaFlute.blp'",
        "scale": "''",
        "file": "'Objects\\InventoryItems\\TreasureChest\\treasurechest.mdl'",
        "Buttonpos": "''",
        "Buttonpos": "''",
        "colorR": "''",
        "colorB": "''",
        "colorG": "''",
        "oldLevel": "''",
        "Level": "''",
        "class": "'Permanent'",
        "goldcost": "''",
        "HP": "''",
        "stockStart": "''",
        "stockRegen": "''",
        "lumbercost": "''",
        "stockMax": "''",
        "prio": 1,
        "cooldownID": "''",
        "ignoreCD": "''",
        "morph": "''",
        "drop": "''",
        "powerup": "''",
        "sellable": "''",
        "pawnable": "''",
        "droppable": "''",
        "pickRandom": "''",
        "uses": "''",
        "perishable": "''",
        "usaable": "''"
    },
    "item":{
        "item": "item",
        "parent": "afac",
        "abilList": "''",
        "Requires": "''",
        "Requiresamount": "''",
        "Name": "'防具'",
        "Description": "''",
        "Tip": "'防具'",
        "Ubertip": "'生命+5W|n防御+10|n'",
        "Hotkey": "''",
        "Art": "'ReplaceableTextures\\CommandButtons\\BTNAlleriaFlute.blp'",
        "scale": "''",
        "file": "'Objects\\InventoryItems\\TreasureChest\\treasurechest.mdl'",
        "Buttonpos": "''",
        "Buttonpos": "''",
        "colorR": "''",
        "colorB": "''",
        "colorG": "''",
        "oldLevel": "''",
        "Level": "''",
        "class": "'Permanent'",
        "goldcost": "''",
        "HP": "''",
        "stockStart": "''",
        "stockRegen": "''",
        "lumbercost": "''",
        "stockMax": "''",
        "prio": 1,
        "cooldownID": "''",
        "ignoreCD": "''",
        "morph": "''",
        "drop": "''",
        "powerup": "''",
        "sellable": "''",
        "pawnable": "''",
        "droppable": "''",
        "pickRandom": "''",
        "uses": "''",
        "perishable": "''",
        "usaable": "''"
    },
};

export class xlsm_物品 {
    static Start() {
        const data=xlsm_data_物品;
    }
}
