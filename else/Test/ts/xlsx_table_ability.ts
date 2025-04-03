// This file is auto-generated from Excel data

export const xlsx_inte_keys_table_ability = [
"name","icon","method","range","area","cool","cost","action","targettp","cast","type"
];

export interface xlsx_inte_table_ability {
    [key: string]: {
    "name"?: string;
        "icon"?: string;
        "method"?: string;
        "range"?: number;
        "area"?: number;
        "cool"?: number;
        "cost"?: number;
        "action"?: string;
        "targettp"?: string;
        "cast"?: number;
        "type"?: string;
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
    }
};

export class xlsx_table_ability {
    static Start() {
        const data=xlsx_data_table_ability;
    }
}
