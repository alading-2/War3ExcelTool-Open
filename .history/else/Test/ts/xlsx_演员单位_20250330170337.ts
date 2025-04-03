// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员单位 = {
    "class": "class",
    "name": "name",
    "describe": "describe",
    "templateType": "templateType",
    "strength": "strength",
    "agility": "agility",
    "intelligence": "intelligence",
    "attribute": "attribute",
    "icon": "icon",
    "model": "model",
    "moveSpeed": "moveSpeed",
    "maxLife": "maxLife",
    "maxMana": "maxMana",
    "def": "def",
    "damage": "damage",
    "damageCd": "damageCd",
    "range": "range",
    "missileModel": "missileModel",
    "moveType": "moveType",
    "flyHeight": "flyHeight",
    "goldCost": "goldCost",
    "sellItems": "sellItems"
};

export interface xlsx_inte_演员单位 {
    class: string;
    name: string;
    describe: string;
    templateType: string;
    strength: number;
    agility: number;
    intelligence: number;
    attribute: string;
    icon: any;
    model: any;
    moveSpeed: any;
    maxLife: number;
    maxMana: number;
    def: any;
    damage: any;
    damageCd: any;
    range: any;
    missileModel: any;
    moveType: any;
    flyHeight: any;
    goldCost: number;
    sellItems: any;
}

export const xlsx_data_演员单位: xlsx_inte_演员单位[] = [
    {
        class: "基础单位",
        name: "${id}",
        describe: "${id}",
        templateType: "近战力量英雄",
        strength: 50,
        agility: 50,
        intelligence: 50,
        attribute: "{strength_p:3,
attack_p:5,
}",
        maxLife: 10000,
        maxMana: 10000,
        goldCost: 0
    }
];

export class xlsx_演员单位 {
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
