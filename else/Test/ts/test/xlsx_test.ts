// This file is auto-generated from Excel data

export const xlsx_inte_keys_test = [
"id","str","icon","num","float","num1","bool","object","array","empty","s1"
];

export interface xlsx_inte_test {
    [key: string]: {
    "id"?: string;
        "str"?: string;
        "icon"?: string;
        "num"?: number;
        "float"?: number;
        "num1"?: number;
        "bool"?: boolean;
        "object"?: any;
        "array"?: any;
        "empty"?: any;
        "s1"?: string;
    }
}

export const xlsx_data_test: xlsx_inte_test = {
    "测试id1":{
        "id": "测试id1",
        "str": "字符串测试12",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 135,
        "float": 52.87,
        "num1": 1e5,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1000},
        "array": [1, 2, 3],
        "s1": ""
    },
    "测试id2":{
        "id": "测试id2",
        "str": "字符串测试13",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 136,
        "float": 15.897,
        "num1": 1e6,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58117},
        "array": [85, 13, 598],
        "empty": false
    }
};

export class xlsx_test {
    static Start() {
        const data=xlsx_data_test;
    }
}
