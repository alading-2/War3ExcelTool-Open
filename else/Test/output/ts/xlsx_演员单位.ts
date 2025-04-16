import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员单位 = [
"id","class","name","describe","templateType","strength","agility","intelligence","attribute","icon","model","moveSpeed","maxLife","maxMana","def","damage","damageCd","range","missileModel","moveType","flyHeight","goldCost","sellItems"
];

export interface xlsx_inte_演员单位 {
    [key: string]: {
        "id"?: string;    // 自定义id
        "class"?: string;    // 类别
        "name"?: string;    // 名字
        "describe"?: string;    // 提示说明
        "templateType"?: string;    // 基础模板
        "strength"?: number;    // 基础力量
        "agility"?: number;    // 基础敏捷
        "intelligence"?: number;    // 基础智力
        "attribute"?: any;    // 属性
        "icon"?: string;    // 图标
        "model"?: string;    // 模型
        "moveSpeed"?: any;    // 移速
        "maxLife"?: number;    // 生命值
        "maxMana"?: number;    // 最大魔法值
        "def"?: any;    // 护甲
        "damage"?: any;    // 攻击力
        "damageCd"?: any;    // 攻击间隔
        "range"?: any;    // 攻击范围
        "missileModel"?: any;    // 投射物模型
        "moveType"?: any;    // 移动类型
        "flyHeight"?: any;    // 飞行高度
        "goldCost"?: number;    // 金币消耗
        "sellItems"?: any;    // (内置有效)售卖演员物品类型id列表
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
    },
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
