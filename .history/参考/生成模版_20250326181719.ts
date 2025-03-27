
import ActorTypeUtil from "@/ActorTypeUtil"


const xlsx_inte_演员单位_keys = ["名字", "类别", "等级", "基础生命值", "攻击力", "防御", "cool1", "spd", "属性", "acquire", "rangeN1", "movetp", "moveHeight", "file", "modelScale", "RGBA", "弹道模型", "弹道大小", "弹道速度", "collision", "血条高度", "unitSound", "scale",]
interface xlsx_inte_演员单位 {
    [key: string]: {
        名字: string,
        类别: string,
        等级: number,
        基础生命值: number,
        攻击力: number,
        防御: number,
        cool1: number,
        spd: number,
        属性: any,
        acquire: number,
        rangeN1: number,
        movetp: string,
        moveHeight: number,
        file: string,
        modelScale: number,
        RGBA: any,
        弹道模型: string,
        弹道大小: number,
        弹道速度: number,
        collision: number,
        血条高度: number,
        unitSound: string,
        scale: number,
    }
}


const data: xlsx_inte_演员单位 = {
    "助手": {
        名字: "助手",
        类别: "助手",
        等级: 1,
        基础生命值: 100,
        攻击力: 1,
        防御: 10,
        cool1: 100,
        spd: 300,
        属性: {
            基础魔抗: 100,
            魔抗加成: 1
        },
        acquire: 150,
        rangeN1: 150,
        movetp: "fly",
        moveHeight: 100,
        file: "units\\human\\phoenix\\phoenix",
        modelScale: 1,
        RGBA: [],
        弹道模型: "",
        弹道大小: 1,
        弹道速度: 700,
        collision: 16,
        血条高度: 150,
        unitSound: "",
        scale: 1,
    },
    "单位": {
        名字: "单位",
        类别: "单位",
        等级: 1,
        基础生命值: 5000,
        攻击力: 100,
        防御: 10,
        cool1: 100,
        spd: 300,
        属性: {
            基础魔抗: 100,
            魔抗加成: 2
        },
        acquire: 150,
        rangeN1: 150,
        movetp: "foot",
        moveHeight: 0,
        file: "units\\human\\Knight\\Knight",
        modelScale: 1,
        RGBA: [100, 255, 255],
        弹道模型: "",
        弹道大小: 1,
        弹道速度: 700,
        collision: 16,
        血条高度: 150,
        unitSound: "",
        scale: 1,
    },
    "test": {
        名字: "test",
        类别: "英雄",
        等级: 1,
        基础生命值: 5000,
        攻击力: 1000,
        防御: 10,
        cool1: 100,
        spd: 300,
        属性: {
            基础魔抗: 100,
            魔抗加成: 3
        },
        acquire: 150,
        rangeN1: 150,
        movetp: "foot",
        moveHeight: 0,
        file: "units\\nightelf\\HeroDemonHunter\\HeroDemonHunter",
        modelScale: 1,
        RGBA: [],
        弹道模型: "",
        弹道大小: 1,
        弹道速度: 700,
        collision: 16,
        血条高度: 150,
        unitSound: "",
        scale: 1,
    },
    "剑圣": {
        名字: "剑圣",
        类别: "英雄",
        等级: 1,
        基础生命值: 5000,
        攻击力: 500,
        防御: 10,
        cool1: 100,
        spd: 300,
        属性: {
            基础魔抗: 100,
            魔抗加成: 4
        },
        acquire: 150,
        rangeN1: 150,
        movetp: "foot",
        moveHeight: 0,
        file: "units\\demon\\HeroChaosBladeMaster\\HeroChaosBladeMaster",
        modelScale: 1,
        RGBA: [],
        弹道模型: "",
        弹道大小: 1,
        弹道速度: 700,
        collision: 16,
        血条高度: 150,
        unitSound: "",
        scale: 1,
    },
    "冰雪法师": {
        名字: "冰雪法师",
        类别: "英雄",
        等级: 1,
        基础生命值: 5000,
        攻击力: 100,
        防御: 10,
        cool1: 100,
        spd: 300,
        属性: {
            基础魔抗: 100,
            魔抗加成: 5
        },
        acquire: 700,
        rangeN1: 700,
        movetp: "foot",
        moveHeight: 0,
        file: "units\\human\\Jaina\\Jaina",
        modelScale: 1,
        RGBA: [],
        弹道模型: "Abilities\\Weapons\\LichMissile\\LichMissile.mdl",
        弹道大小: 1,
        弹道速度: 700,
        collision: 16,
        血条高度: 150,
        unitSound: "",
        scale: 1,
    },
}
export const xlsx_data_演员单位 = data;

//code
export default function () {

    for (let datum of data) {
        if (datum.id) {
            ActorTypeUtil.registerActorType(datum as any);
        }
    }
}