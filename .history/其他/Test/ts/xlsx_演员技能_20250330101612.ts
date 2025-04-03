// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员技能 = {
    "class": "class",
    "index": "index",
    "name": "name",
    "describe": "describe",
    "stateFormula": "stateFormula",
    "attribute": "attribute",
    "nan": "nan",
    "targetType": "targetType",
    " passive": " passive",
    "icon": "icon",
    "model": "model",
    "range": "range",
    "area": "area",
    "manaCost": "manaCost",
    "hotKey": "hotKey",
    "maxCd": "maxCd",
    "x": "x",
    "y": "y"
};

export interface xlsx_inte_演员技能 {
    class: string;
    index: number;
    name: string;
    describe: string;
    stateFormula: string;
    attribute: any;
    nan: any;
    targetType: string;
     passive: boolean;
    icon: string;
    model: string;
    range: number;
    area: number;
    manaCost: number;
    hotKey: string;
    maxCd: number;
    x: number;
    y: number;
}

export const xlsx_data_演员技能: xlsx_inte_演员技能[] = [
    {
        class: "技能",
        index: 0,
        name: "${id}",
        describe: "对范围内目标施放风暴之锤",
        stateFormula: "{str:1}",
        targetType: "点",
         passive: false,
        icon: "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        model: "Abilities\Spells\Human\StormBolt\StormBoltMissile.mdl",
        range: 1000,
        area: 500,
        manaCost: 0,
        hotKey: "Q",
        maxCd: 0,
        x: 0,
        y: 2
    }
];

export class xlsx_演员技能 {
    constructor() {
        //构造函数
    }

    public Start(): void {
        //Start方法，用于初始化数据
        for (let datum of data) {
        if (datum.id) {
        ActorTypeUtil.registerActorType(datum as any);
        }
        }
    }
}
