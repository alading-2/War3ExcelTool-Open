export const xls_inte_keys_xls格式 = [
"id","str","icon","num","num1","num2","bool","object","array","empty"
];

export interface xls_inte_xls格式 {
    [key: string]: {
        "id"?: string;    // 自定义id
        "str"?: string;    // 字符串
        "icon"?: number | string;    // 路径
        "num"?: number;    // 数字1
        "num1"?: number;    // 数字2
        "num2"?: number;    // 科学计数法
        "bool"?: boolean;    // 布尔值
        "object"?: any;    // 对象
        "array"?: any;    // 数组
        "empty"?: boolean;    // 空白
    }
}

export const xls_data_xls格式: xls_inte_xls格式 = {
    "测试id1":{
        "id": "测试id1",
        "str": "字符串测试1",
        "icon": "a\\c\\b\\s.blp",
        "num": 1234567.89,
        "num1": 52.87,
        "num2": 1e5,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1000},
        "array": [1, 2, 3]
    },
    "测试id2":{
        "id": "测试id2",
        "str": "字符串测试2",
        "icon": 40,
        "num1": 15.897,
        "num2": 1234e3,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58117},
        "array": [85, 13, 598],
        "empty": false
    },
    "测试id3":{
        "id": "测试id3",
        "str": "",
        "icon": 40,
        "num1": -21.076,
        "num2": -1234.56e-3,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1001},
        "array": [1, 2, 4]
    },
    "测试id4":{
        "id": "测试id4",
        "str": "",
        "icon": "a\\c\\b\\s.blp",
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
        "str": "",
        "icon": "a\\c\\b\\s.blp",
        "num": 139,
        "num1": -95.022,
        "num2": 1234567.89,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1002},
        "array": [1, 2, 5]
    },
    "测试id8":{
        "id": "测试id8",
        "str": "字符串测试8",
        "icon": "a\\c\\b\\s.blp",
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
        "icon": "a\\c\\b\\s.blp",
        "num": 141,
        "num1": -168.968,
        "num2": 1e11,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1003},
        "array": [1, 2, 6]
    },
};

export class xls_xls格式 {
    static Start() {
        const data=xls_data_xls格式;
    }
}
