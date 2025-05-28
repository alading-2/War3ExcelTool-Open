export const xlsx_inte_keys_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit = [
"名字#color","类别","等级","基础生命值","攻击力","防御","cool1","spd","属性","acquire","rangeN1","movetp","moveHeight","file","modelScale","RGBA","弹道模型","弹道大小","弹道速度","collision","血条高度","unitSound","scale"
];

export interface xlsx_inte_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit {
    [key: string]: {
        "名字#color"?: string;    // 名字
        "类别"?: string;    // 类别
        "等级"?: number;    // 等级
        "基础生命值"?: number;    // 基础生命值
        "攻击力"?: number;    // 攻击力
        "防御"?: number;    // 防御
        "cool1"?: number;    // 基础攻速
        "spd"?: number;    // 基础移速
        "属性"?: any;    // 属性
        "acquire"?: number;    // 主动攻击范围
        "rangeN1"?: number;    // 攻击距离
        "movetp"?: string;    // 移动类型
        "moveHeight"?: number;    // 飞行高度
        "file"?: string;    // 模型
        "modelScale"?: number;    // 模型尺寸
        "RGBA"?: any;    // RGBA
        "弹道模型"?: string;    // 弹道模型
        "弹道大小"?: number;    // 弹道大小
        "弹道速度"?: number;    // 弹道速度
        "collision"?: number;    // 碰撞体积
        "血条高度"?: number;    // 血条高度
        "unitSound"?: any;    // 声音
        "scale"?: number;    // 选择缩放
    }
}

export const xlsx_data_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit: xlsx_inte_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit = {
    "助手":{
        "名字#color": "助手",
        "类别": "助手",
        "等级": 1,
        "基础生命值": 100,
        "攻击力": 1,
        "防御": 10,
        "cool1": 100,
        "spd": 300,
        "属性": {'基础魔抗': 100, '魔抗加成': 1},
        "acquire": 150,
        "rangeN1": 150,
        "movetp": "fly",
        "moveHeight": 100,
        "file": "units\\human\\phoenix\\phoenix",
        "modelScale": 1,
        "RGBA": [],
        "弹道大小": 1,
        "弹道速度": 700,
        "collision": 16,
        "血条高度": 150,
        "scale": 1
    },
    "单位":{
        "名字#color": "单位",
        "类别": "单位",
        "等级": 1,
        "基础生命值": 5000,
        "攻击力": 100,
        "防御": 10,
        "cool1": 100,
        "spd": 300,
        "属性": {'基础魔抗': 100, '魔抗加成': 2},
        "acquire": 150,
        "rangeN1": 150,
        "movetp": "foot",
        "moveHeight": 0,
        "file": "units\\human\\Knight\\Knight",
        "modelScale": 1,
        "RGBA": [100, 255, 255],
        "弹道大小": 1,
        "弹道速度": 700,
        "collision": 16,
        "血条高度": 150,
        "scale": 1
    },
    "test":{
        "名字#color": "test",
        "类别": "英雄",
        "等级": 1,
        "基础生命值": 5000,
        "攻击力": 1000,
        "防御": 10,
        "cool1": 100,
        "spd": 300,
        "属性": {'基础魔抗': 100, '魔抗加成': 3},
        "acquire": 150,
        "rangeN1": 150,
        "movetp": "foot",
        "moveHeight": 0,
        "file": "units\\nightelf\\HeroDemonHunter\\HeroDemonHunter",
        "modelScale": 1,
        "RGBA": [],
        "弹道大小": 1,
        "弹道速度": 700,
        "collision": 16,
        "血条高度": 150,
        "scale": 1
    },
    "剑圣":{
        "名字#color": "剑圣",
        "类别": "英雄",
        "等级": 1,
        "基础生命值": 5000,
        "攻击力": 500,
        "防御": 10,
        "cool1": 100,
        "spd": 300,
        "属性": {'基础魔抗': 100, '魔抗加成': 4},
        "acquire": 150,
        "rangeN1": 150,
        "movetp": "foot",
        "moveHeight": 0,
        "file": "units\\demon\\HeroChaosBladeMaster\\HeroChaosBladeMaster",
        "modelScale": 1,
        "RGBA": [],
        "弹道大小": 1,
        "弹道速度": 700,
        "collision": 16,
        "血条高度": 150,
        "scale": 1
    },
    "冰雪法师":{
        "名字#color": "冰雪法师",
        "类别": "英雄",
        "等级": 1,
        "基础生命值": 5000,
        "攻击力": 100,
        "防御": 10,
        "cool1": 100,
        "spd": 300,
        "属性": {'基础魔抗': 100, '魔抗加成': 5},
        "acquire": 700,
        "rangeN1": 700,
        "movetp": "foot",
        "moveHeight": 0,
        "file": "units\\human\\Jaina\\Jaina",
        "modelScale": 1,
        "RGBA": [],
        "弹道模型": "Abilities\\Weapons\\LichMissile\\LichMissile.mdl",
        "弹道大小": 1,
        "弹道速度": 700,
        "collision": 16,
        "血条高度": 150,
        "scale": 1
    },
};

export class xlsx_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit {
    static Start() {
        const data=xlsx_data_table_e3349c84-582b-4f32-8273-421ac3ac6778_unit;
    }
}
