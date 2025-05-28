export const xlsm_inte_keys_lua物编_xlua_v22_技能 = [
"留空则自动生成ID","ability","Name","Tip","Ubertip","levels","DataA","DataB","Hotkey","Art","Missileart","Missilespeed","Missilearc","hero","item","Dur1","HeroDur1","Cost1","Area1","Buttonpos1","Buttonpos2","colorR","colorB","colorG"
];

export interface xlsm_inte_lua物编_xlua_v22_技能 {
    [key: string]: {
        "留空则自动生成ID"?: any;    // 自定义ID
        "ability"?: any;    // 模板
        "Name"?: any;    // 名字
        "Tip"?: any;    // 提示工具-基础
        "Ubertip"?: any;    // 提示工具扩展
        "levels"?: any;    // 等级
        "DataA"?: any;    // DataA
        "DataB"?: any;    // DataB
        "Hotkey"?: any;    // 热键
        "Art"?: any;    // 界面图标
        "Missileart"?: any;    // 投射物
        "Missilespeed"?: any;    // 弹道速率
        "Missilearc"?: any;    // 弹道弧度
        "hero"?: any;    // 英雄技能
        "item"?: any;    // 物品技能
        "Dur1"?: any;    // 持续时间-普通
        "HeroDur1"?: any;    // 持续时间-普通
        "Cost1"?: any;    // 法力消耗
        "Area1"?: any;    // 影响距离
        "Buttonpos1"?: any;    // 按钮位置x
        "Buttonpos2"?: any;    // 按钮位置y
        "colorR"?: any;    // 颜色红
        "colorB"?: any;    // 颜色蓝
        "colorG"?: any;    // 颜色绿
    }
}

export const xlsm_data_lua物编_xlua_v22_技能: xlsm_inte_lua物编_xlua_v22_技能 = {

};

export class xlsm_lua物编_xlua_v22_技能 {
    static Start() {
        const data=xlsm_data_lua物编_xlua_v22_技能;
    }
}
