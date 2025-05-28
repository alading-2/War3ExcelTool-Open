export const xlsx_inte_keys_演员buff.ts = [
"id","class","name","describe","kind","dur","interval","levelMax","attribute","priority","isDebuff","levelDurMode","icon","modelAttachTarget","model"
];

export interface xlsx_inte_演员buff.ts {
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
        "name"?: string;    // 名字
        "describe"?: string;    // 提示说明
        "kind"?: any;    // 种类
        "dur"?: number;    // 持续时间
        "interval"?: any;    // 间隔
        "levelMax"?: any;    // 叠加层数上限
        "attribute"?: any;    // buff附加属性
        "priority"?: any;    // 优先级
        "isDebuff"?: boolean;    // 是否Debuff
        "levelDurMode"?: boolean;    // 每层buff独立计时
        "icon"?: string;    // 图标
        "modelAttachTarget"?: string;    // 目标附加点
        "model"?: string;    // 目标附加模型
    }
}

export const xlsx_data_演员buff.ts: xlsx_inte_演员buff.ts = {
    "眩晕":{
        "id": "眩晕",
        "class": "基础",
        "name": "${id}",
        "describe": "${id}",
        "dur": 5,
        "isDebuff": true,
        "levelDurMode": true,
        "icon": "ReplaceableTextures\\CommandButtons\\BTNStun.blp",
        "modelAttachTarget": "overhead",
        "model": "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl"
    },
};

export class xlsx_演员buff.ts {
    static Start() {
        const data=xlsx_data_演员buff.ts;
    }
}
