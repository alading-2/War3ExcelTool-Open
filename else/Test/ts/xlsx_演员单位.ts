// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员单位 = [
"id","class","name","describe","templateType","strength","agility","intelligence","attribute","icon","model","moveSpeed","maxLife","maxMana","def","damage","damageCd","range","missileModel","moveType","flyHeight","goldCost","sellItems"
];

export interface xlsx_inte_演员单位 {
    [key: string]: {
    "id"?: string;
        "class"?: string;
        "name"?: string;
        "describe"?: string;
        "templateType"?: string;
        "strength"?: number;
        "agility"?: number;
        "intelligence"?: number;
        "attribute"?: any;
        "icon"?: string;
        "model"?: string;
        "moveSpeed"?: any;
        "maxLife"?: number;
        "maxMana"?: number;
        "def"?: any;
        "damage"?: any;
        "damageCd"?: any;
        "range"?: any;
        "missileModel"?: any;
        "moveType"?: any;
        "flyHeight"?: any;
        "goldCost"?: number;
        "sellItems"?: any;
    }
}

export const xlsx_data_演员单位: xlsx_inte_演员单位 = {
    "测试英雄":{
        "id": "测试英雄",
        "class": "基础单位",
        "name": "测试英雄",
        "describe": "测试英雄",
        "templateType": "近战力量英雄",
        "strength": 50,
        "agility": 50,
        "intelligence": 100,
        "attribute": {'strength_p': 3, 'attack_p': 5},
        "icon": "",
        "model": "",
        "moveSpeed": [211, 50, 50],
        "maxLife": 10000,
        "maxMana": 10000,
        "goldCost": 0
    }
};

export class xlsx_演员单位 {
    static Start() {
        const data=xlsx_data_演员单位;
        for (let datum of data) {
        if (datum.id) {
        ActorTypeUtil.registerActorType(datum as any);
        }
        }
    }
}
