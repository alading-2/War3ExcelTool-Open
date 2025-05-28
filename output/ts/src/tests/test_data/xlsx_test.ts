export const xlsx_inte_keys_test = [
"注释1","注释2","注释3","注释4"
];

export interface xlsx_inte_test {
    [key: string]: {
        "注释1"?: number | string;    // Column1
        "注释2"?: string;    // Column2
        "注释3"?: number | string;    // Column3
        "注释4"?: boolean | string;    // Column4
    }
}

export const xlsx_data_test: xlsx_inte_test = {
    "id":{
        "注释1": "id",
        "注释2": "name",
        "注释3": "age",
        "注释4": "active"
    },
    "1":{
        "注释1": 1,
        "注释2": "Alice",
        "注释3": 25,
        "注释4": true
    },
    "2":{
        "注释1": 2,
        "注释2": "Bob",
        "注释3": 30,
        "注释4": false
    },
    "4":{
        "注释1": 4,
        "注释2": "David",
        "注释3": 40,
        "注释4": true
    },
};

export class xlsx_test {
    static Start() {
        const data=xlsx_data_test;
    }
}
