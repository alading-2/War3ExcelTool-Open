export const xlsx_inte_keys_演员物品.ts = [
"id","class"," passive","name","describe","icon","goldCost","lumberCost","pawnable","unique","attribute","maxCd"
];

export interface xlsx_inte_演员物品.ts {
    [key: string]: {
        "id"?: string;    // 自定义id
        "class"?: string;    // 类别
<%
import ActorTypeUtil from "@/ActorTypeUtil";
    for (let datum of data) {
        if (datum.id) {
            ActorTypeUtil.registerActorType(datum as any);
        }
    }
%>
        " passive"?: boolean;    // 是否被动(不可点击的装备)
        "name"?: string;    // 名字
        "describe"?: string;    // 提示说明
        "icon"?: string;    // 图标
        "goldCost"?: any;    // 金币消耗
        "lumberCost"?: any;    // 木材消耗
        "pawnable"?: any;    // 是否可抵押
        "unique"?: any;    // 唯一
        "attribute"?: any;    // 属性附加
        "maxCd"?: any;    // 冷却时间
    }
}

export const xlsx_data_演员物品.ts: xlsx_inte_演员物品.ts = {
    "杀主刀":{
        "id": "杀主刀",
        "class": "基础",
        " passive": true,
        "name": "|cffff0000${id}",
        "describe": "增加10点力量",
        "icon": "ReplaceableTextures\\CommandButtons\\BTNFrost.blp"
    },
    "属性丹":{
        "id": "属性丹",
        "class": "基础",
        " passive": false,
        "name": "|cffff0001${id}",
        "describe": "点击使用后获得10点全属性",
        "icon": "ReplaceableTextures\\CommandButtons\\BTNFrost.blp"
    },
};

export class xlsx_演员物品.ts {
    static Start() {
        const data=xlsx_data_演员物品.ts;
    }
}
