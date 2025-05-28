export const xlsm_inte_keys_lua物编_xlua_v22_配置项 = [
"开始行","3"
];

export interface xlsm_inte_lua物编_xlua_v22_配置项 {
    [key: string]: {
        "开始行"?: string;    // [生成配置]
        "3"?: number | string;    // 值
    }
}

export const xlsm_data_lua物编_xlua_v22_配置项: xlsm_inte_lua物编_xlua_v22_配置项 = {
    "结束行":{
        "开始行": "结束行",
        "3": 3
    },
    "起始id":{
        "开始行": "起始id",
        "3": 1
    },
    "附带函数框架":{
        "开始行": "附带函数框架",
        "3": 1
    },
    "附带函数名":{
        "开始行": "附带函数名",
        "3": "aa"
    },
    "是否引用":{
        "开始行": "是否引用",
        "3": 1
    },
    "处理颜色的项目":{
        "开始行": "处理颜色的项目",
        "3": "Name;Description;Tip;Ubertip"
    },
    "代码生成类型":{
        "开始行": "代码生成类型",
        "3": 2
    },
    "-END-":{
        "开始行": "-END-",
        "3": "请勿删除该行或改名"
    },
};

export class xlsm_lua物编_xlua_v22_配置项 {
    static Start() {
        const data=xlsm_data_lua物编_xlua_v22_配置项;
    }
}
