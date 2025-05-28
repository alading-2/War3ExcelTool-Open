export const xlsx_inte_keys_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表 = [
"id","str","icon","num","num1","num2","bool","object","array","empty"
];

export interface xlsx_inte_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表 {
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

export const xlsx_data_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表: xlsx_inte_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表 = {
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
};

export class xlsx_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表 {
    static Start() {
        const data=xlsx_data_test_3d4147f1-bc71-4480-8b59-ffc2fda5b64b_中文工作表;
    }
}
