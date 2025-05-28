import ActorTypeUtil from "@/ActorTypeUtil";

export const xlsx_inte_keys_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1 = [
"id","str","icon","default","num","num1","num2","bool","object","array"
];

export interface xlsx_inte_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1 {
    [key: string]: {
        "id"?: string;    // 自定义id
        "str"?: string;    // 字符串
        "icon"?: number | string;    // 路径
        "default"?: string;    // 法抗:58117}
        "num"?: number;    // 数字1
        "num1"?: number;    // 数字2
        "num2"?: number;    // 科学计数法
        "bool"?: boolean;    // 布尔值
        "object"?: any;    // 对象
        "array"?: any;    // 数组
    }
}

export const xlsx_data_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1: xlsx_inte_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1 = {
    "测试id1":{
        "id": "测试id1",
        "str": "字符串测试1aaaabbbbccccdddd",
        "icon": "a\\c\\b\\s.blp",
        "default": "aaa",
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
        "default": "{防御:2785,",
        "num1": 15.897,
        "num2": 1234e3,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58117},
        "array": [85, 13, 598]
    },
    "测试id3":{
        "id": "测试id3",
        "str": "字符串测试3",
        "icon": 40,
        "default": "{防御:2785,",
        "num1": -21.076,
        "num2": -1234.56e-3,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1001},
        "array": [1, 2, 4]
    },
    "测试id4":{
        "id": "测试id4",
        "str": "字符串测试1aaaabbbbccccdddd",
        "icon": "a\\c\\b\\s.blp",
        "default": "{防御:2785,",
        "num": 138,
        "num1": -58.049,
        "num2": 1234567.89e+6,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58118},
        "array": [85, 13, 599]
    },
    "测试id5":{
        "id": "测试id5",
        "icon": "a\\c\\b\\s.blp",
        "default": "{防御:2785,",
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
        "default": "{防御:2785,",
        "num": 140,
        "num1": -131.995,
        "num2": 1e10,
        "bool": false,
        "object": {'防御': 2785, '法抗': 58119},
        "array": [85, 13, 600]
    },
    "测试id9":{
        "id": "测试id9",
        "str": "字符串测试9",
        "icon": "a\\c\\b\\s.blp",
        "default": "{防御:2785,",
        "num": 141,
        "num1": -168.968,
        "num2": 1e11,
        "bool": true,
        "object": {'基础攻击': 500, '基础生命': 1003},
        "array": [1, 2, 6]
    },
};

export class xlsx_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1 {
    static Start() {
        const data=xlsx_data_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_Sheet1;
            for (let datum of data) {
                if (datum.id) {
                    ActorTypeUtil.registerActorType(datum as any);
                }
            }
    }
}
