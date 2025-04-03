// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员物品 = [
"id","class","passive","name","describe","icon","goldCost","lumberCost","pawnable","unique","attribute","maxCd"
];

export interface xlsx_inte_演员物品 {
    [key: string]: {
    "id"?: string;
        "class"?: string;
        "passive"?: boolean;
        "name"?: string;
        "describe"?: string;
        "icon"?: string;
        "goldCost"?: any;
        "lumberCost"?: any;
        "pawnable"?: any;
        "unique"?: any;
        "attribute"?: any;
        "maxCd"?: any;
    }
}

export const xlsx_data_演员物品: xlsx_inte_演员物品 = {
    "杀主刀":{
        "id": "杀主刀",
        "class": "基础",
        "passive": true,
        "name": "|cffff0000${id}",
        "describe": "增加10点力量",
        "icon": "ReplaceableTextures\CommandButtons\BTNFrost.blp"
    },
    "属性丹":{
        "id": "属性丹",
        "class": "基础",
        "passive": false,
        "name": "|cffff0001${id}",
        "describe": "点击使用后获得10点全属性",
        "icon": "ReplaceableTextures\CommandButtons\BTNFrost.blp"
    }
};

export class xlsx_演员物品 {
    static Start() {
        const data=xlsx_data_演员物品;
        for (let datum of data) {
        if (datum.id) {
        ActorTypeUtil.registerActorType(datum as any);
        }
        }
    }
}
