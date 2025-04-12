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
        "cool"?: number;    // 间隔
        "cost"?: number;    // 消耗
        "action"?: string;    // 动作
        "targettp"?: string;    // 目标类型
        "cast"?: number;    // 施放时间
        "type"?: string;    // 类型
    }
}

export const xlsx_data_table_ability: xlsx_inte_table_ability = {
    "abil_1":{
        "name": "abil_1",
        "icon": "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
        "method": "点",
        "range": 500,
        "area": 500,
        "cool": 0,
        "cost": 1,
        "action": "",
        "targettp": "敌人",
        "cast": 1,
        "type": ""
    },
    "abil_2":{
        "name": "abil_2",
        "icon": "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
        "method": "点",
        "range": 500,
        "area": 500,
        "cool": 0,
        "cost": 1,
        "action": "",
        "targettp": "敌人",
        "cast": 1,
        "type": ""
    },
};

export class xlsx_table_ability {
    static Start() {
        const data=xlsx_data_table_ability;
    }
}
