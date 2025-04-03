// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员技能 = [
"id","class","index","name","describe","stateFormula","attribute","targetType","passive","icon","model","range","area","manaCost","hotKey","maxCd","x","y"
];

export interface xlsx_inte_演员技能 {
    [key: string]: {
    "id"?: string;
        "class"?: string;
        "index"?: number;
        "name"?: string;
        "describe"?: string;
        "stateFormula"?: any;
        "attribute"?: any;
        "targetType"?: string;
        "passive"?: boolean;
        "icon"?: string;
        "model"?: string;
        "range"?: number;
        "area"?: number;
        "manaCost"?: number;
        "hotKey"?: string;
        "maxCd"?: number;
        "x"?: number;
        "y"?: number;
    }
}

export const xlsx_data_演员技能: xlsx_inte_演员技能 = {
    "群锤":{
        "id": "群锤",
        "class": "技能",
        "index": 0,
        "name": "${id}",
        "describe": "对范围内目标施放风暴之锤",
        "stateFormula": {'str': 1},
        "targetType": "点",
        "passive": false,
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "model": "Abilities\Spells\Human\StormBolt\StormBoltMissile.mdl",
        "range": 1000,
        "area": 500,
        "manaCost": 0,
        "hotKey": "Q",
        "maxCd": 0,
        "x": 0,
        "y": 2
    }
};

export class xlsx_演员技能 {
    static Start() {
        const data=xlsx_data_演员技能;
        for (let datum of data) {
        if (datum.id) {
        ActorTypeUtil.registerActorType(datum as any);
        }
        }
    }
}
