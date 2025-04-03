// This file is auto-generated from Excel data

import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_演员buff = [
"id","class","name","describe","kind","dur","interval","levelMax","attribute","priority","isDebuff","levelDurMode","icon","modelAttachTarget","model"
];

export interface xlsx_inte_演员buff {
    [key: string]: {
    "id"?: string;
        "class"?: string;
        "name"?: string;
        "describe"?: string;
        "kind"?: any;
        "dur"?: number;
        "interval"?: any;
        "levelMax"?: any;
        "attribute"?: any;
        "priority"?: any;
        "isDebuff"?: boolean;
        "levelDurMode"?: boolean;
        "icon"?: string;
        "modelAttachTarget"?: string;
        "model"?: string;
    }
}

export const xlsx_data_演员buff: xlsx_inte_演员buff = {
    "眩晕":{
        "id": "眩晕",
        "class": "基础",
        "name": "${id}",
        "describe": "${id}",
        "dur": 5,
        "isDebuff": true,
        "levelDurMode": true,
        "icon": "ReplaceableTextures\CommandButtons\BTNStun.blp",
        "modelAttachTarget": "overhead",
        "model": "Abilities\Spells\Human\Thunderclap\ThunderclapTarget.mdl"
    }
};

export class xlsx_演员buff {
    static Start() {
        const data=xlsx_data_演员buff;
        for (let datum of data) {
        if (datum.id) {
        ActorTypeUtil.registerActorType(datum as any);
        }
        }
    }
}
