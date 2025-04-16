import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员技能 = [
"id","class","index","name","describe","stateFormula","attribute","targetType","passive","icon","model","range","area","manaCost","hotKey","maxCd","x","y"
];

export interface xlsx_inte_演员技能 {
    [key: string]: {
        "id"?: string;    // 自定义id

        "class"?: string;    // 类别
        "index"?: number;    // 序号
        "name"?: string;    // 名字
        "describe"?: string;    // 提示说明
        "stateFormula"?: any;    // 数值公式
        "attribute"?: any;    // 属性附加
        "targetType"?: string;    // 目标类型(无目标/点/单位/单位或点)
        "passive"?: boolean;    // 是否被动技能
        "icon"?: string;    // 图标
        "model"?: string;    // 模型
        "range"?: number;    // 施放范围
        "area"?: number;    // 影响区域
        "manaCost"?: number;    // 魔法消耗
        "hotKey"?: string;    // 快捷键
        "maxCd"?: number;    // 冷却
        "x"?: number;    // 按钮x
        "y"?: number;    // 按钮y
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
        "icon": "ReplaceableTextures\\CommandButtons\\BTNStormBolt.blp",
        "model": "Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl",
        "range": 1000,
        "area": 500,
        "manaCost": 0,
        "hotKey": "Q",
        "maxCd": 0,
        "x": 0,
        "y": 2
    },
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
