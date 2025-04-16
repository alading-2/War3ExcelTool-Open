export const xlsx_inte_keys_table_Server = [
"父档名称","子档数据长度","子档名称"
];

export interface xlsx_inte_table_Server {
    [key: string]: {
        "父档名称"?: string;    // 平台索引
        "子档数据长度"?: number;    // 长度
        "子档名称"?: string;    // 具体索引
    }
}

export const xlsx_data_table_Server: xlsx_inte_table_Server = {
    "通关":{
        "父档名称": "通关",
        "子档数据长度": 1,
        "子档名称": "P1"
    },
};

export class xlsx_table_Server {
    static Start() {
        const data=xlsx_data_table_Server;
    }
}
