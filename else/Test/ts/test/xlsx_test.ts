export const xlsx_inte_keys_test = [
"id","str","icon","num","num1","num2","bool","object","array","empty","s1"
];

export interface xlsx_inte_test {
    [key: string]: {
    "id"?: string;
        "str"?: string;
        "icon"?: string;
        "num"?: number;
        "num1"?: number;
        "num2"?: number;
        "bool"?: boolean;
        "object"?: any;
        "array"?: any;
        "empty"?: boolean;
        "s1"?: string;
    }
}

export const xlsx_data_test: xlsx_inte_test = {
    "测试id3":{
        "id": "测试id3",
        "str": "字符串测试3",
        "num1": -21.076,
        "num2": -1234.56e-3,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1001},
        "array": [1, 2, 4],
        "s1": ""
    },
    "测试id4":{
        "id": "测试id4",
        "str": "字符串测试4",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 138,
        "num1": -58.049,
        "num2": 1234567.89e+6,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58118},
        "array": [85, 13, 599],
        "empty": false
    },
    "测试id5":{
        "id": "测试id5",
        "str": "字符串测试5",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 139,
        "num1": -95.022,
        "num2": 1234567.89,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1002},
        "array": [1, 2, 5],
        "s1": ""
    },
    "测试id8":{
        "id": "测试id8",
        "str": "字符串测试8",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 140,
        "num1": -131.995,
        "num2": 1e10,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58119},
        "array": [85, 13, 600],
        "empty": false
    },
    "测试id9":{
        "id": "测试id9",
        "str": "字符串测试9",
        "icon": "ReplaceableTextures\CommandButtons\BTNStormBolt.blp",
        "num": 141,
        "num1": -168.968,
        "num2": 1e11,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1003},
        "array": [1, 2, 6],
        "s1": ""
    }
};

export class xlsx_test {
    static Start() {
        const data=xlsx_data_test;
    }
}
