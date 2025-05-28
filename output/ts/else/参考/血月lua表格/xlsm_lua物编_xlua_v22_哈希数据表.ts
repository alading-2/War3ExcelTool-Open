export const xlsm_inte_keys_lua物编_xlua_v22_哈希数据表 = [
"主索引说明
v
v","udg_table_name","100","1001","11","22"
];

export interface xlsm_inte_lua物编_xlua_v22_哈希数据表 {
    [key: string]: {
        "主索引说明
v
v"?: string;    // nan
        "udg_table_name"?: string;    // 子索引说明>>
        "100"?: number;    // 说明
        "1001"?: number;    // R主属性
        "11"?: any;    // S开头强制整列为字符串
        "22"?: any;    // I开头强制整列为整数
    }
}

export const xlsm_data_lua物编_xlua_v22_哈希数据表: xlsm_inte_lua物编_xlua_v22_哈希数据表 = {
    "农民":{
        "主索引说明
v
v": "农民",
        "udg_table_name": "hpea",
        "100": 111,
        "1001": 999
    },
};

export class xlsm_lua物编_xlua_v22_哈希数据表 {
    static Start() {
        const data=xlsm_data_lua物编_xlua_v22_哈希数据表;
    }
}
