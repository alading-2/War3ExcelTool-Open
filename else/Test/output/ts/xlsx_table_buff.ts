export const xlsx_inte_keys_table_buff = [
"name","icon","cool","type"
];

export interface xlsx_inte_table_buff {
    [key: string]: {
        "name"?: string;    // 名称
        "icon"?: string;    // 图标
        "cool"?: number;    // 冷却
        "type"?: string;    // 元素
    }
}

export const xlsx_data_table_buff: xlsx_inte_table_buff = {
    "buff1":{
        "name": "buff1",
        "icon": "",
        "cool": 1,
        "type": ""
    },
};

export class xlsx_table_buff {
    static Start() {
        const data=xlsx_data_table_buff;
    }
}
