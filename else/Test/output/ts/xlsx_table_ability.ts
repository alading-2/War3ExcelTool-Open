export const xlsx_inte_keys_table_ability = [
"name","icon","method","range","area","cool","cost","action","targettp","cast","type"
];

export interface xlsx_inte_table_ability {
    [key: string]: {
        "name"?: string;    // 名称
        "icon"?: string;    // 图标
        "method"?: string;    // 使用方式
        "range"?: number;    // 使用距离
        "area"?: number;    // 使用范围
        "cool"?: any;    // 间隔
        "cost"?: any;    // 消耗
        "action"?: any;    // 动作
        "targettp"?: any;    // 目标类型
        "cast"?: any;    // 施放时间
        "type"?: any;    // 类型
    }
}

export const xlsx_data_table_ability: xlsx_inte_table_ability = {
    "abil_1":{
        "name": "abil_1",
        "icon": "|cffff0000ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp|r",
        "method": "被动",
        "range": 0,
        "area": 0
    },
    "abil_2":{
        "name": "abil_2",
        "icon": "|cffff0000ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp|r",
        "method": "无目标",
        "range": 0,
        "area": 0
    },
    "abil_3":{
        "name": "abil_3",
        "icon": "|cffff0000ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp|r",
        "method": "单位",
        "range": 800,
        "area": 0
    },
    "abil_4":{
        "name": "abil_4",
        "icon": "|cffff0000ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp|r",
        "method": "点",
        "range": 800,
        "area": 500
    },
};

export class xlsx_table_ability {
    static Start() {
        const data=xlsx_data_table_ability;
    }
}
