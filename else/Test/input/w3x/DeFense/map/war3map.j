globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from DeleteDeathUnit:
constant boolean LIBRARY_DeleteDeathUnit=true
group DeleteDeathUnit___GgGroup_DeathUnit
timer DeleteDeathUnit___GtTimer_DeathUnit
integer DeleteDeathUnit___GiTimerID_DeathUnit
constant real DeleteDeathUnit___GrInterval_DeathUnit= 0.5
//endglobals from DeleteDeathUnit
//globals from HashTable:
constant boolean LIBRARY_HashTable=true
hashtable htCommomHT
hashtable htTimerHT
hashtable htUnitHT
hashtable htTriggerHT
//endglobals from HashTable
//globals from I2H:
constant boolean LIBRARY_I2H=true
hashtable I2H__ht=InitHashtable()
//endglobals from I2H
//globals from LiEffectFront:
constant boolean LIBRARY_LiEffectFront=true
constant integer iEffeFont_Crit= 1
constant integer iEffeFont_SpelCrit= 2
constant integer iEffeFont_RestLife= 3
string array sStrFont_Crit
string array sStrFont_SpelCrit
string array sStrFont_RestLife
//endglobals from LiEffectFront
//globals from MNEVENT:
constant boolean LIBRARY_MNEVENT=true
trigger MNEVENT___MNDamageEventTrigger= null
trigger array MNEVENT___DamageEventQueue
integer MNEVENT___DamageEventNumber= 0
timer MNEVENT___time= CreateTimer()
group MNEVENT___UnitGroup= CreateGroup()
triggeraction MNEVENT___ta
//endglobals from MNEVENT
//globals from Math:
constant boolean LIBRARY_Math=true
//endglobals from Math
//globals from SetDamageWay:
constant boolean LIBRARY_SetDamageWay=true
timer SetDamageWay___tTimer_Damage
integer SetDamageWay___iTimerID_Damage
integer SetDamageWay___iNum_Damage= 0
integer array SetDamageWay___iData_Damage
boolean SetDamageWay___bTimerState_Damage= false
constant real rTimerInterval_Damage= 0.1
        
        //Damage
constant integer GroupDamage_Once= 1
constant integer GroupDamage_Multi= 2
constant integer SingleDamage= 11
//endglobals from SetDamageWay
//globals from SetHeightAcceleration:
constant boolean LIBRARY_SetHeightAcceleration=true
timer SetHeightAcceleration___tTimer_SetHeight_Acce
integer SetHeightAcceleration___iTimerID_SetHeight_Acce
integer SetHeightAcceleration___iNum_SetHeight_Acce= 0
integer array SetHeightAcceleration___iData_SetHeight_Acce
boolean SetHeightAcceleration___bTimerState_SetHeight_Acce= false
constant real rTimerInterval_SetHeight_Acce= 0.03
        
        //SetHeight_AcceWay
constant integer SetHeight_Acce_Up= 1
constant integer SetHeight_Acce_Down= 2
constant integer SetHeight_Acce_UpAndDown= 3
//endglobals from SetHeightAcceleration
//globals from SetHeightWay:
constant boolean LIBRARY_SetHeightWay=true
timer SetHeightWay___tTimer_Height
integer SetHeightWay___iTimerID_Height
integer SetHeightWay___iNum_Height= 0
integer array SetHeightWay___iData_Height
boolean SetHeightWay___bTimerState_Height= false
constant real rTimerInterval_Height= 0.03
        
        //SetHeightWay
constant integer SetHeightWay_Up= 1
constant integer SetHeightWay_Down= 2
constant integer SetHeightWay_UpAndDown= 3
//endglobals from SetHeightWay
//globals from UnitState:
constant boolean LIBRARY_UnitState=true
//endglobals from UnitState
//globals from View:
constant boolean LIBRARY_View=true
//endglobals from View
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEAbilityState:
constant boolean LIBRARY_YDWEAbilityState=true
constant integer YDWEAbilityState___ABILITY_STATE_COOLDOWN= 1
constant integer YDWEAbilityState___ABILITY_DATA_TARGS= 100
constant integer YDWEAbilityState___ABILITY_DATA_CAST= 101
constant integer YDWEAbilityState___ABILITY_DATA_DUR= 102
constant integer YDWEAbilityState___ABILITY_DATA_HERODUR= 103
constant integer YDWEAbilityState___ABILITY_DATA_COST= 104
constant integer YDWEAbilityState___ABILITY_DATA_COOL= 105
constant integer YDWEAbilityState___ABILITY_DATA_AREA= 106
constant integer YDWEAbilityState___ABILITY_DATA_RNG= 107
constant integer YDWEAbilityState___ABILITY_DATA_DATA_A= 108
constant integer YDWEAbilityState___ABILITY_DATA_DATA_B= 109
constant integer YDWEAbilityState___ABILITY_DATA_DATA_C= 110
constant integer YDWEAbilityState___ABILITY_DATA_DATA_D= 111
constant integer YDWEAbilityState___ABILITY_DATA_DATA_E= 112
constant integer YDWEAbilityState___ABILITY_DATA_DATA_F= 113
constant integer YDWEAbilityState___ABILITY_DATA_DATA_G= 114
constant integer YDWEAbilityState___ABILITY_DATA_DATA_H= 115
constant integer YDWEAbilityState___ABILITY_DATA_DATA_I= 116
constant integer YDWEAbilityState___ABILITY_DATA_UNITID= 117

constant integer YDWEAbilityState___ABILITY_DATA_HOTKET= 200
constant integer YDWEAbilityState___ABILITY_DATA_UNHOTKET= 201
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_HOTKEY= 202
constant integer YDWEAbilityState___ABILITY_DATA_NAME= 203
constant integer YDWEAbilityState___ABILITY_DATA_ART= 204
constant integer YDWEAbilityState___ABILITY_DATA_TARGET_ART= 205
constant integer YDWEAbilityState___ABILITY_DATA_CASTER_ART= 206
constant integer YDWEAbilityState___ABILITY_DATA_EFFECT_ART= 207
constant integer YDWEAbilityState___ABILITY_DATA_AREAEFFECT_ART= 208
constant integer YDWEAbilityState___ABILITY_DATA_MISSILE_ART= 209
constant integer YDWEAbilityState___ABILITY_DATA_SPECIAL_ART= 210
constant integer YDWEAbilityState___ABILITY_DATA_LIGHTNING_EFFECT= 211
constant integer YDWEAbilityState___ABILITY_DATA_BUFF_TIP= 212
constant integer YDWEAbilityState___ABILITY_DATA_BUFF_UBERTIP= 213
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_TIP= 214
constant integer YDWEAbilityState___ABILITY_DATA_TIP= 215
constant integer YDWEAbilityState___ABILITY_DATA_UNTIP= 216
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_UBERTIP= 217
constant integer YDWEAbilityState___ABILITY_DATA_UBERTIP= 218
constant integer YDWEAbilityState___ABILITY_DATA_UNUBERTIP= 219
constant integer YDWEAbilityState___ABILITY_DATA_UNART= 220
//endglobals from YDWEAbilityState
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//ȫ�ֹ�ϣ�� 
hashtable YDHT= null
string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//全局系统变量
unit bj_lastAbilityCastingUnit=null
unit bj_lastAbilityTargetUnit=null
unit bj_lastPoolAbstractedUnit=null
unitpool bj_lastCreatedUnitPool=null
item bj_lastPoolAbstractedItem=null
itempool bj_lastCreatedItemPool=null
attacktype bj_lastSetAttackType= ATTACK_TYPE_NORMAL
damagetype bj_lastSetDamageType= DAMAGE_TYPE_NORMAL
weapontype bj_lastSetWeaponType= WEAPON_TYPE_WHOKNOWS
real yd_MapMaxX= 0
real yd_MapMinX= 0
real yd_MapMaxY= 0
real yd_MapMinY= 0
string array YDWEBase___yd_PlayerColor
trigger array YDWEBase___AbilityCastingOverEventQueue
integer array YDWEBase___AbilityCastingOverEventType
integer YDWEBase___AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEEventDamageData:
constant boolean LIBRARY_YDWEEventDamageData=true
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_VAILD= 0
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_PHYSICAL= 1
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK= 2
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_RANGED= 3
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_DAMAGE_TYPE= 4
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_WEAPON_TYPE= 5
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_ATTACK_TYPE= 6
//endglobals from YDWEEventDamageData
//globals from YDWEJapiEffect:
constant boolean LIBRARY_YDWEJapiEffect=true
//endglobals from YDWEJapiEffect
//globals from YDWEJapiUnit:
constant boolean LIBRARY_YDWEJapiUnit=true
//endglobals from YDWEJapiUnit
//globals from YDWETriggerEvent:
constant boolean LIBRARY_YDWETriggerEvent=true
trigger yd_DamageEventTrigger= null
trigger array YDWETriggerEvent___DamageEventQueue
integer YDWETriggerEvent___DamageEventNumber= 0
	
item bj_lastMovedItemInItemSlot= null
	
trigger YDWETriggerEvent___MoveItemEventTrigger= null
trigger array YDWETriggerEvent___MoveItemEventQueue
integer YDWETriggerEvent___MoveItemEventNumber= 0
//endglobals from YDWETriggerEvent
//globals from YDWEYDWEJapiScript:
constant boolean LIBRARY_YDWEYDWEJapiScript=true
constant integer YDWE_OBJECT_TYPE_ABILITY= 0
constant integer YDWE_OBJECT_TYPE_BUFF= 1
constant integer YDWE_OBJECT_TYPE_UNIT= 2
constant integer YDWE_OBJECT_TYPE_ITEM= 3
constant integer YDWE_OBJECT_TYPE_UPGRADE= 4
constant integer YDWE_OBJECT_TYPE_DOODAD= 5
constant integer YDWE_OBJECT_TYPE_DESTRUCTABLE= 6
//endglobals from YDWEYDWEJapiScript
//globals from silingE:
constant boolean LIBRARY_silingE=true
//endglobals from silingE
//globals from BarrageSystem:
constant boolean LIBRARY_BarrageSystem=true
timer BarrageSystem___tTimer_Barrage
integer BarrageSystem___iTimerID_Barrage
integer BarrageSystem___iNum_Barrage= 0
integer array BarrageSystem___iData_Barrage
boolean BarrageSystem___bTimerState_Barrage= false
constant real rTimerInterval_Barrage= 0.03
        
//endglobals from BarrageSystem
//globals from Commom:
constant boolean LIBRARY_Commom=true
constant integer PlayerNum= 4
//endglobals from Commom
//globals from YDWETimerSystem:
constant boolean LIBRARY_YDWETimerSystem=true
integer YDWETimerSystem___CurrentTime
integer YDWETimerSystem___CurrentIndex
integer YDWETimerSystem___TaskListHead
integer YDWETimerSystem___TaskListIdleHead
integer YDWETimerSystem___TaskListIdleMax
integer array YDWETimerSystem___TaskListIdle
integer array YDWETimerSystem___TaskListNext
integer array YDWETimerSystem___TaskListTime
trigger array YDWETimerSystem___TaskListProc
trigger YDWETimerSystem___fnRemoveUnit
trigger YDWETimerSystem___fnDestroyTimer
trigger YDWETimerSystem___fnRemoveItem
trigger YDWETimerSystem___fnDestroyEffect
trigger YDWETimerSystem___fnDestroyLightning
trigger YDWETimerSystem___fnRunTrigger
timer YDWETimerSystem___Timer
integer YDWETimerSystem___TimerHandle
integer YDWETimerSystem___TimerSystem_RunIndex= 0
//endglobals from YDWETimerSystem
//globals from ChargeArrowSystem:
constant boolean LIBRARY_ChargeArrowSystem=true
timer ChargeArrowSystem___tTimer_ChargeArrow
integer ChargeArrowSystem___iTimerID_ChargeArrow
integer ChargeArrowSystem___iNum_ChargeArrow= 0
integer array ChargeArrowSystem___iData_ChargeArrow
boolean ChargeArrowSystem___bTimerState_ChargeArrow= false
constant real rTimerInterval_ChargeArrow= 0.03
//endglobals from ChargeArrowSystem
//globals from ChargeParabolaSystem:
constant boolean LIBRARY_ChargeParabolaSystem=true
timer ChargeParabolaSystem___tTimer_ChargeParabola
integer ChargeParabolaSystem___iTimerID_ChargeParabola
integer ChargeParabolaSystem___iNum_ChargeParabola= 0
integer array ChargeParabolaSystem___iData_ChargeParabola
boolean ChargeParabolaSystem___bTimerState_ChargeParabola= false
constant real rTimerInterval_ChargeParabola= 0.03
        
//endglobals from ChargeParabolaSystem
//globals from ChargeSystem:
constant boolean LIBRARY_ChargeSystem=true
timer ChargeSystem___tTimer_Charge
integer ChargeSystem___iTimerID_Charge
integer ChargeSystem___iNum_Charge= 0
integer array ChargeSystem___iData_Charge
boolean ChargeSystem___bTimerState_Charge= false
constant real rTimerInterval_Charge= 0.03
        
//endglobals from ChargeSystem
//globals from ChargeTraceSystem:
constant boolean LIBRARY_ChargeTraceSystem=true
timer ChargeTraceSystem___tTimer_ChargeTrace
integer ChargeTraceSystem___iTimerID_ChargeTrace
integer ChargeTraceSystem___iNum_ChargeTrace= 0
integer array ChargeTraceSystem___iData_ChargeTrace
boolean ChargeTraceSystem___bTimerState_ChargeTrace= false
constant real rTimerInterval_ChargeTrace= 0.03
        
//endglobals from ChargeTraceSystem
//globals from SurroundSystem:
constant boolean LIBRARY_SurroundSystem=true
timer SurroundSystem___tTimer_Surround
integer SurroundSystem___iTimerID_Surround
integer SurroundSystem___iNum_Surround= 0
integer array SurroundSystem___iData_Surround
boolean SurroundSystem___bTimerState_Surround= false
constant real rTimerInterval_Surround= 0.03
        
constant integer iSurroundMode_Coord= 1
constant integer iSurroundMode_Unit= 2
//endglobals from SurroundSystem
//globals from VerticalSurroundSystem:
constant boolean LIBRARY_VerticalSurroundSystem=true
timer VerticalSurroundSystem___tTimer_VerticalSurround
integer VerticalSurroundSystem___iTimerID_VerticalSurround
integer VerticalSurroundSystem___iNum_VerticalSurround= 0
integer array VerticalSurroundSystem___iData_VerticalSurround
boolean VerticalSurroundSystem___bTimerState_VerticalSurround= false
constant real rTimerInterval_VerticalSurround= 0.03
        
//endglobals from VerticalSurroundSystem
    // Generated
rect gg_rct_Rect_ChoiceHero= null
rect gg_rct_Rect_Brush= null
trigger gg_trg_View= null
trigger gg_trg_Math= null
trigger gg_trg_RB= null
trigger gg_trg_Commom= null
trigger gg_trg_UnitState= null
trigger gg_trg_HT= null
trigger gg_trg_Template______________________u= null
trigger gg_trg_ChargeSystem= null
trigger gg_trg_ChargeTraceSystem= null
trigger gg_trg_ChargeArrowSystem= null
trigger gg_trg_ChargeParabolaSystem= null
trigger gg_trg_SurroundSystem= null
trigger gg_trg_VerticalSurroundSystem= null
trigger gg_trg_SetHeightWay= null
trigger gg_trg_SetHeight_Acceleration= null
trigger gg_trg_SetDamageWay= null
trigger gg_trg_BarrageSystem= null
trigger gg_trg_DeleteDeathUnit= null
trigger gg_trg_JASSTemplate= null
trigger gg_trg_Brush= null
trigger gg_trg_Award= null
trigger gg_trg_BuffSystemOperation= null
trigger gg_trg_BuffSystem_Add_2= null
trigger gg_trg_BuffSystemAction= null
trigger gg_trg_BuffSystemWork= null
trigger gg_trg_BuffSystemTimer= null
trigger gg_trg_BuffSystem_Add= null
trigger gg_trg_BuffSystem_StateInit= null
trigger gg_trg_BuffSystem_BuffTypeInit= null
trigger gg_trg_BuffSystem_StructInit= null
trigger gg_trg_Test_Buff1_A01C= null
trigger gg_trg_Test_Buff2_A01D= null
trigger gg_trg_Test_Buff3_A01E= null
trigger gg_trg_Test_Buff4_A01N= null
trigger gg_trg_Test_Buff4_A01V= null
trigger gg_trg_Test_Buff5_A01Q= null
trigger gg_trg_Test_Buff6_A01R= null
trigger gg_trg_Test_Buff7_A01S= null
trigger gg_trg_fuwang_Q_A005= null
trigger gg_trg_fuwang_W= null
trigger gg_trg_fuwang_E_A008= null
trigger gg_trg_fuwang_E_A008_Learn= null
trigger gg_trg_fuwang_R_A007= null
trigger gg_trg_siling_Q_A00B= null
trigger gg_trg_siling_W_A009= null
trigger gg_trg_siling_E= null
trigger gg_trg_siling_R_A00C= null
trigger gg_trg_siling_R_explode= null
trigger gg_trg_xiaoxiao_Q_A00H= null
trigger gg_trg_xiaoxiao_W_A00I= null
trigger gg_trg_xiaoxiao_E_A00J= null
trigger gg_trg_xiaoxiao_E_A00J_Learn= null
trigger gg_trg_xiaoxiao_R_Learn= null
trigger gg_trg_zhuzai_Q_A00W= null
trigger gg_trg_zhuzai_R_A00M= null
trigger gg_trg_yougui_Q_A010= null
trigger gg_trg_youguiW= null
trigger gg_trg_youguiE= null
trigger gg_trg_yougui_R_A00O= null
trigger gg_trg_renma_Q_A018= null
trigger gg_trg_renma_W_A017= null
trigger gg_trg_renma_E_A016= null
trigger gg_trg_renma_R_A015= null
trigger gg_trg_AbilityTrigger= null
trigger gg_trg_LearnAbilityTrigger= null
trigger gg_trg_UnitDeath= null
trigger gg_trg_EffectFontInit= null
trigger gg_trg_DamageDisplay= null
trigger gg_trg_DamageSystem= null
trigger gg_trg_Ability_DamageTrigger= null
trigger gg_trg_Trig_UI_PlayTime_Init= null
trigger gg_trg_Trig_UI_PlayTime_Dynamic= null
trigger gg_trg_UI_LifeBar_Init= null
trigger gg_trg_UI_LifeBar_Dynamic= null
trigger gg_trg_UI_UnitStateInit= null
trigger gg_trg_UI_UnitState_String_Init= null
trigger gg_trg_UI_UnitStateDynamic= null
trigger gg_trg_UI_UnitStateTrigger= null
trigger gg_trg_UI_BuffSystemInit= null
trigger gg_trg_UI_BuffSystemDynamic= null
trigger gg_trg_UI_DamageDisPlayInit= null
trigger gg_trg_UI_DamageDisplayDynamic= null
trigger gg_trg_UI_Talent_Init= null
trigger gg_trg_UI_Archive_Init= null
trigger gg_trg_UI_Archive_String_Init= null
trigger gg_trg_UI_HighlightInit= null
trigger gg_trg_UIInit= null
trigger gg_trg_0_2_LeakDetection= null
trigger gg_trg_1_3_ChoiceHero= null
trigger gg_trg_1_4_HeroInit= null
trigger gg_trg_1_3ChoiceHero_1= null
trigger gg_trg_1_3ChoiceHero_2_Reskill= null
trigger gg_trg_1_5_F2Home= null
trigger gg_trg_1_6_pet= null
trigger gg_trg_1_7_RightClick= null
trigger gg_trg_1_8_HeroRevive= null
trigger gg_trg_1_9_Victory= null
trigger gg_trg_1_10_Defeat= null
trigger gg_trg_1_0_MapInit= null
trigger gg_trg_0_1_Global= null
trigger gg_trg_1_1_Init= null
trigger gg_trg_test1= null
trigger gg_trg_Test2= null
trigger gg_trg_MapTest= null
trigger gg_trg_BuffSystemTest1= null
trigger gg_trg_buffsysTest= null
trigger gg_trg_Test_TX= null
trigger gg_trg_test_Animation= null
trigger gg_trg_test_Hero= null
trigger gg_trg_DamageSystemTest= null
unit gg_unit_nbfl_0009= null
unit gg_unit_N00I_0136= null
unit gg_unit_N000_0016= null
unit gg_unit_E002_0017= null
unit gg_unit_E003_0037= null
unit gg_unit_hfoo_0052= null
integer Brush___GiWaveCount_Brush= 0
timer Brush___GtTimer_Brush
integer Brush___GiTimerID_Brush
timerdialog Brush___GtdTimerDialog_Brush
integer array GiBrushUnitType
integer array Brush___GiBrushUnitType_Boss
real Brush___GrComputer9Brush_x= - 1450
real Brush___GrComputer9Brush_y= 6200
real Brush___GrComputer10Brush_x= - 850
real Brush___GrComputer10Brush_y= 6200
real Brush___GrComputer11Brush_x= - 200
real Brush___GrComputer11Brush_y= 6200
real Brush___GrComputer12Brush_x= 350
real Brush___GrComputer12Brush_y= 6200
real Brush___GrBossBrush_x= - 550
real Brush___GrBossBrush_y= 6000
integer iBuffPolarity_Optimistic= 1
integer iBuffPolarity_Pesimistic= 2
//data
integer iBuffState_ATK= 1
integer iBuffState_Armor= 2
integer iBuffState_ATKSpeed= 3
integer iBuffState_MovementSpeed= 4
integer iBuffState_Stre= 5
integer iBuffState_Agil= 6
integer iBuffState_Inte= 7
string array sBuffTypeString
timer tTimer_BuffSyst
integer iTimerID_BuffSyst
//group gGroup_BuffSyst               //BUFF系统单位组
integer array iBuffSystUnitId
integer G_iUnitNum_BuffSyst= 0
boolean bTimerState_BuffSyst= false
constant real rTimerInterval_BuffSyst= 0.1
integer stG_BuffSystStruct_TranPara
integer iDamageSystemTest= 0
real rDamaSyst_ArmorFactor= 100
real rDamaSyst_SpellResisFactor= 100
integer array frUI_PlayTime
timer tTimer_UI_PlayTime
integer iTimerID_UI_PlayTime
integer frTest= 0
integer frUI_LifeBar_BackGround= 0
integer frUI_LifeBar_HeadPortrait= 0
integer frUI_LifeBar_Texture_Up= 0
integer frUI_LifeBar_Texture_Bottom= 0
integer frUI_LifeBar_Text= 0
string sTexture_BlackGound
string sTexture_Border
string array sTexture_Color
string array sLifeBarColorIndex
real array rWidth_UI_LifeBar
real array rHeight_UI_LifeBar
integer array frUI_UnitState
integer array frUI_UnitState_Text
integer array frUI_UnitState_Data
timer tTimer_UI_UnitStateDynamic
integer array frUI_BuffSystem
integer iG_UI_BuffNumMax= 10
integer array frUI_DamaDisp
integer array frUI_DamaDisp_Portrait
integer array frUI_DamaDisp_Color
integer array frUI_DamaDisp_Name
integer array frUI_DamaDisp_Data1
integer array frUI_DamaDisp_Data2
integer array frUI_DamaDisp_Data3
real rUI_DamaDisp_x
real array rUI_DamaDisp_y
timer tTimer_UI_DamaDisp
real rTimerInterval_DamaDisp= 0.03
integer array frUI_Talent
integer frUI_Talent_Model
integer array frUI_Archive
integer frUI_Archive_Text
integer frUI_Archive_Text_BlackGround
integer frUI_Archive_CloseButton_BlackGround
integer frUI_Archive_CloseButton
integer frUI_HeightLight
integer iPlayerNum= 5
real GrHeroBirth_x= - 600
real GrHeroBirth_y= - 7000
real GrBloodPool_x= - 550
real GrBloodPool_y= - 6500

    
    
    
    

trigger l__library_init

//JASSHelper struct globals:
constant integer si__DamageData=1
integer si__DamageData_F=0
integer si__DamageData_I=0
integer array si__DamageData_V
integer array s__DamageData_iDamageWay
unit array s__DamageData_uUnit
real array s__DamageData_rDamage
real array s__DamageData_rTotalTime
real array s__DamageData_rMoveTime
real array s__DamageData_iDamageTimeInterval
unit array s__DamageData_uGetDamageUnit
real array s__DamageData_rDamageRange
group array s__DamageData_gGroup
real array s__DamageData_rCount
constant integer si__SetHeight_AcceData=2
integer si__SetHeight_AcceData_F=0
integer si__SetHeight_AcceData_I=0
integer array si__SetHeight_AcceData_V
unit array s__SetHeight_AcceData_uUnit
real array s__SetHeight_AcceData_rTotalTime
real array s__SetHeight_AcceData_rTotalMoveTime
real array s__SetHeight_AcceData_rSwitchTime
real array s__SetHeight_AcceData_rMoveTime_Switch
integer array s__SetHeight_AcceData_iUpDownFlag
integer array s__SetHeight_AcceData_iFlyMode
real array s__SetHeight_AcceData_rInitHeight
real array s__SetHeight_AcceData_rTargetHeight
real array s__SetHeight_AcceData_rMaxHeight
real array s__SetHeight_AcceData_rMinHeight
real array s__SetHeight_AcceData_rCurrentHeight
real array s__SetHeight_AcceData_rInitSpeed
real array s__SetHeight_AcceData_rAcceleration
constant integer si__HeightData=3
integer si__HeightData_F=0
integer si__HeightData_I=0
integer array si__HeightData_V
unit array s__HeightData_uUnit
real array s__HeightData_rTotalTime
real array s__HeightData_rMoveTime
integer array s__HeightData_iFlyMode
integer array s__HeightData_iUpDownFlag
real array s__HeightData_rExtremeHeight
real array s__HeightData_rCurrentHeight
real array s__HeightData_rEveryHeight
constant integer si__BarrageData=4
integer si__BarrageData_F=0
integer si__BarrageData_I=0
integer array si__BarrageData_V
unit array s__BarrageData_uUnit
unit array s__BarrageData_uTargetUnit
boolean array s__BarrageData_bIsDestroyUnit
real array s__BarrageData_rTotalTime
real array s__BarrageData_rMoveTime
real array s__BarrageData_t
real array s__BarrageData_Everyt
real array s__BarrageData_rBt_x
real array s__BarrageData_rBt_y
real array s__BarrageData_P0_x
real array s__BarrageData_P0_y
real array s__BarrageData_P1_x
real array s__BarrageData_P1_y
real array s__BarrageData_P2_x
real array s__BarrageData_P2_y
real array s__BarrageData_P3_x
real array s__BarrageData_P3_y
constant integer si__ChargeArrowData=5
integer si__ChargeArrowData_F=0
integer si__ChargeArrowData_I=0
integer array si__ChargeArrowData_V
unit array s__ChargeArrowData_uUnit
boolean array s__ChargeArrowData_bIsDestroyUnit
real array s__ChargeArrowData_rInitx
real array s__ChargeArrowData_rInity
real array s__ChargeArrowData_rDegree
real array s__ChargeArrowData_rTotalTime
real array s__ChargeArrowData_rMoveTime
real array s__ChargeArrowData_rTotalDistance
real array s__ChargeArrowData_rMoveDistance
real array s__ChargeArrowData_rEveryDistance
boolean array s__ChargeArrowData_bIsHitUnit
unit array s__ChargeArrowData_uHitUnit
constant integer si__ChargeParabolaData=6
integer si__ChargeParabolaData_F=0
integer si__ChargeParabolaData_I=0
integer array si__ChargeParabolaData_V
unit array s__ChargeParabolaData_uUnit
boolean array s__ChargeParabolaData_bIsDestroyUnit
real array s__ChargeParabolaData_rInitx
real array s__ChargeParabolaData_rInity
real array s__ChargeParabolaData_rDegree
real array s__ChargeParabolaData_rTotalTime
real array s__ChargeParabolaData_rMoveTime
real array s__ChargeParabolaData_rTotalDistance
real array s__ChargeParabolaData_rMoveDistance
real array s__ChargeParabolaData_rEveryDistance
real array s__ChargeParabolaData_rSwitchTime
real array s__ChargeParabolaData_rMoveTime_Switch
real array s__ChargeParabolaData_rParabolaTimes
real array s__ChargeParabolaData_rReduceHeight
integer array s__ChargeParabolaData_iUpDownFlag
real array s__ChargeParabolaData_rInitHeight
real array s__ChargeParabolaData_rTargetHeight
real array s__ChargeParabolaData_rMaxHeight
real array s__ChargeParabolaData_rMinHeight
real array s__ChargeParabolaData_rCurrentHeight
real array s__ChargeParabolaData_rInitSpeed
real array s__ChargeParabolaData_rAcceleration
constant integer si__ChargeData=7
integer si__ChargeData_F=0
integer si__ChargeData_I=0
integer array si__ChargeData_V
unit array s__ChargeData_uUnit
boolean array s__ChargeData_bIsDestroyUnit
real array s__ChargeData_rInitx
real array s__ChargeData_rInity
real array s__ChargeData_rDegree
real array s__ChargeData_rTotalTime
real array s__ChargeData_rMoveTime
real array s__ChargeData_rTotalDistance
real array s__ChargeData_rMoveDistance
real array s__ChargeData_rEveryDistance
constant integer si__ChargeTraceData=8
integer si__ChargeTraceData_F=0
integer si__ChargeTraceData_I=0
integer array si__ChargeTraceData_V
unit array s__ChargeTraceData_uUnit
unit array s__ChargeTraceData_uTargetUnit
boolean array s__ChargeTraceData_bIsDestroyUnit
real array s__ChargeTraceData_rInitx
real array s__ChargeTraceData_rInity
real array s__ChargeTraceData_rDegree
real array s__ChargeTraceData_rTotalTime
real array s__ChargeTraceData_rMoveTime
real array s__ChargeTraceData_rEveryDistance
constant integer si__SurroundData=9
integer si__SurroundData_F=0
integer si__SurroundData_I=0
integer array si__SurroundData_V
integer array s__SurroundData_iSurroundMode
real array s__SurroundData_rSurrx
real array s__SurroundData_rSurry
unit array s__SurroundData_uCentreUnit
unit array s__SurroundData_uOutsideUnit
boolean array s__SurroundData_bIsDestroyUnit
real array s__SurroundData_rUnitFacDegree
real array s__SurroundData_rNowSurrDegree
real array s__SurroundData_rTotalSurrDegree
real array s__SurroundData_rMoveSurrDegree
real array s__SurroundData_rEverySurrDegree
real array s__SurroundData_rTotalTime
real array s__SurroundData_rMoveTime
real array s__SurroundData_rCentreDistance
real array s__SurroundData_rEveryDistance
constant integer si__VerticalSurroundData=10
integer si__VerticalSurroundData_F=0
integer si__VerticalSurroundData_I=0
integer array si__VerticalSurroundData_V
unit array s__VerticalSurroundData_uCentreUnit
unit array s__VerticalSurroundData_uOutsideUnit
boolean array s__VerticalSurroundData_bIsDestroyUnit
real array s__VerticalSurroundData_rSurrOffsetAngle
real array s__VerticalSurroundData_rNowSurrDegree
real array s__VerticalSurroundData_rTotalSurrDegree
real array s__VerticalSurroundData_rMoveSurrDegree
real array s__VerticalSurroundData_rEverySurrDegree
real array s__VerticalSurroundData_rTotalTime
real array s__VerticalSurroundData_rMoveTime
real array s__VerticalSurroundData_rCentreDistance
real array s__VerticalSurroundData_rEveryDistance
real array s__VerticalSurroundData_rAddHeight
constant integer si__EachBuffData=11
integer si__EachBuffData_F=0
integer si__EachBuffData_I=0
integer array si__EachBuffData_V
unit array s__EachBuffData_uBuffUnit
unit array s__EachBuffData_uAttackerUnit
string array s__EachBuffData_sBuffName
integer array s__EachBuffData_iBuffPolarity
real array s__EachBuffData_rBuffDuration
real array s__EachBuffData_rBuffTriggerTime
real array s__EachBuffData_rBuffMoveTime_Duration
real array s__EachBuffData_rBuffMoveTime_TriggerTime
boolean array s__EachBuffData_bIsBuffClean
real array s__EachBuffData_rBuffDamage
boolean array s__EachBuffData_bIsBuffLayer
integer array s__EachBuffData_iBuffLayer
integer array s__EachBuffData_iBuffLayerMax
integer array s__EachBuffData_iIsBuffDizziness
integer array s__EachBuffData_iIsBuffChangeShape
integer array s__EachBuffData_iIsBuffScare
integer array s__EachBuffData_iIsBuffBlind
integer array s__EachBuffData_iIsImmovable
integer array s__EachBuffData_iBuffState_Num
integer array s___EachBuffData_iBuffState_Type
constant integer s___EachBuffData_iBuffState_Type_size=5
integer array s__EachBuffData_iBuffState_Type
real array s___EachBuffData_rBuffState_Data
constant integer s___EachBuffData_rBuffState_Data_size=5
integer array s__EachBuffData_rBuffState_Data
effect array s__EachBuffData_eBuffEffect
trigger st__DamageData_TimerAction_Damage
trigger st__DamageData_Damage_Single
trigger st__DamageData_Damage_Group
trigger st__DamageData_onDestroy
trigger st__DamageData_destroy
trigger st__SetHeight_AcceData_TimerAction_SetHeight_Acce
trigger st__SetHeight_AcceData_onDestroy
trigger st__SetHeight_AcceData_destroy
trigger st__HeightData_TimerAction_Height
trigger st__HeightData_onDestroy
trigger st__HeightData_destroy
trigger st__BarrageData_SetControlPoint
trigger st__BarrageData_TimerAction_Barrage
trigger st__BarrageData_onDestroy
trigger st__BarrageData_destroy
trigger st__ChargeArrowData_TimerAction_ChargeArrow
trigger st__ChargeArrowData_onDestroy
trigger st__ChargeArrowData_destroy
trigger st__ChargeParabolaData_TimerAction_ChargeParabola
trigger st__ChargeParabolaData_onDestroy
trigger st__ChargeParabolaData_destroy
trigger st__ChargeData_TimerAction_Charge
trigger st__ChargeData_onDestroy
trigger st__ChargeData_destroy
trigger st__ChargeTraceData_TimerAction_ChargeTrace
trigger st__ChargeTraceData_onDestroy
trigger st__ChargeTraceData_destroy
trigger st__SurroundData_TimerAction_Surround
trigger st__SurroundData_onDestroy
trigger st__SurroundData_destroy
trigger st__VerticalSurroundData_TimerAction_VerticalSurround
trigger st__VerticalSurroundData_onDestroy
trigger st__VerticalSurroundData_destroy
trigger st__EachBuffData_create
trigger st__EachBuffData_onDestroy
trigger st__EachBuffData_destroy
integer f__arg_integer1
integer f__arg_this
integer f__result_integer

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzGetLocale takes nothing returns string
    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncPrefix takes nothing returns string
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzSyncBuffer takes string prefix, string data, integer dataLen returns nothing
    native DzSyncDataImmediately takes string prefix, string data returns nothing 
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
    native DzFrameSetPriority takes integer frame, integer priority returns nothing
    native DzFrameSetParent takes integer frame, integer parent returns nothing
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
    native DzGetClientWidth takes nothing returns integer
    native DzGetClientHeight takes nothing returns integer
    native DzFrameIsVisible takes integer frame returns boolean
    native DzFrameAddText takes integer frame, string text returns nothing
    native DzUnitSilence takes unit whichUnit, boolean disable returns nothing
    native DzUnitDisableAttack takes unit whichUnit, boolean disable returns nothing
    native DzUnitDisableInventory takes unit whichUnit, boolean disable returns nothing
    native DzUpdateMinimap takes nothing returns nothing
    native DzUnitChangeAlpha takes unit whichUnit, integer alpha, boolean forceUpdate returns nothing
    native DzUnitSetCanSelect takes unit whichUnit, boolean state returns nothing
    native DzUnitSetTargetable takes unit whichUnit, boolean state returns nothing
    native DzSaveMemoryCache takes string cache returns nothing
    native DzGetMemoryCache takes nothing returns string
    native DzSetSpeed takes real ratio returns nothing
    native DzConvertWorldPosition takes real x, real y, real z, code callback returns boolean
    native DzGetConvertWorldPositionX takes nothing returns real
    native DzGetConvertWorldPositionY takes nothing returns real
    native DzCreateCommandButton takes integer parent, string icon, string name, string desc returns integer
	native EXGetUnitAbility takes unit u, integer abilcode returns ability
	native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
	native EXGetAbilityId takes ability abil returns integer
	native EXGetAbilityState takes ability abil, integer state_type returns real
	native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
	native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
	native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
	native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
	native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
	native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
	native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean
	native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
	native EXGetItemDataString takes integer itemcode, integer data_type returns string
	native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
	native EXGetEventDamageData takes integer edd_type returns integer
	native EXSetEventDamage takes real amount returns boolean
	native EXGetEffectX takes effect e returns real
	native EXGetEffectY takes effect e returns real
	native EXGetEffectZ takes effect e returns real
	native EXSetEffectXY takes effect e, real x, real y returns nothing
	native EXSetEffectZ takes effect e, real z returns nothing
	native EXGetEffectSize takes effect e returns real
	native EXSetEffectSize takes effect e, real size returns nothing
	native EXEffectMatRotateX takes effect e, real angle returns nothing
	native EXEffectMatRotateY takes effect e, real angle returns nothing
	native EXEffectMatRotateZ takes effect e, real angle returns nothing
	native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
	native EXEffectMatReset takes effect e returns nothing
	native EXSetEffectSpeed takes effect e, real speed returns nothing
	native EXSetUnitFacing takes unit u, real angle returns nothing
	native EXPauseUnit takes unit u, boolean flag returns nothing
	native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
	native EXSetUnitMoveType takes unit u, integer t returns nothing
	native EXExecuteScript takes string script returns string


//Generated method caller for DamageData.TimerAction_Damage
function sc__DamageData_TimerAction_Damage takes nothing returns nothing
    call TriggerEvaluate(st__DamageData_TimerAction_Damage)
endfunction

//Generated method caller for DamageData.Damage_Single
function sc__DamageData_Damage_Single takes integer st returns nothing
    set f__arg_integer1=st
    call TriggerEvaluate(st__DamageData_Damage_Single)
endfunction

//Generated method caller for DamageData.Damage_Group
function sc__DamageData_Damage_Group takes integer st returns nothing
    set f__arg_integer1=st
    call TriggerEvaluate(st__DamageData_Damage_Group)
endfunction

//Generated method caller for DamageData.onDestroy
function sc__DamageData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__DamageData_onDestroy)
endfunction

//Generated allocator of DamageData
function s__DamageData__allocate takes nothing returns integer
 local integer this=si__DamageData_F
    if (this!=0) then
        set si__DamageData_F=si__DamageData_V[this]
    else
        set si__DamageData_I=si__DamageData_I+1
        set this=si__DamageData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: DamageData")
        return 0
    endif

   set s__DamageData_iDamageWay[this]= 0
   set s__DamageData_rDamage[this]= 0.
   set s__DamageData_rTotalTime[this]= 0.
   set s__DamageData_rMoveTime[this]= 0.
   set s__DamageData_iDamageTimeInterval[this]= 0.
   set s__DamageData_rDamageRange[this]= 0.
   set s__DamageData_rCount[this]= 0.
    set si__DamageData_V[this]=-1
 return this
endfunction

//Generated destructor of DamageData
function sc__DamageData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DamageData")
        return
    elseif (si__DamageData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DamageData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__DamageData_onDestroy)
    set si__DamageData_V[this]=si__DamageData_F
    set si__DamageData_F=this
endfunction

//Generated method caller for EachBuffData.create
function sc__EachBuffData_create takes nothing returns integer
    call TriggerEvaluate(st__EachBuffData_create)
 return f__result_integer
endfunction

//Generated method caller for EachBuffData.onDestroy
function sc__EachBuffData_onDestroy takes integer this returns nothing
        local integer i
        set s__EachBuffData_uBuffUnit[this]=null
        set s__EachBuffData_uAttackerUnit[this]=null
        set s__EachBuffData_sBuffName[this]=null
        set s__EachBuffData_iBuffPolarity[this]=0
        set s__EachBuffData_rBuffDuration[this]=0.
        set s__EachBuffData_rBuffTriggerTime[this]=0.
        set s__EachBuffData_rBuffMoveTime_Duration[this]=0.
        set s__EachBuffData_rBuffMoveTime_TriggerTime[this]=0.
        set s__EachBuffData_bIsBuffClean[this]=false
        set s__EachBuffData_rBuffDamage[this]=0.
        set s__EachBuffData_bIsBuffLayer[this]=false
        set s__EachBuffData_iBuffLayer[this]=0
        set s__EachBuffData_iBuffLayerMax[this]=0
        set s__EachBuffData_iIsBuffDizziness[this]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[this]=0 //变形
set s__EachBuffData_iIsBuffScare[this]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[this]=0 //致盲
set s__EachBuffData_iIsImmovable[this]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[this]=0
        set i=1
        loop
            exitwhen i > 5
            set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[this]+i]=0
            set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[this]+i]=0.
            set i=i + 1
        endloop
        set s__EachBuffData_eBuffEffect[this]=null
endfunction

//Generated allocator of EachBuffData
function s__EachBuffData__allocate takes nothing returns integer
 local integer this=si__EachBuffData_F
    if (this!=0) then
        set si__EachBuffData_F=si__EachBuffData_V[this]
    else
        set si__EachBuffData_I=si__EachBuffData_I+1
        set this=si__EachBuffData_I
    endif
    if (this>1637) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: EachBuffData")
        return 0
    endif
    set s__EachBuffData_iBuffState_Type[this]=(this-1)*5
    set s__EachBuffData_rBuffState_Data[this]=(this-1)*5
    set si__EachBuffData_V[this]=-1
 return this
endfunction

//Generated destructor of EachBuffData
function sc__EachBuffData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: EachBuffData")
        return
    elseif (si__EachBuffData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: EachBuffData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__EachBuffData_onDestroy)
    set si__EachBuffData_V[this]=si__EachBuffData_F
    set si__EachBuffData_F=this
endfunction

//Generated method caller for VerticalSurroundData.TimerAction_VerticalSurround
function sc__VerticalSurroundData_TimerAction_VerticalSurround takes nothing returns nothing
    call TriggerEvaluate(st__VerticalSurroundData_TimerAction_VerticalSurround)
endfunction

//Generated method caller for VerticalSurroundData.onDestroy
function sc__VerticalSurroundData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__VerticalSurroundData_onDestroy)
endfunction

//Generated allocator of VerticalSurroundData
function s__VerticalSurroundData__allocate takes nothing returns integer
 local integer this=si__VerticalSurroundData_F
    if (this!=0) then
        set si__VerticalSurroundData_F=si__VerticalSurroundData_V[this]
    else
        set si__VerticalSurroundData_I=si__VerticalSurroundData_I+1
        set this=si__VerticalSurroundData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: VerticalSurroundData")
        return 0
    endif

   set s__VerticalSurroundData_bIsDestroyUnit[this]= false
   set s__VerticalSurroundData_rMoveSurrDegree[this]= 0.
   set s__VerticalSurroundData_rTotalTime[this]= 0.
   set s__VerticalSurroundData_rMoveTime[this]= 0.
    set si__VerticalSurroundData_V[this]=-1
 return this
endfunction

//Generated destructor of VerticalSurroundData
function sc__VerticalSurroundData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: VerticalSurroundData")
        return
    elseif (si__VerticalSurroundData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: VerticalSurroundData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__VerticalSurroundData_onDestroy)
    set si__VerticalSurroundData_V[this]=si__VerticalSurroundData_F
    set si__VerticalSurroundData_F=this
endfunction

//Generated method caller for SurroundData.TimerAction_Surround
function sc__SurroundData_TimerAction_Surround takes nothing returns nothing
    call TriggerEvaluate(st__SurroundData_TimerAction_Surround)
endfunction

//Generated method caller for SurroundData.onDestroy
function sc__SurroundData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__SurroundData_onDestroy)
endfunction

//Generated allocator of SurroundData
function s__SurroundData__allocate takes nothing returns integer
 local integer this=si__SurroundData_F
    if (this!=0) then
        set si__SurroundData_F=si__SurroundData_V[this]
    else
        set si__SurroundData_I=si__SurroundData_I+1
        set this=si__SurroundData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SurroundData")
        return 0
    endif

   set s__SurroundData_bIsDestroyUnit[this]= false
   set s__SurroundData_rMoveSurrDegree[this]= 0.
   set s__SurroundData_rTotalTime[this]= 0.
   set s__SurroundData_rMoveTime[this]= 0.
    set si__SurroundData_V[this]=-1
 return this
endfunction

//Generated destructor of SurroundData
function sc__SurroundData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SurroundData")
        return
    elseif (si__SurroundData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SurroundData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__SurroundData_onDestroy)
    set si__SurroundData_V[this]=si__SurroundData_F
    set si__SurroundData_F=this
endfunction

//Generated method caller for ChargeTraceData.TimerAction_ChargeTrace
function sc__ChargeTraceData_TimerAction_ChargeTrace takes nothing returns nothing
    call TriggerEvaluate(st__ChargeTraceData_TimerAction_ChargeTrace)
endfunction

//Generated method caller for ChargeTraceData.onDestroy
function sc__ChargeTraceData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeTraceData_onDestroy)
endfunction

//Generated allocator of ChargeTraceData
function s__ChargeTraceData__allocate takes nothing returns integer
 local integer this=si__ChargeTraceData_F
    if (this!=0) then
        set si__ChargeTraceData_F=si__ChargeTraceData_V[this]
    else
        set si__ChargeTraceData_I=si__ChargeTraceData_I+1
        set this=si__ChargeTraceData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: ChargeTraceData")
        return 0
    endif

   set s__ChargeTraceData_rTotalTime[this]= 0.
   set s__ChargeTraceData_rMoveTime[this]= 0.
    set si__ChargeTraceData_V[this]=-1
 return this
endfunction

//Generated destructor of ChargeTraceData
function sc__ChargeTraceData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeTraceData")
        return
    elseif (si__ChargeTraceData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeTraceData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeTraceData_onDestroy)
    set si__ChargeTraceData_V[this]=si__ChargeTraceData_F
    set si__ChargeTraceData_F=this
endfunction

//Generated method caller for ChargeData.TimerAction_Charge
function sc__ChargeData_TimerAction_Charge takes nothing returns nothing
    call TriggerEvaluate(st__ChargeData_TimerAction_Charge)
endfunction

//Generated method caller for ChargeData.onDestroy
function sc__ChargeData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeData_onDestroy)
endfunction

//Generated allocator of ChargeData
function s__ChargeData__allocate takes nothing returns integer
 local integer this=si__ChargeData_F
    if (this!=0) then
        set si__ChargeData_F=si__ChargeData_V[this]
    else
        set si__ChargeData_I=si__ChargeData_I+1
        set this=si__ChargeData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: ChargeData")
        return 0
    endif

   set s__ChargeData_rTotalTime[this]= 0.
   set s__ChargeData_rMoveTime[this]= 0.
    set si__ChargeData_V[this]=-1
 return this
endfunction

//Generated destructor of ChargeData
function sc__ChargeData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeData")
        return
    elseif (si__ChargeData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeData_onDestroy)
    set si__ChargeData_V[this]=si__ChargeData_F
    set si__ChargeData_F=this
endfunction

//Generated method caller for ChargeParabolaData.TimerAction_ChargeParabola
function sc__ChargeParabolaData_TimerAction_ChargeParabola takes nothing returns nothing
    call TriggerEvaluate(st__ChargeParabolaData_TimerAction_ChargeParabola)
endfunction

//Generated method caller for ChargeParabolaData.onDestroy
function sc__ChargeParabolaData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeParabolaData_onDestroy)
endfunction

//Generated allocator of ChargeParabolaData
function s__ChargeParabolaData__allocate takes nothing returns integer
 local integer this=si__ChargeParabolaData_F
    if (this!=0) then
        set si__ChargeParabolaData_F=si__ChargeParabolaData_V[this]
    else
        set si__ChargeParabolaData_I=si__ChargeParabolaData_I+1
        set this=si__ChargeParabolaData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: ChargeParabolaData")
        return 0
    endif

   set s__ChargeParabolaData_rTotalTime[this]= 0.
   set s__ChargeParabolaData_rMoveTime[this]= 0.
   set s__ChargeParabolaData_rSwitchTime[this]= 0.
   set s__ChargeParabolaData_rMoveTime_Switch[this]= 0.
   set s__ChargeParabolaData_rParabolaTimes[this]= 0.
   set s__ChargeParabolaData_rReduceHeight[this]= 0.
   set s__ChargeParabolaData_iUpDownFlag[this]= 0
   set s__ChargeParabolaData_rInitHeight[this]= 0.
   set s__ChargeParabolaData_rTargetHeight[this]= 0.
   set s__ChargeParabolaData_rMaxHeight[this]= 0.
   set s__ChargeParabolaData_rMinHeight[this]= 0.
   set s__ChargeParabolaData_rCurrentHeight[this]= 0.
   set s__ChargeParabolaData_rInitSpeed[this]= 0.
   set s__ChargeParabolaData_rAcceleration[this]= 0.
    set si__ChargeParabolaData_V[this]=-1
 return this
endfunction

//Generated destructor of ChargeParabolaData
function sc__ChargeParabolaData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeParabolaData")
        return
    elseif (si__ChargeParabolaData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeParabolaData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeParabolaData_onDestroy)
    set si__ChargeParabolaData_V[this]=si__ChargeParabolaData_F
    set si__ChargeParabolaData_F=this
endfunction

//Generated method caller for ChargeArrowData.TimerAction_ChargeArrow
function sc__ChargeArrowData_TimerAction_ChargeArrow takes nothing returns nothing
    call TriggerEvaluate(st__ChargeArrowData_TimerAction_ChargeArrow)
endfunction

//Generated method caller for ChargeArrowData.onDestroy
function sc__ChargeArrowData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeArrowData_onDestroy)
endfunction

//Generated allocator of ChargeArrowData
function s__ChargeArrowData__allocate takes nothing returns integer
 local integer this=si__ChargeArrowData_F
    if (this!=0) then
        set si__ChargeArrowData_F=si__ChargeArrowData_V[this]
    else
        set si__ChargeArrowData_I=si__ChargeArrowData_I+1
        set this=si__ChargeArrowData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: ChargeArrowData")
        return 0
    endif

   set s__ChargeArrowData_rTotalTime[this]= 0.
   set s__ChargeArrowData_rMoveTime[this]= 0.
   set s__ChargeArrowData_bIsHitUnit[this]= false
    set si__ChargeArrowData_V[this]=-1
 return this
endfunction

//Generated destructor of ChargeArrowData
function sc__ChargeArrowData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeArrowData")
        return
    elseif (si__ChargeArrowData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeArrowData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__ChargeArrowData_onDestroy)
    set si__ChargeArrowData_V[this]=si__ChargeArrowData_F
    set si__ChargeArrowData_F=this
endfunction

//Generated method caller for BarrageData.SetControlPoint
function sc__BarrageData_SetControlPoint takes integer st returns nothing
    set f__arg_integer1=st
    call TriggerEvaluate(st__BarrageData_SetControlPoint)
endfunction

//Generated method caller for BarrageData.TimerAction_Barrage
function sc__BarrageData_TimerAction_Barrage takes nothing returns nothing
    call TriggerEvaluate(st__BarrageData_TimerAction_Barrage)
endfunction

//Generated method caller for BarrageData.onDestroy
function sc__BarrageData_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__BarrageData_onDestroy)
endfunction

//Generated allocator of BarrageData
function s__BarrageData__allocate takes nothing returns integer
 local integer this=si__BarrageData_F
    if (this!=0) then
        set si__BarrageData_F=si__BarrageData_V[this]
    else
        set si__BarrageData_I=si__BarrageData_I+1
        set this=si__BarrageData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: BarrageData")
        return 0
    endif

   set s__BarrageData_bIsDestroyUnit[this]= false
   set s__BarrageData_rTotalTime[this]= 0.
   set s__BarrageData_rMoveTime[this]= 0.
   set s__BarrageData_t[this]= 0.
   set s__BarrageData_Everyt[this]= 0.
   set s__BarrageData_rBt_x[this]= 0.
   set s__BarrageData_rBt_y[this]= 0.
   set s__BarrageData_P0_x[this]= 0.
   set s__BarrageData_P0_y[this]= 0.
   set s__BarrageData_P1_x[this]= 0.
   set s__BarrageData_P1_y[this]= 0.
   set s__BarrageData_P2_x[this]= 0.
   set s__BarrageData_P2_y[this]= 0.
   set s__BarrageData_P3_x[this]= 0.
   set s__BarrageData_P3_y[this]= 0.
    set si__BarrageData_V[this]=-1
 return this
endfunction

//Generated destructor of BarrageData
function sc__BarrageData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: BarrageData")
        return
    elseif (si__BarrageData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: BarrageData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__BarrageData_onDestroy)
    set si__BarrageData_V[this]=si__BarrageData_F
    set si__BarrageData_F=this
endfunction

//Generated method caller for HeightData.TimerAction_Height
function sc__HeightData_TimerAction_Height takes nothing returns nothing
    call TriggerEvaluate(st__HeightData_TimerAction_Height)
endfunction

//Generated method caller for HeightData.onDestroy
function sc__HeightData_onDestroy takes integer this returns nothing
            call UnitRemoveAbility(s__HeightData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__HeightData_uUnit[this]=null
            set s__HeightData_rTotalTime[this]=0.
            set s__HeightData_rMoveTime[this]=0.
            
            //Height
            set s__HeightData_iFlyMode[this]=0
            set s__HeightData_iUpDownFlag[this]=0
            set s__HeightData_rExtremeHeight[this]=0.
            set s__HeightData_rCurrentHeight[this]=0.
            set s__HeightData_rEveryHeight[this]=0.
endfunction

//Generated allocator of HeightData
function s__HeightData__allocate takes nothing returns integer
 local integer this=si__HeightData_F
    if (this!=0) then
        set si__HeightData_F=si__HeightData_V[this]
    else
        set si__HeightData_I=si__HeightData_I+1
        set this=si__HeightData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: HeightData")
        return 0
    endif

   set s__HeightData_rTotalTime[this]= 0.
   set s__HeightData_rMoveTime[this]= 0.
   set s__HeightData_iFlyMode[this]= 0
   set s__HeightData_iUpDownFlag[this]= 0
   set s__HeightData_rExtremeHeight[this]= 0.
   set s__HeightData_rCurrentHeight[this]= 0.
   set s__HeightData_rEveryHeight[this]= 0.
    set si__HeightData_V[this]=-1
 return this
endfunction

//Generated destructor of HeightData
function sc__HeightData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: HeightData")
        return
    elseif (si__HeightData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: HeightData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__HeightData_onDestroy)
    set si__HeightData_V[this]=si__HeightData_F
    set si__HeightData_F=this
endfunction

//Generated method caller for SetHeight_AcceData.TimerAction_SetHeight_Acce
function sc__SetHeight_AcceData_TimerAction_SetHeight_Acce takes nothing returns nothing
    call TriggerEvaluate(st__SetHeight_AcceData_TimerAction_SetHeight_Acce)
endfunction

//Generated method caller for SetHeight_AcceData.onDestroy
function sc__SetHeight_AcceData_onDestroy takes integer this returns nothing
            call UnitRemoveAbility(s__SetHeight_AcceData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__SetHeight_AcceData_uUnit[this]=null //单位
set s__SetHeight_AcceData_rTotalTime[this]=0. //总时间
set s__SetHeight_AcceData_rTotalMoveTime[this]=0. //已经走的时间
set s__SetHeight_AcceData_rSwitchTime[this]=0. //到最高/最低点时切换的时间
set s__SetHeight_AcceData_rMoveTime_Switch[this]=0. //用于切换时间.
set s__SetHeight_AcceData_iUpDownFlag[this]=0 //0:Stop,1:Up,2:Down
//SetHeight_Acce
set s__SetHeight_AcceData_iFlyMode[this]=0 //飞行模式,0:没有,1:只上升,2:只下降,3:先升后降
set s__SetHeight_AcceData_rInitHeight[this]=0. //初始高度
set s__SetHeight_AcceData_rTargetHeight[this]=0. //目标高度
set s__SetHeight_AcceData_rMaxHeight[this]=0. //最高高度
set s__SetHeight_AcceData_rMinHeight[this]=0. //最低高度
set s__SetHeight_AcceData_rCurrentHeight[this]=0. //当前高度
//
set s__SetHeight_AcceData_rInitSpeed[this]=0. //初始速度
set s__SetHeight_AcceData_rAcceleration[this]=0. //加速度
endfunction

//Generated allocator of SetHeight_AcceData
function s__SetHeight_AcceData__allocate takes nothing returns integer
 local integer this=si__SetHeight_AcceData_F
    if (this!=0) then
        set si__SetHeight_AcceData_F=si__SetHeight_AcceData_V[this]
    else
        set si__SetHeight_AcceData_I=si__SetHeight_AcceData_I+1
        set this=si__SetHeight_AcceData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SetHeight_AcceData")
        return 0
    endif

   set s__SetHeight_AcceData_rTotalTime[this]= 0.
   set s__SetHeight_AcceData_rTotalMoveTime[this]= 0.
   set s__SetHeight_AcceData_rSwitchTime[this]= 0.
   set s__SetHeight_AcceData_rMoveTime_Switch[this]= 0.
   set s__SetHeight_AcceData_iUpDownFlag[this]= 0
   set s__SetHeight_AcceData_iFlyMode[this]= 0
   set s__SetHeight_AcceData_rInitHeight[this]= 0.
   set s__SetHeight_AcceData_rTargetHeight[this]= 0.
   set s__SetHeight_AcceData_rMaxHeight[this]= 0.
   set s__SetHeight_AcceData_rMinHeight[this]= 0.
   set s__SetHeight_AcceData_rCurrentHeight[this]= 0.
   set s__SetHeight_AcceData_rInitSpeed[this]= 0.
   set s__SetHeight_AcceData_rAcceleration[this]= 0.
    set si__SetHeight_AcceData_V[this]=-1
 return this
endfunction

//Generated destructor of SetHeight_AcceData
function sc__SetHeight_AcceData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SetHeight_AcceData")
        return
    elseif (si__SetHeight_AcceData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SetHeight_AcceData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__SetHeight_AcceData_onDestroy)
    set si__SetHeight_AcceData_V[this]=si__SetHeight_AcceData_F
    set si__SetHeight_AcceData_F=this
endfunction

//library BzAPI:
    //hardware




























    //plus











    //sync






    //native DzGetPushContext takes nothing returns string

    //gui











































































        //显示/隐藏SimpleFrame
    //native DzSimpleFrameShow takes integer frame, boolean enable returns nothing
    // 追加文字（支持TextArea）

    // 沉默单位-禁用技能

    // 禁用攻击

    // 禁用道具

    // 刷新小地图

    // 修改单位alpha

    // 设置单位是否可以选中

    // 修改单位是否可以被设置为目标

    // 保存内存数据

    // 读取内存数据

    // 设置加速倍率

    // 转换世界坐标为屏幕坐标-异步

    // 转换世界坐标为屏幕坐标-获取转换后的X坐标

    // 转换世界坐标为屏幕坐标-获取转换后的Y坐标

    // 创建command button

    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction
    function DzTriggerRegisterMallItemSyncData takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZMIA", true)
    endfunction
    function DzGetTriggerMallItemPlayer takes nothing returns player
        return DzGetTriggerSyncPlayer()
    endfunction
    function DzGetTriggerMallItem takes nothing returns string
        return DzGetTriggerSyncData()
    endfunction
    

//library BzAPI ends
//library DeleteDeathUnit:
    
    function GetGroup_DeleteDeathUnit takes nothing returns group
        return DeleteDeathUnit___GgGroup_DeathUnit
    endfunction
    
    function DeleteDeathUnit takes nothing returns nothing
        local unit uUnit= GetEnumUnit()
        local real rDeleteTime_DeathUnit= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDeleteTime_DeathUnit"))
        local real rMoveTime_DeathUnit= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rMoveTime_DeathUnit"))
        call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rMoveTime_DeathUnit"), rMoveTime_DeathUnit + DeleteDeathUnit___GrInterval_DeathUnit)
        if ( uUnit == null ) then
            call GroupRemoveUnit(DeleteDeathUnit___GgGroup_DeathUnit, uUnit)
            return
        endif
        
        if ( rMoveTime_DeathUnit >= rDeleteTime_DeathUnit ) then
            call FlushChildHashtable(htUnitHT, GetHandleId(uUnit))
            call GroupRemoveUnit(DeleteDeathUnit___GgGroup_DeathUnit, uUnit)
            call RemoveUnit(uUnit)
        endif
        
        set uUnit=null
    endfunction
    
    function TimerAction_DeleteDeathUnit takes nothing returns nothing
        call ForGroup(DeleteDeathUnit___GgGroup_DeathUnit, function DeleteDeathUnit)
    endfunction
    
    function DeleteDeathUnit___DeleteDeathUnitInit takes nothing returns nothing
        set DeleteDeathUnit___GgGroup_DeathUnit=CreateGroup()
        set DeleteDeathUnit___GtTimer_DeathUnit=CreateTimer()
        set DeleteDeathUnit___GiTimerID_DeathUnit=GetHandleId(DeleteDeathUnit___GtTimer_DeathUnit)
        call TimerStart(DeleteDeathUnit___GtTimer_DeathUnit, DeleteDeathUnit___GrInterval_DeathUnit, true, function TimerAction_DeleteDeathUnit)
    endfunction
    
    

//library DeleteDeathUnit ends
//library HashTable:
    
    function HashTable___HashTableInit takes nothing returns nothing
        set htTimerHT=InitHashtable()
        set htUnitHT=InitHashtable()
        set htCommomHT=InitHashtable()
        set htTriggerHT=InitHashtable()
    endfunction

//library HashTable ends
//library I2H:
//textmacro instance: I2H("U","Unit","unit")
function I2U takes integer i returns unit
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadUnitHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("U","Unit","unit")
//textmacro instance: I2H("I","Item","item")
function I2I takes integer i returns item
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadItemHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("I","Item","item")
//textmacro instance: I2H("D","Destructable","destructable")
function I2D takes integer i returns destructable
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadDestructableHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("D","Destructable","destructable")
//textmacro instance: I2H("E","Effect","effect")
function I2E takes integer i returns effect
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadEffectHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("E","Effect","effect")
//textmacro instance: I2H("TG","Trigger","trigger")
function I2TG takes integer i returns trigger
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadTriggerHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("TG","Trigger","trigger")
//textmacro instance: I2H("T","Timer","timer")
function I2T takes integer i returns timer
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadTimerHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("T","Timer","timer")
//textmacro instance: I2H("G","Group","group")
function I2G takes integer i returns group
    call SaveFogStateHandle(htCommomHT, 0, 0, ConvertFogState(i))
    return LoadGroupHandle(htCommomHT, 0, 0)
endfunction
//end of: I2H("G","Group","group")

//library I2H ends
//library LiEffectFront:
    function EffectFontInit takes nothing returns nothing
        //物理暴击
        set sStrFont_Crit[0]="dawn_wlBJ_0.mdx"
        set sStrFont_Crit[1]="dawn_wlBJ_1.mdx"
        set sStrFont_Crit[2]="dawn_wlBJ_2.mdx"
        set sStrFont_Crit[3]="dawn_wlBJ_3.mdx"
        set sStrFont_Crit[4]="dawn_wlBJ_4.mdx"
        set sStrFont_Crit[5]="dawn_wlBJ_5.mdx"
        set sStrFont_Crit[6]="dawn_wlBJ_6.mdx"
        set sStrFont_Crit[7]="dawn_wlBJ_7.mdx"
        set sStrFont_Crit[8]="dawn_wlBJ_8.mdx"
        set sStrFont_Crit[9]="dawn_wlBJ_9.mdx"
        set sStrFont_Crit[10]="dawn_wlBJ.mdx"
        //法术暴击
        set sStrFont_SpelCrit[0]="dawn_fsBJ_0.mdx"
        set sStrFont_SpelCrit[1]="dawn_fsBJ_1.mdx"
        set sStrFont_SpelCrit[2]="dawn_fsBJ_2.mdx"
        set sStrFont_SpelCrit[3]="dawn_fsBJ_3.mdx"
        set sStrFont_SpelCrit[4]="dawn_fsBJ_4.mdx"
        set sStrFont_SpelCrit[5]="dawn_fsBJ_5.mdx"
        set sStrFont_SpelCrit[6]="dawn_fsBJ_6.mdx"
        set sStrFont_SpelCrit[7]="dawn_fsBJ_7.mdx"
        set sStrFont_SpelCrit[8]="dawn_fsBJ_8.mdx"
        set sStrFont_SpelCrit[9]="dawn_fsBJ_9.mdx"
        set sStrFont_SpelCrit[10]="dawn_fsBJ.mdx"
        //恢复生命
        set sStrFont_RestLife[0]="[hurt]C_0.mdx"
        set sStrFont_RestLife[1]="[hurt]C_1.mdx"
        set sStrFont_RestLife[2]="[hurt]C_2.mdx"
        set sStrFont_RestLife[3]="[hurt]C_3.mdx"
        set sStrFont_RestLife[4]="[hurt]C_4.mdx"
        set sStrFont_RestLife[5]="[hurt]C_5.mdx"
        set sStrFont_RestLife[6]="[hurt]C_6.mdx"
        set sStrFont_RestLife[7]="[hurt]C_7.mdx"
        set sStrFont_RestLife[8]="[hurt]C_8.mdx"
        set sStrFont_RestLife[9]="[hurt]C_9.mdx"
    endfunction
    function EffectFontDisplay takes real x,real y,integer iDamage,integer iMode returns nothing
        local string sStr= I2S(iDamage)
        local integer iLen= StringLength(sStr)
        local integer i
        local integer iNum
        local real rDistance
        local real rInit_x
        local real rInit_y= y
        local effect eEffect
        if ( iMode == iEffeFont_Crit ) then
            set rDistance=28 * 2
            set rInit_x=x - ( I2R(iLen) * rDistance ) / 2
            set i=1
            loop
                exitwhen i > iLen
                set iNum=S2I(SubStringBJ(sStr, i, i))
                //call BJDebugMsg("暴击数字:"+I2S(iNum))
                set eEffect=AddSpecialEffect(sStrFont_Crit[iNum], rInit_x, rInit_y + 150)
                call EXSetEffectSize(eEffect, 2.00)
                call EXSetEffectSpeed(eEffect, 0.75) //动画速度
call DestroyEffect(eEffect)
                set rInit_x=rInit_x + rDistance
                set i=i + 1
            endloop
            //暴击红字
            set eEffect=AddSpecialEffect(sStrFont_Crit[10], x, rInit_y + 250)
            call EXSetEffectSize(eEffect, 2.00)
            call EXSetEffectSpeed(eEffect, 0.75) //动画速度
call DestroyEffect(eEffect)
            
        elseif ( iMode == iEffeFont_SpelCrit ) then
            set rDistance=28 * 2
            set rInit_x=x - ( I2R(iLen) * rDistance ) / 2
            set i=1
            loop
                exitwhen i > iLen
                set iNum=S2I(SubStringBJ(sStr, i, i))
                set eEffect=AddSpecialEffect(sStrFont_SpelCrit[iNum], rInit_x - 75, rInit_y + 150)
                call EXSetEffectSize(eEffect, 2.00)
                call EXSetEffectSpeed(eEffect, 0.75) //动画速度
call DestroyEffect(eEffect)
                set rInit_x=rInit_x + rDistance
                set i=i + 1
            endloop
            //暴击蓝字
            set eEffect=AddSpecialEffect(sStrFont_SpelCrit[10], x - 75, rInit_y + 250)
            call EXSetEffectSize(eEffect, 2.00)
            call EXSetEffectSpeed(eEffect, 0.75) //动画速度
call DestroyEffect(eEffect)
            
        elseif ( iMode == iEffeFont_RestLife ) then
            set rDistance=25
            set rInit_x=x - ( I2R(iLen) * rDistance ) / 2
            set i=1
            loop
                exitwhen i > iLen
                set iNum=S2I(SubStringBJ(sStr, i, i))
                set eEffect=AddSpecialEffect(sStrFont_RestLife[iNum], rInit_x + 50, rInit_y + 50)
                call EXSetEffectSize(eEffect, 1)
                call EXSetEffectSpeed(eEffect, 0.75) //动画速度
call DestroyEffect(eEffect)
                set rInit_x=rInit_x + rDistance
                set i=i + 1
            endloop
            
        endif
        set eEffect=null
    endfunction
    

//library LiEffectFront ends
//library MNEVENT:
    //===========================================================================  
    //任意单位伤害事件 
    //===========================================================================
    function MNEVENT___UnitDeathconditions takes nothing returns boolean
        return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) != true )
    endfunction
   
    function MNEVENT___UnitDeathAction takes nothing returns nothing
       call GroupRemoveUnit(MNEVENT___UnitGroup, GetTriggerUnit())
       //call RemoveUnit(GetTriggerUnit())
    endfunction
    
    function MNEVENT___enumunitdamaged takes nothing returns nothing
        call TriggerRegisterUnitEvent(MNEVENT___MNDamageEventTrigger, GetEnumUnit(), EVENT_UNIT_DAMAGED)
    endfunction
    function MNEVENT___MNAnyUnitDamagedAction takes nothing returns nothing
        local integer i= 0
        
        loop
            exitwhen i >= MNEVENT___DamageEventNumber
            if MNEVENT___DamageEventQueue[i] != null and IsTriggerEnabled(MNEVENT___DamageEventQueue[i]) and TriggerEvaluate(MNEVENT___DamageEventQueue[i]) then
                call TriggerExecute(MNEVENT___DamageEventQueue[i]) //如果触发不为空,触发开启,则运行触发器i
            endif
            set i=i + 1
        endloop
    endfunction
    
    function MNEVENT___MNAnyUnitDamagedFilter takes nothing returns boolean
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
            //单位组加入该单位
            call GroupAddUnit(MNEVENT___UnitGroup, GetFilterUnit())
            call TriggerRegisterUnitEvent(MNEVENT___MNDamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
            //注册指定单位接受伤害事件
        endif
        return false
    endfunction
    
    function MNEVENT___MNAnyUnitDamagedEnumUnit takes nothing returns nothing
        local trigger t= CreateTrigger()
        local region r= CreateRegion()
        local group g= CreateGroup()
        local trigger trideath= CreateTrigger()
    
        call RegionAddRect(r, GetWorldBounds())
        call TriggerRegisterEnterRegion(t, r, Condition(function MNEVENT___MNAnyUnitDamagedFilter))
        //非蝗虫单位进入区域 注册指定单位接受伤害事件
        call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function MNEVENT___MNAnyUnitDamagedFilter))
        //选取可用地图上现存的非蝗虫单位 注册指定单位接受伤害事件
        //注册单位死亡事件
        call TriggerRegisterAnyUnitEventBJ(trideath, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddCondition(trideath, Condition(function MNEVENT___UnitDeathconditions))
        call TriggerAddAction(trideath, function MNEVENT___UnitDeathAction)
        call DestroyGroup(g)
        set r=null
        set t=null
        set g=null
    endfunction
        
    function MNEVENT___timeout takes nothing returns nothing
call TriggerRemoveAction(MNEVENT___MNDamageEventTrigger, MNEVENT___ta) //删除触发器动作
        call DestroyTrigger(MNEVENT___MNDamageEventTrigger)
        set MNEVENT___MNDamageEventTrigger=CreateTrigger()
        set MNEVENT___ta=TriggerAddAction(MNEVENT___MNDamageEventTrigger, function MNEVENT___MNAnyUnitDamagedAction)
        call ForGroupBJ(MNEVENT___UnitGroup, function MNEVENT___enumunitdamaged)
    endfunction
    function MNAnyUnitDamaged takes trigger trg,real miao returns nothing
        if trg == null then
            return
        endif
            
        if MNEVENT___DamageEventNumber == 0 then
            set MNEVENT___MNDamageEventTrigger=CreateTrigger()
            set MNEVENT___ta=TriggerAddAction(MNEVENT___MNDamageEventTrigger, function MNEVENT___MNAnyUnitDamagedAction)
            call MNEVENT___MNAnyUnitDamagedEnumUnit()
            call TimerStart(MNEVENT___time, miao, true, function MNEVENT___timeout)
        endif
        
        set MNEVENT___DamageEventQueue[MNEVENT___DamageEventNumber]=trg
        set MNEVENT___DamageEventNumber=MNEVENT___DamageEventNumber + 1
    endfunction
    

//library MNEVENT ends
//library Math:
    //GetDistance(x1, y1, x2, y2)
    function GetDistance takes real x1,real y1,real x2,real y2 returns real
        return SquareRoot(Pow(x1 - x2, 2) + Pow(y1 - y2, 2))
    endfunction
    //两个单位间距离
    //Math_GetUnitDistance(u1, u2)
    function Math_GetUnitDistance takes unit uUnit1,unit uUnit2 returns real
        return GetDistance(GetUnitX(uUnit1) , GetUnitY(uUnit1) , GetUnitX(uUnit2) , GetUnitY(uUnit2))
    endfunction
    
    //180=PI,PI=3.14159,DEG_TO_RAD:DEG*PI/180,RAD_TO_DEG:RAD*180/PI
    //GetDegree(x1, y1, x2, y2)
    function GetDegree takes real x1,real y1,real x2,real y2 returns real
        local real rDegree= Atan2(y2 - y1, x2 - x1) * bj_RADTODEG
        if ( rDegree >= 0 ) then
            return rDegree
        else
            return rDegree + 360
        endif
    endfunction
    //单位1到单位2的角度
    //Math_GetUnitDegree(u1, u2)
    function Math_GetUnitDegree takes unit uUnit1,unit uUnit2 returns real
        return GetDegree(GetUnitX(uUnit1) , GetUnitY(uUnit1) , GetUnitX(uUnit2) , GetUnitY(uUnit2))
    endfunction
    
    //非负实数
    function RNonnegative takes real rData returns real
        if ( rData >= 0 ) then
            return rData
        else
            return 0.
        endif
    endfunction
    //非负整数
    function INonnegative takes integer iData returns integer
        if ( iData >= 0 ) then
            return iData
        else
            return 0
        endif
    endfunction
    
    //实数绝对值
    function RAbs takes real rData returns real
        if ( rData >= 0 ) then
            return rData
        else
            return - rData
        endif
    endfunction
    
    //整数绝对值
    function IAbs takes integer iData returns integer
        if ( iData >= 0 ) then
            return iData
        else
            return - iData
        endif
    endfunction
    
    function AngleAdjustment takes real rDegree returns real
        loop
            exitwhen ( rDegree >= 0 ) and ( rDegree < 360 )
            if ( rDegree < 0 ) then
                set rDegree=rDegree + 360
            endif
            if ( rDegree > 360 ) then
                set rDegree=rDegree - 360
            endif
        endloop
        return rDegree
    endfunction
    //角度差
    function AngleDifference takes real rDegree1,real rDegree2 returns real
        local real rDifference
        set rDegree1=AngleAdjustment(rDegree1)
        set rDegree2=AngleAdjustment(rDegree2)
        set rDifference=RAbs(rDegree1 - rDegree2)
        if ( rDifference <= 180 ) then
            return rDifference
        else
            return RAbs(rDifference - 360)
        endif
            
    endfunction
    

//library Math ends
//library SetDamageWay:
   
   function SetDamageWay___SetDamageWayInit takes nothing returns nothing
        set SetDamageWay___tTimer_Damage=CreateTimer()
        //call TimerStart(tTimer_Damage, rTimerInterval_Damage, true, function DamageData.TimerAction_Damage)
        set SetDamageWay___iTimerID_Damage=GetHandleId(SetDamageWay___tTimer_Damage)
    endfunction
    
//Damage
//iDamageWay==11时是单体伤害
        //iDamageWay==1或2时是群体伤害


        
        function s__DamageData_create takes integer DamageWay,unit u,real Damage,real TotalTime,real DamageTimeInterval returns integer
            local integer st
            if ( SetDamageWay___iNum_Damage < 8190 ) then //已经在伤害的单位无法再被设置伤害
set st=s__DamageData__allocate()
                set s__DamageData_iDamageWay[st]=DamageWay
                set s__DamageData_uUnit[st]=u
                set s__DamageData_rDamage[st]=Damage
                set s__DamageData_rTotalTime[st]=TotalTime
                set s__DamageData_iDamageTimeInterval[st]=DamageTimeInterval
                
                set SetDamageWay___iNum_Damage=SetDamageWay___iNum_Damage + 1
                set SetDamageWay___iData_Damage[SetDamageWay___iNum_Damage]=(st)
                
                if SetDamageWay___bTimerState_Damage == false then
                    call TimerStart(SetDamageWay___tTimer_Damage, rTimerInterval_Damage, true, function sc__DamageData_TimerAction_Damage)
                    set SetDamageWay___bTimerState_Damage=true
                endif
                //call BJDebugMsg("SetDamage_create:" + I2S(iData_Damage[iNum_Damage]))
                return st
            else
                //call BJDebugMsg("当前伤害数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__DamageData_SetDamageData_Single takes integer st,unit GetDamageUnit returns nothing
            if ( st > 0 ) and ( s__DamageData_iDamageWay[st] == 11 ) then
                set s__DamageData_uGetDamageUnit[st]=GetDamageUnit
            endif
        endfunction
        
        function s__DamageData_SetDamageData_Group takes integer st,real DamageRange returns nothing
            if ( st > 0 ) and ( ( s__DamageData_iDamageWay[st] == 1 ) or ( s__DamageData_iDamageWay[st] == 2 ) ) then
                set s__DamageData_rDamageRange[st]=DamageRange
                if ( s__DamageData_iDamageWay[st] == 1 ) then
                    set s__DamageData_gGroup[st]=CreateGroup()
                endif
            endif
        endfunction
        
        function s__DamageData_TimerAction_Damage takes nothing returns nothing
            local integer i= 1
            local integer Num= SetDamageWay___iNum_Damage
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            //call BJDebugMsg("Running")
            
            if Num == 0 then
                call PauseTimer(SetDamageWay___tTimer_Damage)
                set SetDamageWay___bTimerState_Damage=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(SetDamageWay___iData_Damage[i])
                if ( SetDamageWay___iData_Damage[i] != 0 ) and ( s__DamageData_uUnit[st] != null ) and ( s__DamageData_iDamageWay[st] != 0 ) and ( s__DamageData_rMoveTime[st] <= s__DamageData_rTotalTime[st] ) then
                    set s__DamageData_rMoveTime[st]=s__DamageData_rMoveTime[st] + rTimerInterval_Damage
                    //Damage
                    set s__DamageData_rCount[st]=s__DamageData_rCount[st] + rTimerInterval_Damage
                    if ( s__DamageData_rCount[st] >= s__DamageData_iDamageTimeInterval[st] ) then //相当于取余，因为实数取余有问题，所以用if代替
set s__DamageData_rCount[st]=0.
                        if ( s__DamageData_iDamageWay[st] == 11 ) then
                            call sc__DamageData_Damage_Single(st)
                        elseif ( s__DamageData_iDamageWay[st] == 1 ) or ( s__DamageData_iDamageWay[st] == 2 ) then
                            call sc__DamageData_Damage_Group(st)
                        endif
                    endif
                else
                    //Done
                    set SetDamageWay___iData_Damage[i]=0
                    set SetDamageWay___iNum_Damage=SetDamageWay___iNum_Damage - 1
                    call sc__DamageData_deallocate(st)
                    //排序
                    if ( i != Num ) then //伤害完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetDamageWay___iData_Damage[i]=SetDamageWay___iData_Damage[Num]
                    endif
                    set SetDamageWay___iData_Damage[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__DamageData_Damage_Single takes integer st returns nothing
            local player pPlayer= GetOwningPlayer(s__DamageData_uUnit[st])
            if ( GetUnitState(s__DamageData_uGetDamageUnit[st], UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(s__DamageData_uGetDamageUnit[st], pPlayer) == false ) then
                 call UnitDamageTarget(s__DamageData_uUnit[st], s__DamageData_uGetDamageUnit[st], s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            endif
            set pPlayer=null
        endfunction
        
        function s__DamageData_Damage_Group takes integer st returns nothing
            local real x= GetUnitX(s__DamageData_uUnit[st])
            local real y= GetUnitY(s__DamageData_uUnit[st])
            local player pPlayer= GetOwningPlayer(s__DamageData_uUnit[st])
            local group gGroup= CreateGroup()
            local unit uGroupUnit
            call GroupEnumUnitsInRange(gGroup, x, y, s__DamageData_rDamageRange[st], null)
            loop
                set uGroupUnit=FirstOfGroup(gGroup)
                exitwhen uGroupUnit == null
                call GroupRemoveUnit(gGroup, uGroupUnit)
                if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
                    if ( s__DamageData_iDamageWay[st] == 2 ) then //多次伤害
call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                    elseif ( s__DamageData_iDamageWay[st] == 1 ) then //1次伤害
if ( IsUnitInGroup(uGroupUnit, s__DamageData_gGroup[st]) == false ) then
                            call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                            call GroupAddUnit(s__DamageData_gGroup[st], uGroupUnit)
                        endif
                    endif
                endif
            endloop
            call DestroyGroup(gGroup)
            set pPlayer=null
            set uGroupUnit=null
            set gGroup=null
        endfunction
        
        function s__DamageData_onDestroy takes integer this returns nothing
            if ( s__DamageData_iDamageWay[this] == 1 ) then
                call DestroyGroup(s__DamageData_gGroup[this])
            endif
            
            set s__DamageData_iDamageWay[this]=0 //1:群体一次伤害，2:群体多次伤害，11.单体伤害
set s__DamageData_uUnit[this]=null //单位
set s__DamageData_rDamage[this]=0. //伤害
set s__DamageData_rTotalTime[this]=0. //伤害时间限制
set s__DamageData_rMoveTime[this]=0. //已经伤害的时间
set s__DamageData_iDamageTimeInterval[this]=0. //伤害时间间隔
//iDamageWay==11时是单体伤害
set s__DamageData_uGetDamageUnit[this]=null
            //iDamageWay==1或2时是群体伤害
            set s__DamageData_rDamageRange[this]=0. //伤害半径范围
set s__DamageData_gGroup[this]=null //伤害单位组

            set s__DamageData_rCount[this]=0. //每移动一次加0.1，用于伤害结算

        endfunction

//Generated destructor of DamageData
function s__DamageData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DamageData")
        return
    elseif (si__DamageData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DamageData")
        return
    endif
    call s__DamageData_onDestroy(this)
    set si__DamageData_V[this]=si__DamageData_F
    set si__DamageData_F=this
endfunction
        
   
   

//library SetDamageWay ends
//library SetHeightAcceleration:
        
    function SetHeightAcceleration___SetHeight_AcceInit takes nothing returns nothing
        set SetHeightAcceleration___tTimer_SetHeight_Acce=CreateTimer()
        //call TimerStart(tTimer_SetHeight_Acce, rTimerInterval_SetHeight_Acce, true, function SetHeight_AcceData.TimerAction_SetHeight_Acce)
        set SetHeightAcceleration___iTimerID_SetHeight_Acce=GetHandleId(SetHeightAcceleration___tTimer_SetHeight_Acce)
    endfunction
    
//SetHeight_Acce
//

        function s__SetHeight_AcceData_create takes unit uUnit,real rTotalTime,integer iFlyMode,real rInitHeight,real rTargetHeight,real rMaxHeight,real rMinHeight returns integer
            local integer st
            if ( SetHeightAcceleration___iNum_SetHeight_Acce < 8190 ) then //已经在冲锋的单位无法再被设置冲锋
set st=s__SetHeight_AcceData__allocate()
                set s__SetHeight_AcceData_uUnit[st]=uUnit
                set s__SetHeight_AcceData_rTotalTime[st]=rTotalTime
                set s__SetHeight_AcceData_iFlyMode[st]=iFlyMode
                set s__SetHeight_AcceData_rInitHeight[st]=rInitHeight
                set s__SetHeight_AcceData_rTargetHeight[st]=rTargetHeight
                set s__SetHeight_AcceData_rMaxHeight[st]=rMaxHeight
                set s__SetHeight_AcceData_rMinHeight[st]=rMinHeight
                if ( s__SetHeight_AcceData_iFlyMode[st] == SetHeight_Acce_Up ) then
                    set s__SetHeight_AcceData_iUpDownFlag[st]=1
                    set s__SetHeight_AcceData_rSwitchTime[st]=s__SetHeight_AcceData_rTotalTime[st]
                elseif ( s__SetHeight_AcceData_iFlyMode[st] == SetHeight_Acce_Down ) then
                    set s__SetHeight_AcceData_iUpDownFlag[st]=2
                    set s__SetHeight_AcceData_rSwitchTime[st]=s__SetHeight_AcceData_rTotalTime[st]
                elseif ( s__SetHeight_AcceData_iFlyMode[st] == SetHeight_Acce_UpAndDown ) then
                    set s__SetHeight_AcceData_iUpDownFlag[st]=1
                    set s__SetHeight_AcceData_rSwitchTime[st]=s__SetHeight_AcceData_rTotalTime[st] / 2
                endif
                set s__SetHeight_AcceData_rAcceleration[st]=2 * RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / Pow(s__SetHeight_AcceData_rSwitchTime[st], 2) //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st] //初始速度
if ( s__SetHeight_AcceData_iFlyMode[st] == SetHeight_Acce_Down ) then
                    set s__SetHeight_AcceData_rInitSpeed[st]=0
                endif
                set SetHeightAcceleration___iNum_SetHeight_Acce=SetHeightAcceleration___iNum_SetHeight_Acce + 1
                set SetHeightAcceleration___iData_SetHeight_Acce[SetHeightAcceleration___iNum_SetHeight_Acce]=(st)
                call UnitAddAbility(s__SetHeight_AcceData_uUnit[st], 'Arav') //乌鸦技能，可以设置高度
if SetHeightAcceleration___bTimerState_SetHeight_Acce == false then
                    call TimerStart(SetHeightAcceleration___tTimer_SetHeight_Acce, rTimerInterval_SetHeight_Acce, true, function sc__SetHeight_AcceData_TimerAction_SetHeight_Acce)
                    set SetHeightAcceleration___bTimerState_SetHeight_Acce=true
                endif
                return st
            else
                return 0
            endif
        endfunction
                
        function s__SetHeight_AcceData_TimerAction_SetHeight_Acce takes nothing returns nothing
            local integer i= 1
            local integer Num= SetHeightAcceleration___iNum_SetHeight_Acce
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            local real rMoveHeight
            //call BJDebugMsg("Running")
            
            if Num == 0 then
                call PauseTimer(SetHeightAcceleration___tTimer_SetHeight_Acce)
                set SetHeightAcceleration___bTimerState_SetHeight_Acce=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(SetHeightAcceleration___iData_SetHeight_Acce[i])
                if ( SetHeightAcceleration___iData_SetHeight_Acce[i] != 0 ) and ( s__SetHeight_AcceData_uUnit[st] != null ) and ( GetUnitState(s__SetHeight_AcceData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__SetHeight_AcceData_rTotalMoveTime[st] <= s__SetHeight_AcceData_rTotalTime[st] ) then
                    set s__SetHeight_AcceData_rTotalMoveTime[st]=s__SetHeight_AcceData_rTotalMoveTime[st] + rTimerInterval_SetHeight_Acce
                    set s__SetHeight_AcceData_rMoveTime_Switch[st]=s__SetHeight_AcceData_rMoveTime_Switch[st] + rTimerInterval_SetHeight_Acce
                    if ( s__SetHeight_AcceData_iUpDownFlag[st] == 1 ) then //上升
                        set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] - 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] + rMoveHeight
                    elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //下降
                        set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] + 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] - rMoveHeight
                    endif
                    call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rCurrentHeight[st], 0.)
                    //判断
                    if ( s__SetHeight_AcceData_rMoveTime_Switch[st] >= s__SetHeight_AcceData_rSwitchTime[st] ) then
                        set s__SetHeight_AcceData_rMoveTime_Switch[st]=0
                        if ( s__SetHeight_AcceData_iUpDownFlag[st] == 1 ) then //0:Stop,1:Up,2:Down，到最高点
                            set s__SetHeight_AcceData_iUpDownFlag[st]=2
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMaxHeight[st], 0.)
                            set s__SetHeight_AcceData_rInitSpeed[st]=0
                        elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //最低点
set s__SetHeight_AcceData_iUpDownFlag[st]=1
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMinHeight[st], 0.)
                            set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st]
                        endif
                    endif
                else
                    //Done
                    set SetHeightAcceleration___iData_SetHeight_Acce[i]=0
                    set SetHeightAcceleration___iNum_SetHeight_Acce=SetHeightAcceleration___iNum_SetHeight_Acce - 1
                    call sc__SetHeight_AcceData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetHeightAcceleration___iData_SetHeight_Acce[i]=SetHeightAcceleration___iData_SetHeight_Acce[Num]
                    endif
                    set SetHeightAcceleration___iData_SetHeight_Acce[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__SetHeight_AcceData_onDestroy takes integer this returns nothing
            call UnitRemoveAbility(s__SetHeight_AcceData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__SetHeight_AcceData_uUnit[this]=null //单位
set s__SetHeight_AcceData_rTotalTime[this]=0. //总时间
set s__SetHeight_AcceData_rTotalMoveTime[this]=0. //已经走的时间
set s__SetHeight_AcceData_rSwitchTime[this]=0. //到最高/最低点时切换的时间
set s__SetHeight_AcceData_rMoveTime_Switch[this]=0. //用于切换时间.
set s__SetHeight_AcceData_iUpDownFlag[this]=0 //0:Stop,1:Up,2:Down
//SetHeight_Acce
set s__SetHeight_AcceData_iFlyMode[this]=0 //飞行模式,0:没有,1:只上升,2:只下降,3:先升后降
set s__SetHeight_AcceData_rInitHeight[this]=0. //初始高度
set s__SetHeight_AcceData_rTargetHeight[this]=0. //目标高度
set s__SetHeight_AcceData_rMaxHeight[this]=0. //最高高度
set s__SetHeight_AcceData_rMinHeight[this]=0. //最低高度
set s__SetHeight_AcceData_rCurrentHeight[this]=0. //当前高度
//
set s__SetHeight_AcceData_rInitSpeed[this]=0. //初始速度
set s__SetHeight_AcceData_rAcceleration[this]=0. //加速度
endfunction

//Generated destructor of SetHeight_AcceData
function s__SetHeight_AcceData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SetHeight_AcceData")
        return
    elseif (si__SetHeight_AcceData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SetHeight_AcceData")
        return
    endif
    call s__SetHeight_AcceData_onDestroy(this)
    set si__SetHeight_AcceData_V[this]=si__SetHeight_AcceData_F
    set si__SetHeight_AcceData_F=this
endfunction
        

//library SetHeightAcceleration ends
//library SetHeightWay:
        
    function SetHeightWay___SetHeightWayInit takes nothing returns nothing
        set SetHeightWay___tTimer_Height=CreateTimer()
        //call TimerStart(tTimer_Height, rTimerInterval_Height, true, function HeightData.TimerAction_Height)
        set SetHeightWay___iTimerID_Height=GetHandleId(SetHeightWay___tTimer_Height)
    endfunction
    
//Height

        function s__HeightData_create takes unit u,real TotalTime returns integer
            local integer st
            if ( SetHeightWay___iNum_Height < 8190 ) then //已经在冲锋的单位无法再被设置冲锋
set st=s__HeightData__allocate()
                set s__HeightData_uUnit[st]=u
                set s__HeightData_rTotalTime[st]=TotalTime
                
                set SetHeightWay___iNum_Height=SetHeightWay___iNum_Height + 1
                set SetHeightWay___iData_Height[SetHeightWay___iNum_Height]=(st)
                call UnitAddAbility(s__HeightData_uUnit[st], 'Arav') //乌鸦技能，可以设置高度
if SetHeightWay___bTimerState_Height == false then
                    call TimerStart(SetHeightWay___tTimer_Height, rTimerInterval_Height, true, function sc__HeightData_TimerAction_Height)
                    set SetHeightWay___bTimerState_Height=true
                endif
                
                //call BJDebugMsg("SetHeight_create:" + I2S(iData_Height[iNum_Height]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__HeightData_SetHeightData takes integer st,integer FlyMode,real CurrentHeight,real ExtremeHeight,real EveryHeight returns nothing
            if ( st > 0 ) and ( FlyMode != 0 ) then
                set s__HeightData_iFlyMode[st]=FlyMode
                set s__HeightData_rCurrentHeight[st]=CurrentHeight
                set s__HeightData_rExtremeHeight[st]=ExtremeHeight
                set s__HeightData_rEveryHeight[st]=EveryHeight
                if ( FlyMode == 1 ) then
                    set s__HeightData_iUpDownFlag[st]=1
                elseif ( FlyMode == 2 ) then
                    set s__HeightData_iUpDownFlag[st]=2
                elseif ( FlyMode == 3 ) then
                    set s__HeightData_iUpDownFlag[st]=1
                    set s__HeightData_rEveryHeight[st]=ExtremeHeight / ( s__HeightData_rTotalTime[st] / 2 ) * rTimerInterval_Height
                endif
                
            endif
        endfunction
        
        function s__HeightData_SetHeight takes integer st returns nothing
            
            if ( s__HeightData_iFlyMode[st] == 0 ) or ( s__HeightData_iUpDownFlag[st] == 0 ) then
                return
            endif
            
            if ( s__HeightData_iFlyMode[st] == 1 ) then
                if ( s__HeightData_rCurrentHeight[st] >= s__HeightData_rExtremeHeight[st] ) then
                    set s__HeightData_iUpDownFlag[st]=0
                endif
            elseif ( s__HeightData_iFlyMode[st] == 2 ) then
                
            elseif ( s__HeightData_iFlyMode[st] == 3 ) then
                if ( s__HeightData_rCurrentHeight[st] >= s__HeightData_rExtremeHeight[st] ) then
                    set s__HeightData_iUpDownFlag[st]=2
                endif
            endif
            
            if ( s__HeightData_iUpDownFlag[st] == 1 ) then
                set s__HeightData_rCurrentHeight[st]=s__HeightData_rCurrentHeight[st] + s__HeightData_rEveryHeight[st]
            elseif ( s__HeightData_iUpDownFlag[st] == 2 ) then
                set s__HeightData_rCurrentHeight[st]=s__HeightData_rCurrentHeight[st] - s__HeightData_rEveryHeight[st]
            endif
            if ( s__HeightData_rCurrentHeight[st] < 0 ) then
                set s__HeightData_rCurrentHeight[st]=0
                set s__HeightData_iUpDownFlag[st]=0
            endif
            call SetUnitFlyHeight(s__HeightData_uUnit[st], s__HeightData_rCurrentHeight[st], 0.)
            
        endfunction
        
        function s__HeightData_TimerAction_Height takes nothing returns nothing
            local integer i= 1
            local integer Num= SetHeightWay___iNum_Height
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            //call BJDebugMsg("Running")
            
            if Num == 0 then
                call PauseTimer(SetHeightWay___tTimer_Height)
                set SetHeightWay___bTimerState_Height=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(SetHeightWay___iData_Height[i])
                if ( SetHeightWay___iData_Height[i] != 0 ) and ( s__HeightData_uUnit[st] != null ) and ( GetUnitState(s__HeightData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__HeightData_rMoveTime[st] <= s__HeightData_rTotalTime[st] ) then
                    set s__HeightData_rMoveTime[st]=s__HeightData_rMoveTime[st] + rTimerInterval_Height
                    //Height
                    call s__HeightData_SetHeight(st)
                else
                    //Done
                    set SetHeightWay___iData_Height[i]=0
                    set SetHeightWay___iNum_Height=SetHeightWay___iNum_Height - 1
                    call sc__HeightData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetHeightWay___iData_Height[i]=SetHeightWay___iData_Height[Num]
                    endif
                    set SetHeightWay___iData_Height[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__HeightData_onDestroy takes integer this returns nothing
            call UnitRemoveAbility(s__HeightData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__HeightData_uUnit[this]=null
            set s__HeightData_rTotalTime[this]=0.
            set s__HeightData_rMoveTime[this]=0.
            
            //Height
            set s__HeightData_iFlyMode[this]=0
            set s__HeightData_iUpDownFlag[this]=0
            set s__HeightData_rExtremeHeight[this]=0.
            set s__HeightData_rCurrentHeight[this]=0.
            set s__HeightData_rEveryHeight[this]=0.
        endfunction

//Generated destructor of HeightData
function s__HeightData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: HeightData")
        return
    elseif (si__HeightData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: HeightData")
        return
    endif
    call s__HeightData_onDestroy(this)
    set si__HeightData_V[this]=si__HeightData_F
    set si__HeightData_F=this
endfunction
        

//library SetHeightWay ends
//library UnitState:
    
    
    
    
    
//textmacro instance: tmUnitState("MaxLife", "UNIT_STATE_MAX_LIFE")
        function US_GetUnitMaxLife takes unit uUnit returns real
            return GetUnitState(uUnit, UNIT_STATE_MAX_LIFE)
        endfunction
        function US_SetUnitMaxLife takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MAX_LIFE, RNonnegative(rData))
        endfunction
        function US_AddUnitMaxLife takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MAX_LIFE, RNonnegative(GetUnitState(uUnit, UNIT_STATE_MAX_LIFE) + rData))
        endfunction
//end of: tmUnitState("MaxLife", "UNIT_STATE_MAX_LIFE")
//textmacro instance: tmUnitState("Life", "UNIT_STATE_LIFE")
        function US_GetUnitLife takes unit uUnit returns real
            return GetUnitState(uUnit, UNIT_STATE_LIFE)
        endfunction
        function US_SetUnitLife takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_LIFE, RNonnegative(rData))
        endfunction
        function US_AddUnitLife takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_LIFE, RNonnegative(GetUnitState(uUnit, UNIT_STATE_LIFE) + rData))
        endfunction
//end of: tmUnitState("Life", "UNIT_STATE_LIFE")
//textmacro instance: tmUnitState("MaxMana", "UNIT_STATE_MAX_MANA")
        function US_GetUnitMaxMana takes unit uUnit returns real
            return GetUnitState(uUnit, UNIT_STATE_MAX_MANA)
        endfunction
        function US_SetUnitMaxMana takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MAX_MANA, RNonnegative(rData))
        endfunction
        function US_AddUnitMaxMana takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MAX_MANA, RNonnegative(GetUnitState(uUnit, UNIT_STATE_MAX_MANA) + rData))
        endfunction
//end of: tmUnitState("MaxMana", "UNIT_STATE_MAX_MANA")
//textmacro instance: tmUnitState("Mana", "UNIT_STATE_MANA")
        function US_GetUnitMana takes unit uUnit returns real
            return GetUnitState(uUnit, UNIT_STATE_MANA)
        endfunction
        function US_SetUnitMana takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MANA, RNonnegative(rData))
        endfunction
        function US_AddUnitMana takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, UNIT_STATE_MANA, RNonnegative(GetUnitState(uUnit, UNIT_STATE_MANA) + rData))
        endfunction
//end of: tmUnitState("Mana", "UNIT_STATE_MANA")
//textmacro instance: tmUnitState("ATKSpeed", "ConvertUnitState(0x51)")
        function US_GetUnitATKSpeed takes unit uUnit returns real
            return GetUnitState(uUnit, ConvertUnitState(0x51))
        endfunction
        function US_SetUnitATKSpeed takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, ConvertUnitState(0x51), RNonnegative(rData))
        endfunction
        function US_AddUnitATKSpeed takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, ConvertUnitState(0x51), RNonnegative(GetUnitState(uUnit, ConvertUnitState(0x51)) + rData))
        endfunction
//end of: tmUnitState("ATKSpeed", "ConvertUnitState(0x51)")
//textmacro instance: tmUnitState("ATKInterval", "ConvertUnitState(0x25)")
        function US_GetUnitATKInterval takes unit uUnit returns real
            return GetUnitState(uUnit, ConvertUnitState(0x25))
        endfunction
        function US_SetUnitATKInterval takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, ConvertUnitState(0x25), RNonnegative(rData))
        endfunction
        function US_AddUnitATKInterval takes unit uUnit,real rData returns nothing
            call SetUnitState(uUnit, ConvertUnitState(0x25), RNonnegative(GetUnitState(uUnit, ConvertUnitState(0x25)) + rData))
        endfunction
//end of: tmUnitState("ATKInterval", "ConvertUnitState(0x25)")
    
    //攻击和防御可以是负的
    //攻击
    function US_GetUnitATK takes unit uUnit returns real
        return GetUnitState(uUnit, ConvertUnitState(0x12))
    endfunction
    function US_SetUnitATK takes unit uUnit,real rData returns nothing
        call SetUnitState(uUnit, ConvertUnitState(0x12), rData)
    endfunction
    function US_AddUnitATK takes unit uUnit,real rData returns nothing
        call SetUnitState(uUnit, ConvertUnitState(0x12), GetUnitState(uUnit, ConvertUnitState(0x12)) + rData)
    endfunction
    //护甲
    function US_GetUnitArmor takes unit uUnit returns real
        return GetUnitState(uUnit, ConvertUnitState(0x20))
    endfunction
    function US_SetUnitArmor takes unit uUnit,real rData returns nothing
        call SetUnitState(uUnit, ConvertUnitState(0x20), rData)
    endfunction
    function US_AddUnitArmor takes unit uUnit,real rData returns nothing
        call SetUnitState(uUnit, ConvertUnitState(0x20), GetUnitState(uUnit, ConvertUnitState(0x20)) + rData)
    endfunction
    //速度
    function US_GetUnitMoveSpeed takes unit uUnit returns real
        return GetUnitDefaultMoveSpeed(uUnit)
    endfunction
    function US_SetUnitMoveSpeed takes unit uUnit,real rData returns nothing
        call SetUnitMoveSpeed(uUnit, RNonnegative(rData))
    endfunction
    function US_AddUnitMoveSpeed takes unit uUnit,real rData returns nothing
        call SetUnitMoveSpeed(uUnit, RNonnegative(GetUnitDefaultMoveSpeed(uUnit) + rData))
    endfunction
    
    
    //生命恢复
    function US_UnitLifeRecovery takes unit uUnit,real rData returns nothing
        local real rLifeRecoCoef= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rLifeRecoCoef"))
local real rNonLifeReco= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rNonLifeReco"))
set rLifeRecoCoef=rLifeRecoCoef * 0.01
        if ( rNonLifeReco == 1 ) or ( rLifeRecoCoef == 0 ) then //禁疗或者生命恢复系数为0
//显示禁疗
call EffectFontDisplay(GetUnitX(uUnit) , GetUnitY(uUnit) , 0 , iEffeFont_RestLife) //禁疗显示
return
        endif
        set rData=rData * rLifeRecoCoef
        call US_AddUnitLife(uUnit , rData)
        call EffectFontDisplay(GetUnitX(uUnit) , GetUnitY(uUnit) , R2I(rData) , iEffeFont_RestLife) //显示
endfunction
    
    
    
    
    
    //Hero获取英雄全属性
    function iGetHeroAllState takes unit uHero returns integer
        return ( GetHeroStr(uHero, true) + GetHeroAgi(uHero, true) + GetHeroInt(uHero, true) )
    endfunction
    function rGetHeroAllState takes unit uHero returns real
        return I2R(GetHeroStr(uHero, true) + GetHeroAgi(uHero, true) + GetHeroInt(uHero, true))
    endfunction
//textmacro instance: tmHeroState("Str")
        function iGetHeroStr takes unit uHero returns integer
            return GetHeroStr(uHero, true)
        endfunction
        function rGetHeroStr takes unit uHero returns real
            return I2R(GetHeroStr(uHero, true))
        endfunction
        function iSetHeroStr takes unit uHero,integer iData returns nothing
            call SetHeroStr(uHero, INonnegative(iData), true)
        endfunction
        function iAddHeroStr takes unit uHero,integer iData returns nothing
            call SetHeroStr(uHero, INonnegative(iGetHeroStr(uHero) + iData), true)
        endfunction
//end of: tmHeroState("Str")
//textmacro instance: tmHeroState("Agi")
        function iGetHeroAgi takes unit uHero returns integer
            return GetHeroAgi(uHero, true)
        endfunction
        function rGetHeroAgi takes unit uHero returns real
            return I2R(GetHeroAgi(uHero, true))
        endfunction
        function iSetHeroAgi takes unit uHero,integer iData returns nothing
            call SetHeroAgi(uHero, INonnegative(iData), true)
        endfunction
        function iAddHeroAgi takes unit uHero,integer iData returns nothing
            call SetHeroAgi(uHero, INonnegative(iGetHeroAgi(uHero) + iData), true)
        endfunction
//end of: tmHeroState("Agi")
//textmacro instance: tmHeroState("Int")
        function iGetHeroInt takes unit uHero returns integer
            return GetHeroInt(uHero, true)
        endfunction
        function rGetHeroInt takes unit uHero returns real
            return I2R(GetHeroInt(uHero, true))
        endfunction
        function iSetHeroInt takes unit uHero,integer iData returns nothing
            call SetHeroInt(uHero, INonnegative(iData), true)
        endfunction
        function iAddHeroInt takes unit uHero,integer iData returns nothing
            call SetHeroInt(uHero, INonnegative(iGetHeroInt(uHero) + iData), true)
        endfunction
//end of: tmHeroState("Int")
    
    
    

//library UnitState ends
//library View:
    //每帧
    function Trig_PerFrame takes nothing returns nothing
        local boolean bIsSetCameraDistance
        local real rCameraDistance
        set bIsSetCameraDistance=LoadBoolean(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("IsSetCameraDistance"))
        if ( bIsSetCameraDistance == true ) then
            set rCameraDistance=LoadReal(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("rCameraDistance"))
            //设置玩家镜头属性X旋转角度为默认
            call SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, bj_CAMERA_DEFAULT_AOA, 0.)
            //镜头距离
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, rCameraDistance, 0.1)
            
            call SaveBoolean(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("IsSetCameraDistance"), false)
        endif
    endfunction
    
    //滚轮
    function Trig_MouseWheel takes nothing returns nothing
        local integer iWheelDelta= DzGetWheelDelta()
local real rCameraDistance
        if ( ( DzIsMouseOverUI() == false ) ) then //鼠标不在屏幕
return
        endif
        call SaveBoolean(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("IsSetCameraDistance"), true)
        set rCameraDistance=LoadReal(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("rCameraDistance"))
        if ( iWheelDelta > 0 ) then //向前，拉近
set rCameraDistance=rCameraDistance - 200
        elseif ( iWheelDelta < 0 ) then
            set rCameraDistance=rCameraDistance + 200
        endif
        if ( rCameraDistance > 3000 ) then
            set rCameraDistance=3000
        endif
        if ( rCameraDistance < 600 ) then
            set rCameraDistance=600
        endif
        call SaveReal(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("rCameraDistance"), rCameraDistance)
    endfunction
    function View__ViewInit takes nothing returns nothing
        local real rCameraDistance= 2000
call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, rCameraDistance, 0.1)
        call SaveReal(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("rCameraDistance"), rCameraDistance)
        call SaveBoolean(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("IsSetCameraDistance"), false)
        //每帧
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetUpdateCallbackByCode(function Trig_PerFrame)
        endif
        //滚轮滑动
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzTriggerRegisterMouseWheelEventByCode(null, false, function Trig_MouseWheel)
        endif
        
    endfunction

//library View ends
//library YDTriggerSaveLoadSystem:
//#  define YDTRIGGER_handle(SG)                          YDTRIGGER_HT##SG##(HashtableHandle)
    function YDTriggerSaveLoadSystem___Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEAbilityState:











 function YDWEGetUnitAbilityState takes unit u,integer abilcode,integer state_type returns real
		return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
	endfunction
 function YDWEGetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
		return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWEGetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
		return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWEGetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
		return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWESetUnitAbilityState takes unit u,integer abilcode,integer state_type,real value returns boolean
		return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
	endfunction
 function YDWESetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns boolean
		return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction
 function YDWESetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns boolean
		return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction
 function YDWESetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns boolean
		return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction

 function YDWEUnitTransform takes unit u,integer abilcode,integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), 1, YDWEAbilityState___ABILITY_DATA_UNITID, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction


 function YDWEGetItemDataString takes integer itemcode,integer data_type returns string
		return EXGetItemDataString(itemcode, data_type)
	endfunction
 function YDWESetItemDataString takes integer itemcode,integer data_type,string value returns boolean
		return EXSetItemDataString(itemcode, data_type, value)
	endfunction

//library YDWEAbilityState ends
//library YDWEBase:
//===========================================================================
//HashTable
//===========================================================================
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//����
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT, i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT, StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT, i, j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT, i, j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT, pTable, pKey, i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT, pTable, pKey, r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT, pTable, pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT, pTable, pKey, s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT, pTable, pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT, pTable, pKey, b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT, pTable, pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, pTable, pKey, u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT, pTable, pKey, uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT, pTable, pKey, abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT, pTable, pKey, p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT, pTable, pKey, it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT, pTable, pKey, itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, pTable, pKey, t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, pTable, pKey, trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, pTable, pKey, pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT, pTable, pKey, g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, pTable, pKey, m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, pTable, pKey, tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, pTable, pKey, ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, pTable, pKey, e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, pTable, pKey, da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, pTable, pKey, et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT, pTable, pKey, fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, pTable, pKey, be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, pTable, pKey, sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, pTable, pKey, td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, pTable, pKey, d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, pTable, pKey, bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, pTable, pKey, qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, pTable, pKey, qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID,integer key,integer missionKey,hashtable table returns nothing
    call SaveInteger(table, missionKey, key, AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table,integer parentKey,integer childKey,integer AbilityID returns nothing
    call SaveInteger(table, parentKey, childKey, AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key,integer missionKey,hashtable table returns integer
    return LoadInteger(table, missionKey, key)
endfunction
function YDWELoadAbilityHandle takes hashtable table,integer parentKey,integer childKey returns integer
    return LoadInteger(table, parentKey, childKey)
endfunction
//===========================================================================
//返回参数
//===========================================================================
//地图边界判断
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
//两个单位之间的距离
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    return SquareRoot(( GetUnitX(a) - GetUnitX(b) ) * ( GetUnitX(a) - GetUnitX(b) ) + ( GetUnitY(a) - GetUnitY(b) ) * ( GetUnitY(a) - GetUnitY(b) ))
endfunction
//两个单位之间的角度
function YDWEAngleBetweenUnits takes unit fromUnit,unit toUnit returns real
    return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
endfunction
//生成区域
function YDWEGetRect takes real x,real y,real width,real height returns rect
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
endfunction
//===========================================================================
//设置单位可以飞行
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u, 'Amrf')
    call UnitRemoveAbility(u, 'Amrf')
endfunction
//===========================================================================
//字符窜与ID转换
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result= ""
    local integer remainingValue= value
    local integer charValue
    local integer byteno
    set byteno=0
    loop
        set charValue=ModuloInteger(remainingValue, 256)
        set remainingValue=remainingValue / 256
        set result=SubString(charMap, charValue, charValue + 1) + result
        set byteno=byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0
local integer b=0
local integer numx=1
local integer result=0
    loop
    exitwhen b > strlength - 1
        set numx=R2I(Pow(256, strlength - 1 - b))
        set a=1
        loop
            exitwhen a > 255
            if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
                set result=result + a * numx
                set a=256
            endif
            set a=a + 1
        endloop
        set b=b + 1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//YDWE特殊技能结束事件 
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero,integer index returns nothing
 local integer i= 0
    loop
        exitwhen i >= YDWEBase___AbilityCastingOverEventNumber
        if YDWEBase___AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase___AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase___AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase___AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase___AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase___AbilityCastingOverEventQueue[YDWEBase___AbilityCastingOverEventNumber]=trg
	set YDWEBase___AbilityCastingOverEventType[YDWEBase___AbilityCastingOverEventNumber]=index
	set YDWEBase___AbilityCastingOverEventNumber=YDWEBase___AbilityCastingOverEventNumber + 1
endfunction 
//===========================================================================
//系统函数完善
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up, p, x, y, face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip, x, y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p,string s returns string
    return YDWEBase___yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//系统函数补充
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i= 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i=i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//===========================================================================
//显示版本
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00KKWE 1.0.1.2204")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t= CreateTrigger()
    local integer i= 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "KKWE Version", true)
        set i=i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t=null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable()
	//=================设置变量=====================
	set yd_MapMinX=GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY=GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX=GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY=GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set YDWEBase___yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase___yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase___yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase___yd_PlayerColor[3]="|cFF540081"
    set YDWEBase___yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase___yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase___yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase___yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase___yd_PlayerColor[8]="|cFF959697"
    set YDWEBase___yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase___yd_PlayerColor[10]="|cFF106246"
    set YDWEBase___yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase___yd_PlayerColor[12]="|cFF282828"
    set YDWEBase___yd_PlayerColor[13]="|cFF282828"
    set YDWEBase___yd_PlayerColor[14]="|cFF282828"
    set YDWEBase___yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEEventDamageData:


	
 function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_PHYSICAL)
	endfunction
 function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK)
	endfunction
	
 function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_RANGED)
	endfunction
	
 function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_DAMAGE_TYPE))
	endfunction
 function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_WEAPON_TYPE))
	endfunction
	
 function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_ATTACK_TYPE))
	endfunction
	
 function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
	
	

//library YDWEEventDamageData ends
//library YDWEJapiEffect:













 function YDWESetEffectLoc takes effect e,location loc returns nothing
		call EXSetEffectXY(e, GetLocationX(loc), GetLocationY(loc))
	endfunction

//library YDWEJapiEffect ends
//library YDWEJapiUnit:




 function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
 function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction

//library YDWEJapiUnit ends
//library YDWETriggerEvent:
	
//===========================================================================  
//任意单位伤害事件 
//===========================================================================
function YDWEAnyUnitDamagedTriggerAction takes nothing returns nothing
    local integer i= 0
    
    loop
        exitwhen i >= YDWETriggerEvent___DamageEventNumber
        if YDWETriggerEvent___DamageEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent___DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent___DamageEventQueue[i]) then
            call TriggerExecute(YDWETriggerEvent___DamageEventQueue[i])
        endif
        set i=i + 1
    endloop
endfunction
function YDWEAnyUnitDamagedFilter takes nothing returns boolean
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
        call TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    endif
    return false
endfunction
function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
    local trigger t= CreateTrigger()
    local region r= CreateRegion()
    local group g= CreateGroup()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(t, r, Condition(function YDWEAnyUnitDamagedFilter))
    call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function YDWEAnyUnitDamagedFilter))
    call DestroyGroup(g)
    set r=null
    set t=null
    set g=null
endfunction
	
function YDWESyStemAnyUnitDamagedRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent___DamageEventNumber == 0 then
        set yd_DamageEventTrigger=CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction)
        call YDWEAnyUnitDamagedEnumUnit()
    endif
    
    set YDWETriggerEvent___DamageEventQueue[YDWETriggerEvent___DamageEventNumber]=trg
    set YDWETriggerEvent___DamageEventNumber=YDWETriggerEvent___DamageEventNumber + 1
endfunction
//===========================================================================  
//移动物品事件 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i= 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		set bj_lastMovedItemInItemSlot=GetOrderTargetItem()
    	loop
        	exitwhen i >= YDWETriggerEvent___MoveItemEventNumber
        	if YDWETriggerEvent___MoveItemEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent___MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent___MoveItemEventQueue[i]) then
        	    call TriggerExecute(YDWETriggerEvent___MoveItemEventQueue[i])
        	endif
        	set i=i + 1
    	endloop
	endif
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent___MoveItemEventNumber == 0 then
        set YDWETriggerEvent___MoveItemEventTrigger=CreateTrigger()
        call TriggerAddAction(YDWETriggerEvent___MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction)
        call TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent___MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif
    
    set YDWETriggerEvent___MoveItemEventQueue[YDWETriggerEvent___MoveItemEventNumber]=trg
    set YDWETriggerEvent___MoveItemEventNumber=YDWETriggerEvent___MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction

//library YDWETriggerEvent ends
//library YDWEYDWEJapiScript:


//library YDWEYDWEJapiScript ends
//library silingE:
    
    function SummonUnitAddState takes unit uMJUnit,real rLevel returns nothing
        local real rLife= 100 * rLevel
        local real rMana= rLife
        local real rATK= 10 * rLevel
        local real rArmor= 2 * rLevel
        call US_AddUnitMaxLife(uMJUnit , rLife)
        call US_AddUnitLife(uMJUnit , rLife)
        call US_AddUnitMaxMana(uMJUnit , rMana)
        call US_AddUnitMana(uMJUnit , rMana)
        call US_AddUnitATK(uMJUnit , rATK) //基础伤害
call US_AddUnitArmor(uMJUnit , rArmor) //护甲
endfunction
    

//library silingE ends
//library BarrageSystem:
        
    function BarrageSystem___BarrageSystemInit takes nothing returns nothing
        set BarrageSystem___tTimer_Barrage=CreateTimer()
        //call TimerStart(tTimer_Barrage, rTimerInterval_Barrage, true, function BarrageData.TimerAction_Barrage)
        set BarrageSystem___iTimerID_Barrage=GetHandleId(BarrageSystem___tTimer_Barrage)
    endfunction
    

        //Barrage
        
        function s__BarrageData_create takes unit u,unit TargetUnit,boolean IsDestroyUnit,real TotalTime returns integer
            local real rCount
local integer st
            if ( BarrageSystem___iNum_Barrage < 8190 ) then
                set st=s__BarrageData__allocate()
                set s__BarrageData_uUnit[st]=u
                set s__BarrageData_uTargetUnit[st]=TargetUnit
                set s__BarrageData_bIsDestroyUnit[st]=IsDestroyUnit
                set s__BarrageData_rTotalTime[st]=TotalTime
                set rCount=TotalTime / 0.03
                set s__BarrageData_Everyt[st]=1.0 / rCount
                
                set BarrageSystem___iNum_Barrage=BarrageSystem___iNum_Barrage + 1
                set BarrageSystem___iData_Barrage[BarrageSystem___iNum_Barrage]=(st)
                
                if BarrageSystem___bTimerState_Barrage == false then
                    call TimerStart(BarrageSystem___tTimer_Barrage, rTimerInterval_Barrage, true, function sc__BarrageData_TimerAction_Barrage)
                    set BarrageSystem___bTimerState_Barrage=true
                endif
                
                //call BJDebugMsg("SetBarrage_create:" + I2S(iData_Barrage[iNum_Barrage]))
                return st
            else
                //call BJDebugMsg("当前弹幕数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__BarrageData_SetBarrageData takes integer st,real x0,real y0 returns nothing
            if ( st != 0 ) then
                set s__BarrageData_P0_x[st]=x0
                set s__BarrageData_P0_y[st]=y0
               // set st.P1_x = x1
                //set st.P1_y = y1
                //set st.P2_x = x2
                //set st.P2_y = y2
                set s__BarrageData_P3_x[st]=GetUnitX(s__BarrageData_uTargetUnit[st])
                set s__BarrageData_P3_y[st]=GetUnitY(s__BarrageData_uTargetUnit[st])
                call sc__BarrageData_SetControlPoint(st)
            endif
        endfunction
        
        function s__BarrageData_SetControlPoint takes integer st returns nothing
local real rReverseDegree= GetDegree(s__BarrageData_P0_x[st] , s__BarrageData_P0_y[st] , s__BarrageData_P3_x[st] , s__BarrageData_P3_y[st]) + 180.
            local real rRadius_P1= GetRandomReal(200., 800.)
            local real rRadius_P2= GetRandomReal(200., 800.)
            local real rDegree_P1= rReverseDegree + GetRandomReal(- 60., 60.)
            local real rDegree_P2= GetRandomReal(0., 360.)
            
            //call BJDebugMsg("P1:" + R2S(rRandomReal))
            
            set s__BarrageData_P1_x[st]=s__BarrageData_P0_x[st] + rRadius_P1 * Cos(rDegree_P1 * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__BarrageData_P1_y[st]=s__BarrageData_P0_y[st] + rRadius_P1 * Sin(rDegree_P1 * bj_DEGTORAD)
            set s__BarrageData_P2_x[st]=s__BarrageData_P3_x[st] + rRadius_P2 * Cos(rDegree_P2 * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__BarrageData_P2_y[st]=s__BarrageData_P3_y[st] + rRadius_P2 * Sin(rDegree_P2 * bj_DEGTORAD)
        endfunction
        
        function s__BarrageData_BesselCurveFormula takes integer st returns nothing
local real rx1
            local real ry1
            local real rx2
            local real ry2
            local real rDegree
            //track跟踪
            set s__BarrageData_P3_x[st]=GetUnitX(s__BarrageData_uTargetUnit[st])
            set s__BarrageData_P3_y[st]=GetUnitY(s__BarrageData_uTargetUnit[st])
            //Coodinate
            set s__BarrageData_rBt_x[st]=Pow(( 1 - s__BarrageData_t[st] ), 3.) * s__BarrageData_P0_x[st] + 3 * Pow(( 1 - s__BarrageData_t[st] ), 2.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P1_x[st] + 3 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P2_x[st] + Pow(s__BarrageData_t[st], 3.) * s__BarrageData_P3_x[st]
            set s__BarrageData_rBt_y[st]=Pow(( 1 - s__BarrageData_t[st] ), 3.) * s__BarrageData_P0_y[st] + 3 * Pow(( 1 - s__BarrageData_t[st] ), 2.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P1_y[st] + 3 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P2_y[st] + Pow(s__BarrageData_t[st], 3.) * s__BarrageData_P3_y[st]
            //CalculateDegree
            set rx1=Pow(( 1 - s__BarrageData_t[st] ), 2.) * s__BarrageData_P0_x[st] + 2 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P1_x[st] + Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P2_x[st]
            set ry1=Pow(( 1 - s__BarrageData_t[st] ), 2.) * s__BarrageData_P0_y[st] + 2 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P1_y[st] + Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P2_y[st]
            set rx2=Pow(( 1 - s__BarrageData_t[st] ), 2.) * s__BarrageData_P1_x[st] + 2 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P2_x[st] + Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P3_x[st]
            set ry2=Pow(( 1 - s__BarrageData_t[st] ), 2.) * s__BarrageData_P1_y[st] + 2 * Pow(( 1 - s__BarrageData_t[st] ), 1.) * Pow(s__BarrageData_t[st], 1.) * s__BarrageData_P2_y[st] + Pow(s__BarrageData_t[st], 2.) * s__BarrageData_P3_y[st]
            set rDegree=GetDegree(rx1 , ry1 , rx2 , ry2)
            
            set s__BarrageData_rBt_x[st]=YDWECoordinateX(s__BarrageData_rBt_x[st]) //x坐标边界检测
set s__BarrageData_rBt_y[st]=YDWECoordinateY(s__BarrageData_rBt_y[st]) //y坐标边界检测
call SetUnitX(s__BarrageData_uUnit[st], s__BarrageData_rBt_x[st])
            call SetUnitY(s__BarrageData_uUnit[st], s__BarrageData_rBt_y[st])
            call SetUnitFacing(s__BarrageData_uUnit[st], rDegree)
        endfunction
        
        function s__BarrageData_TimerAction_Barrage takes nothing returns nothing
            local integer i= 1
            local integer Num= BarrageSystem___iNum_Barrage
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            //call BJDebugMsg("Running")
            
            if Num == 0 then
                call PauseTimer(BarrageSystem___tTimer_Barrage)
                set BarrageSystem___bTimerState_Barrage=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(BarrageSystem___iData_Barrage[i])
                if ( BarrageSystem___iData_Barrage[i] != 0 ) and ( s__BarrageData_uUnit[st] != null ) and ( GetUnitState(s__BarrageData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__BarrageData_t[st] < 1. ) and ( s__BarrageData_rMoveTime[st] <= s__BarrageData_rTotalTime[st] ) then
                    set s__BarrageData_rMoveTime[st]=s__BarrageData_rMoveTime[st] + rTimerInterval_Barrage
                    set s__BarrageData_t[st]=s__BarrageData_t[st] + s__BarrageData_Everyt[st]
                    //Barrage
                    call s__BarrageData_BesselCurveFormula(st)
                    
                    //call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", d.x, d.y))
                else
                    //Done
                    set BarrageSystem___iData_Barrage[i]=0
                    set BarrageSystem___iNum_Barrage=BarrageSystem___iNum_Barrage - 1
                    call sc__BarrageData_deallocate(st)
                    //排序
                    if ( i != Num ) then //弹幕完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set BarrageSystem___iData_Barrage[i]=BarrageSystem___iData_Barrage[Num]
                    endif
                    set BarrageSystem___iData_Barrage[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__BarrageData_onDestroy takes integer this returns nothing
            if ( s__BarrageData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__BarrageData_uUnit[this])
            endif
            //Barrage
            set s__BarrageData_uUnit[this]=null //单位
set s__BarrageData_uTargetUnit[this]=null
            set s__BarrageData_bIsDestroyUnit[this]=false //弹幕结束是否删除单位
set s__BarrageData_rTotalTime[this]=0. //弹幕时间限制
set s__BarrageData_rMoveTime[this]=0. //已经弹幕的时间
//Barrage
set s__BarrageData_t[this]=0. //取值：0-1
set s__BarrageData_Everyt[this]=0. //每0.03秒变化的
set s__BarrageData_rBt_x[this]=0.
            set s__BarrageData_rBt_y[this]=0.
            set s__BarrageData_P0_x[this]=0.
            set s__BarrageData_P0_y[this]=0.
            set s__BarrageData_P1_x[this]=0.
            set s__BarrageData_P1_y[this]=0.
            set s__BarrageData_P2_x[this]=0.
            set s__BarrageData_P2_y[this]=0.
            set s__BarrageData_P3_x[this]=0.
            set s__BarrageData_P3_y[this]=0.
        endfunction

//Generated destructor of BarrageData
function s__BarrageData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: BarrageData")
        return
    elseif (si__BarrageData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: BarrageData")
        return
    endif
    call s__BarrageData_onDestroy(this)
    set si__BarrageData_V[this]=si__BarrageData_F
    set si__BarrageData_F=this
endfunction
        
    

//library BarrageSystem ends
//library Commom:
    
    //检查X坐标有没有超过边界
    function IsXExceedBoundary takes real x11 returns real
        local real X_MIN= GetRectMinX(bj_mapInitialPlayableArea)
        local real X_MAX= GetRectMaxX(bj_mapInitialPlayableArea)
        if ( x11 >= X_MAX ) then
            set x11=X_MAX - 50
        elseif ( x11 < X_MIN ) then
            set x11=X_MIN + 50
        endif
        return x11
    endfunction
    //检查Y坐标有没有超过边界
    function IsYExceedBoundary takes real y11 returns real
        local real Y_MIN= GetRectMinY(bj_mapInitialPlayableArea)
        local real Y_MAX= GetRectMaxY(bj_mapInitialPlayableArea)
        if ( y11 >= Y_MAX ) then
            set y11=Y_MAX - 50
        elseif ( y11 < Y_MIN ) then
            set y11=Y_MIN + 50
        endif
        return y11
    endfunction
    
    function Com_SetUnitScale takes unit uUnit,real rData returns nothing
        call SetUnitScale(uUnit, rData, rData, rData) //体积
endfunction
    
    //Damage
    //call RangeDamage(x, y, rRange, uHero, rDamage)
    function RangeDamage takes real x,real y,real rDistance,unit uHero,real rDamage returns nothing
        local group gGroup= CreateGroup()
        local unit uGroupUnit
        call GroupEnumUnitsInRange(gGroup, x, y, rDistance, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, GetOwningPlayer(uHero)) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
                //Action
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            endif
        endloop
        call DestroyGroup(gGroup)
        set gGroup=null
        set uGroupUnit=null
    endfunction
    
    //普通伤害
    //call RangeDamage_Normal(x, y, rRange, uHero, rDamage)
    function RangeDamage_Normal takes real x,real y,real rDistance,unit uHero,real rDamage returns nothing
        local group gGroup= CreateGroup()
        local unit uGroupUnit
        call GroupEnumUnitsInRange(gGroup, x, y, rDistance, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, GetOwningPlayer(uHero)) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
                //Action
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            endif
        endloop
        call DestroyGroup(gGroup)
        set gGroup=null
        set uGroupUnit=null
    endfunction
    
    //自定义攻击伤害类型
    //call RangeDamage_Define(x, y, rRange, uHero, rDamage, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED)
    function RangeDamage_Define takes real x,real y,real rDistance,unit uHero,real rDamage,attacktype at1,damagetype dt1 returns nothing
        local group gGroup= CreateGroup()
        local unit uGroupUnit
        call GroupEnumUnitsInRange(gGroup, x, y, rDistance, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, GetOwningPlayer(uHero)) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
                //Action
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, at1, dt1, WEAPON_TYPE_WHOKNOWS)
            endif
        endloop
        call DestroyGroup(gGroup)
        set gGroup=null
        set uGroupUnit=null
    endfunction
    
    
    //call Com_RangeDamage_Cone(x, y, rRange, rDegree_Centre, rDegree_Range, uHero, rDamage)
    //扇形范围伤害，与rDegree_Centre相差rDegree_Range之内的角度
    function Com_RangeDamage_Cone takes real x,real y,real rDistance,real rDegree_Centre,real rDegree_Range,unit uHero,real rDamage returns nothing
        local group gGroup= CreateGroup()
        local unit uGroupUnit
        local real rDegree
        call GroupEnumUnitsInRange(gGroup, x, y, rDistance, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            set rDegree=GetDegree(x , y , GetUnitX(uGroupUnit) , GetUnitY(uGroupUnit))
            if ( AngleDifference(rDegree , rDegree_Centre) <= rDegree_Range ) and ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, GetOwningPlayer(uHero)) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
                //Action
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            endif
        endloop
        call DestroyGroup(gGroup)
        set gGroup=null
        set uGroupUnit=null
    endfunction
    //TextTag     //漂浮文字
    function CreateTextTag_New takes real x,real y,real z,string sttString,real size returns texttag
        local texttag ttTextTag= CreateTextTag()
        set size=size * 0.023 / 10.
        call SetTextTagPos(ttTextTag, x, y, z) //位置，xyz坐标，z表示z轴偏移
call SetTextTagText(ttTextTag, sttString, size) //内容，字体大小
return ttTextTag
    endfunction
    //CreateTextTag_New(x, y, z, string, size)
    
    
    

//library Commom ends
//library YDWETimerSystem:
function YDWETimerSystem___NewTaskIndex takes nothing returns integer
 local integer h= YDWETimerSystem___TaskListIdleHead
	if YDWETimerSystem___TaskListIdleHead < 0 then
		if YDWETimerSystem___TaskListIdleMax >= 8000 then
    call BJDebugMsg("中心计时器任务队列溢出！")
			return 8100
		else
			set YDWETimerSystem___TaskListIdleMax=YDWETimerSystem___TaskListIdleMax + 1
			return YDWETimerSystem___TaskListIdleMax
		endif
	endif
	set YDWETimerSystem___TaskListIdleHead=YDWETimerSystem___TaskListIdle[h]
	return h
endfunction
function YDWETimerSystem___DeleteTaskIndex takes integer index returns nothing
	set YDWETimerSystem___TaskListIdle[index]=YDWETimerSystem___TaskListIdleHead
	set YDWETimerSystem___TaskListIdleHead=index
endfunction
//该函数序列处理
function YDWETimerSystem___NewTask takes real time,trigger proc returns integer
 local integer index= YDWETimerSystem___NewTaskIndex()
 local integer h= YDWETimerSystem___TaskListHead
 local integer t= R2I(100. * time) + YDWETimerSystem___CurrentTime
 local integer p
	set YDWETimerSystem___TaskListProc[index]=proc
	set YDWETimerSystem___TaskListTime[index]=t
	loop
		set p=YDWETimerSystem___TaskListNext[h]
		if p < 0 or YDWETimerSystem___TaskListTime[p] >= t then
		//	call BJDebugMsg("NewTask:"+I2S(index))
			set YDWETimerSystem___TaskListNext[h]=index
			set YDWETimerSystem___TaskListNext[index]=p
			return index
		endif
		set h=p
	endloop
	return index
endfunction
function YDWETimerSystemNewTask takes real time,trigger proc returns integer
	return YDWETimerSystem___NewTask(time , proc)
endfunction
function YDWETimerSystemGetCurrentTask takes nothing returns integer
	return YDWETimerSystem___CurrentIndex
endfunction
//删除单位
function YDWETimerSystem___RemoveUnit_CallBack takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRemoveUnit takes real time,unit u returns nothing
    call SaveUnitHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRemoveUnit), u)
endfunction
//摧毁计时器
function YDWETimerSystem___DestroyTimer_CallBack takes nothing returns nothing
    call DestroyTimer(LoadTimerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyTimer takes real time,timer t returns nothing
    call SaveTimerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyTimer), t)
endfunction
//删除物品
function YDWETimerSystem___RemoveItem_CallBack takes nothing returns nothing
    call RemoveItem(LoadItemHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRemoveItem takes real time,item it returns nothing
    call SaveItemHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRemoveItem), it)
endfunction
//删除特效
function YDWETimerSystem___DestroyEffect_CallBack takes nothing returns nothing
    call DestroyEffect(LoadEffectHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyEffect takes real time,effect e returns nothing
    call SaveEffectHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyEffect), e)
endfunction
//删除闪电特效
function YDWETimerSystem___DestroyLightning_CallBack takes nothing returns nothing
    call DestroyLightning(LoadLightningHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyLightning takes real time,lightning lt returns nothing
 local integer i= YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyLightning)
    call SaveLightningHandle(YDHT, YDWETimerSystem___TimerHandle, i, lt)
endfunction
//运行触发器
function YDWETimerSystem___RunTrigger_CallBack takes nothing returns nothing
    call TriggerExecute(LoadTriggerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRunTrigger takes real time,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRunTrigger), trg)
endfunction
//删除漂浮文字
function YDWETimerDestroyTextTag takes real time,texttag tt returns nothing
    local integer N=0
    local integer i=0
    if time <= 0 then
        set time=0.01
    endif
    call SetTextTagPermanent(tt, false)
    call SetTextTagLifespan(tt, time)
    call SetTextTagFadepoint(tt, time)
endfunction
//中心计时器主函数
function YDWETimerSystem___Main takes nothing returns nothing
 local integer h= YDWETimerSystem___TaskListHead
 local integer p
	loop
		set YDWETimerSystem___CurrentIndex=YDWETimerSystem___TaskListNext[h]
		exitwhen YDWETimerSystem___CurrentIndex < 0 or YDWETimerSystem___CurrentTime < YDWETimerSystem___TaskListTime[YDWETimerSystem___CurrentIndex]
		//call BJDebugMsg("Task:"+I2S(CurrentIndex))
		call TriggerEvaluate(YDWETimerSystem___TaskListProc[YDWETimerSystem___CurrentIndex])
		call YDWETimerSystem___DeleteTaskIndex(YDWETimerSystem___CurrentIndex)
		set YDWETimerSystem___TaskListNext[h]=YDWETimerSystem___TaskListNext[YDWETimerSystem___CurrentIndex]
	endloop
	set YDWETimerSystem___CurrentTime=YDWETimerSystem___CurrentTime + 1
endfunction
//初始化函数
function YDWETimerSystem___Init takes nothing returns nothing
    set YDWETimerSystem___Timer=CreateTimer()
	set YDWETimerSystem___TimerHandle=GetHandleId(YDWETimerSystem___Timer)
	set YDWETimerSystem___CurrentTime=0
	set YDWETimerSystem___TaskListHead=0
	set YDWETimerSystem___TaskListNext[0]=- 1
	set YDWETimerSystem___TaskListIdleHead=1
	set YDWETimerSystem___TaskListIdleMax=1
	set YDWETimerSystem___TaskListIdle[1]=- 1
	
	set YDWETimerSystem___fnRemoveUnit=CreateTrigger()
	set YDWETimerSystem___fnDestroyTimer=CreateTrigger()
	set YDWETimerSystem___fnRemoveItem=CreateTrigger()
	set YDWETimerSystem___fnDestroyEffect=CreateTrigger()
	set YDWETimerSystem___fnDestroyLightning=CreateTrigger()
	set YDWETimerSystem___fnRunTrigger=CreateTrigger()
	call TriggerAddCondition(YDWETimerSystem___fnRemoveUnit, Condition(function YDWETimerSystem___RemoveUnit_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyTimer, Condition(function YDWETimerSystem___DestroyTimer_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnRemoveItem, Condition(function YDWETimerSystem___RemoveItem_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyEffect, Condition(function YDWETimerSystem___DestroyEffect_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyLightning, Condition(function YDWETimerSystem___DestroyLightning_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnRunTrigger, Condition(function YDWETimerSystem___RunTrigger_CallBack))
	
    call TimerStart(YDWETimerSystem___Timer, 0.01, true, function YDWETimerSystem___Main)
endfunction
//循环类仍用独立计时器
function YDWETimerSystemGetRunIndex takes nothing returns integer
    return YDWETimerSystem___TimerSystem_RunIndex
endfunction
function YDWETimerSystem___RunPeriodicTriggerFunction takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set trg=null
endfunction
function YDWETimerSystem___RunPeriodicTriggerFunctionByTimes takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
    local integer times= LoadInteger(YDHT, tid, $D0003)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set times=times - 1
    if times > 0 then
		call SaveInteger(YDHT, tid, $D0003, times)
      else
        call DestroyTimer(GetExpiredTimer())
        call FlushChildHashtable(YDHT, tid)
    endif
    set trg=null
endfunction
function YDWETimerRunPeriodicTrigger takes real timeout,trigger trg,boolean b,integer times,integer data returns nothing
    local timer t
    local integer tid
    local integer index= 0
    if timeout < 0 then
        return
      else
        set t=CreateTimer()
		set tid=GetHandleId(t)
    endif
    set YDWETimerSystem___TimerSystem_RunIndex=YDWETimerSystem___TimerSystem_RunIndex + 1
	call SaveTriggerHandle(YDHT, tid, $D0001, trg)
	call SaveInteger(YDHT, tid, $D0002, YDWETimerSystem___TimerSystem_RunIndex)
	set index=LoadInteger(YDHT, GetHandleId(trg), 'YDTS' + data)
    set index=index + 1
	call SaveInteger(YDHT, GetHandleId(trg), 'YDTS' + data, index)
	call SaveTimerHandle(YDHT, GetHandleId(trg), ( 'YDTS' + data ) * index, t)
	
    if b == false then
		call SaveInteger(YDHT, tid, $D0003, times)
        call TimerStart(t, timeout, true, function YDWETimerSystem___RunPeriodicTriggerFunctionByTimes)
      else
        call TimerStart(t, timeout, true, function YDWETimerSystem___RunPeriodicTriggerFunction)
    endif
    set t=null
endfunction
function YDWETimerRunPeriodicTriggerOver takes trigger trg,integer data returns nothing
 local integer trgid= GetHandleId(trg)
    local integer index= LoadInteger(YDHT, trgid, 'YDTS' + data)
    local timer t
    loop
        exitwhen index <= 0
        set t=LoadTimerHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        call DestroyTimer(t)
        call FlushChildHashtable(YDHT, GetHandleId(t))
		call RemoveSavedHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        set index=index - 1
    endloop
	
    call RemoveSavedInteger(YDHT, trgid, 'YDTS' + data)
    set t=null
endfunction

//library YDWETimerSystem ends
//library ChargeArrowSystem:
        
    function ChargeArrowSystem___ChargeArrowSystemInit takes nothing returns nothing
        set ChargeArrowSystem___tTimer_ChargeArrow=CreateTimer()
        //call TimerStart(tTimer_ChargeArrow, rTimerInterval_ChargeArrow, true, function ChargeArrowData.TimerAction_ChargeArrow)
        set ChargeArrowSystem___iTimerID_ChargeArrow=GetHandleId(ChargeArrowSystem___tTimer_ChargeArrow)
    endfunction
        

        function s__ChargeArrowData_GetuHitUnit takes integer st returns unit
            return s__ChargeArrowData_uHitUnit[st]
        endfunction
        
        function s__ChargeArrowData_create takes unit uUnit,boolean IsDestroyUnit,real Degree,real TotalDistance,real TotalTime,real EveryDistance returns integer
            local integer st
            local integer iUnitChargeArrowDataAdress= LoadInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeArrowDataAdress"))
            if ( iUnitChargeArrowDataAdress > 0 ) then //已经在冲锋的单位无法再被设置冲锋
return 0
            endif
            if ( ChargeArrowSystem___iNum_ChargeArrow < 8190 ) then
                set st=s__ChargeArrowData__allocate()
                set s__ChargeArrowData_uUnit[st]=uUnit
                set s__ChargeArrowData_bIsDestroyUnit[st]=IsDestroyUnit
                set s__ChargeArrowData_rInitx[st]=GetUnitX(uUnit)
                set s__ChargeArrowData_rInity[st]=GetUnitY(uUnit)
                set s__ChargeArrowData_rDegree[st]=Degree
                set s__ChargeArrowData_rTotalDistance[st]=TotalDistance
                set s__ChargeArrowData_rTotalTime[st]=TotalTime
                set s__ChargeArrowData_rEveryDistance[st]=EveryDistance
                //set st.rEveryDistance = st.rTotalDistance/st.rTotalTime * rTimerInterval_ChargeArrow     //Speed*0.03
                call SetUnitFacing(s__ChargeArrowData_uUnit[st], s__ChargeArrowData_rDegree[st])
                set ChargeArrowSystem___iNum_ChargeArrow=ChargeArrowSystem___iNum_ChargeArrow + 1
                set ChargeArrowSystem___iData_ChargeArrow[ChargeArrowSystem___iNum_ChargeArrow]=(st)
                
                if ChargeArrowSystem___bTimerState_ChargeArrow == false then
                    call TimerStart(ChargeArrowSystem___tTimer_ChargeArrow, rTimerInterval_ChargeArrow, true, function sc__ChargeArrowData_TimerAction_ChargeArrow)
                    set ChargeArrowSystem___bTimerState_ChargeArrow=true
                endif
                
                call SaveInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeArrowDataAdress"), st)
                //call BJDebugMsg("ChargeArrow_create:" + I2S(iData_ChargeArrow[iNum_ChargeArrow]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__ChargeArrowData_ChargeArrowAction_Condition takes nothing returns boolean
            local integer iChargeArrowUnitId= LoadInteger(htTimerHT, ChargeArrowSystem___iTimerID_ChargeArrow, StringHash("iChargeArrowUnitId"))
            return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(I2U(iChargeArrowUnitId))) == false )
        endfunction
        
        function s__ChargeArrowData_ChargeArrowAction takes integer st returns nothing
local group gGroup= CreateGroup()
            local integer iGroupCount= 0
            call SaveInteger(htTimerHT, ChargeArrowSystem___iTimerID_ChargeArrow, StringHash("iChargeArrowUnitId"), GetHandleId(s__ChargeArrowData_uUnit[st]))
            call GroupEnumUnitsInRange(gGroup, s__ChargeArrowData_rInitx[st], s__ChargeArrowData_rInity[st], 50., Condition(function s__ChargeArrowData_ChargeArrowAction_Condition))
            call SaveInteger(htTimerHT, ChargeArrowSystem___iTimerID_ChargeArrow, StringHash("iChargeArrowUnitId"), 0)
            set iGroupCount=CountUnitsInGroup(gGroup)
            if ( iGroupCount > 0 ) then
                set s__ChargeArrowData_bIsHitUnit[st]=true
                set s__ChargeArrowData_uHitUnit[st]=FirstOfGroup(gGroup)
                //call BJDebugMsg("月神箭单位名字："+GetUnitName(st.uUnit))
                //call BJDebugMsg("击中单位名字："+GetUnitName(st.uHitUnit))
            endif
            call DestroyGroup(gGroup)
            set gGroup=null
        endfunction
        
        function s__ChargeArrowData_ChargeArrowTriggerAction takes integer st returns nothing
local trigger tTrigger= LoadTriggerHandle(htUnitHT, GetHandleId(s__ChargeArrowData_uUnit[st]), StringHash("tTrigger"))
            if ( tTrigger != null ) then
            //有触发器，且月神箭击中单位
                if ( s__ChargeArrowData_bIsHitUnit[st] == true ) then
                    call SaveUnitHandle(htTriggerHT, GetHandleId(tTrigger), StringHash("uUnit"), s__ChargeArrowData_uUnit[st]) //传参，传月神箭冲锋单位
call SaveUnitHandle(htTriggerHT, GetHandleId(tTrigger), StringHash("uHitUnit"), s__ChargeArrowData_uHitUnit[st]) //传参，传月神箭冲锋单位
call TriggerExecute(tTrigger)
                    call FlushChildHashtable(htTriggerHT, GetHandleId(tTrigger))
                endif
            endif
            set tTrigger=null
        endfunction
        
        function s__ChargeArrowData_TimerAction_ChargeArrow takes nothing returns nothing
            local integer i= 1
            local integer Num= ChargeArrowSystem___iNum_ChargeArrow
            local integer st
            if Num == 0 then
                call PauseTimer(ChargeArrowSystem___tTimer_ChargeArrow)
                set ChargeArrowSystem___bTimerState_ChargeArrow=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(ChargeArrowSystem___iData_ChargeArrow[i])
                if ( ChargeArrowSystem___iData_ChargeArrow[i] != 0 ) and ( s__ChargeArrowData_uUnit[st] != null ) and ( GetUnitState(s__ChargeArrowData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeArrowData_bIsHitUnit[st] == false ) and ( s__ChargeArrowData_rMoveTime[st] <= s__ChargeArrowData_rTotalTime[st] ) and ( s__ChargeArrowData_rMoveDistance[st] <= s__ChargeArrowData_rTotalDistance[st] ) then
                    call s__ChargeArrowData_ChargeArrowAction(st)
                    if ( s__ChargeArrowData_bIsHitUnit[st] == true ) then
                        return
                    endif
                    set s__ChargeArrowData_rInitx[st]=s__ChargeArrowData_rInitx[st] + s__ChargeArrowData_rEveryDistance[st] * Cos(s__ChargeArrowData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeArrowData_rInity[st]=s__ChargeArrowData_rInity[st] + s__ChargeArrowData_rEveryDistance[st] * Sin(s__ChargeArrowData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeArrowData_rInitx[st]=IsXExceedBoundary(s__ChargeArrowData_rInitx[st]) //x坐标边界检测
set s__ChargeArrowData_rInity[st]=IsYExceedBoundary(s__ChargeArrowData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeArrowData_uUnit[st], s__ChargeArrowData_rInitx[st])
                    call SetUnitY(s__ChargeArrowData_uUnit[st], s__ChargeArrowData_rInity[st])
                    set s__ChargeArrowData_rMoveDistance[st]=s__ChargeArrowData_rMoveDistance[st] + s__ChargeArrowData_rEveryDistance[st]
                    set s__ChargeArrowData_rMoveTime[st]=s__ChargeArrowData_rMoveTime[st] + rTimerInterval_ChargeArrow
                else
                    //月神箭结束后触发器动作
                    call s__ChargeArrowData_ChargeArrowTriggerAction(st)
                    //Done
                    set ChargeArrowSystem___iData_ChargeArrow[i]=0
                    set ChargeArrowSystem___iNum_ChargeArrow=ChargeArrowSystem___iNum_ChargeArrow - 1
                    call sc__ChargeArrowData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeArrowSystem___iData_ChargeArrow[i]=ChargeArrowSystem___iData_ChargeArrow[Num]
                    endif
                    set ChargeArrowSystem___iData_ChargeArrow[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__ChargeArrowData_onDestroy takes integer this returns nothing
            if ( s__ChargeArrowData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeArrowData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeArrowData_uUnit[this]), StringHash("iUnitChargeArrowDataAdress"), 0)
            set s__ChargeArrowData_uUnit[this]=null //单位
set s__ChargeArrowData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeArrowData_rInitx[this]=0. //初始坐标
set s__ChargeArrowData_rInity[this]=0. //初始坐标
set s__ChargeArrowData_rDegree[this]=0. //角度
set s__ChargeArrowData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeArrowData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeArrowData_rTotalDistance[this]=0. //总距离
set s__ChargeArrowData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeArrowData_rEveryDistance[this]=0. //每0.03秒移动的距离
set s__ChargeArrowData_bIsHitUnit[this]=false //月神箭到最后是否击中单位
set s__ChargeArrowData_uHitUnit[this]=null //被月神箭击中的单位
endfunction

//Generated destructor of ChargeArrowData
function s__ChargeArrowData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeArrowData")
        return
    elseif (si__ChargeArrowData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeArrowData")
        return
    endif
    call s__ChargeArrowData_onDestroy(this)
    set si__ChargeArrowData_V[this]=si__ChargeArrowData_F
    set si__ChargeArrowData_F=this
endfunction

//library ChargeArrowSystem ends
//library ChargeParabolaSystem:
    
        
    function ChargeParabolaSystem___ChargeParabolaSystemInit takes nothing returns nothing
        set ChargeParabolaSystem___tTimer_ChargeParabola=CreateTimer()
        //call TimerStart(tTimer_ChargeParabola, rTimerInterval_ChargeParabola, true, function ChargeParabolaData.TimerAction_ChargeParabola)
        set ChargeParabolaSystem___iTimerID_ChargeParabola=GetHandleId(ChargeParabolaSystem___tTimer_ChargeParabola)
    endfunction
    
//Height

        
        function s__ChargeParabolaData_GetuUnit takes integer st returns unit
            return s__ChargeParabolaData_uUnit[st]
        endfunction
        
        function s__ChargeParabolaData_create takes unit uUnit,boolean IsDestroyUnit,real Degree,real TotalDistance,real TotalTime,real EveryDistance returns integer
            local integer st
            local integer iUnitChargeParabolaDataAdress= LoadInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeParabolaDataAdress"))
            if ( iUnitChargeParabolaDataAdress > 0 ) then //已经在冲锋的单位无法再被设置冲锋
return 0
            endif
            if ( ChargeParabolaSystem___iNum_ChargeParabola < 8190 ) then
                set st=s__ChargeParabolaData__allocate()
                set s__ChargeParabolaData_uUnit[st]=uUnit
                set s__ChargeParabolaData_bIsDestroyUnit[st]=IsDestroyUnit
                set s__ChargeParabolaData_rInitx[st]=GetUnitX(uUnit)
                set s__ChargeParabolaData_rInity[st]=GetUnitY(uUnit)
                set s__ChargeParabolaData_rDegree[st]=Degree
                set s__ChargeParabolaData_rTotalDistance[st]=TotalDistance
                set s__ChargeParabolaData_rTotalTime[st]=TotalTime
                set s__ChargeParabolaData_rEveryDistance[st]=EveryDistance
                //set st.rEveryDistance = st.rTotalDistance/st.rTotalTime * rTimerInterval_ChargeParabola     //Speed*0.03
                call SetUnitFacing(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rDegree[st])
                call UnitAddAbility(s__ChargeParabolaData_uUnit[st], 'Arav') //乌鸦技能，可以设置高度

                set ChargeParabolaSystem___iNum_ChargeParabola=ChargeParabolaSystem___iNum_ChargeParabola + 1
                set ChargeParabolaSystem___iData_ChargeParabola[ChargeParabolaSystem___iNum_ChargeParabola]=(st)
                
                if ChargeParabolaSystem___bTimerState_ChargeParabola == false then
                    call TimerStart(ChargeParabolaSystem___tTimer_ChargeParabola, rTimerInterval_ChargeParabola, true, function sc__ChargeParabolaData_TimerAction_ChargeParabola)
                    set ChargeParabolaSystem___bTimerState_ChargeParabola=true
                endif
                
                call SaveInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeParabolaDataAdress"), st)
                //call BJDebugMsg("ChargeParabola_create:" + I2S(iData_ChargeParabola[iNum_ChargeParabola]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
        endfunction
        
        //设置抛物线数据
        function s__ChargeParabolaData_SetParabolaData takes integer st,real rParabolaTimes,real rReduceHeight,real rCurrentHeight,real rMaxHeight,real rMinHeight returns nothing
            if ( st > 0 ) then
                set s__ChargeParabolaData_rParabolaTimes[st]=rParabolaTimes
                set s__ChargeParabolaData_rReduceHeight[st]=rReduceHeight
                set s__ChargeParabolaData_iUpDownFlag[st]=1 //一开始都是上升高度
set s__ChargeParabolaData_rCurrentHeight[st]=rCurrentHeight
                set s__ChargeParabolaData_rMaxHeight[st]=rMaxHeight
                set s__ChargeParabolaData_rMinHeight[st]=rMinHeight
                set s__ChargeParabolaData_rInitHeight[st]=s__ChargeParabolaData_rCurrentHeight[st]
                set s__ChargeParabolaData_rTargetHeight[st]=s__ChargeParabolaData_rMaxHeight[st]
                set s__ChargeParabolaData_rSwitchTime[st]=s__ChargeParabolaData_rTotalTime[st] / ( s__ChargeParabolaData_rParabolaTimes[st] * 2 )
                set s__ChargeParabolaData_rAcceleration[st]=2 * RAbs(s__ChargeParabolaData_rInitHeight[st] - s__ChargeParabolaData_rTargetHeight[st]) / Pow(s__ChargeParabolaData_rSwitchTime[st], 2) //加速度
set s__ChargeParabolaData_rInitSpeed[st]=s__ChargeParabolaData_rAcceleration[st] * s__ChargeParabolaData_rSwitchTime[st] //初始速度
endif
        endfunction
        
        function s__ChargeParabolaData_ChargeParabolaTriggerAction takes integer st returns nothing
            local trigger tTrigger= LoadTriggerHandle(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[st]), StringHash("tTrigger"))
            if ( tTrigger != null ) then
            //有触发器，且抛物次数>0
                if ( s__ChargeParabolaData_rParabolaTimes[st] > 0 ) then
                    call SaveUnitHandle(htTriggerHT, GetHandleId(tTrigger), StringHash("uUnit"), s__ChargeParabolaData_uUnit[st]) //传参，传月神箭冲锋单位
call TriggerExecute(tTrigger)
                    call FlushChildHashtable(htTriggerHT, GetHandleId(tTrigger))
                    set s__ChargeParabolaData_rParabolaTimes[st]=s__ChargeParabolaData_rParabolaTimes[st] - 1 //用抛物线次数来控制触发的次数
endif
            endif
            set tTrigger=null
        endfunction
        
        function s__ChargeParabolaData_ChargeParabolaCreateMJUnit takes integer st returns nothing
            local player pPlayer= GetOwningPlayer(s__ChargeParabolaData_uUnit[st])
            local unit uMJUnit
            local string sString_Model= LoadStr(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[st]), StringHash("MJUnit_ModelString"))
local integer iUnitId= LoadInteger(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[st]), StringHash("MJUnit_Id"))
local real rUnitScale= LoadReal(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[st]), StringHash("MJUnit_Scale"))
local real rDistance= s__ChargeParabolaData_rTotalDistance[st] / s__ChargeParabolaData_rTotalTime[st] * s__ChargeParabolaData_rSwitchTime[st]
            local real x
            local real y
            if ( sString_Model != null ) then
                set x=s__ChargeParabolaData_rInitx[st] + rDistance * Cos(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=s__ChargeParabolaData_rInity[st] + rDistance * Sin(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD)
                set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, iUnitId, x, y, 0)
                call DzSetUnitModel(uMJUnit, sString_Model)
                call Com_SetUnitScale(uMJUnit , rUnitScale) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', s__ChargeParabolaData_rSwitchTime[st]) //生命周期
endif
            set pPlayer=null
            set uMJUnit=null
        endfunction
        
        function s__ChargeParabolaData_TimerAction_ChargeParabola takes nothing returns nothing
            local integer i= 1
            local integer Num= ChargeParabolaSystem___iNum_ChargeParabola
            local integer st
            local real rMoveHeight
            if Num == 0 then
                call PauseTimer(ChargeParabolaSystem___tTimer_ChargeParabola)
                set ChargeParabolaSystem___bTimerState_ChargeParabola=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(ChargeParabolaSystem___iData_ChargeParabola[i])
                if ( ChargeParabolaSystem___iData_ChargeParabola[i] != 0 ) and ( s__ChargeParabolaData_uUnit[st] != null ) and ( GetUnitState(s__ChargeParabolaData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeParabolaData_rMoveTime[st] <= s__ChargeParabolaData_rTotalTime[st] ) and ( s__ChargeParabolaData_rMoveDistance[st] <= s__ChargeParabolaData_rTotalDistance[st] ) then
                    set s__ChargeParabolaData_rInitx[st]=s__ChargeParabolaData_rInitx[st] + s__ChargeParabolaData_rEveryDistance[st] * Cos(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeParabolaData_rInity[st]=s__ChargeParabolaData_rInity[st] + s__ChargeParabolaData_rEveryDistance[st] * Sin(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeParabolaData_rInitx[st]=IsXExceedBoundary(s__ChargeParabolaData_rInitx[st]) //x坐标边界检测
set s__ChargeParabolaData_rInity[st]=IsYExceedBoundary(s__ChargeParabolaData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rInitx[st])
                    call SetUnitY(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rInity[st])
                    call SetUnitFacing(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rDegree[st])
                    set s__ChargeParabolaData_rMoveDistance[st]=s__ChargeParabolaData_rMoveDistance[st] + s__ChargeParabolaData_rEveryDistance[st]
                    set s__ChargeParabolaData_rMoveTime[st]=s__ChargeParabolaData_rMoveTime[st] + rTimerInterval_ChargeParabola
                    //SetHeight
                    set s__ChargeParabolaData_rMoveTime_Switch[st]=s__ChargeParabolaData_rMoveTime_Switch[st] + rTimerInterval_ChargeParabola
                    if ( s__ChargeParabolaData_iUpDownFlag[st] == 1 ) then //上升
                        set rMoveHeight=s__ChargeParabolaData_rInitSpeed[st] * s__ChargeParabolaData_rMoveTime_Switch[st] - 0.5 * s__ChargeParabolaData_rAcceleration[st] * Pow(s__ChargeParabolaData_rMoveTime_Switch[st], 2)
                        set s__ChargeParabolaData_rCurrentHeight[st]=s__ChargeParabolaData_rInitHeight[st] + rMoveHeight
                    elseif ( s__ChargeParabolaData_iUpDownFlag[st] == 2 ) then //下降
                        set rMoveHeight=s__ChargeParabolaData_rInitSpeed[st] * s__ChargeParabolaData_rMoveTime_Switch[st] + 0.5 * s__ChargeParabolaData_rAcceleration[st] * Pow(s__ChargeParabolaData_rMoveTime_Switch[st], 2)
                        set s__ChargeParabolaData_rCurrentHeight[st]=s__ChargeParabolaData_rInitHeight[st] - rMoveHeight
                    endif
                    call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rCurrentHeight[st], 0.)
                    //判断
                    if ( s__ChargeParabolaData_rMoveTime_Switch[st] >= s__ChargeParabolaData_rSwitchTime[st] ) then
                        set s__ChargeParabolaData_rMoveTime_Switch[st]=0
                        if ( s__ChargeParabolaData_iUpDownFlag[st] == 1 ) then //0:Stop,1:Up,2:Down，到最高点
                            set s__ChargeParabolaData_iUpDownFlag[st]=2
                            set s__ChargeParabolaData_rInitHeight[st]=s__ChargeParabolaData_rMaxHeight[st]
                            set s__ChargeParabolaData_rTargetHeight[st]=s__ChargeParabolaData_rMinHeight[st]
                            call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rMaxHeight[st], 0.)
                            set s__ChargeParabolaData_rInitSpeed[st]=0
                            //CreateMJUnit
                            call s__ChargeParabolaData_ChargeParabolaCreateMJUnit(st)
                        elseif ( s__ChargeParabolaData_iUpDownFlag[st] == 2 ) then //最低点
set s__ChargeParabolaData_iUpDownFlag[st]=1
                            set s__ChargeParabolaData_rInitHeight[st]=s__ChargeParabolaData_rMinHeight[st]
                            set s__ChargeParabolaData_rTargetHeight[st]=s__ChargeParabolaData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rMinHeight[st], 0.)
                            set s__ChargeParabolaData_rInitSpeed[st]=s__ChargeParabolaData_rAcceleration[st] * s__ChargeParabolaData_rSwitchTime[st] //初始速度
//Trigger动作
call s__ChargeParabolaData_ChargeParabolaTriggerAction(st)
                        endif
                    endif
                else
                    //Trigger
                    call s__ChargeParabolaData_ChargeParabolaTriggerAction(st)
                    //Done
                    set ChargeParabolaSystem___iData_ChargeParabola[i]=0
                    set ChargeParabolaSystem___iNum_ChargeParabola=ChargeParabolaSystem___iNum_ChargeParabola - 1
                    call sc__ChargeParabolaData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeParabolaSystem___iData_ChargeParabola[i]=ChargeParabolaSystem___iData_ChargeParabola[Num]
                    endif
                    set ChargeParabolaSystem___iData_ChargeParabola[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__ChargeParabolaData_onDestroy takes integer this returns nothing
            if ( s__ChargeParabolaData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeParabolaData_uUnit[this])
            endif
            call UnitRemoveAbility(s__ChargeParabolaData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
call SaveInteger(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[this]), StringHash("iUnitChargeParabolaDataAdress"), 0)
            set s__ChargeParabolaData_uUnit[this]=null //单位
set s__ChargeParabolaData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeParabolaData_rInitx[this]=0. //初始坐标
set s__ChargeParabolaData_rInity[this]=0. //初始坐标
set s__ChargeParabolaData_rDegree[this]=0. //角度
set s__ChargeParabolaData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeParabolaData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeParabolaData_rTotalDistance[this]=0. //总距离
set s__ChargeParabolaData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeParabolaData_rEveryDistance[this]=0. //每0.03秒移动的距离
//Parabola
set s__ChargeParabolaData_rSwitchTime[this]=0. //到最高/最低点时切换的时间
set s__ChargeParabolaData_rMoveTime_Switch[this]=0. //用于切换时间
set s__ChargeParabolaData_rParabolaTimes[this]=0. //抛物线次数
set s__ChargeParabolaData_rReduceHeight[this]=0. //每完成一次抛物线减少的最大高度
set s__ChargeParabolaData_iUpDownFlag[this]=0 //0:Stop,1:Up,2:Down
set s__ChargeParabolaData_rInitHeight[this]=0. //初始高度
set s__ChargeParabolaData_rTargetHeight[this]=0. //目标高度
set s__ChargeParabolaData_rMaxHeight[this]=0. //最高高度
set s__ChargeParabolaData_rMinHeight[this]=0. //最低高度
set s__ChargeParabolaData_rCurrentHeight[this]=0. //当前高度
set s__ChargeParabolaData_rInitSpeed[this]=0. //初始速度
set s__ChargeParabolaData_rAcceleration[this]=0. //加速度
endfunction

//Generated destructor of ChargeParabolaData
function s__ChargeParabolaData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeParabolaData")
        return
    elseif (si__ChargeParabolaData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeParabolaData")
        return
    endif
    call s__ChargeParabolaData_onDestroy(this)
    set si__ChargeParabolaData_V[this]=si__ChargeParabolaData_F
    set si__ChargeParabolaData_F=this
endfunction

//library ChargeParabolaSystem ends
//library ChargeSystem:
    
        
    function ChargeSystem___ChargeSystemInit takes nothing returns nothing
        set ChargeSystem___tTimer_Charge=CreateTimer()
        //call TimerStart(tTimer_Charge, rTimerInterval_Charge, true, function ChargeData.TimerAction_Charge)
        set ChargeSystem___iTimerID_Charge=GetHandleId(ChargeSystem___tTimer_Charge)
    endfunction
    

        function s__ChargeData_create takes unit uUnit,boolean IsDestroyUnit,real Degree,real TotalDistance,real TotalTime,real EveryDistance returns integer
            local integer st
            local integer iUnitChargeDataAdress= LoadInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeDataAdress"))
            if ( iUnitChargeDataAdress > 0 ) then //已经在冲锋的单位无法再被设置冲锋
return 0
            endif
            if ( ChargeSystem___iNum_Charge < 8190 ) then
                set st=s__ChargeData__allocate()
                set s__ChargeData_uUnit[st]=uUnit
                set s__ChargeData_bIsDestroyUnit[st]=IsDestroyUnit
                set s__ChargeData_rInitx[st]=GetUnitX(uUnit)
                set s__ChargeData_rInity[st]=GetUnitY(uUnit)
                set s__ChargeData_rDegree[st]=Degree
                set s__ChargeData_rTotalDistance[st]=TotalDistance
                set s__ChargeData_rTotalTime[st]=TotalTime
                set s__ChargeData_rEveryDistance[st]=EveryDistance
                //set st.rEveryDistance = st.rTotalDistance/st.rTotalTime * rTimerInterval_Charge     //Speed*0.03
                call SetUnitFacing(s__ChargeData_uUnit[st], s__ChargeData_rDegree[st])
                set ChargeSystem___iNum_Charge=ChargeSystem___iNum_Charge + 1
                set ChargeSystem___iData_Charge[ChargeSystem___iNum_Charge]=(st)
                
                if ChargeSystem___bTimerState_Charge == false then
                    call TimerStart(ChargeSystem___tTimer_Charge, rTimerInterval_Charge, true, function sc__ChargeData_TimerAction_Charge)
                    set ChargeSystem___bTimerState_Charge=true
                endif
                
                call SaveInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeDataAdress"), st)
                //call BJDebugMsg("Charge_create:" + I2S(iData_Charge[iNum_Charge]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__ChargeData_ChargeTriggerAction takes integer st returns nothing
            local trigger tTrigger= LoadTriggerHandle(htUnitHT, GetHandleId(s__ChargeData_uUnit[st]), StringHash("tTrigger"))
            if ( tTrigger != null ) then
            //有触发器
                call SaveUnitHandle(htTriggerHT, GetHandleId(tTrigger), StringHash("uUnit"), s__ChargeData_uUnit[st]) //传参，传月神箭冲锋单位
call TriggerExecute(tTrigger)
                call FlushChildHashtable(htTriggerHT, GetHandleId(tTrigger))
            endif
            set tTrigger=null
        endfunction
        
        function s__ChargeData_TimerAction_Charge takes nothing returns nothing
            local integer i= 1
            local integer Num= ChargeSystem___iNum_Charge
            local integer st
            if Num == 0 then
                call PauseTimer(ChargeSystem___tTimer_Charge)
                set ChargeSystem___bTimerState_Charge=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(ChargeSystem___iData_Charge[i])
                if ( ChargeSystem___iData_Charge[i] != 0 ) and ( s__ChargeData_uUnit[st] != null ) and ( GetUnitState(s__ChargeData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeData_rMoveTime[st] <= s__ChargeData_rTotalTime[st] ) and ( s__ChargeData_rMoveDistance[st] <= s__ChargeData_rTotalDistance[st] ) then
                    set s__ChargeData_rInitx[st]=s__ChargeData_rInitx[st] + s__ChargeData_rEveryDistance[st] * Cos(s__ChargeData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeData_rInity[st]=s__ChargeData_rInity[st] + s__ChargeData_rEveryDistance[st] * Sin(s__ChargeData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeData_rInitx[st]=IsXExceedBoundary(s__ChargeData_rInitx[st]) //x坐标边界检测
set s__ChargeData_rInity[st]=IsYExceedBoundary(s__ChargeData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeData_uUnit[st], s__ChargeData_rInitx[st])
                    call SetUnitY(s__ChargeData_uUnit[st], s__ChargeData_rInity[st])
                    call SetUnitFacing(s__ChargeData_uUnit[st], s__ChargeData_rDegree[st])
                    set s__ChargeData_rMoveDistance[st]=s__ChargeData_rMoveDistance[st] + s__ChargeData_rEveryDistance[st]
                    set s__ChargeData_rMoveTime[st]=s__ChargeData_rMoveTime[st] + rTimerInterval_Charge
                else
                    //Trigger
                    call s__ChargeData_ChargeTriggerAction(st)
                    //Done
                    set ChargeSystem___iData_Charge[i]=0
                    set ChargeSystem___iNum_Charge=ChargeSystem___iNum_Charge - 1
                    call sc__ChargeData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeSystem___iData_Charge[i]=ChargeSystem___iData_Charge[Num]
                    endif
                    set ChargeSystem___iData_Charge[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__ChargeData_onDestroy takes integer this returns nothing
            if ( s__ChargeData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeData_uUnit[this]), StringHash("iUnitChargeDataAdress"), 0)
            set s__ChargeData_uUnit[this]=null //单位
set s__ChargeData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeData_rInitx[this]=0. //初始坐标
set s__ChargeData_rInity[this]=0. //初始坐标
set s__ChargeData_rDegree[this]=0. //角度
set s__ChargeData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeData_rTotalDistance[this]=0. //总距离
set s__ChargeData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeData_rEveryDistance[this]=0. //每0.03秒移动的距离
endfunction

//Generated destructor of ChargeData
function s__ChargeData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeData")
        return
    elseif (si__ChargeData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeData")
        return
    endif
    call s__ChargeData_onDestroy(this)
    set si__ChargeData_V[this]=si__ChargeData_F
    set si__ChargeData_F=this
endfunction

//library ChargeSystem ends
//library ChargeTraceSystem:
    
        
    function ChargeTraceSystem___ChargeTraceSystemInit takes nothing returns nothing
        set ChargeTraceSystem___tTimer_ChargeTrace=CreateTimer()
        //call TimerStart(tTimer_ChargeTrace, rTimerInterval_ChargeTrace, true, function ChargeTraceData.TimerAction_ChargeTrace)
        set ChargeTraceSystem___iTimerID_ChargeTrace=GetHandleId(ChargeTraceSystem___tTimer_ChargeTrace)
    endfunction
    
//private real rTotalDistance         //总距离
//private real rMoveDistance          //已经移动的距离
//Trace

        function s__ChargeTraceData_create takes unit uUnit,unit uTargetUnit,boolean IsDestroyUnit,real TotalTime returns integer
            local integer st
            local integer iUnitChargeTraceDataAdress= LoadInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeTraceDataAdress"))
            if ( iUnitChargeTraceDataAdress > 0 ) then //已经在冲锋的单位无法再被设置冲锋   
return 0
            endif
            if ( ChargeTraceSystem___iNum_ChargeTrace < 8190 ) then
                set st=s__ChargeTraceData__allocate()
                set s__ChargeTraceData_uUnit[st]=uUnit
                set s__ChargeTraceData_uTargetUnit[st]=uTargetUnit
                set s__ChargeTraceData_bIsDestroyUnit[st]=IsDestroyUnit
                set s__ChargeTraceData_rInitx[st]=GetUnitX(uUnit)
                set s__ChargeTraceData_rInity[st]=GetUnitY(uUnit)
                set s__ChargeTraceData_rDegree[st]=Math_GetUnitDegree(s__ChargeTraceData_uUnit[st] , s__ChargeTraceData_uTargetUnit[st])
                //set st.rTotalDistance = TotalDistance
                set s__ChargeTraceData_rTotalTime[st]=TotalTime
                //set st.rEveryDistance = EveryDistance
                call SetUnitFacing(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rDegree[st])
                set ChargeTraceSystem___iNum_ChargeTrace=ChargeTraceSystem___iNum_ChargeTrace + 1
                set ChargeTraceSystem___iData_ChargeTrace[ChargeTraceSystem___iNum_ChargeTrace]=(st)
                
                if ChargeTraceSystem___bTimerState_ChargeTrace == false then
                    call TimerStart(ChargeTraceSystem___tTimer_ChargeTrace, rTimerInterval_ChargeTrace, true, function sc__ChargeTraceData_TimerAction_ChargeTrace)
                    set ChargeTraceSystem___bTimerState_ChargeTrace=true
                endif
                
                call SaveInteger(htUnitHT, GetHandleId(uUnit), StringHash("iUnitChargeTraceDataAdress"), st)
                //call BJDebugMsg("ChargeTrace_create:" + I2S(iData_ChargeTrace[iNum_ChargeTrace]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
        endfunction
        
        function s__ChargeTraceData_TimerAction_ChargeTrace takes nothing returns nothing
            local integer i= 1
            local integer Num= ChargeTraceSystem___iNum_ChargeTrace
            local integer st
            local real Distance1
            if Num == 0 then
                call PauseTimer(ChargeTraceSystem___tTimer_ChargeTrace)
                set ChargeTraceSystem___bTimerState_ChargeTrace=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(ChargeTraceSystem___iData_ChargeTrace[i])
                if ( ChargeTraceSystem___iData_ChargeTrace[i] != 0 ) and ( s__ChargeTraceData_uUnit[st] != null ) and ( GetUnitState(s__ChargeTraceData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeTraceData_rMoveTime[st] <= s__ChargeTraceData_rTotalTime[st] ) then
                    set Distance1=Math_GetUnitDistance(s__ChargeTraceData_uUnit[st] , s__ChargeTraceData_uTargetUnit[st])
                    set s__ChargeTraceData_rDegree[st]=Math_GetUnitDegree(s__ChargeTraceData_uUnit[st] , s__ChargeTraceData_uTargetUnit[st])
                    //重置速度
                    set s__ChargeTraceData_rEveryDistance[st]=Distance1 / ( s__ChargeTraceData_rTotalTime[st] - s__ChargeTraceData_rMoveTime[st] ) * rTimerInterval_ChargeTrace
                    set s__ChargeTraceData_rInitx[st]=s__ChargeTraceData_rInitx[st] + s__ChargeTraceData_rEveryDistance[st] * Cos(s__ChargeTraceData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeTraceData_rInity[st]=s__ChargeTraceData_rInity[st] + s__ChargeTraceData_rEveryDistance[st] * Sin(s__ChargeTraceData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeTraceData_rInitx[st]=IsXExceedBoundary(s__ChargeTraceData_rInitx[st]) //x坐标边界检测
set s__ChargeTraceData_rInity[st]=IsYExceedBoundary(s__ChargeTraceData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rInitx[st])
                    call SetUnitY(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rInity[st])
                    call SetUnitFacing(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rDegree[st])
                    //set st.rMoveDistance = st.rMoveDistance + st.rEveryDistance
                    set s__ChargeTraceData_rMoveTime[st]=s__ChargeTraceData_rMoveTime[st] + rTimerInterval_ChargeTrace
                else
                    //Done
                    set ChargeTraceSystem___iData_ChargeTrace[i]=0
                    set ChargeTraceSystem___iNum_ChargeTrace=ChargeTraceSystem___iNum_ChargeTrace - 1
                    call sc__ChargeTraceData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeTraceSystem___iData_ChargeTrace[i]=ChargeTraceSystem___iData_ChargeTrace[Num]
                    endif
                    set ChargeTraceSystem___iData_ChargeTrace[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__ChargeTraceData_onDestroy takes integer this returns nothing
            if ( s__ChargeTraceData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeTraceData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeTraceData_uUnit[this]), StringHash("iUnitChargeTraceDataAdress"), 0)
            set s__ChargeTraceData_uUnit[this]=null //单位
set s__ChargeTraceData_uTargetUnit[this]=null //目标单位
set s__ChargeTraceData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeTraceData_rInitx[this]=0. //初始坐标
set s__ChargeTraceData_rInity[this]=0. //初始坐标
set s__ChargeTraceData_rDegree[this]=0. //角度
set s__ChargeTraceData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeTraceData_rMoveTime[this]=0. //已经冲锋的时间
//set rTotalDistance = 0.         //总距离
//set rMoveDistance = 0.        //已经移动的距离
set s__ChargeTraceData_rEveryDistance[this]=0. //每0.03秒移动的距离
endfunction

//Generated destructor of ChargeTraceData
function s__ChargeTraceData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ChargeTraceData")
        return
    elseif (si__ChargeTraceData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ChargeTraceData")
        return
    endif
    call s__ChargeTraceData_onDestroy(this)
    set si__ChargeTraceData_V[this]=si__ChargeTraceData_F
    set si__ChargeTraceData_F=this
endfunction

//library ChargeTraceSystem ends
//library SurroundSystem:
        
    function SurroundSystemInit takes nothing returns nothing
        set SurroundSystem___tTimer_Surround=CreateTimer()
        //call TimerStart(tTimer_Surround, rTimerInterval_Surround, true, function SurroundData.TimerAction_Surround)
        set SurroundSystem___iTimerID_Surround=GetHandleId(SurroundSystem___tTimer_Surround)
    endfunction
    
//SurroundData




        function s__SurroundData_create takes integer SurroundMode,real Surrx,real Surry,unit CentreUnit,unit OutsideUnit,boolean IsDestroyUnit returns integer
            local integer st
            if ( SurroundSystem___iNum_Surround < 8190 ) then
                set st=s__SurroundData__allocate()
                set s__SurroundData_iSurroundMode[st]=SurroundMode
                if ( SurroundMode == 1 ) then //1:Coord
set s__SurroundData_rSurrx[st]=Surrx
                    set s__SurroundData_rSurry[st]=Surry
                elseif ( SurroundMode == 2 ) then //2:Unit
set s__SurroundData_uCentreUnit[st]=CentreUnit
                endif
                set s__SurroundData_uOutsideUnit[st]=OutsideUnit
                set s__SurroundData_bIsDestroyUnit[st]=IsDestroyUnit
                
                set SurroundSystem___iNum_Surround=SurroundSystem___iNum_Surround + 1
                set SurroundSystem___iData_Surround[SurroundSystem___iNum_Surround]=(st)
                
                if SurroundSystem___bTimerState_Surround == false then
                    call TimerStart(SurroundSystem___tTimer_Surround, rTimerInterval_Surround, true, function sc__SurroundData_TimerAction_Surround)
                    set SurroundSystem___bTimerState_Surround=true
                endif
                
                //call BJDebugMsg("Surround_create:" + I2S(iData_Surround[iNum_Surround]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
            
        endfunction
        
        function s__SurroundData_SetSurroundData takes integer st,real UnitFacDegree,real NowSurrDegree,real TotalSurrDegree,real EverySurrDegree,real TotalTime,real CentreDistance,real EveryDistance returns nothing
            if ( st != 0 ) then
                set s__SurroundData_rUnitFacDegree[st]=UnitFacDegree
                set s__SurroundData_rNowSurrDegree[st]=NowSurrDegree
                set s__SurroundData_rTotalSurrDegree[st]=TotalSurrDegree
                set s__SurroundData_rTotalTime[st]=TotalTime
                set s__SurroundData_rEverySurrDegree[st]=EverySurrDegree
                set s__SurroundData_rCentreDistance[st]=CentreDistance
                set s__SurroundData_rEveryDistance[st]=EveryDistance
            endif
        endfunction
        
        function s__SurroundData_TimerAction_Surround takes nothing returns nothing
            local integer i= 1
            local integer Num= SurroundSystem___iNum_Surround
            local integer st
            local real x
            local real y
            //call BJDebugMsg("Running")
            
            if ( Num == 0 ) then
                call PauseTimer(SurroundSystem___tTimer_Surround)
                set SurroundSystem___bTimerState_Surround=false
                //call BJDebugMsg("Pause")
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(SurroundSystem___iData_Surround[i])
                if ( SurroundSystem___iData_Surround[i] != 0 ) and ( s__SurroundData_uOutsideUnit[st] != null ) and ( GetUnitState(s__SurroundData_uOutsideUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__SurroundData_iSurroundMode[st] != 0 ) and ( s__SurroundData_rMoveTime[st] <= s__SurroundData_rTotalTime[st] ) and ( s__SurroundData_rMoveSurrDegree[st] <= s__SurroundData_rTotalSurrDegree[st] ) then
                    //call BJDebugMsg("Surround")
                    if ( s__SurroundData_iSurroundMode[st] == 1 ) then //1:Coord,2:Unit
//初始坐标固定
set x=s__SurroundData_rSurrx[st]
                        set y=s__SurroundData_rSurry[st]
                    elseif ( s__SurroundData_iSurroundMode[st] == 2 ) then
                        set x=GetUnitX(s__SurroundData_uCentreUnit[st])
                        set y=GetUnitY(s__SurroundData_uCentreUnit[st])
                    endif
                    set x=x + s__SurroundData_rCentreDistance[st] * Cos(s__SurroundData_rNowSurrDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=y + s__SurroundData_rCentreDistance[st] * Sin(s__SurroundData_rNowSurrDegree[st] * bj_DEGTORAD)
                    set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
call SetUnitX(s__SurroundData_uOutsideUnit[st], x)
                    call SetUnitY(s__SurroundData_uOutsideUnit[st], y)
                    call SetUnitFacing(s__SurroundData_uOutsideUnit[st], s__SurroundData_rNowSurrDegree[st] + s__SurroundData_rUnitFacDegree[st])
                    set s__SurroundData_rNowSurrDegree[st]=s__SurroundData_rNowSurrDegree[st] + s__SurroundData_rEverySurrDegree[st] //实际角度
set s__SurroundData_rMoveSurrDegree[st]=s__SurroundData_rMoveSurrDegree[st] + s__SurroundData_rEverySurrDegree[st] //已经完成(当前)的环绕角度
set s__SurroundData_rCentreDistance[st]=s__SurroundData_rCentreDistance[st] + s__SurroundData_rEveryDistance[st] //中心距离变化

                    set s__SurroundData_rMoveTime[st]=s__SurroundData_rMoveTime[st] + rTimerInterval_Surround
                    
                    //call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", d.x, d.y))
                else
                    //Done
                    set SurroundSystem___iData_Surround[i]=0
                    set SurroundSystem___iNum_Surround=SurroundSystem___iNum_Surround - 1
                    call sc__SurroundData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SurroundSystem___iData_Surround[i]=SurroundSystem___iData_Surround[Num]
                    endif
                    set SurroundSystem___iData_Surround[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__SurroundData_onDestroy takes integer this returns nothing
            if ( s__SurroundData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__SurroundData_uOutsideUnit[this])
            endif
            
            set s__SurroundData_iSurroundMode[this]=0 //环绕模式,1:Coord,2:Unit
set s__SurroundData_rSurrx[this]=0. //初始坐标
set s__SurroundData_rSurry[this]=0. //初始坐标
set s__SurroundData_uCentreUnit[this]=null //中心单位
set s__SurroundData_uOutsideUnit[this]=null //外围单位
set s__SurroundData_bIsDestroyUnit[this]=false //环绕结束是否删除单位

            set s__SurroundData_rUnitFacDegree[this]=0. //单位面向角度，直接加到rMoveSurrDegree上

            set s__SurroundData_rNowSurrDegree[this]=0. //初始环绕角度，实际角度
set s__SurroundData_rTotalSurrDegree[this]=0. //总环绕角度
set s__SurroundData_rMoveSurrDegree[this]=0. //已经完成(当前)的环绕角度
set s__SurroundData_rEverySurrDegree[this]=0. //每次移动的环绕角度

            set s__SurroundData_rTotalTime[this]=0. //环绕时间限制
set s__SurroundData_rMoveTime[this]=0. //已经环绕的时间

            set s__SurroundData_rCentreDistance[this]=0. //当前与中心的距离，需要输入参数，相当于初始距离
set s__SurroundData_rEveryDistance[this]=0. //每0.03秒移动的距离，可以小于0

        endfunction

//Generated destructor of SurroundData
function s__SurroundData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SurroundData")
        return
    elseif (si__SurroundData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SurroundData")
        return
    endif
    call s__SurroundData_onDestroy(this)
    set si__SurroundData_V[this]=si__SurroundData_F
    set si__SurroundData_F=this
endfunction
        

//library SurroundSystem ends
//library VerticalSurroundSystem:
        
    function VerticalSurroundSystemInit takes nothing returns nothing
        set VerticalSurroundSystem___tTimer_VerticalSurround=CreateTimer()
        //call TimerStart(tTimer_VerticalSurround, rTimerInterval_VerticalSurround, true, function VerticalSurroundData.TimerAction_VerticalSurround)
        set VerticalSurroundSystem___iTimerID_VerticalSurround=GetHandleId(VerticalSurroundSystem___tTimer_VerticalSurround)
    endfunction
    
//VerticalSurroundData




        function s__VerticalSurroundData_create takes unit CentreUnit,unit OutsideUnit,boolean IsDestroyUnit returns integer
            local integer st
            if ( VerticalSurroundSystem___iNum_VerticalSurround < 8190 ) then
                set st=s__VerticalSurroundData__allocate()
                set s__VerticalSurroundData_uCentreUnit[st]=CentreUnit
                set s__VerticalSurroundData_uOutsideUnit[st]=OutsideUnit
                set s__VerticalSurroundData_bIsDestroyUnit[st]=IsDestroyUnit
                
                set VerticalSurroundSystem___iNum_VerticalSurround=VerticalSurroundSystem___iNum_VerticalSurround + 1
                set VerticalSurroundSystem___iData_VerticalSurround[VerticalSurroundSystem___iNum_VerticalSurround]=(st)
                
                if VerticalSurroundSystem___bTimerState_VerticalSurround == false then
                    call TimerStart(VerticalSurroundSystem___tTimer_VerticalSurround, rTimerInterval_VerticalSurround, true, function sc__VerticalSurroundData_TimerAction_VerticalSurround)
                    set VerticalSurroundSystem___bTimerState_VerticalSurround=true
                endif
                
                //call BJDebugMsg("VerticalSurround_create:" + I2S(iData_VerticalSurround[iNum_VerticalSurround]))
                return st
            else
                //call BJDebugMsg("当前冲锋数量过多，请等待")
                return 0
            endif
            
        endfunction
        
        function s__VerticalSurroundData_SetVerticalSurroundData takes integer st,real rSurrOffsetAngle,real NowSurrDegree,real TotalSurrDegree,real EverySurrDegree,real TotalTime,real CentreDistance,real EveryDistance,real rAddHeight returns nothing
            if ( st != 0 ) then
                set s__VerticalSurroundData_rSurrOffsetAngle[st]=rSurrOffsetAngle
                set s__VerticalSurroundData_rNowSurrDegree[st]=NowSurrDegree
                set s__VerticalSurroundData_rTotalSurrDegree[st]=TotalSurrDegree
                set s__VerticalSurroundData_rTotalTime[st]=TotalTime
                set s__VerticalSurroundData_rEverySurrDegree[st]=EverySurrDegree
                set s__VerticalSurroundData_rCentreDistance[st]=CentreDistance
                set s__VerticalSurroundData_rEveryDistance[st]=EveryDistance
                set s__VerticalSurroundData_rAddHeight[st]=rAddHeight
            endif
        endfunction
        
        function s__VerticalSurroundData_TimerAction_VerticalSurround takes nothing returns nothing
            local integer i= 1
            local integer Num= VerticalSurroundSystem___iNum_VerticalSurround
            local integer st
            local real x
            local real y
            local real rDegree_Centre
            
            if ( Num == 0 ) then
                call PauseTimer(VerticalSurroundSystem___tTimer_VerticalSurround)
                set VerticalSurroundSystem___bTimerState_VerticalSurround=false
                //call BJDebugMsg("Pause")
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(VerticalSurroundSystem___iData_VerticalSurround[i])
                if ( VerticalSurroundSystem___iData_VerticalSurround[i] != 0 ) and ( s__VerticalSurroundData_uOutsideUnit[st] != null ) and ( GetUnitState(s__VerticalSurroundData_uOutsideUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__VerticalSurroundData_rMoveTime[st] <= s__VerticalSurroundData_rTotalTime[st] ) and ( s__VerticalSurroundData_rMoveSurrDegree[st] <= s__VerticalSurroundData_rTotalSurrDegree[st] ) then
                    set rDegree_Centre=GetUnitFacing(s__VerticalSurroundData_uCentreUnit[st])
                    set x=GetUnitX(s__VerticalSurroundData_uCentreUnit[st])
                    set y=GetUnitY(s__VerticalSurroundData_uCentreUnit[st])
                    set x=x + ( s__VerticalSurroundData_rCentreDistance[st] * Sin(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) ) * Cos(( rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st] ) * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=y + ( s__VerticalSurroundData_rCentreDistance[st] * Sin(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) ) * Sin(( rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st] ) * bj_DEGTORAD)
                    set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
call SetUnitX(s__VerticalSurroundData_uOutsideUnit[st], x)
                    call SetUnitY(s__VerticalSurroundData_uOutsideUnit[st], y)
                    call SetUnitFlyHeight(s__VerticalSurroundData_uOutsideUnit[st], s__VerticalSurroundData_rCentreDistance[st] * Cos(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) + s__VerticalSurroundData_rAddHeight[st], 0.) //高度
call SetUnitFacing(s__VerticalSurroundData_uOutsideUnit[st], rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st])
                    set s__VerticalSurroundData_rNowSurrDegree[st]=s__VerticalSurroundData_rNowSurrDegree[st] + s__VerticalSurroundData_rEverySurrDegree[st] //实际角度
set s__VerticalSurroundData_rMoveSurrDegree[st]=s__VerticalSurroundData_rMoveSurrDegree[st] + s__VerticalSurroundData_rEverySurrDegree[st] //已经完成(当前)的环绕角度
if ( s__VerticalSurroundData_rEveryDistance[st] > 0 ) then
                        set s__VerticalSurroundData_rCentreDistance[st]=s__VerticalSurroundData_rCentreDistance[st] + s__VerticalSurroundData_rEveryDistance[st] //中心距离变化
endif
                    set s__VerticalSurroundData_rMoveTime[st]=s__VerticalSurroundData_rMoveTime[st] + rTimerInterval_VerticalSurround
                else
                    //Done
                    set VerticalSurroundSystem___iData_VerticalSurround[i]=0
                    set VerticalSurroundSystem___iNum_VerticalSurround=VerticalSurroundSystem___iNum_VerticalSurround - 1
                    call sc__VerticalSurroundData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set VerticalSurroundSystem___iData_VerticalSurround[i]=VerticalSurroundSystem___iData_VerticalSurround[Num]
                    endif
                    set VerticalSurroundSystem___iData_VerticalSurround[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__VerticalSurroundData_onDestroy takes integer this returns nothing
            if ( s__VerticalSurroundData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__VerticalSurroundData_uOutsideUnit[this])
            endif
            
            set s__VerticalSurroundData_uCentreUnit[this]=null //中心单位
set s__VerticalSurroundData_uOutsideUnit[this]=null //外围单位
set s__VerticalSurroundData_bIsDestroyUnit[this]=false //环绕结束是否删除单位

            set s__VerticalSurroundData_rSurrOffsetAngle[this]=0.
            
            set s__VerticalSurroundData_rNowSurrDegree[this]=0. //初始环绕角度，实际角度
set s__VerticalSurroundData_rTotalSurrDegree[this]=0. //总环绕角度
set s__VerticalSurroundData_rMoveSurrDegree[this]=0. //已经完成(当前)的环绕角度
set s__VerticalSurroundData_rEverySurrDegree[this]=0. //每次移动的环绕角度

            set s__VerticalSurroundData_rTotalTime[this]=0. //环绕时间限制
set s__VerticalSurroundData_rMoveTime[this]=0. //已经环绕的时间

            set s__VerticalSurroundData_rCentreDistance[this]=0. //当前与中心的距离，需要输入参数，相当于初始距离
set s__VerticalSurroundData_rEveryDistance[this]=0. //每0.03秒移动的距离，可以小于0
set s__VerticalSurroundData_rAddHeight[this]=0. //附加高度
endfunction

//Generated destructor of VerticalSurroundData
function s__VerticalSurroundData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: VerticalSurroundData")
        return
    elseif (si__VerticalSurroundData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: VerticalSurroundData")
        return
    endif
    call s__VerticalSurroundData_onDestroy(this)
    set si__VerticalSurroundData_V[this]=si__VerticalSurroundData_F
    set si__VerticalSurroundData_F=this
endfunction
        

//library VerticalSurroundSystem ends
//===========================================================================
// 
// Defense
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed Mar 05 16:57:48 2025
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('I000', - 329.0, - 6790.1)
    call CreateItem('I000', - 164.8, - 6752.9)
    call CreateItem('I000', - 291.4, - 6689.4)
    call CreateItem('I000', - 205.5, - 6624.1)
    call CreateItem('ckng', - 1071.4, - 6784.1)
    call CreateItem('ckng', - 922.3, - 6784.1)
    call CreateItem('ckng', - 1231.9, - 6788.8)
    call CreateItem('ratc', - 941.4, - 6655.0)
    call CreateItem('ratc', - 940.4, - 6562.6)
    call CreateItem('ratc', - 1219.4, - 6562.6)
    call CreateItem('ratc', - 1105.7, - 6562.6)
    call CreateItem('ratc', - 1096.6, - 6667.5)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_E003_0037=CreateUnit(p, 'E003', - 492.1, - 6857.3, 141.490)
    set life=GetUnitState(gg_unit_E003_0037, UNIT_STATE_LIFE)
    call SetUnitState(gg_unit_E003_0037, UNIT_STATE_LIFE, 0.50 * life)
    set u=CreateUnit(p, 'H001', - 1516.9, - 7437.3, 202.000)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.10 * life)
    set u=CreateUnit(p, 'H009', - 1309.7, - 7454.1, 290.150)
endfunction
//===========================================================================
function CreateUnitsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hfoo', - 1264.8, 3639.9, 317.427)
    set u=CreateUnit(p, 'hfoo', - 1269.4, 3026.8, 317.427)
    set u=CreateUnit(p, 'hfoo', - 1646.2, 2565.7, 317.427)
    set u=CreateUnit(p, 'hfoo', - 1487.2, - 7068.1, 317.427)
    set u=CreateUnit(p, 'E003', 5330.3, 55.1, 141.490)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.50 * life)
endfunction
//===========================================================================
function CreateUnitsForPlayer2 takes nothing returns nothing
    local player p= Player(2)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hfoo', - 841.1, 4066.7, 153.250)
    set u=CreateUnit(p, 'hfoo', - 845.6, 3453.6, 153.250)
    set u=CreateUnit(p, 'hfoo', - 920.2, 2840.5, 153.250)
    set u=CreateUnit(p, 'E003', 5243.0, 250.1, 141.490)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.50 * life)
endfunction
//===========================================================================
function CreateUnitsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hfoo', - 212.9, 4089.9, 258.010)
    set u=CreateUnit(p, 'hfoo', - 217.4, 3476.8, 258.010)
    set u=CreateUnit(p, 'hfoo', - 292.0, 2863.7, 258.010)
    set u=CreateUnit(p, 'E003', 4879.4, - 14.8, 141.490)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.50 * life)
endfunction
//===========================================================================
function CreateUnitsForPlayer4 takes nothing returns nothing
    local player p= Player(4)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hfoo', 228.0, 3665.3, 106.530)
    set u=CreateUnit(p, 'hfoo', 223.5, 3052.3, 106.530)
    set u=CreateUnit(p, 'hfoo', 469.2, 2578.9, 106.530)
    set u=CreateUnit(p, 'E003', 4984.7, 217.7, 141.490)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.50 * life)
endfunction
//===========================================================================
function CreateBuildingsForPlayer5 takes nothing returns nothing
    local player p= Player(5)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_nbfl_0009=CreateUnit(p, 'nbfl', - 576.0, - 6528.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer8 takes nothing returns nothing
    local player p= Player(8)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'h006', - 854.9, 6459.2, 270.000)
    set u=CreateUnit(p, 'h006', - 1472.9, 6478.4, 270.000)
    set u=CreateUnit(p, 'h006', - 235.6, 6468.3, 270.000)
    set u=CreateUnit(p, 'h006', 365.1, 6474.9, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_hfoo_0052=CreateUnit(p, 'hfoo', 253.2, - 6932.0, 40.837)
    set u=CreateUnit(p, 'hfoo', 567.4, - 7458.3, 221.931)
    set u=CreateUnit(p, 'hfoo', 637.7, - 7458.3, 19.941)
    set u=CreateUnit(p, 'hfoo', 739.9, - 7458.3, 68.645)
    set u=CreateUnit(p, 'hfoo', 839.8, - 7455.6, 278.556)
    set u=CreateUnit(p, 'hfoo', 908.1, - 7452.9, 143.189)
    set u=CreateUnit(p, 'hfoo', 985.3, - 7452.9, 226.809)
    set u=CreateUnit(p, 'hfoo', 5120.3, 144.7, 226.809)
    set u=CreateUnit(p, 'hfoo', 5166.6, 128.8, 19.941)
    set u=CreateUnit(p, 'hfoo', 5124.4, 114.5, 143.189)
    set u=CreateUnit(p, 'hfoo', 5136.0, 134.9, 278.556)
    set u=CreateUnit(p, 'hfoo', 5149.5, 102.0, 68.645)
    set u=CreateUnit(p, 'hfoo', 5177.6, 98.6, 221.931)
    set u=CreateUnit(p, 'hfoo', 5089.1, 98.6, 40.837)
    set u=CreateUnit(p, 'hfoo', 5026.0, 91.7, 226.809)
    set u=CreateUnit(p, 'hfoo', 5049.2, 66.8, 68.645)
    set u=CreateUnit(p, 'hfoo', 5186.9, 74.5, 143.189)
    set u=CreateUnit(p, 'hfoo', 5118.7, 71.8, 278.556)
    set u=CreateUnit(p, 'hfoo', 5174.8, 34.4, 226.809)
    set u=CreateUnit(p, 'hfoo', 5164.9, - 53.0, 40.837)
    set u=CreateUnit(p, 'hfoo', 5174.2, - 79.9, 221.931)
    set u=CreateUnit(p, 'hfoo', 5135.1, 76.8, 226.809)
    set u=CreateUnit(p, 'hfoo', 5102.2, 34.1, 19.941)
    set u=CreateUnit(p, 'hfoo', 5139.3, 46.6, 143.189)
    set u=CreateUnit(p, 'hfoo', 5071.0, 43.9, 278.556)
    set u=CreateUnit(p, 'hfoo', 5164.3, 34.1, 68.645)
    set u=CreateUnit(p, 'hfoo', 5192.5, 30.7, 221.931)
    set u=CreateUnit(p, 'hfoo', 5103.9, 30.7, 40.837)
    set u=CreateUnit(p, 'hfoo', 5040.8, 23.8, 226.809)
    set u=CreateUnit(p, 'hfoo', 5126.5, - 82.5, 68.645)
    set u=CreateUnit(p, 'hfoo', 5120.4, 36.8, 143.189)
    set u=CreateUnit(p, 'hfoo', 5133.5, 3.9, 278.556)
    set u=CreateUnit(p, 'hfoo', 5065.6, 1.2, 68.645)
    set u=CreateUnit(p, 'hfoo', 5106.9, 17.8, 278.556)
    set u=CreateUnit(p, 'hfoo', 5105.6, 34.4, 143.189)
    set u=CreateUnit(p, 'hfoo', 5143.1, 11.6, 226.809)
    set u=CreateUnit(p, 'hfoo', 5110.1, - 31.2, 19.941)
    set u=CreateUnit(p, 'hfoo', 5147.2, - 18.6, 143.189)
    set u=CreateUnit(p, 'hfoo', 5079.0, - 21.3, 278.556)
    set u=CreateUnit(p, 'hfoo', 5172.3, - 31.2, 68.645)
    set u=CreateUnit(p, 'hfoo', 5200.4, - 34.5, 221.931)
    set u=CreateUnit(p, 'hfoo', 5111.9, - 34.5, 40.837)
    set u=CreateUnit(p, 'hfoo', 5048.8, - 41.4, 226.809)
    set u=CreateUnit(p, 'hfoo', 5172.8, 14.6, 226.809)
    set u=CreateUnit(p, 'hfoo', 5128.3, - 28.4, 143.189)
    set u=CreateUnit(p, 'hfoo', 5141.5, - 61.3, 278.556)
    set u=CreateUnit(p, 'hfoo', 5073.6, - 64.0, 68.645)
    set u=CreateUnit(p, 'hfoo', 5137.7, 28.9, 19.941)
    set u=CreateUnit(p, 'hfoo', 5174.8, 41.4, 143.189)
    set u=CreateUnit(p, 'hfoo', 5147.8, - 56.0, 226.809)
    set u=CreateUnit(p, 'hfoo', 5106.5, 25.8, 19.941)
    set u=CreateUnit(p, 'hfoo', 5143.6, 38.3, 143.189)
    set u=CreateUnit(p, 'hfoo', 5075.3, 35.6, 278.556)
    set u=CreateUnit(p, 'hfoo', 5168.6, 25.8, 68.645)
    set u=CreateUnit(p, 'hfoo', 5123.7, - 71.9, 221.931)
    set u=CreateUnit(p, 'hfoo', 5108.2, 22.4, 40.837)
    set u=CreateUnit(p, 'hfoo', 5045.1, 15.5, 226.809)
    set u=CreateUnit(p, 'hfoo', 5187.9, 8.5, 278.556)
    set u=CreateUnit(p, 'hfoo', 5124.7, 28.5, 143.189)
    set u=CreateUnit(p, 'hfoo', 5137.8, - 4.4, 278.556)
    set u=CreateUnit(p, 'hfoo', 5069.9, - 7.1, 68.645)
    set u=CreateUnit(p, 'hfoo', 5199.8, 28.9, 68.645)
    set u=CreateUnit(p, 'hfoo', 5148.7, - 1.3, 221.931)
    set u=CreateUnit(p, 'hfoo', 5179.3, 89.9, 226.809)
    set u=CreateUnit(p, 'hfoo', 5144.2, 104.3, 19.941)
    set u=CreateUnit(p, 'hfoo', 5102.1, 89.9, 143.189)
    set u=CreateUnit(p, 'hfoo', 5194.5, 83.9, 278.556)
    set u=CreateUnit(p, 'hfoo', 5206.4, 104.3, 68.645)
    set u=CreateUnit(p, 'hfoo', 5155.3, 74.0, 221.931)
    set u=CreateUnit(p, 'hfoo', 5146.0, 100.9, 40.837)
    set u=CreateUnit(p, 'hfoo', 5164.3, 63.8, 226.809)
    set u=CreateUnit(p, 'hfoo', 5139.4, 25.5, 40.837)
    set u=CreateUnit(p, 'hfoo', 5095.0, 63.8, 143.189)
    set u=CreateUnit(p, 'hfoo', 5096.3, 47.2, 278.556)
    set u=CreateUnit(p, 'hfoo', 5189.0, 41.1, 68.645)
    set u=CreateUnit(p, 'hfoo', 5157.7, - 11.6, 226.809)
    set u=CreateUnit(p, 'hfoo', 5088.5, - 11.6, 143.189)
    set u=CreateUnit(p, 'hfoo', 5169.0, - 1.3, 278.556)
    set u=CreateUnit(p, 'hfoo', 5182.5, - 34.2, 68.645)
    set u=CreateUnit(p, 'hfoo', 5492.7, 33.0, 226.809)
    set u=CreateUnit(p, 'hfoo', 5163.1, - 49.6, 19.941)
    set u=CreateUnit(p, 'hfoo', 5121.0, - 64.0, 143.189)
    set u=CreateUnit(p, 'hfoo', 5132.0, - 39.8, 278.556)
    set u=CreateUnit(p, 'hfoo', 5145.4, - 72.7, 68.645)
    set u=CreateUnit(p, 'hfoo', 5146.3, 17.3, 221.931)
    set u=CreateUnit(p, 'hfoo', 5104.0, - 13.6, 221.931)
    set u=CreateUnit(p, 'hfoo', 5204.9, 38.6, 226.809)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'O006', - 6957.6, - 6436.1, 270.000)
    set u=CreateUnit(p, 'O002', - 6379.6, - 6432.9, 270.000)
    set u=CreateUnit(p, 'E005', - 5777.7, - 6412.3, 270.000)
    set gg_unit_N000_0016=CreateUnit(p, 'N000', - 6378.7, - 6721.0, 270.000)
    set gg_unit_E002_0017=CreateUnit(p, 'E002', - 6080.2, - 6988.5, 270.000)
    set u=CreateUnit(p, 'U001', - 5804.4, - 7013.7, 270.000)
    set u=CreateUnit(p, 'E003', - 5798.1, - 6732.2, 270.000)
    set u=CreateUnit(p, 'U003', - 5815.7, - 7191.3, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 210)
    set u=CreateUnit(p, 'N002', - 6089.9, - 6729.5, 270.000)
    set u=CreateUnit(p, 'H000', - 6698.2, - 6730.5, 270.000)
    set u=CreateUnit(p, 'O003', - 6951.3, - 6727.4, 270.000)
    set u=CreateUnit(p, 'H007', - 6695.1, - 7003.4, 270.000)
    set u=CreateUnit(p, 'U008', - 6399.5, - 7003.4, 270.000)
    set u=CreateUnit(p, 'U006', - 6943.3, - 7003.4, 270.000)
    set u=CreateUnit(p, 'e009', - 6411.0, 2119.8, 82.400)
    set u=CreateUnit(p, 'e00C', - 5422.8, 2091.1, 211.856)
    set u=CreateUnit(p, 'e008', - 6334.8, 1028.3, 119.919)
    set u=CreateUnit(p, 'e00D', - 5433.7, 1056.7, 235.137)
    set u=CreateUnit(p, 'e00A', - 4650.2, 1024.2, 142.596)
    set gg_unit_N00I_0136=CreateUnit(p, 'N00I', - 6687.1, - 6428.5, 270.000)
    set u=CreateUnit(p, 'O00A', - 6079.8, - 6407.5, 270.000)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer5()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer1()
    call CreateUnitsForPlayer2()
    call CreateUnitsForPlayer3()
    call CreateUnitsForPlayer4()
    call CreateUnitsForPlayer8()
    call CreateUnitsForPlayer11()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_Rect_ChoiceHero=Rect(- 7168.0, - 7296.0, - 5536.0, - 6176.0)
    set gg_rct_Rect_Brush=Rect(- 1952.0, 4608.0, 768.0, 7040.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: View
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Math
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// Trigger: RB
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Commom
//===========================================================================
//TESH.scrollpos=119
//TESH.alwaysfold=0
//===========================================================================
// Trigger: UnitState
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: HT
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// Trigger: ChargeSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//冲锋系统只负责冲锋，完成冲锋后的复杂动作需要技能另外加计时器完成，冲锋系统不能完成
//===========================================================================
// Trigger: ChargeTraceSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//冲锋跟踪系统
//===========================================================================
// Trigger: ChargeArrowSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//月神箭系统
//===========================================================================
// Trigger: ChargeParabolaSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//冲锋抛物线系统
//===========================================================================
// Trigger: SurroundSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: VerticalSurroundSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: SetHeightWay
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: SetHeight_Acceleration
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//设置高度，有加速度
//===========================================================================
// Trigger: SetDamageWay
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: BarrageSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: DeleteDeathUnit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Brush
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// scope Brush begins
    
    function GetWaveCount takes nothing returns integer
        return Brush___GiWaveCount_Brush
    endfunction
    
    function test_Brush takes nothing returns nothing
        //测试刷兵类型有无错误
        local integer i
        local unit uUnit
        set i=1
        loop
            exitwhen i > 20
            set uUnit=CreateUnit(Player(0), GiBrushUnitType[i], - 650, 2000, 0.)
            call BJDebugMsg(I2S(i))
            call BJDebugMsg(I2S(GetUnitLevel(uUnit)) + "等级")
            call BJDebugMsg(GetUnitName(uUnit))
            set i=i + 1
        endloop
        set uUnit=null
    endfunction
    
    function BrushUnitInit takes nothing returns nothing
        //刷兵类型初始化
        set GiBrushUnitType[1]='n004'
        set GiBrushUnitType[2]='u002'
        set GiBrushUnitType[3]='n00C'
        set GiBrushUnitType[4]='n00D'
        set GiBrushUnitType[5]='h005'
        set GiBrushUnitType[6]='o000'
        set GiBrushUnitType[7]='h002'
        set GiBrushUnitType[8]='h004'
        set GiBrushUnitType[9]='u000'
        set GiBrushUnitType[10]='u005'
        set GiBrushUnitType[11]='n00E'
        set GiBrushUnitType[12]='o005'
        set GiBrushUnitType[13]='n00B'
        set GiBrushUnitType[14]='n005'
        set GiBrushUnitType[15]='n00A'
        set GiBrushUnitType[16]='n009'
        set GiBrushUnitType[17]='n007'
        set GiBrushUnitType[18]='n00F'
        set GiBrushUnitType[19]='n008'
        set GiBrushUnitType[20]='n006'
        //BOSS
        set Brush___GiBrushUnitType_Boss[1]='U004'
        set Brush___GiBrushUnitType_Boss[2]='U007'
        set Brush___GiBrushUnitType_Boss[3]='H003'
        set Brush___GiBrushUnitType_Boss[4]='N001'
    endfunction
    
    //设置属性
// scope Brush_SetBrushState begins
        function SetState_enemy takes unit uUnit returns nothing
        //设置小怪属性
            //local real rWaveCount = I2R(GetUnitLevel(uUnit))    //波数
            local real rWaveCount= I2R(Brush___GiWaveCount_Brush)
            local real rLife= Pow(rWaveCount, 2) * 7 + 15
            local real rMana= rLife + 300
            local real rATK= Pow(rWaveCount, 2) * 0.6 + 5
            local real rArmor= rWaveCount
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            
            call US_SetUnitMaxLife(uUnit , rLife)
            call US_SetUnitLife(uUnit , rLife)
            call US_SetUnitMaxMana(uUnit , rMana)
            call US_SetUnitMana(uUnit , rMana)
            call US_SetUnitATK(uUnit , rATK) //基础伤害
call US_SetUnitArmor(uUnit , rArmor) //护甲
endfunction
        
        function SetState_Boss takes unit uUnit returns nothing
        //设置BOSS属性
            local real rWaveCount= I2R(Brush___GiWaveCount_Brush)
            local real rLife= Pow(rWaveCount, 2.25) * 150
            local real rMana= rLife
            local real rATK= Pow(rWaveCount, 1.5) * 5 + 50
            local real rArmor= Pow(rWaveCount, 1.3) + 5
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            call US_SetUnitMaxLife(uUnit , rLife)
            call US_SetUnitLife(uUnit , rLife)
            call US_SetUnitMaxMana(uUnit , rMana)
            call US_SetUnitMana(uUnit , rMana)
            call US_SetUnitATK(uUnit , rATK) //基础伤害
call US_SetUnitArmor(uUnit , rArmor) //护甲
endfunction
// scope Brush_SetBrushState ends
    
    
    function TimerAction_Action_Brush takes nothing returns nothing
        local timer tTimer= GetExpiredTimer()
        local unit uUnit
        local integer iTimerID= GetHandleId(tTimer)
        local integer iWaveCount_Brush= LoadInteger(htTimerHT, iTimerID, StringHash("iWaveCount_Brush"))
        local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
        call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
        if ( iTimerCount <= 10 ) then
            //Brush
            set uUnit=CreateUnit(Player(8), GiBrushUnitType[iWaveCount_Brush], Brush___GrComputer9Brush_x, Brush___GrComputer9Brush_y, 270.)
            call SetState_enemy(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            set uUnit=CreateUnit(Player(9), GiBrushUnitType[iWaveCount_Brush], Brush___GrComputer10Brush_x, Brush___GrComputer10Brush_y, 270.)
            call SetState_enemy(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            set uUnit=CreateUnit(Player(10), GiBrushUnitType[iWaveCount_Brush], Brush___GrComputer11Brush_x, Brush___GrComputer11Brush_y, 270.)
            call SetState_enemy(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            set uUnit=CreateUnit(Player(11), GiBrushUnitType[iWaveCount_Brush], Brush___GrComputer12Brush_x, Brush___GrComputer12Brush_y, 270.)
            call SetState_enemy(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
        else
            //End
            call DestroyTimer(tTimer)
            call FlushChildHashtable(htTimerHT, iTimerID)
        endif
        set tTimer=null
        set uUnit=null
    endfunction
    
    function Action_Brush takes nothing returns nothing
        local timer tTimer= CreateTimer()
        local integer iTimerID= GetHandleId(tTimer)
        local integer iTimerCount= 1
        local integer iWaveCount_Brush= Brush___GiWaveCount_Brush
        call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
        call SaveInteger(htTimerHT, iTimerID, StringHash("iWaveCount_Brush"), iWaveCount_Brush)
        call TimerStart(tTimer, 1., true, function TimerAction_Action_Brush)
        set tTimer=null
    endfunction
    
    function Action_BossBrush takes nothing returns nothing
        call PanCameraToTimed(Brush___GrBossBrush_x, Brush___GrBossBrush_y, 0.2)
        call DisplayTextToForce(GetPlayersAll(), "BOSS来袭")
    endfunction
    
    function TimerAction_BrushJudge takes nothing returns nothing
        local string sTimerDialogTitle_Brush
        local unit uUnit
        //设置每波计时器时间
        set Brush___GiWaveCount_Brush=Brush___GiWaveCount_Brush + 1
        //call BJDebugMsg("当前波数：" + I2S(GiWaveCount_Brush))
        set sTimerDialogTitle_Brush=( "第" + I2S(Brush___GiWaveCount_Brush + 1) + "波敌军即将来袭！" )
        call TimerDialogSetTitle(Brush___GtdTimerDialog_Brush, sTimerDialogTitle_Brush)
        //test
        call TimerStart(Brush___GtTimer_Brush, 10., false, function TimerAction_BrushJudge)
        
        //Brush
        call Action_Brush()
        
        //BrushBoss
        if ( Brush___GiWaveCount_Brush == 5 ) then
            set uUnit=CreateUnit(Player(7), Brush___GiBrushUnitType_Boss[1], Brush___GrBossBrush_x, Brush___GrBossBrush_y, 270.)
            call SetState_Boss(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            call Action_BossBrush()
        elseif ( Brush___GiWaveCount_Brush == 10 ) then
            set uUnit=CreateUnit(Player(7), Brush___GiBrushUnitType_Boss[2], Brush___GrBossBrush_x, Brush___GrBossBrush_y, 270.)
            call SetState_Boss(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            call Action_BossBrush()
        elseif ( Brush___GiWaveCount_Brush == 15 ) then
            set uUnit=CreateUnit(Player(7), Brush___GiBrushUnitType_Boss[3], Brush___GrBossBrush_x, Brush___GrBossBrush_y, 270.)
            call SetState_Boss(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            call Action_BossBrush()
        elseif ( Brush___GiWaveCount_Brush == 20 ) then
            set uUnit=CreateUnit(Player(7), Brush___GiBrushUnitType_Boss[4], Brush___GrBossBrush_x, Brush___GrBossBrush_y, 270.)
            call SetState_Boss(uUnit)
            call IssuePointOrder(uUnit, "attack", GrBloodPool_x, GrBloodPool_y)
            call Action_BossBrush()
        endif
        
        set uUnit=null
    endfunction
    
    function StartBrushTimer takes nothing returns nothing
        local string sTimerDialogTitle_Brush
        set Brush___GtTimer_Brush=CreateTimer() //刷兵计时器
set Brush___GiTimerID_Brush=GetHandleId(Brush___GtTimer_Brush) //ID
set Brush___GtdTimerDialog_Brush=CreateTimerDialog(Brush___GtTimer_Brush) //计时器窗口

        set sTimerDialogTitle_Brush=( "第" + I2S(Brush___GiWaveCount_Brush + 1) + "波敌军即将来袭！" )
        call TimerStart(Brush___GtTimer_Brush, 1., false, function TimerAction_BrushJudge)
        call TimerDialogSetTitle(Brush___GtdTimerDialog_Brush, sTimerDialogTitle_Brush)
        call TimerDialogDisplay(Brush___GtdTimerDialog_Brush, true)
    endfunction
    
    
// scope Brush ends
//===========================================================================
// Trigger: Award
//===========================================================================
//TESH.scrollpos=27
//TESH.alwaysfold=0
function Trig_AwardActions takes nothing returns nothing
    local unit uDeathUnit= GetTriggerUnit()
    local unit uKillerUnit= GetKillingUnit()
    local player pPlayer= GetOwningPlayer(uKillerUnit)
    local integer iAbiliLevel_Enemy= GetUnitAbilityLevel(uDeathUnit, 'A003')
    local integer iAbiliLevel_Boss= GetUnitAbilityLevel(uDeathUnit, 'A004')
    local integer iLevel= GetUnitLevel(uDeathUnit)
local integer iGoldAward= 0
    local string sString_GoldAward
    local texttag ttTextTag
    local integer i
    //Award
    if ( GetPlayerController(pPlayer) == MAP_CONTROL_USER ) then //击杀者玩家是用户
if ( iAbiliLevel_Enemy > 0 ) then
        //击杀的是小怪
            if ( iLevel > 0 ) and ( iLevel <= 10 ) then
                set iGoldAward=iLevel
            elseif ( iLevel > 10 ) and ( iLevel <= 20 ) then
                set iGoldAward=iLevel + GetRandomInt(4, 6)
            endif
            //call BJDebugMsg(GetUnitName(uDeathUnit))
            //call BJDebugMsg("|Cffffff00" + "增加金币：" + I2S(iGoldAward) + "|R")
            //增加金币
            call SetPlayerState(pPlayer, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(pPlayer, PLAYER_STATE_RESOURCE_GOLD) + iGoldAward)
            if ( GetPlayerSlotState(pPlayer) == PLAYER_SLOT_STATE_PLAYING ) then
            //玩家正在游戏才创建漂浮文字
                //漂浮文字
                set sString_GoldAward=( "|Cffffff00+" + I2S(iGoldAward) + "|R" )
                set ttTextTag=CreateTextTag_New(GetUnitX(uDeathUnit) , GetUnitY(uDeathUnit) , 50. , sString_GoldAward , 10.)
                call SetTextTagColor(ttTextTag, 255, 255, 255, 255) //设置颜色透明度，0最小，255最大
call SetTextTagVelocityBJ(ttTextTag, 64, 60) //速率，角度
//指定玩家显示
call SetTextTagVisibility(ttTextTag, false) //先隐藏
if ( GetLocalPlayer() == GetOwningPlayer(uKillerUnit) ) then
                    call SetTextTagVisibility(ttTextTag, true)
                endif
                //几秒后删除
                call YDWETimerDestroyTextTag(2.00 , ttTextTag)
            endif
        endif
        
        if ( iAbiliLevel_Boss > 0 ) then
        //击杀的是英雄，每个玩家奖励500
            set iGoldAward=500
            set sString_GoldAward=( "成功击败BOSS：|Cffff0000" + GetUnitName(uKillerUnit) + "|R，奖励金币：|Cffffff00" + I2S(iGoldAward) + "|R" )
            set i=0
            loop
                exitwhen i > 4
                call SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD) + iGoldAward)
                call DisplayTextToPlayer(Player(i), 0, 0, sString_GoldAward) //显示击杀BOSS奖励信息
set i=i + 1
            endloop
        endif
    endif
    set uDeathUnit=null
    set uKillerUnit=null
    set pPlayer=null
    set ttTextTag=null
endfunction
function Trig_AwardConditions takes nothing returns boolean
    return ( ( GetPlayerController(GetOwningPlayer(GetTriggerUnit())) == MAP_CONTROL_COMPUTER ) )
endfunction
function InitTrig_Award takes nothing returns nothing
    set gg_trg_Award=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Award, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Award, Condition(function Trig_AwardConditions))
    call TriggerAddAction(gg_trg_Award, function Trig_AwardActions)
endfunction
//===========================================================================
// Trigger: BuffSystemAction
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0

//属性添加动作
//BuffSystemAction_State_Add(uBuffUnit, iBuffState_Type[i], rBuffState_Data[i])
function BuffSystemAction_State_Add takes unit uBuffUnit,integer iBuffState_Type,real rBuffState_Data returns nothing
    if ( iBuffState_Type == iBuffState_ATK ) then
        call US_AddUnitATK(uBuffUnit , rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_Armor ) then
        call US_AddUnitArmor(uBuffUnit , rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_ATKSpeed ) then
        call US_AddUnitATKSpeed(uBuffUnit , rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_MovementSpeed ) then
        call US_AddUnitMoveSpeed(uBuffUnit , rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_Stre ) then
        call iAddHeroStr(uBuffUnit , R2I(rBuffState_Data))
    elseif ( iBuffState_Type == iBuffState_Agil ) then
        call iAddHeroAgi(uBuffUnit , R2I(rBuffState_Data))
    elseif ( iBuffState_Type == iBuffState_Inte ) then
        call iAddHeroInt(uBuffUnit , R2I(rBuffState_Data))
    endif
endfunction
//属性buff结束动作
//BuffSystemAction_State_Finish(uBuffUnit, iBuffState_Type[i], rBuffState_Data[i])
function BuffSystemAction_State_Finish takes unit uBuffUnit,integer iBuffState_Type,real rBuffState_Data returns nothing
    if ( iBuffState_Type == iBuffState_ATK ) then
        call US_AddUnitATK(uBuffUnit , - rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_Armor ) then
        call US_AddUnitArmor(uBuffUnit , - rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_ATKSpeed ) then
        call US_AddUnitATKSpeed(uBuffUnit , - rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_MovementSpeed ) then
        call US_AddUnitMoveSpeed(uBuffUnit , - rBuffState_Data)
    elseif ( iBuffState_Type == iBuffState_Stre ) then
        call iAddHeroStr(uBuffUnit , - R2I(rBuffState_Data))
    elseif ( iBuffState_Type == iBuffState_Agil ) then
        call iAddHeroAgi(uBuffUnit , - R2I(rBuffState_Data))
    elseif ( iBuffState_Type == iBuffState_Inte ) then
        call iAddHeroInt(uBuffUnit , - R2I(rBuffState_Data))
    endif
endfunction

//变形添加buff
//BuffSystemAction_iIsBuffChangeShape_Add(st.uBuffUnit, st.uAttackerUnit, st.rBuffDuration)
function BuffSystemAction_iIsBuffChangeShape_Add takes unit uBuffUnit,unit uAttackerUnit,real rBuffDuration returns nothing
    local real x= GetUnitX(uBuffUnit)
    local real y= GetUnitY(uBuffUnit)
    local player pPlayer= GetOwningPlayer(uAttackerUnit)
    local unit uMJUnit= CreateUnit(pPlayer, 'e000', x, y, 0)
    local integer iAbiliId= 0
    local string sOrder= ""
    local real rValue
    set iAbiliId='A01P' //变形
set sOrder="hex"
    call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, iAbiliId) //技能
call YDWESetUnitAbilityDataReal(uMJUnit , iAbiliId , 1 , 102 , rBuffDuration) //持续时间普通
call YDWESetUnitAbilityDataReal(uMJUnit , iAbiliId , 1 , 103 , rBuffDuration) //持续时间英雄

    call IssueTargetOrder(uMJUnit, sOrder, uBuffUnit)
    call UnitApplyTimedLife(uMJUnit, iAbiliId, 1.00) //生命周期
set pPlayer=null
    set uMJUnit=null
endfunction
//attacktype attackType, damagetype damageType
//ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL,
function BuffSystemCycleAction_Damage takes unit uBuffUnit,unit uAttackerUnit,string sBuffName,real rBuffDamage,boolean bIsBuffLayer,integer iBuffLayer returns nothing
    local attacktype at1= ATTACK_TYPE_NORMAL
    local damagetype dt1= DAMAGE_TYPE_POISON
    //不叠层
    if ( sBuffName == sBuffTypeString[1] ) then
        set dt1=DAMAGE_TYPE_FIRE //法术攻击火焰伤害
elseif ( sBuffName == sBuffTypeString[2] ) then
        set dt1=DAMAGE_TYPE_COLD //法术攻击冰冻伤害
elseif ( sBuffName == sBuffTypeString[3] ) then
        set dt1=DAMAGE_TYPE_POISON //法术攻击毒药伤害

    endif
    if ( bIsBuffLayer == true ) then
        set rBuffDamage=rBuffDamage * iBuffLayer
        call UnitDamageTarget(uAttackerUnit, uBuffUnit, rBuffDamage, false, false, at1, dt1, WEAPON_TYPE_WHOKNOWS)
    else
        call UnitDamageTarget(uAttackerUnit, uBuffUnit, rBuffDamage, false, false, at1, dt1, WEAPON_TYPE_WHOKNOWS)
    endif
    set at1=null
    set dt1=null
endfunction
//===========================================================================
// Trigger: BuffSystemWork
//
// rBuffMoveTime_Duration
// rBuffMoveTime_TriggerTime
//===========================================================================
//TESH.scrollpos=106
//TESH.alwaysfold=0
function Trig_BuffSystemWorkActions takes nothing returns nothing
    local unit uBuffUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uBuffUnit"))
    local integer iBuffSyst_UnitIndex= LoadInteger(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("iBuffSyst_UnitIndex"))
    local integer iBuffNum= LoadInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("BuffSystemiBuffNum"))
local integer array iBuffDataAdress
local integer st
local integer i
    local integer j
    local integer iNum
    local integer iNum_1
    local integer iFlag_Clean= 0
    local string sString
    //local trigger trTrigger
    set i=1
    loop
        exitwhen i > iBuffNum
        set iBuffDataAdress[i]=LoadInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("iBuffDataAdress" + I2S(i))) //存buff数据结构体地址
if ( iBuffDataAdress[i] > 0 ) then //地址存在
set st=iBuffDataAdress[i]
            set s__EachBuffData_rBuffMoveTime_Duration[st]=s__EachBuffData_rBuffMoveTime_Duration[st] - rTimerInterval_BuffSyst //持续时间-0.1
set s__EachBuffData_rBuffMoveTime_TriggerTime[st]=s__EachBuffData_rBuffMoveTime_TriggerTime[st] - rTimerInterval_BuffSyst //运行时间-0.1
//CycleAction
if ( s__EachBuffData_rBuffMoveTime_TriggerTime[st] <= 0 ) then
                if ( s__EachBuffData_rBuffDamage[st] > 0 ) then
                    call BuffSystemCycleAction_Damage(s__EachBuffData_uBuffUnit[st] , s__EachBuffData_uAttackerUnit[st] , s__EachBuffData_sBuffName[st] , s__EachBuffData_rBuffDamage[st] , s__EachBuffData_bIsBuffLayer[st] , s__EachBuffData_iBuffLayer[st])
                endif
                set s__EachBuffData_rBuffMoveTime_TriggerTime[st]=s__EachBuffData_rBuffTriggerTime[st]
            endif
            
            //BUFF时间结束
            if ( GetUnitState(s__EachBuffData_uBuffUnit[st], UNIT_STATE_LIFE) <= 0 ) or ( s__EachBuffData_rBuffMoveTime_Duration[st] <= 0. ) then
                //call BJDebugMsg("clean")
                //Action
                if ( s__EachBuffData_eBuffEffect[st] != null ) then
                    call DestroyEffect(s__EachBuffData_eBuffEffect[st]) //删除特效
endif
                //属性恢复原来
                set j=1
                loop
                    exitwhen j > s__EachBuffData_iBuffState_Num[st]
                    call BuffSystemAction_State_Finish(s__EachBuffData_uBuffUnit[st] , s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+j] , s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+j])
                    set j=j + 1
                endloop
                if ( s__EachBuffData_iIsBuffDizziness[st] == 1 ) then //眩晕
call YDWEUnitRemoveStun(s__EachBuffData_uBuffUnit[st])
                endif
                if ( s__EachBuffData_iIsBuffChangeShape[st] == 1 ) then //变形
call UnitAddAbility(s__EachBuffData_uBuffUnit[st], 'A00S') //魔免
call UnitRemoveAbility(s__EachBuffData_uBuffUnit[st], 'A00S') //魔免
endif
                if ( s__EachBuffData_iIsImmovable[st] == 1 ) then //定身
set sString=LoadStr(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("sString_UnitMoveType"))
                    if ( sString == "foot" ) then
                        call EXSetUnitMoveType(s__EachBuffData_uBuffUnit[st], 0x02) //步行
else
                        call EXSetUnitMoveType(s__EachBuffData_uBuffUnit[st], 0x04) //飞行
endif
                endif
                //Clean
                call sc__EachBuffData_deallocate(st)
                set iBuffDataAdress[i]=0
                set iFlag_Clean=1
            endif
            
        endif
        set i=i + 1
    endloop
    
    //排序
    if ( iFlag_Clean == 1 ) then
    //buff数量>1，且有buff结束
        set i=1
        set iNum=iBuffNum
        set iNum_1=1
        loop
            exitwhen i > iNum
            call SaveInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("iBuffDataAdress" + I2S(i)), 0) //存buff数据结构体地址
if ( iBuffDataAdress[i] > 0 ) then
                call SaveInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("iBuffDataAdress" + I2S(iNum_1)), iBuffDataAdress[i]) //存buff数据结构体地址
set iNum_1=iNum_1 + 1
            else //BUFF空出来
                set iBuffNum=iBuffNum - 1
            endif
            set i=i + 1
        endloop
        //剩余的存null
        
        call SaveInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("BuffSystemiBuffNum"), iBuffNum) //BUFF数量
endif
    
    if ( iBuffNum == 0 ) then
        if ( iBuffSyst_UnitIndex != G_iUnitNum_BuffSyst ) then //最后的放到当前
set iBuffSystUnitId[iBuffSyst_UnitIndex]=iBuffSystUnitId[G_iUnitNum_BuffSyst]
            set iBuffSystUnitId[G_iUnitNum_BuffSyst]=0
        endif
        set G_iUnitNum_BuffSyst=G_iUnitNum_BuffSyst - 1
        
    endif
    
    call SaveUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uBuffUnit"), null)
    call SaveInteger(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("iBuffSyst_UnitIndex"), 0)
    set uBuffUnit=null
    //set trTrigger = null
endfunction
//===========================================================================
function InitTrig_BuffSystemWork takes nothing returns nothing
    set gg_trg_BuffSystemWork=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_BuffSystemWork, function Trig_BuffSystemWorkActions)
endfunction
//===========================================================================
// Trigger: BuffSystemTimer
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
    
function TimerAction_BuffSystem takes nothing returns nothing
    local integer i
    local unit uBuffUnit
    //local trigger trTrigger
    if ( G_iUnitNum_BuffSyst == 0 ) then
        call PauseTimer(tTimer_BuffSyst)
        set bTimerState_BuffSyst=false
        return
    endif
    if ( G_iUnitNum_BuffSyst > 0 ) then //BUFF系统单位组数量>0
        set i=1
        loop
            exitwhen i > G_iUnitNum_BuffSyst
            set uBuffUnit=I2U(iBuffSystUnitId[i])
            
            call SaveUnitHandle(htTriggerHT, GetHandleId(gg_trg_BuffSystemWork), StringHash("uBuffUnit"), uBuffUnit)
            call SaveInteger(htTriggerHT, GetHandleId(gg_trg_BuffSystemWork), StringHash("iBuffSyst_UnitIndex"), i)
            call TriggerExecute(gg_trg_BuffSystemWork)
            
            set i=i + 1
        endloop
    endif
    call TriggerExecute(gg_trg_UI_BuffSystemDynamic) //buff系统UI动态显示
set uBuffUnit=null
    //set trTrigger = null
endfunction
function BuffSystemInit takes nothing returns nothing
    set tTimer_BuffSyst=CreateTimer()
    set iTimerID_BuffSyst=GetHandleId(tTimer_BuffSyst)
    call TimerStart(tTimer_BuffSyst, rTimerInterval_BuffSyst, true, function TimerAction_BuffSystem)
    set bTimerState_BuffSyst=true
endfunction
//===========================================================================
// Trigger: BuffSystem_Add
//
// 属性：攻击、防御、攻速、移速、三维、治疗效果
//===========================================================================
//TESH.scrollpos=107
//TESH.alwaysfold=0
function Trig_BuffSystem_AddActions takes nothing returns nothing
    local integer st= stG_BuffSystStruct_TranPara
local integer st_BuffData
local integer iBuffNum= LoadInteger(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("BuffSystemiBuffNum"))
//local integer array iBuffDataAdress //单位身上的Buff数据结构体的地址
local integer iFlag= 0
    local integer iAddUnit= 0
    local integer iUpdateDuration= 0
    local integer i
    local integer iNum
    local string sString
    local string sString_AttachPoint
    local effect eBuffEffect
    local real rValue
    //local trigger trTrigger
    //local triggeraction traTriggerAction
        
    
    //一个单位身上有多少个buff，判断新加buff还是延续buff
    if ( iBuffNum > 0 ) then
        set iFlag=1 //默认
set i=1
        loop
            exitwhen i > iBuffNum
            set st_BuffData=LoadInteger(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("iBuffDataAdress" + I2S(i))) //BUFF种类
if ( s__EachBuffData_sBuffName[st_BuffData] == s__EachBuffData_sBuffName[st] ) then
                set iFlag=2
                call DoNothing()
 exitwhen true //(  )   //退出循环
            endif
            set i=i + 1
        endloop
    else
        //一个BUFF都没，新加BUFF，而且加入BUFF单位组
        set iFlag=1
        set iAddUnit=1
    endif
    
    
    if ( iFlag == 1 ) then //新加BUFF
        set st_BuffData=sc__EachBuffData_create()
        set iBuffNum=iBuffNum + 1
        call SaveInteger(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("BuffSystemiBuffNum"), iBuffNum) //Buff数量
call SaveInteger(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("iBuffDataAdress" + I2S(iBuffNum)), st_BuffData) //存buff数据结构体地址
//Data
set s__EachBuffData_uBuffUnit[st_BuffData]=s__EachBuffData_uBuffUnit[st]
        set s__EachBuffData_uAttackerUnit[st_BuffData]=s__EachBuffData_uAttackerUnit[st]
        set s__EachBuffData_sBuffName[st_BuffData]=s__EachBuffData_sBuffName[st]
        set s__EachBuffData_iBuffPolarity[st_BuffData]=s__EachBuffData_iBuffPolarity[st]
        set rValue=LoadReal(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("rBuffSystem_StateResistance")) //状态抗性
if ( rValue > 0 ) and ( s__EachBuffData_iBuffPolarity[st] == iBuffPolarity_Pesimistic ) then //有状态抗性且是负面buff
set s__EachBuffData_rBuffDuration[st]=s__EachBuffData_rBuffDuration[st] * ( 1 - rValue * 0.01 )
        endif
        set s__EachBuffData_rBuffDuration[st_BuffData]=s__EachBuffData_rBuffDuration[st]
        set s__EachBuffData_rBuffTriggerTime[st_BuffData]=s__EachBuffData_rBuffTriggerTime[st]
        set s__EachBuffData_rBuffMoveTime_Duration[st_BuffData]=s__EachBuffData_rBuffDuration[st]
        set s__EachBuffData_rBuffMoveTime_TriggerTime[st_BuffData]=s__EachBuffData_rBuffTriggerTime[st]
        set s__EachBuffData_bIsBuffClean[st_BuffData]=s__EachBuffData_bIsBuffClean[st]
        set s__EachBuffData_rBuffDamage[st_BuffData]=s__EachBuffData_rBuffDamage[st]
        set s__EachBuffData_bIsBuffLayer[st_BuffData]=s__EachBuffData_bIsBuffLayer[st]
        if ( s__EachBuffData_bIsBuffLayer[st] == true ) then //叠层
            set s__EachBuffData_iBuffLayer[st_BuffData]=1
            set s__EachBuffData_iBuffLayerMax[st_BuffData]=s__EachBuffData_iBuffLayerMax[st]
        endif
        set s__EachBuffData_iIsBuffDizziness[st_BuffData]=s__EachBuffData_iIsBuffDizziness[st] //眩晕
set s__EachBuffData_iIsBuffChangeShape[st_BuffData]=s__EachBuffData_iIsBuffChangeShape[st] //变形
set s__EachBuffData_iIsBuffScare[st_BuffData]=s__EachBuffData_iIsBuffScare[st] //惊吓
set s__EachBuffData_iIsBuffBlind[st_BuffData]=s__EachBuffData_iIsBuffBlind[st] //致盲
set s__EachBuffData_iIsImmovable[st_BuffData]=s__EachBuffData_iIsImmovable[st] //定身，不能移动
set s__EachBuffData_iBuffState_Num[st_BuffData]=s__EachBuffData_iBuffState_Num[st] //buff属性数量
if ( s__EachBuffData_iBuffState_Num[st] > 0 ) then
            set i=1
            loop
                exitwhen i > s__EachBuffData_iBuffState_Num[st]
                set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st_BuffData]+i]=s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+i]
                set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st_BuffData]+i]=s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+i]
                call BuffSystemAction_State_Add(s__EachBuffData_uBuffUnit[st] , s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+i] , s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+i])
                set i=i + 1
            endloop
        endif
        //Effect
        set sString=LoadStr(htCommomHT, StringHash("BuffSystInit" + s__EachBuffData_sBuffName[st]), StringHash(s__EachBuffData_sBuffName[st] + "eEffect")) //特效字符串
set sString_AttachPoint=LoadStr(htCommomHT, StringHash("BuffSystInit" + s__EachBuffData_sBuffName[st]), StringHash(s__EachBuffData_sBuffName[st] + "AttachPointName"))
        if ( sString != null ) then
            set eBuffEffect=AddSpecialEffectTarget(sString, s__EachBuffData_uBuffUnit[st], sString_AttachPoint)
            set s__EachBuffData_eBuffEffect[st_BuffData]=eBuffEffect
        endif
        
        
        
        if ( s__EachBuffData_iIsBuffDizziness[st] == 1 ) then //眩晕
call YDWEUnitAddStun(s__EachBuffData_uBuffUnit[st])
        endif
        if ( s__EachBuffData_iIsBuffChangeShape[st] == 1 ) then //变形
call BuffSystemAction_iIsBuffChangeShape_Add(s__EachBuffData_uBuffUnit[st] , s__EachBuffData_uAttackerUnit[st] , s__EachBuffData_rBuffDuration[st])
        endif
        if ( s__EachBuffData_iIsImmovable[st] == 1 ) then //定身
set sString=( EXExecuteScript("(require'jass.slk').unit[" + I2S(GetUnitTypeId(s__EachBuffData_uBuffUnit[st])) + "].movetp") )
            call SaveStr(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("sString_UnitMoveType"), sString)
            call EXSetUnitMoveType(s__EachBuffData_uBuffUnit[st], 0x01) //无法移动
//call BJDebugMsg("sString_UnitMoveType:"+sString)
endif
        
        if ( s__EachBuffData_iIsBuffBlind[st] == 1 ) then //致盲

        endif
        
        if ( iAddUnit == 1 ) then
            set G_iUnitNum_BuffSyst=G_iUnitNum_BuffSyst + 1
            set iBuffSystUnitId[G_iUnitNum_BuffSyst]=GetHandleId(s__EachBuffData_uBuffUnit[st])
            
        endif
        
    elseif ( iFlag == 2 ) then //延续BUFF
//3种固定状态持续时间内不能重置
if ( s__EachBuffData_iIsBuffDizziness[st] == 0 ) and ( s__EachBuffData_iIsBuffChangeShape[st] == 0 ) and ( s__EachBuffData_iIsImmovable[st] == 0 ) then
            //注意伤害最大值，持续时间最大值，最大叠层数取最大值
            set s__EachBuffData_uAttackerUnit[st_BuffData]=s__EachBuffData_uAttackerUnit[st] //施加单位
set rValue=LoadReal(htUnitHT, GetHandleId(s__EachBuffData_uBuffUnit[st]), StringHash("rBuffSystem_StateResistance")) //状态抗性
if ( rValue > 0 ) and ( s__EachBuffData_iBuffPolarity[st] == iBuffPolarity_Pesimistic ) then //有状态抗性且是负面buff
set s__EachBuffData_rBuffDuration[st]=s__EachBuffData_rBuffDuration[st] * ( 1 - rValue * 0.01 )
            endif
            if ( s__EachBuffData_rBuffDuration[st] > s__EachBuffData_rBuffDuration[st_BuffData] ) then //持续时间取最大值
set s__EachBuffData_rBuffDuration[st_BuffData]=s__EachBuffData_rBuffDuration[st]
                set iUpdateDuration=1
            endif
            if ( s__EachBuffData_rBuffDuration[st] > s__EachBuffData_rBuffMoveTime_Duration[st_BuffData] ) then //持续时间重置，而且新加的时间比buff还剩下的时间多才重置
set s__EachBuffData_rBuffMoveTime_Duration[st_BuffData]=s__EachBuffData_rBuffDuration[st]
            endif
        endif
        if ( s__EachBuffData_rBuffDamage[st] > s__EachBuffData_rBuffDamage[st_BuffData] ) then //伤害取最大值
set s__EachBuffData_rBuffDamage[st_BuffData]=s__EachBuffData_rBuffDamage[st]
        endif
        if ( s__EachBuffData_bIsBuffLayer[st] == true ) then //叠层
            if ( s__EachBuffData_iBuffLayerMax[st] > s__EachBuffData_iBuffLayerMax[st_BuffData] ) then //最大叠层数取最大值
set s__EachBuffData_iBuffLayerMax[st_BuffData]=s__EachBuffData_iBuffLayerMax[st]
            endif
            if ( s__EachBuffData_iBuffLayer[st_BuffData] < s__EachBuffData_iBuffLayerMax[st_BuffData] ) then //层数<最大层数，才能增加层数
                set s__EachBuffData_iBuffLayer[st_BuffData]=s__EachBuffData_iBuffLayer[st_BuffData] + 1
            endif
        endif
        //同一buff属性更新，取最大值
        if ( s__EachBuffData_iBuffState_Num[st] > 0 ) then
            set i=1
            loop
                exitwhen i > s__EachBuffData_iBuffState_Num[st]
                if ( s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st_BuffData]+i] == s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+i] ) and ( s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+i] > s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st_BuffData]+i] ) then
                    set rValue=s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+i] - s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st_BuffData]+i]
                    call BuffSystemAction_State_Add(s__EachBuffData_uBuffUnit[st] , s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+i] , rValue)
                    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st_BuffData]+i]=s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+i]
                endif
                set i=i + 1
            endloop
        endif
    endif
    
    
    if ( bTimerState_BuffSyst == false ) then
        call TimerStart(tTimer_BuffSyst, rTimerInterval_BuffSyst, true, function TimerAction_BuffSystem)
        set bTimerState_BuffSyst=true
    endif
    
    call sc__EachBuffData_deallocate(st) //传参完就没用
set eBuffEffect=null
    //set trTrigger = null
    //set traTriggerAction = null
endfunction
function InitTrig_BuffSystem_Add takes nothing returns nothing
    set gg_trg_BuffSystem_Add=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_BuffSystem_Add, function Trig_BuffSystem_AddActions)
endfunction
//===========================================================================
// Trigger: BuffSystem_StateInit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_BuffSystem_StateInitActions takes nothing returns nothing
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_ATK, "攻击力")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_Armor, "防御")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_ATKSpeed, "攻速")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_MovementSpeed, "移速")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_Stre, "力量")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_Agil, "敏捷")
    call SaveStr(htCommomHT, StringHash("BuffSystem_StateInit"), iBuffState_Inte, "智力")
    
endfunction
//===========================================================================
// Trigger: BuffSystem_BuffTypeInit
//===========================================================================
//TESH.scrollpos=45
//TESH.alwaysfold=0
//BUFF固定参数初始化：名字、特效、图标、BUFF介绍文本
function Trig_BuffSystem_BuffTypeInitActions takes nothing returns nothing
    local string sBuffName
    local string sString
    call BuffSystemInit()
    call Trig_BuffSystem_StateInitActions()
    //灼烧
    set sBuffName="灼烧"
    set sBuffTypeString[1]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\PassiveButtons\\PASBTNFireRocks.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位被灼烧，持续受到伤害") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeDamageTarget.mdl") //特效字符串
set sString="origin"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//冰冻
set sBuffName="冰冻"
    set sBuffTypeString[2]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\PassiveButtons\\PASBTNFreezingBreath.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位冻结，行动变慢，持续受到伤害") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl") //特效字符串
set sString="origin"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//毒药
set sBuffName="中毒"
    set sBuffTypeString[3]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\PassiveButtons\\PASBTNEnvenomedSpear.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位中毒，持续受到伤害") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl") //特效字符串
set sString="origin"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//心灵之火
set sBuffName="心灵之火"
    set sBuffTypeString[4]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\CommandButtons\\BTNInnerFireOn.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位攻击力和防御力得到加强") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Spells\\Human\\InnerFire\\InnerFireTarget.mdl") //特效字符串
set sString="overhead"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//眩晕
set sBuffName="眩晕"
    set sBuffTypeString[5]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\CommandButtons\\BTNStun.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位被眩晕，无法行动，无法叠加") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl") //特效字符串
set sString="overhead"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//变形
set sBuffName="变形"
    set sBuffTypeString[6]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\CommandButtons\\BTNHex.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位变成动物，无法攻击，无法叠加") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "") //特效字符串
set sString=""
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串
//定身
set sBuffName="定身"
    set sBuffTypeString[7]=sBuffName
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon"), "ReplaceableTextures\\CommandButtons\\BTNEntanglingRoots.blp") //图标字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction"), "单位被定身，无法移动，可施法，无法叠加") //介绍字符串
call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "eEffect"), "Abilities\\Spells\\NightElf\\EntanglingRoots\\EntanglingRootsTarget.mdl") //特效字符串
set sString="origin"
    call SaveStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "AttachPointName"), sString) //附着点位置字符串

    
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_BuffSystem_BuffTypeInit takes nothing returns nothing
    set gg_trg_BuffSystem_BuffTypeInit=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_BuffSystem_BuffTypeInit, 0.00)
    call TriggerAddAction(gg_trg_BuffSystem_BuffTypeInit, function Trig_BuffSystem_BuffTypeInitActions)
endfunction
//===========================================================================
// Trigger: BuffSystem_StructInit
//===========================================================================
//TESH.scrollpos=42
//TESH.alwaysfold=0

//每种buff数据
    
    function s__EachBuffData_create takes nothing returns integer
        local integer st
        set st=s__EachBuffData__allocate()
        return st
    endfunction
    
    function s__EachBuffData_onDestroy takes integer this returns nothing
        local integer i
        set s__EachBuffData_uBuffUnit[this]=null
        set s__EachBuffData_uAttackerUnit[this]=null
        set s__EachBuffData_sBuffName[this]=null
        set s__EachBuffData_iBuffPolarity[this]=0
        set s__EachBuffData_rBuffDuration[this]=0.
        set s__EachBuffData_rBuffTriggerTime[this]=0.
        set s__EachBuffData_rBuffMoveTime_Duration[this]=0.
        set s__EachBuffData_rBuffMoveTime_TriggerTime[this]=0.
        set s__EachBuffData_bIsBuffClean[this]=false
        set s__EachBuffData_rBuffDamage[this]=0.
        set s__EachBuffData_bIsBuffLayer[this]=false
        set s__EachBuffData_iBuffLayer[this]=0
        set s__EachBuffData_iBuffLayerMax[this]=0
        set s__EachBuffData_iIsBuffDizziness[this]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[this]=0 //变形
set s__EachBuffData_iIsBuffScare[this]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[this]=0 //致盲
set s__EachBuffData_iIsImmovable[this]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[this]=0
        set i=1
        loop
            exitwhen i > 5
            set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[this]+i]=0
            set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[this]+i]=0.
            set i=i + 1
        endloop
        set s__EachBuffData_eBuffEffect[this]=null
    endfunction

//Generated destructor of EachBuffData
function s__EachBuffData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: EachBuffData")
        return
    elseif (si__EachBuffData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: EachBuffData")
        return
    endif
    call s__EachBuffData_onDestroy(this)
    set si__EachBuffData_V[this]=si__EachBuffData_F
    set si__EachBuffData_F=this
endfunction
    
//===========================================================================
// Trigger: Test_Buff1_A01C
//
// 灼烧
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A01C_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[1] //灼烧
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=10 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=1
    set s__EachBuffData_bIsBuffClean[st]=false
    set s__EachBuffData_rBuffDamage[st]=rDamage
    set s__EachBuffData_bIsBuffLayer[st]=true
    set s__EachBuffData_iBuffLayerMax[st]=5
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=0 //buff属性数量
//set st.iBuffState_Type[1] = 0
//set st.rBuffState_Data[1] = 0.

    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01C takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 100
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01C_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff2_A01D
//
// 冰冻
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function AbilityAction_A01D_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[2] //冰冻
    set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=10 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=0.5
    set s__EachBuffData_bIsBuffClean[st]=false
    set s__EachBuffData_rBuffDamage[st]=rDamage
    set s__EachBuffData_bIsBuffLayer[st]=true
    set s__EachBuffData_iBuffLayerMax[st]=3
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=2 //buff属性数量
set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+1]=iBuffState_ATKSpeed
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+1]=- 0.5 * US_GetUnitATKSpeed(uBuffUnit)
    set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+2]=iBuffState_MovementSpeed
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+2]=- 0.5 * US_GetUnitMoveSpeed(uBuffUnit)
    
    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01D takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 50
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01D_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff3_A01E
//
// 中毒
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A01E_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[3] //中毒
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=10 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=0.3
    set s__EachBuffData_bIsBuffClean[st]=false
    set s__EachBuffData_rBuffDamage[st]=rDamage
    set s__EachBuffData_bIsBuffLayer[st]=true
    set s__EachBuffData_iBuffLayerMax[st]=10
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=0 //buff属性数量
//set st.iBuffState_Type[1] = 0
//set st.rBuffState_Data[1] = 0.

    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01E takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 20
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01E_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff4_A01N
//
// 心灵之火
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A01N_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[4] //心灵之火
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Optimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=s__EachBuffData_rBuffDuration[st] + 1
    set s__EachBuffData_bIsBuffClean[st]=true
    set s__EachBuffData_rBuffDamage[st]=0
    set s__EachBuffData_bIsBuffLayer[st]=false
    set s__EachBuffData_iBuffLayerMax[st]=0
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=3 //buff属性数量
set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+1]=iBuffState_ATK
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+1]=50
    set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+2]=iBuffState_Armor
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+2]=10
    set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+3]=iBuffState_ATKSpeed
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+3]=1
    
    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01N takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 0
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == true ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01N_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff4_A01V
//
// 心灵之火加强
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
function AbilityAction_A01V_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[4] //心灵之火
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Optimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=s__EachBuffData_rBuffDuration[st] + 1
    set s__EachBuffData_bIsBuffClean[st]=true
    set s__EachBuffData_rBuffDamage[st]=0
    set s__EachBuffData_bIsBuffLayer[st]=false
    set s__EachBuffData_iBuffLayerMax[st]=0
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=3 //buff属性数量
set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+1]=iBuffState_ATK
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+1]=100
    set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+2]=iBuffState_Armor
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+2]=20
    set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+3]=iBuffState_ATKSpeed
    set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+3]=2
    
    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01V takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 0
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == true ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01V_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff5_A01Q
//
// 眩晕
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function AbilityAction_A01Q_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[5] //眩晕
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=s__EachBuffData_rBuffDuration[st] + 1
    set s__EachBuffData_bIsBuffClean[st]=true
    set s__EachBuffData_rBuffDamage[st]=0
    set s__EachBuffData_bIsBuffLayer[st]=false
    set s__EachBuffData_iBuffLayerMax[st]=0
    set s__EachBuffData_iIsBuffDizziness[st]=1 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=0 //buff属性数量
//set st.iBuffState_Type[1] = 0
//set st.rBuffState_Data[1] = 0.

    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01Q takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 20
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01Q_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff6_A01R
//
// 变形
//===========================================================================
//TESH.scrollpos=4
//TESH.alwaysfold=0
function AbilityAction_A01R_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[6] //变形
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=s__EachBuffData_rBuffDuration[st] + 1
    set s__EachBuffData_bIsBuffClean[st]=true
    set s__EachBuffData_rBuffDamage[st]=0
    set s__EachBuffData_bIsBuffLayer[st]=false
    set s__EachBuffData_iBuffLayerMax[st]=0
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=1 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=0 //buff属性数量
//set st.iBuffState_Type[1] = 0
//set st.rBuffState_Data[1] = 0.

    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01R takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 20
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01R_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: Test_Buff7_A01S
//
// 定身
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function AbilityAction_A01S_AddBuff1 takes unit uBuffUnit,unit uAttackerUnit,real rDamage returns nothing
    local integer st= s__EachBuffData_create()
    set stG_BuffSystStruct_TranPara=st
    set s__EachBuffData_uBuffUnit[st]=uBuffUnit
    set s__EachBuffData_uAttackerUnit[st]=uAttackerUnit
    set s__EachBuffData_sBuffName[st]=sBuffTypeString[7] //定身
set s__EachBuffData_iBuffPolarity[st]=iBuffPolarity_Pesimistic //buff极性
if ( IsUnitType(uBuffUnit, UNIT_TYPE_HERO) == false ) then
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：普通
else
        set s__EachBuffData_rBuffDuration[st]=5 //持续时间：英雄
endif
    set s__EachBuffData_rBuffTriggerTime[st]=s__EachBuffData_rBuffDuration[st] + 1
    set s__EachBuffData_bIsBuffClean[st]=true
    set s__EachBuffData_rBuffDamage[st]=0
    set s__EachBuffData_bIsBuffLayer[st]=false
    set s__EachBuffData_iBuffLayerMax[st]=0
    set s__EachBuffData_iIsBuffDizziness[st]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[st]=0 //变形
set s__EachBuffData_iIsBuffScare[st]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[st]=0 //致盲
set s__EachBuffData_iIsImmovable[st]=1 //定身，不能移动
set s__EachBuffData_iBuffState_Num[st]=0 //buff属性数量
//set st.iBuffState_Type[1] = 0
//set st.rBuffState_Data[1] = 0.

    call TriggerExecute(gg_trg_BuffSystem_Add)
endfunction
function AbilityAction_A01S takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 20
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 2000, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            call AbilityAction_A01S_AddBuff1(uGroupUnit , uHero , rDamage)
            
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: fuwang_Q_A005
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function GroupAction_3 takes nothing returns nothing
    call IssuePointOrder(GetEnumUnit(), "attack", GetUnitX(GetEnumUnit()), GetUnitY(GetEnumUnit()))
endfunction
function GroupAction_2 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local group gGroup= LoadGroupHandle(htTimerHT, iTimerID, StringHash("gGroup"))
    if ( GetUnitState(GetEnumUnit(), UNIT_STATE_LIFE) > 0 ) then
        call IssueTargetOrder(GetEnumUnit(), "attack", uHero)
    else
        call GroupRemoveUnit(gGroup, GetEnumUnit())
    endif
    set uHero=null
    set gGroup=null
    set tTimer=null
endfunction
function TimerAction_AbilityAction_A005 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local group gGroup= LoadGroupHandle(htTimerHT, iTimerID, StringHash("gGroup"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 0.2)
    if ( rTimerCount <= rDuration ) and ( GetUnitState(uHero, UNIT_STATE_LIFE) > 0 ) then
        call ForGroup(gGroup, function GroupAction_2)
    else
        //End
        //call ForGroup(gGroup, function GroupAction_3)
        //call BJDebugMsg("End")
        call US_AddUnitArmor(uHero , - 40) //英雄护甲减40
call DestroyGroup(gGroup)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set uHero=null
    set tTimer=null
    set gGroup=null
endfunction
function GroupAction_AbilityAction_A005 takes nothing returns nothing
    local effect eEffect
    local real rDuration= LoadReal(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("rDuration"))
    set eEffect=AddSpecialEffectTarget("Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnBirthMissile.mdl", GetEnumUnit(), "overhead")
    call YDWETimerDestroyEffect(rDuration , eEffect)
    call IssueTargetOrder(GetEnumUnit(), "attack", GetTriggerUnit())
    set eEffect=null
endfunction
function Condition_AbilityAction_A005 takes nothing returns boolean
    local integer iHeroId= LoadInteger(htTimerHT, GetHandleId(GetExpiredTimer()), StringHash("iHeroId"))
    return ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false )
            //生命值>0，不是建筑，是敌人
endfunction
function AbilityAction_A005 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local group gGroup= CreateGroup()
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, 'A005')
    local real rDuration= 1.6 + 0.4 * I2R(iAbilityLevel)
local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerCount= 0.2
    call US_AddUnitArmor(uHero , 40) //英雄护甲加40
//call BJDebugMsg("持续时间" + R2S(rDuration))
call SaveReal(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("rDuration"), rDuration)
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 500, Condition(function Condition_AbilityAction_A005))
    call ForGroup(gGroup, function GroupAction_AbilityAction_A005)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveGroupHandle(htTimerHT, iTimerID, StringHash("gGroup"), gGroup)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 0.2, true, function TimerAction_AbilityAction_A005)
    
    set uHero=null
    set gGroup=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: fuwang_E_A008
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_Trig_fuwang_E_A008Actions takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    call SaveInteger(htUnitHT, GetHandleId(uHero), StringHash("FuWang_E_CoolTime_Flag"), 1)
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set uHero=null
    set tTimer=null
endfunction
function Trig_fuwang_E_A008Actions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local integer FuWang_E_CoolTime_Flag= LoadInteger(htUnitHT, GetHandleId(GetTriggerUnit()), StringHash("FuWang_E_CoolTime_Flag"))
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, 'A008')
    local real rCoolTime= 0.5
    local real rDamage= 50 + 50 * I2R(iAbilityLevel) + 0.5 * I2R(GetHeroStr(uHero, true))
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    
    call DisableTrigger(GetTriggeringTrigger()) //关闭当前触发

    if ( FuWang_E_CoolTime_Flag == 1 ) and ( iAbilityLevel > 0 ) and ( GetRandomInt(1, 100) <= 20 ) then
    //冷却好了，有反击螺旋技能，概率20%
        call SaveInteger(htUnitHT, GetHandleId(GetTriggerUnit()), StringHash("FuWang_E_CoolTime_Flag"), 0) //进入冷却
//Timer
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
        call TimerStart(tTimer, rCoolTime, false, function TimerAction_Trig_fuwang_E_A008Actions)
        //Damage
        call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 500, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            //生命值>0，不是建筑，是敌人
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", uGroupUnit, "origin"))
            endif
        endloop
        call SetUnitAnimation(uHero, "Attack Walk Stand Spin")
        call DestroyGroup(gGroup)
    endif
    
    call EnableTrigger(GetTriggeringTrigger()) //打开当前触发

    set uHero=null
    set pPlayer=null
    set tTimer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
function InitTrig_fuwang_E_A008 takes nothing returns nothing
    set gg_trg_fuwang_E_A008=CreateTrigger()
    call TriggerAddAction(gg_trg_fuwang_E_A008, function Trig_fuwang_E_A008Actions)
endfunction
//===========================================================================
// Trigger: fuwang_E_A008_Learn
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//为触发添加事件：英雄被攻击
function Trig_fuwang_E_A008_LearnActions takes nothing returns nothing
    call TriggerRegisterUnitEvent(gg_trg_fuwang_E_A008, GetTriggerUnit(), EVENT_UNIT_ATTACKED)
    call SaveInteger(htUnitHT, GetHandleId(GetTriggerUnit()), StringHash("FuWang_E_CoolTime_Flag"), 1)
endfunction
//学习技能打开触发，学习的技能等级为1作为条件，相当于一个标志，添加触发动作只做1次
function Trig_fuwang_E_A008_LearnConditions takes nothing returns boolean
    return ( ( GetLearnedSkill() == 'A008' ) and ( GetUnitAbilityLevel(GetTriggerUnit(), GetLearnedSkill()) == 1 ) )
endfunction
function InitTrig_fuwang_E_A008_Learn takes nothing returns nothing
    set gg_trg_fuwang_E_A008_Learn=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_fuwang_E_A008_Learn, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_fuwang_E_A008_Learn, Condition(function Trig_fuwang_E_A008_LearnConditions))
    call TriggerAddAction(gg_trg_fuwang_E_A008_Learn, function Trig_fuwang_E_A008_LearnActions)
endfunction//===========================================================================
// Trigger: fuwang_R_A007
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A007 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //local integer iTimerCount = LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    //Charge
    local integer stCharge
    local real rDegree= 0
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 1000
    local real rTotalTime_Charge= 1
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    local real x
    local real y
    //Loop
    local integer i= 0
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 1)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount") , iTimerCount + 1)
    //Effect
    if ( rTimerCount <= rDuration ) then
        //Damage
        call RangeDamage(rTargetx , rTargety , rTotalDistance , uHero , rDamage)
        //Effect
        loop
            exitwhen i > 8
            //Charge
            set x=rTargetx + 200 * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + 200 * Sin(rDegree * bj_DEGTORAD)
            set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uChargeUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree)
            call DzSetUnitModel(uChargeUnit, "Abilities\\Spells\\Orc\\Shockwave\\ShockwaveMissile.mdl")
            call SetUnitScale(uChargeUnit, 2, 2, 2) //体积
set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
            set rDegree=rDegree + 45
            set i=i + 1
        endloop
    else
        //End
        call RemoveUnit(uMJUnit)
        call IssueImmediateOrder(uHero, "stop")
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    
    
    set tTimer=null
    set uHero=null
    set uMJUnit=null
    set pPlayer=null
    set uChargeUnit=null
endfunction
function AbilityAction_A007 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetSpellAbilityId())
    local real rDamage= ( 500 * I2R(iAbilityLevel) + 5 * I2R(GetHeroStr(uHero, true)) ) / 3
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerCount= 1
    local real rDuration= 3

    //Action
    set uMJUnit=CreateUnit(pPlayer, 'e004', rTargetx, rTargety, 270)
    call SetUnitVertexColor(uMJUnit, 255, 255, 255, 150) //颜色透明度
call SetUnitAnimation(uMJUnit, "Attack Walk Stand Spin")
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount") , iTimerCount)
    call TimerStart(tTimer, 1, true, function TimerAction_AbilityAction_A007)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: siling_Q_A00B
//
// 死亡脉冲
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A00B takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 100 * rLevel + 0.5 * I2R(GetHeroInt(uHero, true))
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 500, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\AnimateDead\\AnimateDeadTarget.mdl", uGroupUnit, "origin"))
            if ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
            //敌人造成伤害
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            elseif ( IsUnitAlly(uGroupUnit, pPlayer) == true ) then
            //友军回血
                call SetUnitState(uGroupUnit, UNIT_STATE_LIFE, GetUnitState(uGroupUnit, UNIT_STATE_LIFE) + rDamage)
            endif
        endif
    endloop
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: siling_W_A009
//===========================================================================
//TESH.scrollpos=49
//TESH.alwaysfold=0
function GetRandomUnitId_A009 takes nothing returns integer
    local integer iIndex= GetRandomInt(0, 3)
    local integer array iUnitId
    set iUnitId[0]='n00H'
    set iUnitId[1]='n00J'
    set iUnitId[2]='n00G'
    set iUnitId[3]='n00K'
    return iUnitId[iIndex]
endfunction
function AbilityAction_A009 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uMJUnit
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetSpellAbilityId())
    local integer iSummonUnitCount
local real rDuration= 30
local integer iUnitId= GetRandomUnitId_A009()
local real x
    local real y
    local real rDegree
    local integer i
    //State
    local real rLevel= I2R(iAbilityLevel)
    local real rLife= Pow(rLevel, 1.5) * 180 + 50 + 5 * I2R(GetHeroStr(uHero, true))
    local real rMana= rLife
    local real rATK= Pow(rLevel, 2) * 5 + 10 + 0.3 * I2R(GetHeroInt(uHero, true))
    local real rArmor= 2 * I2R(iAbilityLevel) + 0.1 * I2R(GetHeroAgi(uHero, true))
    //E亡灵之力
    local real rLevel_A00A= I2R(GetUnitAbilityLevel(uHero, 'A00A'))
    
    //SummonUnitCount
    if ( iAbilityLevel == 1 ) then
        set iSummonUnitCount=GetRandomInt(2, 4)
    elseif ( iAbilityLevel == 2 ) then
        set iSummonUnitCount=GetRandomInt(3, 5)
    elseif ( iAbilityLevel == 3 ) then
        set iSummonUnitCount=GetRandomInt(4, 6)
    elseif ( iAbilityLevel == 4 ) then
        set iSummonUnitCount=GetRandomInt(5, 7)
    endif
    
    set i=0
    loop
        exitwhen i > iSummonUnitCount
        set rDegree=GetUnitFacing(uHero)
        set x=rHerox + 400 * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + 400 * Sin(rDegree * bj_DEGTORAD)
        set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, iUnitId, x, y, 0)
        call UnitApplyTimedLife(uMJUnit, 'B001', rDuration)
        //State
        call US_SetUnitMaxLife(uMJUnit , rLife)
        call US_SetUnitLife(uMJUnit , rLife)
        call US_SetUnitMaxMana(uMJUnit , rMana)
        call US_SetUnitMana(uMJUnit , rMana)
        call US_SetUnitATK(uMJUnit , rATK) //基础伤害
call US_SetUnitArmor(uMJUnit , rArmor) //护甲
//silingE,亡灵之力
call SummonUnitAddState(uMJUnit , rLevel_A00A)
        set i=i + 1
    endloop
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
endfunction//===========================================================================
// Trigger: siling_E
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: siling_R_A00C
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function Condition_Group_A00C takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == true ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == false )
        //死亡单位，不是英雄
endfunction
function AbilityAction_A00C takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 15 + 5 * rLevel
    local real rLevel_A00A= I2R(GetUnitAbilityLevel(uHero, 'A00A'))
//local group gGroup = CreateGroup()
//local unit uGroupUnit
//local integer iGroupCount
local integer iSummonUnitCount= 6
local integer iUnitType
    local integer i= 1
    local real x
    local real y
    local real rDistance
    local real rDegree
    loop
        exitwhen i > iSummonUnitCount
        if ( GetWaveCount() >= 1 ) and ( GetWaveCount() <= 5 ) then
            set iUnitType=GetRandomInt(1, 5)
        elseif ( GetWaveCount() >= 6 ) and ( GetWaveCount() <= 10 ) then
            set iUnitType=GetRandomInt(6, 10)
        elseif ( GetWaveCount() >= 11 ) and ( GetWaveCount() <= 15 ) then
            set iUnitType=GetRandomInt(11, 15)
        elseif ( GetWaveCount() >= 16 ) then
            set iUnitType=GetRandomInt(16, 20)
        endif
        set rDistance=I2R(GetRandomInt(200, 500))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
        set uMJUnit=CreateUnit(pPlayer, GiBrushUnitType[iUnitType], x, y, 0)
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", x, y))
        call UnitApplyTimedLife(uMJUnit, 'B001', rDuration) //生命周期
call UnitAddAbility(uMJUnit, 'A00G') //死灵法师召唤物识别技能
call SetUnitVertexColor(uMJUnit, 255, 0, 150, 255) //紫色
//call GroupRemoveUnit(GetGroup_DeleteDeathUnit(), uGroupUnit)   //移除死亡单位组，避免被
//State
call SetState_enemy(uMJUnit) //当前波数进攻怪属性
        call IssuePointOrder(uMJUnit, "attack", GetUnitX(uMJUnit), GetUnitY(uMJUnit))
        call SummonUnitAddState(uMJUnit , rLevel_A00A) //silingE,亡灵之力
set i=i + 1
    endloop
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    //set gGroup = null
    //set uGroupUnit = null
endfunction
//===========================================================================
// Trigger: siling_R_explode
//===========================================================================
//TESH.scrollpos=8
//TESH.alwaysfold=0
function siling_R_explode takes nothing returns nothing
    local unit uDeathUnit= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uDeathUnit)
    local unit uHero= LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uHero"))
    local unit uMJUnit
    local real x= GetUnitX(uDeathUnit)
    local real y= GetUnitY(uDeathUnit)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, 'A00C'))
    local real rDamage= 100 * rLevel + 2 * I2R(GetHeroInt(uHero, true))
    //local group gGroup = CreateGroup()
    //local unit uGroupUnit
    //call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
    //Effect
    set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
    call DzSetUnitModel(uMJUnit, "cenarionfury.mdx")
    call SetUnitScale(uMJUnit, 1.5, 1.5, 1.5) //体积
call SetUnitFlyHeight(uMJUnit, 100, 0.)
    call SetUnitAnimation(uMJUnit, "birth")
    //Damage
    call RangeDamage(x , y , 500 , uHero , rDamage)
    
    set uMJUnit=null
    set uDeathUnit=null
    set pPlayer=null
    set uHero=null
    //set gGroup = null
    //set uGroupUnit = null
endfunction
//===========================================================================
// Trigger: xiaoxiao_Q_A00H
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A00H takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    if ( iTimerCount <= 4 ) then
        call RangeDamage(rTargetx , rTargety , 500 , uHero , rDamage)
    else
        
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    
    set tTimer=null
    set uHero=null
endfunction
function AbilityAction_A00H takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit= CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0)
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= ( 100 * rLevel + 0.5 * I2R(GetHeroStr(uHero, true)) ) / 4
    
    call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A00F') //技能
call IssuePointOrder(uMJUnit, "clusterrockets", rTargetx, rTargety)
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.00) //生命周期
//Timer
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer, 0.25, true, function TimerAction_AbilityAction_A00H)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: xiaoxiao_W_A00I
//
// |cffffcc00没有可投掷的单位|r
//===========================================================================
//TESH.scrollpos=107
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A00I takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uSpellTargetUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"))
    local unit uGroupUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uGroupUnit"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rExtraDamage= LoadReal(htTimerHT, iTimerID, StringHash("rExtraDamage"))
    local real rTargetx=GetUnitX(uSpellTargetUnit)
    local real rTargety=GetUnitY(uSpellTargetUnit)
    //Action
    call PauseUnit(uGroupUnit, false) //取消暂停
call SetUnitPathing(uGroupUnit, true) //打开碰撞
call UnitRemoveAbility(uGroupUnit, 'Arav') //删除风暴之鸦
    //Effect
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", rTargetx, rTargety))
    //Damage
    //额外伤害
    call UnitDamageTarget(uHero, uGroupUnit, rExtraDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
    //范围伤害
    call RangeDamage(rTargetx , rTargety , 500 , uHero , rDamage)
    //End
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set tTimer=null
    set uHero=null
    set uSpellTargetUnit=null
    set uGroupUnit=null
endfunction
function Condition_Group_A00I takes nothing returns boolean
    return ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetFilterUnit() != GetTriggerUnit() )
            //生命值>0，不是建筑，不是自己
endfunction
function AbilityAction_A00I takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uSpellTargetUnit= GetSpellTargetUnit()
    local real rTargetx= GetUnitX(uSpellTargetUnit)
    local real rTargety= GetUnitY(uSpellTargetUnit)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rManaCost= 105 + 20 * rLevel
    local real rDamage= 100 * rLevel + 2 * I2R(GetHeroStr(uHero, true))
    local real rExtraDamage= rDamage * ( 0.2 + 0.2 * rLevel )
    //ChargeData
    local integer stCharge
    local real rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance
    local real rTotalTime_Charge= 1
    local real rEveryDistance
    
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer iFlyMode= 3
    local real rCurrentHeight= 0.
    local real rExtremeHeight= 1000.
    local real rEveryHeight= 0
//Timer
local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    
    //Group
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local integer iGroupCount
    call BJDebugMsg("rLevel:" + R2S(rLevel))
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 275, Condition(function Condition_Group_A00I))
    set iGroupCount=CountUnitsInGroup(gGroup)
    if ( iGroupCount > 0 ) then
        set uGroupUnit=GroupPickRandomUnit(gGroup)
        //Action
        call IssueTargetOrder(uHero, "attack", uGroupUnit)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl", uGroupUnit, "origin"))
        call PauseUnit(uGroupUnit, true) //暂停
call SetUnitPathing(uGroupUnit, false) //取消碰撞
call UnitAddAbility(uGroupUnit, 'Arav') //风暴之鸦，有这个才能设置高度
        //Charge
        set uChargeUnit=uGroupUnit
        set rDegree=GetDegree(GetUnitX(uChargeUnit) , GetUnitY(uChargeUnit) , rTargetx , rTargety)
        set rTotalDistance=GetDistance(GetUnitX(uChargeUnit) , GetUnitY(uChargeUnit) , rTargetx , rTargety)
        set rEveryDistance=rTotalDistance / rTotalTime_Charge * 0.03
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //call stCharge.SetChargeData_Trace(stCharge, bIsTrace, uTargetUnit_Charge)
        //Height
        set uSetHeightUnit=uGroupUnit
        set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
        call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
        //Timer
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"), uSpellTargetUnit)
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uGroupUnit"), uGroupUnit)
        call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
        call SaveReal(htTimerHT, iTimerID, StringHash("rExtraDamage"), rExtraDamage)
        call TimerStart(tTimer, rTotalTime_Charge + 0.1, false, function TimerAction_AbilityAction_A00I)
        
    else
        //没有投掷目标，则恢复魔法值、恢复冷却
        call DisplayTextToPlayer(pPlayer, 0, 0, "|cffffcc00没有可投掷的单位|r")
        call US_AddUnitMana(uHero , rManaCost) //恢复魔法值
call YDWESetUnitAbilityState(uHero , 'A00I' , 1 , 0.00) //重置冷却时间
endif
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set uSpellTargetUnit=null
    set uChargeUnit=null
    //set uTargetUnit_Charge = null
    set uSetHeightUnit=null
    set tTimer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: xiaoxiao_E_A00J
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_xiaoxiao_EActions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local unit uAttacker= GetAttacker()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetUnitX(uAttacker)
    local real rTargety= GetUnitY(uAttacker)
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, 'A00J')
    local integer iProbability= 5 + 5 * iAbilityLevel
local real rDistance= GetDistance(rHerox , rHeroy , rTargetx , rTargety)
    local real rLevel= I2R(iAbilityLevel)
    local real rDamage= 30 * rLevel + 0.5 * I2R(GetHeroStr(uHero, true))
    local unit uMJUnit
    if ( GetRandomInt(1, 100) <= iProbability ) and ( rDistance <= 300 ) then
        //眩晕效果
        set uMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0)
        call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A00L') //技能
call IssueTargetOrder(uMJUnit, "thunderbolt", uAttacker)
        call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.00) //生命周期
//Damage
call UnitDamageTarget(uHero, uAttacker, rDamage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
    endif
    set uHero=null
    set uAttacker=null
    set pPlayer=null
    set uMJUnit=null
endfunction
//===========================================================================
function InitTrig_xiaoxiao_E_A00J takes nothing returns nothing
    set gg_trg_xiaoxiao_E_A00J=CreateTrigger()
    call TriggerAddAction(gg_trg_xiaoxiao_E_A00J, function Trig_xiaoxiao_EActions)
endfunction
//===========================================================================
// Trigger: xiaoxiao_E_A00J_Learn
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_xiaoxiao_E_LearnConditions takes nothing returns boolean
    return ( ( GetLearnedSkill() == 'A00J' ) and ( GetUnitAbilityLevel(GetTriggerUnit(), GetLearnedSkill()) == 1 ) )
endfunction
function Trig_xiaoxiao_E_LearnActions takes nothing returns nothing
    //添加触发单位被攻击事件
    call TriggerRegisterUnitEvent(gg_trg_xiaoxiao_E_A00J, GetTriggerUnit(), EVENT_UNIT_ATTACKED)
endfunction
//===========================================================================
function InitTrig_xiaoxiao_E_A00J_Learn takes nothing returns nothing
    set gg_trg_xiaoxiao_E_A00J_Learn=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_xiaoxiao_E_A00J_Learn, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_xiaoxiao_E_A00J_Learn, Condition(function Trig_xiaoxiao_E_LearnConditions))
    call TriggerAddAction(gg_trg_xiaoxiao_E_A00J_Learn, function Trig_xiaoxiao_E_LearnActions)
endfunction
//===========================================================================
// Trigger: xiaoxiao_R_Learn
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_xiaoxiao_R_LearnActions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetLearnedSkill())
    if ( iAbilityLevel == 1 ) then
        call SetUnitScale(uHero, 0.75, 0.75, 0.75) //体积
call US_AddUnitATK(uHero , 60)
    elseif ( iAbilityLevel == 2 ) then
        call SetUnitScale(uHero, 1., 1., 1.) //体积
call US_AddUnitATK(uHero , 120)
    elseif ( iAbilityLevel == 3 ) then
        call SetUnitScale(uHero, 1.25, 1.25, 1.25) //体积
call US_AddUnitATK(uHero , 180)
    endif
    set uHero=null
endfunction
function Trig_xiaoxiao_R_LearnConditions takes nothing returns boolean
    return ( ( GetLearnedSkill() == 'A00K' ) )
endfunction
//===========================================================================
function InitTrig_xiaoxiao_R_Learn takes nothing returns nothing
    set gg_trg_xiaoxiao_R_Learn=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_xiaoxiao_R_Learn, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_xiaoxiao_R_Learn, Condition(function Trig_xiaoxiao_R_LearnConditions))
    call TriggerAddAction(gg_trg_xiaoxiao_R_Learn, function Trig_xiaoxiao_R_LearnActions)
endfunction
//===========================================================================
// Trigger: zhuzai_Q_A00W
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A00W takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 0.25)
    if ( rTimerCount <= 7 ) then
        //Damage
        call RangeDamage_Normal(rHerox , rHeroy , 500 , uHero , rDamage) //普通伤害
else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set uHero=null
    set tTimer=null
endfunction
function AbilityAction_A00W takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerCount= 0.1
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= ( 35 * rLevel + 0.5 * I2R(GetHeroAgi(uHero, true)) ) / 4
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 0.25, true, function TimerAction_AbilityAction_A00W)
    
    set uHero=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: zhuzai_R_A00M
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HeroAction_A00M takes unit uHero,unit uSpellTargetUnit,real rDamage returns nothing
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDistance= I2R(GetRandomInt(0, 50))
    local real rDegree= I2R(GetRandomInt(0, 359))
    local real x= GetUnitX(uSpellTargetUnit) + rDistance * Cos(Deg2Rad(rDegree))
    local real y= GetUnitY(uSpellTargetUnit) + rDistance * Sin(Deg2Rad(rDegree))
    local real rTargetx= GetUnitX(uSpellTargetUnit)
    local real rTargety= GetUnitY(uSpellTargetUnit)
    set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
call SetUnitX(uHero, x)
    call SetUnitY(uHero, y)
    call SetUnitFacing(uHero, rDegree + 180.)
    call SetUnitAnimation(uHero, "attack")
    //call SetUnitAnimationByIndex( uHero, GetRandomInt(2,3) )
    //Damage，英雄攻击普通伤害
    call RangeDamage_Normal(rTargetx , rTargety , 300 , uHero , rDamage)
    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl", uHero, "chest"))
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", rTargetx, rTargety))
    set pPlayer=null
endfunction
function Condition_TimerAction_A00M takes nothing returns boolean
    local integer iHeroId= LoadInteger(htTimerHT, GetHandleId(GetExpiredTimer()), StringHash("iHeroId"))
    return ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(I2U(iHeroId))) == false ) and ( GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') == 0 )
endfunction
function TimerAction_A00M takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uSpellTargetUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rAddATK= LoadReal(htTimerHT, iTimerID, StringHash("rAddATK"))
    local effect eHeroWeaponEffect= LoadEffectHandle(htTimerHT, iTimerID, StringHash("eHeroWeaponEffect"))
    local integer iSpellCount= LoadInteger(htTimerHT, iTimerID, StringHash("iSpellCount"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local group gGroup= CreateGroup()
    local integer iGroupCount
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    call GroupEnumUnitsInRange(gGroup, GetUnitX(uHero), GetUnitY(uHero), 800, Condition(function Condition_TimerAction_A00M))
    set iGroupCount=CountUnitsInGroup(gGroup)
    if ( iTimerCount <= ( iSpellCount - 1 ) ) and ( iGroupCount > 0 ) then
        set uSpellTargetUnit=GroupPickRandomUnit(gGroup)
        call HeroAction_A00M(uHero , uSpellTargetUnit , rDamage)
    else
        call US_AddUnitATK(uHero , - rAddATK) //减少攻击力
call PauseUnit(uHero, false)
        call IssueImmediateOrder(uHero, "stop")
        call SetUnitPathing(uHero, true) //无视碰撞
call SetUnitInvulnerable(uHero, false) //无敌
        call SetUnitTimeScale(uHero, 1.) //动画速度
call SetUnitVertexColor(uHero, 255, 255, 255, 255)
        call DestroyEffect(eHeroWeaponEffect) //删除附着在武器的特效
call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    call DestroyGroup(gGroup)
    set uHero=null
    set uSpellTargetUnit=null
    set eHeroWeaponEffect=null
    set tTimer=null
    set gGroup=null
endfunction
function AbilityAction_A00M takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local unit uSpellTargetUnit= GetSpellTargetUnit()
    local real rDamage
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetSpellAbilityId())
    local integer iSpellCount= 6 + 2 * iAbilityLevel
    local real rLevel= I2R(iAbilityLevel)
    local real rAddATK= 60 * rLevel
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local effect eHeroWeaponEffect= AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl", uHero, "weapon")
    //Action
    call US_AddUnitATK(uHero , rAddATK) //临时增加攻击力
set rDamage=US_GetUnitATK(uHero) + 1 * I2R(GetHeroAgi(uHero, true))
    call PauseUnit(uHero, true)
    call SetUnitPathing(uHero, false) //无视碰撞
call SetUnitInvulnerable(uHero, true) //无敌
    call SetUnitTimeScale(uHero, 3.) //动画速度
call SetUnitVertexColor(uHero, 255, 255, 255, 84) //255:正常，0：不显示
    call HeroAction_A00M(uHero , uSpellTargetUnit , rDamage)
    //Timer
    call SaveEffectHandle(htTimerHT, iTimerID, StringHash("eHeroWeaponEffect"), eHeroWeaponEffect)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rAddATK"), rAddATK)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"), uSpellTargetUnit)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iHeroId"), GetHandleId(uHero))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iSpellCount"), iSpellCount)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer, 0.5, true, function TimerAction_A00M)
    
    set uHero=null
    set uSpellTargetUnit=null
    set tTimer=null
    set eHeroWeaponEffect=null
endfunction//===========================================================================
// Trigger: yougui_Q_A010
//===========================================================================
//TESH.scrollpos=107
//TESH.alwaysfold=0
function TimerAction_A010 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local real rx
    local real ry
    //ChargeData
    local integer stCharge
    local real rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance
    local real rTotalTime_Charge= 1.0
    local real rEveryDistance
    
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 500.00, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Orc\\StasisTrap\\StasisTotemTarget.mdl", rTargetx, rTargety))
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", rTargetx, rTargety))
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            set rx=GetUnitX(uGroupUnit)
            set ry=GetUnitY(uGroupUnit)
            set rDegree=GetDegree(rTargetx , rTargety , rx , ry)
            set rTotalDistance=300.0
            set uChargeUnit=uGroupUnit
            set rEveryDistance=rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge //0.03
            set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
            //call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\StasisTrap\\StasisTotemTarget.mdl", uGroupUnit, "foot") )
        endif
    endloop
    call DestroyGroup(gGroup)
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set tTimer=null
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
    set uChargeUnit=null
endfunction
function AbilityAction_A010 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //local real rHerox = GetUnitX(uHero)
    //local real rHeroy = GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uEffectMJUnit
    local unit uMJUnit
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 100 * rLevel + rGetHeroAllState(uHero)
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local real rx
    local real ry
    local real rDistance
local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer i= 1
    
    //ChargeData
    local integer stCharge
    local real rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance
    local real rTotalTime_Charge= 2.0
    local real rEveryDistance
    //EffectMJUnit
    loop
        exitwhen i > 3
        set uEffectMJUnit=CreateUnit(pPlayer, 'e00E', rTargetx, rTargety, 0.)
        call UnitApplyTimedLife(uEffectMJUnit, 'BHwe', 4.00)
        set i=i + 1
    endloop
    
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 800.00, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(uGroupUnit, UNIT_TYPE_HERO) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            //生命值>0，是敌人，不是英雄，不是马甲
            set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0.)
            call ShowUnit(uMJUnit, false) //隐藏单位
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00)
            call UnitAddAbility(uMJUnit, 'A014')
            call IssueTargetOrder(uMJUnit, "fingerofdeath", uGroupUnit)
            
            set rx=GetUnitX(uGroupUnit)
            set ry=GetUnitY(uGroupUnit)
            set rDistance=GetDistance(rx , ry , rTargetx , rTargety)
            if ( rDistance >= 200.0 ) then
                set rDegree=GetDegree(rx , ry , rTargetx , rTargety)
                set rTotalDistance=rDistance - 200.0
            elseif ( rDistance < 200.0 ) then
                set rDegree=GetDegree(rTargetx , rTargety , rx , ry)
                set rTotalDistance=200.0 - rDistance
            endif
            if ( rTotalDistance < 100.0 ) then
                set rTotalDistance=100.0
            endif
            set uChargeUnit=uGroupUnit
            set rEveryDistance=rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge //0.03
            set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        endif
    endloop
    call DestroyGroup(gGroup)
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    
    call TimerStart(tTimer, 2.1, false, function TimerAction_A010)
    
    set uHero=null
    set pPlayer=null
    set uEffectMJUnit=null
    set uMJUnit=null
    set gGroup=null
    set uGroupUnit=null
    set tTimer=null
    set uChargeUnit=null
endfunction
//===========================================================================
// Trigger: youguiW
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function youguiWAction takes unit uHero returns nothing
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, 'A012'))
    local real rDamage= 50 * rLevel + 0.3 * rGetHeroAllState(uHero)
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 500, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitType(uGroupUnit, UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
        //生命值>0，是敌人，不是建筑，不是马甲单位
            //Damage
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            //Effect
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl", uGroupUnit, "origin"))
        endif
    endloop
    call DestroyGroup(gGroup)
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
//===========================================================================
// Trigger: youguiE
//===========================================================================
//TESH.scrollpos=4
//TESH.alwaysfold=0
//闪避几率：13+3*iAbilityLevel
function Trig_youguiEActions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetLearnedSkill())
    local real rDamageSystem_DodgeRate= LoadReal(htUnitHT, GetHandleId(uHero), StringHash("rDamageSystem_DodgeRate"))
if ( iAbilityLevel == 1 ) then
        call SaveReal(htUnitHT, GetHandleId(uHero), StringHash("rDamageSystem_DodgeRate"), rDamageSystem_DodgeRate + 13)
    elseif ( iAbilityLevel >= 2 ) and ( iAbilityLevel <= 4 ) then
        call SaveReal(htUnitHT, GetHandleId(uHero), StringHash("rDamageSystem_DodgeRate"), rDamageSystem_DodgeRate + 3)
    endif
    set uHero=null
endfunction
function Trig_youguiEConditions takes nothing returns boolean
    return ( ( GetLearnedSkill() == 'A013' ) )
endfunction
//===========================================================================
function InitTrig_youguiE takes nothing returns nothing
    set gg_trg_youguiE=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_youguiE, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_youguiE, Condition(function Trig_youguiEConditions))
    call TriggerAddAction(gg_trg_youguiE, function Trig_youguiEActions)
endfunction
//===========================================================================
// Trigger: yougui_R_A00O
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function youguiR_daoshan takes unit uUnit,unit uHero,real rDamage returns nothing
    local real rTargetx= GetUnitX(uUnit)
    local real rTargety= GetUnitY(uUnit)
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local integer i= 1
    local real rDistance
    local real rDegree
    local real x
    local real y
    local effect eEffect= AddSpecialEffect("Flamestrike Blood Big.mdl", rTargetx, rTargety)
    call EXSetEffectSize(eEffect, 2.00)
    call DestroyEffect(eEffect)
    //Action
    call SetUnitAnimation(uUnit, "spell") //动画
//Effect    随机坐标刀扇特效
loop
        exitwhen i > 10
        set rDistance=I2R(GetRandomInt(50, 500))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A00Z') //技能
call IssueImmediateOrder(uMJUnit, "fanofknives")
        call UnitApplyTimedLife(uMJUnit, 'BHwe', 1.00) //生命周期

        set i=i + 1
    endloop
    //Damage
    call RangeDamage_Normal(rTargetx , rTargety , 800 , uHero , rDamage) //普通伤害
set eEffect=null
    set pPlayer=null
    set uMJUnit=null
endfunction
function youguiR_dubiao takes integer iAbilityLevel,unit uUnit,unit uHero,real rDamage returns nothing
    local real rTargetx= GetUnitX(uUnit)
    local real rTargety= GetUnitY(uUnit)
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local effect eEffect= AddSpecialEffect("Flamestrike Green Big.mdl", rTargetx, rTargety)
    call EXSetEffectSize(eEffect, 2.00)
    call DestroyEffect(eEffect)
    //Action
    call SetUnitAnimation(uUnit, "spell") //动画
call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 800, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
            call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A00Y') //技能
call SetUnitAbilityLevel(uMJUnit, 'A00Y', iAbilityLevel)
            call IssueTargetOrder(uMJUnit, "shadowstrike", uGroupUnit)
            call UnitApplyTimedLife(uMJUnit, 'BHwe', 1.00) //生命周期
endif
    endloop
    call DestroyGroup(gGroup)
    //Damage
    call RangeDamage_Define(rTargetx , rTargety , 800 , uHero , rDamage , ATTACK_TYPE_HERO , DAMAGE_TYPE_POISON) //毒伤害
set eEffect=null
    set pPlayer=null
    set uMJUnit=null
    set gGroup=null
    set uGroupUnit=null
endfunction
function youguiR_xiaomo takes unit uUnit,unit uHero,real rDamage returns nothing
    local real rTargetx= GetUnitX(uUnit)
    local real rTargety= GetUnitY(uUnit)
    local player pPlayer= GetOwningPlayer(uHero)
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local effect eEffect= AddSpecialEffect("Flamestrike Purple Big.mdl", rTargetx, rTargety)
    call EXSetEffectSize(eEffect, 2.00)
    call DestroyEffect(eEffect)
    //Action
    call SetUnitAnimation(uUnit, "spell") //动画
call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 800, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            //Effect
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Feedback\\ArcaneTowerAttack.mdl", uGroupUnit, "origin"))
        endif
    endloop
    call DestroyGroup(gGroup)
    //Damage
    call RangeDamage(rTargetx , rTargety , 800 , uHero , rDamage) //魔法伤害
set eEffect=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
function TimerAction_AbilityAction_A00O takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uMJUnit_daoshan= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_daoshan"))
    local unit uMJUnit_dubiao= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_dubiao"))
    local unit uMJUnit_xiaomo= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_xiaomo"))
    local integer iAbilityLevel= LoadInteger(htTimerHT, iTimerID, StringHash("iAbilityLevel"))
    local integer iProcessCount= LoadInteger(htTimerHT, iTimerID, StringHash("iProcessCount"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rDamage_daoshan= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_daoshan"))
    local real rDamage_dubiao= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_dubiao"))
    local real rDamage_xiaomo= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_xiaomo"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iProcessCount"), iProcessCount + 1) //用于按顺序施放刀扇、毒镖、消魔的变量
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 1)
    if ( rTimerCount <= rDuration ) then
        if ( iProcessCount == 1 ) then
            call youguiR_daoshan(uMJUnit_daoshan , uHero , rDamage_daoshan)
        elseif ( iProcessCount == 2 ) then
            call youguiR_dubiao(iAbilityLevel , uMJUnit_dubiao , uHero , rDamage_dubiao)
        elseif ( iProcessCount == 3 ) then
            call SaveInteger(htTimerHT, iTimerID, StringHash("iProcessCount"), 1)
            call youguiR_xiaomo(uMJUnit_xiaomo , uHero , rDamage_xiaomo)
        endif
    else
        //End
        call KillUnit(uMJUnit_daoshan)
        call KillUnit(uMJUnit_dubiao)
        call KillUnit(uMJUnit_xiaomo)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    
    set tTimer=null
    set uHero=null
    set uMJUnit_daoshan=null
    set uMJUnit_dubiao=null
    set uMJUnit_xiaomo=null
endfunction
function AbilityAction_A00O takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit_daoshan
local unit uMJUnit_dubiao
local unit uMJUnit_xiaomo
local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, GetSpellAbilityId())
    local real rLevel= I2R(iAbilityLevel)
    local real rDuration= 4 + 2 * rLevel
local real rDamage_daoshan= 100 * rLevel + 1 * I2R(GetHeroStr(uHero, true))
    local real rDamage_dubiao= 75 * rLevel + 1 * I2R(GetHeroAgi(uHero, true))
    local real rDamage_xiaomo= 100 * rLevel + 1 * I2R(GetHeroInt(uHero, true))
    local integer iProcessCount= 1
local real x
    local real y
    local real rDegree
    local real rDistance
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerCount= 1
    
    //Action
    set rDegree=90
    set rDistance=400
    set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
    set uMJUnit_daoshan=CreateUnit(pPlayer, 'e007', x, y, 90)
    set rDegree=rDegree + 120
    set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
    set uMJUnit_dubiao=CreateUnit(pPlayer, 'e007', x, y, 90)
    set rDegree=rDegree + 120
    set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
    set uMJUnit_xiaomo=CreateUnit(pPlayer, 'e007', x, y, 90)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_daoshan"), uMJUnit_daoshan)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_dubiao"), uMJUnit_dubiao)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_xiaomo"), uMJUnit_xiaomo)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iAbilityLevel"), iAbilityLevel)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iProcessCount"), iProcessCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_daoshan"), rDamage_daoshan)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_dubiao"), rDamage_dubiao)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_xiaomo"), rDamage_xiaomo)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 1, true, function TimerAction_AbilityAction_A00O)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit_daoshan=null
    set uMJUnit_dubiao=null
    set uMJUnit_xiaomo=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: renma_Q_A018
//
// Abilities\Weapons\PhoenixMissile\Phoenix_Missile_mini.mdl
// Abilities\Weapons\ZigguratMissile\ZigguratMissile.mdl
//===========================================================================
//TESH.scrollpos=74
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A018 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local effect eEffect1= LoadEffectHandle(htTimerHT, iTimerID, StringHash("eEffect1"))
    local effect eEffect2= LoadEffectHandle(htTimerHT, iTimerID, StringHash("eEffect2"))
    local effect eEffect3
    //Damage
    call RangeDamage(rHerox , rHeroy , 600 , uHero , rDamage)
    //Effect
    set eEffect3=AddSpecialEffect("NewDirtEXNofire.mdl", rTargetx, rTargety)
    call EXSetEffectSize(eEffect3, 2.00)
    call DestroyEffect(eEffect3)
    set eEffect3=AddSpecialEffect("liedi.mdl", rTargetx, rTargety)
    call EXSetEffectSize(eEffect3, 2.00)
    call DestroyEffect(eEffect3)
    //End
    call PauseUnit(uHero, false)
    call IssueImmediateOrder(uHero, "stop")
    call UnitRemoveAbility(uHero, 'Arav') //风暴之鸦
    call DestroyEffect(eEffect1)
    call DestroyEffect(eEffect2)
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set tTimer=null
    set uHero=null
    set eEffect1=null
    set eEffect2=null
    set eEffect3=null
endfunction
function AbilityAction_A018 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 100 * rLevel + 1.5 * rGetHeroStr(uHero)
    local effect eEffect1
    local effect eEffect2
    //ChargeData
    local integer stCharge
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance= GetDistance(rHerox , rHeroy , rTargetx , rTargety)
    local real rTotalTime_Charge= 0.7
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer iFlyMode= 3
    local real rCurrentHeight= 0.
    local real rExtremeHeight= 400.
    local real rEveryHeight= 0
//Timer
local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    
    //Action
    call PauseUnit(uHero, true)
    call SetUnitAnimationByIndex(uHero, 3) //3号动作
call UnitAddAbility(uHero, 'Arav') //风暴之鸦
    //Effect
    set eEffect1=AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", uHero, "weapon")
    call EXSetEffectSize(eEffect1, 2.00)
    set eEffect2=AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratMissile\\ZigguratMissile.mdl", uHero, "weapon")
    call EXSetEffectSize(eEffect2, 2.00)
    //Charge
    set uChargeUnit=uHero
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Height
    set uSetHeightUnit=uHero
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveEffectHandle(htTimerHT, iTimerID, StringHash("eEffect1"), eEffect1)
    call SaveEffectHandle(htTimerHT, iTimerID, StringHash("eEffect2"), eEffect2)
    call TimerStart(tTimer, rTotalTime_Charge + 0.1, false, function TimerAction_AbilityAction_A018)
    
    set uHero=null
    set pPlayer=null
    set eEffect1=null
    set eEffect2=null
    set uChargeUnit=null
    set uSetHeightUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: renma_W_A017
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_renma_W_A017 takes unit uHero,real rRepLife returns nothing
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local texttag ttTextTag
    local string sttString= "+" + R2S(rRepLife)
    set ttTextTag=CreateTextTag_New(rHerox , rHeroy + 100 , 50. , sttString , 10.)
    call SetTextTagColor(ttTextTag, 0, 255, 0, 255) //设置颜色透明度，0最小，255最大
call SetTextTagVelocityBJ(ttTextTag, 64, 90) //速率，角度
//所有人显示
call SetTextTagVisibility(ttTextTag, true) //对所有人显示
//几秒后删除
call YDWETimerDestroyTextTag(1.5 , ttTextTag)
    
    //恢复生命
    call US_AddUnitLife(uHero , rRepLife)
    set ttTextTag=null
endfunction
function TimerAction_AbilityAction_A017 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rRepLife= LoadReal(htTimerHT, iTimerID, StringHash("rRepLife"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local effect eEffect= LoadEffectHandle(htTimerHT, iTimerID, StringHash("eEffect"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 1)
    if ( rTimerCount <= rDuration ) then
        call AbilityAction_renma_W_A017(uHero , rRepLife)
    else
        //End
        call DestroyEffect(eEffect)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
    set eEffect=null
endfunction
function AbilityAction_A017 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rRepLife= 15 * rLevel + 0.01 * ( 2 + 1 * rLevel ) * US_GetUnitMaxLife(uHero)
    local real rDuration= 10
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerCount= 1
    local effect eEffect= AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", uHero, "chest")
    call EXSetEffectSize(eEffect, 2.00)
    
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRepLife"), rRepLife)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveEffectHandle(htTimerHT, iTimerID, StringHash("eEffect"), eEffect)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 1, true, function TimerAction_AbilityAction_A017)
    
    set uHero=null
    set tTimer=null
    set eEffect=null
endfunction
//===========================================================================
// Trigger: renma_E_A016
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function renma_E_A016 takes unit uHero,unit uAttacker returns nothing
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, 'A016'))
    local real rDamage= 25 * rLevel + 0.005 * rLevel * US_GetUnitMaxLife(uHero)
    local effect eEffect= AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl", uAttacker, "origin")
    call EXSetEffectSize(eEffect, 5.00)
    call DestroyEffect(eEffect)
    call UnitDamageTarget(uHero, uAttacker, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
endfunction
//===========================================================================
// Trigger: renma_R_A015
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A015 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
local integer iAbilityLevel= GetLearnedSkillLevel()
    call iAddHeroStr(uHero , 30)
endfunction
function AbilityAction_A015_Kill takes unit uHero returns nothing
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, 'A015'))
    local real rAddLife= 0.5 + 0.5 * rLevel
    call US_AddUnitMaxLife(uHero , rAddLife)
endfunction//===========================================================================
// Trigger: AbilityTrigger
//
// 斧王Q
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_AbilityTriggerActions takes nothing returns nothing
    local integer id= GetSpellAbilityId()
    
    if ( id == 'A005' ) then
        call AbilityAction_A005()
//textmacro instance: IfAbilityID("A007")
    elseif ( id == 'A007' ) then
        call AbilityAction_A007()
//end of: IfAbilityID("A007")
//textmacro instance: IfAbilityID("A009")
    elseif ( id == 'A009' ) then
        call AbilityAction_A009()
//end of: IfAbilityID("A009")
//textmacro instance: IfAbilityID("A00B")
    elseif ( id == 'A00B' ) then
        call AbilityAction_A00B()
//end of: IfAbilityID("A00B")
//textmacro instance: IfAbilityID("A00C")
    elseif ( id == 'A00C' ) then
        call AbilityAction_A00C()
//end of: IfAbilityID("A00C")
//textmacro instance: IfAbilityID("A00H")
    elseif ( id == 'A00H' ) then
        call AbilityAction_A00H()
//end of: IfAbilityID("A00H")
//textmacro instance: IfAbilityID("A00I")
    elseif ( id == 'A00I' ) then
        call AbilityAction_A00I()
//end of: IfAbilityID("A00I")
//textmacro instance: IfAbilityID("A00W")
    elseif ( id == 'A00W' ) then
        call AbilityAction_A00W()
//end of: IfAbilityID("A00W")
//textmacro instance: IfAbilityID("A00M")
    elseif ( id == 'A00M' ) then
        call AbilityAction_A00M()
//end of: IfAbilityID("A00M")
//textmacro instance: IfAbilityID("A00O")
    elseif ( id == 'A00O' ) then
        call AbilityAction_A00O()
//end of: IfAbilityID("A00O")
//textmacro instance: IfAbilityID("A010")
    elseif ( id == 'A010' ) then
        call AbilityAction_A010()
//end of: IfAbilityID("A010")
//textmacro instance: IfAbilityID("A018")
    elseif ( id == 'A018' ) then
        call AbilityAction_A018()
//end of: IfAbilityID("A018")
//textmacro instance: IfAbilityID("A017")
    elseif ( id == 'A017' ) then
        call AbilityAction_A017()
//end of: IfAbilityID("A017")
//textmacro instance: IfAbilityID("A01C")
    elseif ( id == 'A01C' ) then
        call AbilityAction_A01C()
//end of: IfAbilityID("A01C")
//textmacro instance: IfAbilityID("A01D")
    elseif ( id == 'A01D' ) then
        call AbilityAction_A01D()
//end of: IfAbilityID("A01D")
//textmacro instance: IfAbilityID("A01E")
    elseif ( id == 'A01E' ) then
        call AbilityAction_A01E()
//end of: IfAbilityID("A01E")
//textmacro instance: IfAbilityID("A01N")
    elseif ( id == 'A01N' ) then
        call AbilityAction_A01N()
//end of: IfAbilityID("A01N")
//textmacro instance: IfAbilityID("A01Q")
    elseif ( id == 'A01Q' ) then
        call AbilityAction_A01Q()
//end of: IfAbilityID("A01Q")
//textmacro instance: IfAbilityID("A01R")
    elseif ( id == 'A01R' ) then
        call AbilityAction_A01R()
//end of: IfAbilityID("A01R")
//textmacro instance: IfAbilityID("A01S")
    elseif ( id == 'A01S' ) then
        call AbilityAction_A01S()
//end of: IfAbilityID("A01S")
//textmacro instance: IfAbilityID("A01V")
    elseif ( id == 'A01V' ) then
        call AbilityAction_A01V()
//end of: IfAbilityID("A01V")
    endif
    
    
endfunction
function Trig_AbilityTriggerConditions takes nothing returns boolean
    return ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( GetPlayerController(GetOwningPlayer(GetTriggerUnit())) == MAP_CONTROL_USER ) )
endfunction
function InitTrig_AbilityTrigger takes nothing returns nothing
    set gg_trg_AbilityTrigger=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AbilityTrigger, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_AbilityTrigger, Condition(function Trig_AbilityTriggerConditions))
    call TriggerAddAction(gg_trg_AbilityTrigger, function Trig_AbilityTriggerActions)
endfunction
//===========================================================================
// Trigger: LearnAbilityTrigger
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_LearnAbilityTriggerActions takes nothing returns nothing
    local integer id= GetLearnedSkill()
    
    if ( id == 'A015' ) then
        call AbilityAction_A015() //人马R
//  //! runtextmacro IfAbilityID("A007")
endif
endfunction
function Trig_LearnAbilityTriggerConditions takes nothing returns boolean
    return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true )
endfunction
//===========================================================================
function InitTrig_LearnAbilityTrigger takes nothing returns nothing
    set gg_trg_LearnAbilityTrigger=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LearnAbilityTrigger, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_LearnAbilityTrigger, Condition(function Trig_LearnAbilityTriggerConditions))
    call TriggerAddAction(gg_trg_LearnAbilityTrigger, function Trig_LearnAbilityTriggerActions)
endfunction
//===========================================================================
// Trigger: UnitDeath
//
// uUnit_Death
// uDeathUnit
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_UnitDeathActions takes nothing returns nothing
    local unit uDeathUnit= GetTriggerUnit()
    local unit uKiller= GetKillingUnit()
    local player pPlayer= GetOwningPlayer(uDeathUnit)
    local integer iAbilityLevel
    
    set iAbilityLevel=GetUnitAbilityLevel(uDeathUnit, 'A00G') //死灵法师召唤物识别技能
if ( GetPlayerController(pPlayer) == MAP_CONTROL_USER ) and ( iAbilityLevel > 0 ) then
    //死灵法师大招被动，单位死亡爆炸
        call siling_R_explode()
        call RemoveUnit(uDeathUnit)
    endif
    
    set iAbilityLevel=GetUnitAbilityLevel(uKiller, 'A015') //死灵法师召唤物识别技能
if ( IsUnitType(uKiller, UNIT_TYPE_HERO) == true ) and ( IsUnitAlly(uKiller, pPlayer) == false ) and ( iAbilityLevel > 0 ) then
    //击杀者是英雄（人马），击杀的是敌人，有升大招
    //人马大招R，杀敌加最大生命值
        call AbilityAction_A015_Kill(uKiller)
    endif
    
    
    if ( GetPlayerController(pPlayer) == MAP_CONTROL_COMPUTER ) then
    //死亡单位控制者是电脑
        //Delete
        //call YDWETimerRemoveUnit(3, uDeathUnit)
        call GroupAddUnit(GetGroup_DeleteDeathUnit(), uDeathUnit)
        if ( IsUnitType(uDeathUnit, UNIT_TYPE_HERO) == false ) then
            call SaveReal(htUnitHT, GetHandleId(uDeathUnit), StringHash("rDeleteTime_DeathUnit"), 5) //普通
else
            call SaveReal(htUnitHT, GetHandleId(uDeathUnit), StringHash("rDeleteTime_DeathUnit"), 10) //英雄
endif
        call SaveReal(htUnitHT, GetHandleId(uDeathUnit), StringHash("rMoveTime_DeathUnit"), 0)
        //Award
        call Trig_AwardActions() //奖励金币
endif
    
    if ( GetPlayerController(pPlayer) == MAP_CONTROL_USER ) and ( IsUnitType(uDeathUnit, UNIT_TYPE_HERO) == false ) then
    //玩家单位死亡，不是英雄
        //call YDWETimerRemoveUnit(3, uDeathUnit)
        call GroupAddUnit(GetGroup_DeleteDeathUnit(), uDeathUnit)
        call SaveReal(htUnitHT, GetHandleId(uDeathUnit), StringHash("rDeleteTime_DeathUnit"), 5)
        call SaveReal(htUnitHT, GetHandleId(uDeathUnit), StringHash("rMoveTime_DeathUnit"), 0)
    endif
    
    
    set uDeathUnit=null
    set uKiller=null
    set pPlayer=null
endfunction
function InitTrig_UnitDeath takes nothing returns nothing
    set gg_trg_UnitDeath=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_UnitDeath, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_UnitDeath, function Trig_UnitDeathActions)
endfunction
//===========================================================================
// Trigger: EffectFontInit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: DamageDisplay
//
// uUnit
// uAttacker
// //CreateTextTag_New(x, y, z, string, size)
// local texttag ttTextTag = CreateTextTag()
// set size = size * 0.023 / 10.
// call SetTextTagPos(ttTextTag, x, y, z)      //??,xyz??,z??z???
// call SetTextTagText(ttTextTag, s, size)     //??,????
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function DamageDisplay takes unit uUnit,unit uAttacker,real rDamage,real rShieldReduce,real rRestoreLife,integer iImmune,integer iDodge,integer iCrit,integer iLeech,integer iSpellCrit,integer iSpellLeech,integer iShield returns nothing
    local string sUnitName= GetUnitName(uUnit)
    local string sAttackerName= GetUnitName(uAttacker)
    local string sString= sUnitName + "受到伤害：|CFFFF0000" + R2S(rDamage) + "|R，伤害来源：|Cffffff00" + sAttackerName + "|R"
    local integer iDamage= R2I(rDamage)
    local integer iIsBuff= 0
    //漂浮文字
    local string sString_TextTag= ""
    local texttag ttTextTag
    local real size
    local real x
    local real y
    local real x_TX
    local real y_TX
    local real rDegree
    local real rDistance
    if ( iDamageSystemTest == 1 ) then
        call DisplayTextToPlayer(Player(0), 0, 0, sString) //显示
endif
    set x=GetUnitX(uUnit)
    set y=GetUnitY(uUnit)
    set rDistance=I2R(GetRandomInt(1, 100))
    set rDegree=I2R(GetRandomInt(0, 359))
    set x=x + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=y + rDistance * Sin(rDegree * bj_DEGTORAD)
    //免疫
    if ( iImmune == 1 ) then
        set sString_TextTag="免疫:" + I2S(iDamage)
    endif
    //闪避
    if ( iDodge == 1 ) then
        set sString_TextTag="闪避:" + I2S(iDamage)
    endif
    //暴击，TX
    if ( iCrit == 1 ) then
        set x_TX=GetUnitX(uAttacker)
        set y_TX=GetUnitY(uAttacker)
        call EffectFontDisplay(x_TX , y_TX , iDamage , iEffeFont_Crit)
    endif
    //吸血，TX
    if ( iLeech == 1 ) then
        call US_UnitLifeRecovery(uAttacker , rRestoreLife)
    endif
    //法术暴击，TX
    if ( iSpellCrit == 1 ) then
        set x_TX=GetUnitX(uAttacker)
        set y_TX=GetUnitY(uAttacker)
        call EffectFontDisplay(x_TX , y_TX , iDamage , iEffeFont_SpelCrit)
    endif
    //法术吸血，TX
    if ( iSpellLeech == 1 ) then
        call US_UnitLifeRecovery(uAttacker , rRestoreLife)
    endif
    //护盾
    if ( iShield == 1 ) then
        set sString_TextTag="护盾-" + I2S(R2I(rShieldReduce))
    endif
    //Buff伤害
    if ( YDWEIsEventAttackType(ATTACK_TYPE_NORMAL) == true ) then
        set iIsBuff=1
        if ( YDWEIsEventDamageType(DAMAGE_TYPE_FIRE) == true ) then //灼烧
            set sString_TextTag=sBuffTypeString[1] + I2S(iDamage)
        elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_COLD) == true ) then //冰冻
            set sString_TextTag=sBuffTypeString[2] + I2S(iDamage)
        elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_POISON) == true ) then //中毒
            set sString_TextTag=sBuffTypeString[3] + I2S(iDamage)
        endif
    endif
    
    if ( ( GetPlayerController(GetOwningPlayer(uUnit)) == MAP_CONTROL_COMPUTER ) ) or ( IsUnitType(uAttacker, UNIT_TYPE_HERO) == true ) then
    //显示电脑受到伤害，还有BOSS伤害
        set ttTextTag=CreateTextTag()
        set size=10 * ( 0.023 / 10. )
        if ( iImmune == 1 ) or ( iDodge == 1 ) or ( iShield == 1 ) then
            //免疫，闪避，护盾
            call SetTextTagVelocityBJ(ttTextTag, 64, 90) //速率，角度
call SetTextTagColor(ttTextTag, 255, 255, 255, 255)
        else
            //普通
            if ( iIsBuff != 1 ) then
                set sString_TextTag=I2S(iDamage)
            endif
            call SetTextTagVelocityBJ(ttTextTag, 64, I2R(GetRandomInt(60, 120))) //速率，角度
if ( YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) == true ) then //普通伤害，即物理伤害
                call SetTextTagColor(ttTextTag, 255, 50, 50, 255)
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_MAGIC) == true ) then //魔法伤害，即技能伤害
call SetTextTagColor(ttTextTag, 50, 50, 255, 255)
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_FIRE) == true ) then //火焰伤害
                call SetTextTagColor(ttTextTag, 255, 200, 0, 255)
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_COLD) == true ) then //冰冻伤害
                call SetTextTagColor(ttTextTag, 0, 255, 255, 255)
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_POISON) == true ) then //毒药伤害
                call SetTextTagColor(ttTextTag, 0, 255, 0, 255)
            endif
            
        endif
        
        call SetTextTagPos(ttTextTag, x, y, 20) //位置，xyz坐标，z表示z轴偏移
call SetTextTagText(ttTextTag, sString_TextTag, size) //内容，字体大小
call SetTextTagVisibility(ttTextTag, true) //对所有人显示
call YDWETimerDestroyTextTag(1.5 , ttTextTag) //1.5秒后删除

    endif
    
    
    
    set ttTextTag=null
    
endfunction
//===========================================================================
// Trigger: DamageSystem
//
// 攻击伤害、远程伤害：伤害目标指令
// 物理伤害：魔兽伤害体系里面的物理伤害（对虚无无效）
// 一、免疫伤害
// 二、物理伤害（先判断普通伤害，在判断攻击伤害）
//     1.闪避和命中
//                 特殊：无视闪避
//     2.暴击爆伤
//     3.护盾
//     4.护甲穿甲计算
//     5.吸血
// 三、法术伤害
//     1.法爆法伤
//     2.护盾
//     3.法抗法穿
//     4.法术吸血
// 四、伤害增幅
// 五、伤害减免
// 六、伤害显示
//===========================================================================
//TESH.scrollpos=114
//TESH.alwaysfold=0
function youguiEAction takes unit uHero,real rDamage returns nothing
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local texttag ttTextTag
    local string sttString= "闪避：" + R2S(rDamage)
    set ttTextTag=CreateTextTag_New(rHerox , rHeroy , 300. , sttString , 10.)
    call SetTextTagColor(ttTextTag, 255, 0, 255, 255) //设置颜色透明度，0最小，255最大
call SetTextTagVelocityBJ(ttTextTag, 100, 80) //速率，角度
//所有人显示
call SetTextTagVisibility(ttTextTag, true) //对所有人显示
//几秒后删除
call YDWETimerDestroyTextTag(1.5 , ttTextTag)
    set ttTextTag=null
endfunction
function Trig_DamageSystemActions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uUnit)
    local unit uAttacker= GetEventDamageSource()
    local player pAttackerPlayer= GetOwningPlayer(uAttacker)
    local integer iAbilityLevel
    local integer array iLevel
    local real r1
    local real rValue
    local real rRestoreLife= 0
    local real rShieldReduce= 0
local real rDamage= GetEventDamage()
    local real rDamageSystem_BlindDodge= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_BlindDodge"))
local real rDamageSystem_Accuracy= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_Accuracy"))
local real rDamageSystem_DodgeRate= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_DodgeRate"))
local real rDamageSystem_CriticalChance= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_CriticalChance"))
local real rDamageSystem_CriticalDamage= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_CriticalDamage"))
//local real rDamageSystem_Armor = LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Armor"))                          //被攻击单位护甲
local real rDamageSystem_Armor= US_GetUnitArmor(uUnit)
    local real rDamageSystem_ArmorPenetration= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_ArmorPenetration"))
    local real rDamageSystem_Leech= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_Leech"))
local real rDamageSystem_SpellCriticalChance= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellCriticalChance"))
local real rDamageSystem_SpellCriticalDamage= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellCriticalDamage"))
local real rDamageSystem_SpellResistance= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellResistance"))
local real rDamageSystem_SpellResistancePenetration= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellResistancePenetration"))
    local real rDamageSystem_SpellLeech= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellLeech"))
local real rDamageSystem_Increase= LoadReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_Increase"))
local real rDamageSystem_Reduction= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Reduction"))
local real rDamageSystem_ShieldValue= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"))
local integer iAllyDamage= 0
    local integer iImmune= 0
local integer iDodge= 0
local integer iCrit= 0
local integer iLeech= 0
local integer iSpellCrit= 0
local integer iSpellLeech= 0
local integer iShield= 0

    if ( iDamageSystemTest == 1 ) then
    call BJDebugMsg("原始伤害：" + R2S(rDamage))
    endif
    
    if ( IsPlayerAlly(pPlayer, pAttackerPlayer) == true ) then
        set iAllyDamage=1
        set rDamage=0
        call YDWESetEventDamage(0.)
        call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("免疫伤害")
        endif
        set uUnit=null
        set uAttacker=null
        set pPlayer=null
        set pAttackerPlayer=null
        return
    endif
    
    set iLevel[0]=GetUnitAbilityLevel(uUnit, 'Aloc') //有蝗虫技能的马甲
set iLevel[1]=GetUnitAbilityLevel(uUnit, 'A00X') //复仇天神大招巨大分身
if ( iLevel[0] > 0 ) or ( iLevel[1] > 0 ) or ( IsPlayerAlly(pPlayer, pAttackerPlayer) == true ) then
    //蝗虫、友军伤害，免疫
        set iImmune=1
        set rDamage=0
        call YDWESetEventDamage(0.)
        call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("免疫伤害")
        endif
        set uUnit=null
        set uAttacker=null
        set pPlayer=null
        set pAttackerPlayer=null
        return
    endif
    
    
    if ( rDamage > 0 ) and ( YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) == true ) then
    //普通伤害
        
        if ( rDamageSystem_BlindDodge == 0 ) and ( rDamageSystem_DodgeRate > 0 ) and ( GetRandomReal(0, 100) <= rDamageSystem_DodgeRate ) then
        //无视闪避次数=0，回避率>0，触发回避
            if ( rDamageSystem_Accuracy > 0 ) and ( GetRandomReal(0, 100) > rDamageSystem_DodgeRate ) then //回避之后再判断命中率，没触发命中才能闪避
set iDodge=1
                set rDamage=0
                call YDWESetEventDamage(0.)
                call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
                if ( iDamageSystemTest == 1 ) then
                    call BJDebugMsg("闪避")
                endif
                set uUnit=null
                set uAttacker=null
                set pPlayer=null
                set pAttackerPlayer=null
                return
            endif
        endif
        
        set rDamageSystem_CriticalDamage=rDamageSystem_CriticalDamage * 0.01 //爆伤
if ( rDamageSystem_CriticalChance > 0 ) and ( GetRandomReal(0, 100) <= rDamageSystem_CriticalChance ) then //暴击
set iCrit=1
            set rDamage=rDamage * rDamageSystem_CriticalDamage
            call YDWESetEventDamage(rDamage)
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("暴击率：" + R2S(rDamageSystem_CriticalChance))
                call BJDebugMsg("暴击伤害：" + R2S(rDamageSystem_CriticalDamage))
                call BJDebugMsg("产生暴击Damage：" + R2S(rDamage))
            endif
        endif
        
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("护盾值：" + R2S(rDamageSystem_ShieldValue))
        endif
        if ( rDamageSystem_ShieldValue > 0 ) then //护盾
set iShield=1
            if ( rDamageSystem_ShieldValue >= rDamage ) then //护盾>=伤害
set rDamageSystem_ShieldValue=rDamageSystem_ShieldValue - rDamage
                set rShieldReduce=rDamage //护盾降低值
set rDamage=0
                call YDWESetEventDamage(0.)
                call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"), rDamageSystem_ShieldValue)
                if ( iDamageSystemTest == 1 ) then
                    call BJDebugMsg("护盾值 >= 伤害值，护盾还剩：" + R2S(rDamageSystem_ShieldValue))
                endif
                call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
                set uUnit=null
                set uAttacker=null
                return
            else ////护盾<伤害
set rDamage=rDamage - rDamageSystem_ShieldValue
                set rShieldReduce=rDamageSystem_ShieldValue //护盾降低值
call YDWESetEventDamage(rDamage)
                call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"), 0)
                if ( iDamageSystemTest == 1 ) then
                    call BJDebugMsg("护盾值 < 伤害值，护盾破碎")
                endif
            endif
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("Damage：" + R2S(rDamage))
            endif
        endif
        
        set rValue=rDamageSystem_Armor - rDamageSystem_ArmorPenetration //穿甲：无视对应值的护甲
if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("护甲：" + R2S(rDamageSystem_Armor))
            call BJDebugMsg("穿甲：" + R2S(rDamageSystem_ArmorPenetration))
            call BJDebugMsg("剩余护甲：" + R2S(rValue))
        endif
        if ( rValue >= 0 ) then
            set rDamage=rDamage * ( rDamaSyst_ArmorFactor / ( rDamaSyst_ArmorFactor + rValue ) ) //正护甲减伤
if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("护甲减伤结果Damage：" + R2S(rDamage))
            endif
        else
            set rDamage=rDamage * ( 2 - Pow(0.94, - rValue) ) //负护甲加伤
if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("护甲增伤结果Damage：" + R2S(rDamage))
            endif
        endif
        
        
        set rDamageSystem_Leech=rDamageSystem_Leech * 0.01 //吸血
if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("物理吸血系数：" + R2S(rDamageSystem_Leech))
        endif
        if ( rDamageSystem_Leech > 0 ) then //吸血
set rRestoreLife=rDamage * rDamageSystem_Leech
            set iLeech=1
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("物理吸血：" + R2S(rRestoreLife))
            endif
        endif
        
    endif
    
    
    if ( rDamage > 0 ) and ( YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) == false ) then
    //非普通伤害就是法术伤害
        
        set rDamageSystem_SpellCriticalDamage=rDamageSystem_SpellCriticalDamage * 0.01 //爆伤
if ( rDamageSystem_SpellCriticalChance > 0 ) and ( GetRandomReal(0, 100) <= rDamageSystem_SpellCriticalChance ) then //暴击
set iSpellCrit=1
            set rDamage=rDamage * rDamageSystem_SpellCriticalDamage
            call YDWESetEventDamage(rDamage)
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("法术暴击率：" + R2S(rDamageSystem_SpellCriticalChance))
                call BJDebugMsg("法术暴击伤害：" + R2S(rDamageSystem_SpellCriticalDamage))
                call BJDebugMsg("产生暴击Damage：" + R2S(rDamage))
            endif
        endif
        
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("护盾值：" + R2S(rDamageSystem_ShieldValue))
        endif
        if ( rDamageSystem_ShieldValue > 0 ) then //护盾
set iShield=1
            if ( rDamageSystem_ShieldValue >= rDamage ) then //护盾>=伤害
set rDamageSystem_ShieldValue=rDamageSystem_ShieldValue - rDamage
                set rShieldReduce=rDamage //护盾降低值
set rDamage=0
                call YDWESetEventDamage(0.)
                call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"), rDamageSystem_ShieldValue)
                if ( iDamageSystemTest == 1 ) then
                    call BJDebugMsg("护盾值 >= 伤害值，护盾还剩：" + R2S(rDamageSystem_ShieldValue))
                endif
                call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
                set uUnit=null
                set uAttacker=null
                return
            else ////护盾<伤害
set rDamage=rDamage - rDamageSystem_ShieldValue
                set rShieldReduce=rDamageSystem_ShieldValue //护盾降低值
call YDWESetEventDamage(rDamage)
                call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"), 0)
                if ( iDamageSystemTest == 1 ) then
                    call BJDebugMsg("护盾值 < 伤害值，护盾破碎")
                endif
            endif
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("Damage：" + R2S(rDamage))
            endif
        endif
        
        
        set rValue=rDamageSystem_SpellResistance - rDamageSystem_SpellResistancePenetration
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("法抗：" + R2S(rDamageSystem_SpellResistance))
            call BJDebugMsg("法穿：" + R2S(rDamageSystem_SpellResistancePenetration))
            call BJDebugMsg("剩余法抗：" + R2S(rValue))
        endif
        if ( rValue >= 0 ) then
            set rDamage=rDamage * ( rDamaSyst_SpellResisFactor / ( rDamaSyst_SpellResisFactor + rValue ) )
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("法抗减伤结果Damage：" + R2S(rDamage))
            endif
        else
            set rDamage=rDamage * ( 2 - Pow(0.94, - rValue) )
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("法抗增伤结果Damage：" + R2S(rDamage))
            endif
        endif
        
        
        set rDamageSystem_SpellLeech=rDamageSystem_SpellLeech * 0.01 //法术吸血
if ( rDamageSystem_SpellLeech > 0 ) then //法术吸血
set rRestoreLife=rDamage * rDamageSystem_SpellLeech
            set iSpellLeech=1
            if ( iDamageSystemTest == 1 ) then
                call BJDebugMsg("法术吸血：" + R2S(rRestoreLife))
            endif
        endif
        
    endif
    
    if ( rDamage > 0 ) then
        
        set rDamageSystem_Increase=rDamageSystem_Increase * 0.01 //伤害增幅
if ( rDamageSystem_Increase > 0 ) then
            set rDamage=rDamage * ( 1 + rDamageSystem_Increase )
        endif
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("伤害增幅：" + R2S(rDamageSystem_Increase))
            call BJDebugMsg("Damage：" + R2S(rDamage))
        endif
        
        set rDamageSystem_Reduction=rDamageSystem_Reduction * 0.01 //伤害减免
if ( rDamageSystem_Reduction > 0 ) then
            set rDamage=rDamage * ( 1 - rDamageSystem_Reduction )
        endif
        if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("伤害减免：" + R2S(rDamageSystem_Reduction))
            call BJDebugMsg("Damage：" + R2S(rDamage))
        endif
        
        if ( IsUnitType(uUnit, UNIT_TYPE_HERO) == true ) or ( IsUnitType(uAttacker, UNIT_TYPE_HERO) == true ) or ( GetPlayerController(pPlayer) == MAP_CONTROL_USER ) or ( GetPlayerController(pAttackerPlayer) == MAP_CONTROL_USER ) then
            //伤害不能超过生命值
            set rValue=US_GetUnitLife(uUnit)
            if ( rValue >= rDamage ) then
                set rValue=rDamage
            else
                
            endif
            //总伤害
            set r1=LoadReal(htCommomHT, GetHandleId(pAttackerPlayer), StringHash("rUI_DamaDisp_TotalDamage"))
            call SaveReal(htCommomHT, GetHandleId(pAttackerPlayer), StringHash("rUI_DamaDisp_TotalDamage"), r1 + rValue) //总伤害
//承受伤害
set r1=LoadReal(htCommomHT, GetHandleId(pPlayer), StringHash("rUI_DamaDisp_TakeDamage"))
            call SaveReal(htCommomHT, GetHandleId(pPlayer), StringHash("rUI_DamaDisp_TakeDamage"), r1 + rValue) //总伤害

        endif
        
        
        if ( rDamage > 0 ) then
            if ( iDamageSystemTest == 1 ) then
            call BJDebugMsg("|cffffff00伤害显示|r")
            endif
            call DamageDisplay(uUnit , uAttacker , rDamage , rShieldReduce , rRestoreLife , iImmune , iDodge , iCrit , iLeech , iSpellCrit , iSpellLeech , iShield)
        endif
    endif
    
    set uUnit=null
    set uAttacker=null
    set pPlayer=null
    set pAttackerPlayer=null
endfunction
function Trig_DamageSystemConditions takes nothing returns boolean
    return ( GetEventDamage() > 1 ) //收到伤害>1
endfunction
function InitTrig_DamageSystem takes nothing returns nothing
    set gg_trg_DamageSystem=CreateTrigger()
    call MNAnyUnitDamaged(gg_trg_DamageSystem , 60)
    call TriggerAddCondition(gg_trg_DamageSystem, Condition(function Trig_DamageSystemConditions))
    call TriggerAddAction(gg_trg_DamageSystem, function Trig_DamageSystemActions)
endfunction
//===========================================================================
// Trigger: Ability_DamageTrigger
//
// 伤害触发的技能
//===========================================================================
//TESH.scrollpos=13
//TESH.alwaysfold=0
function Trig_Ability_DamageTriggerActions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local unit uAttacker= GetEventDamageSource()
    local real rDamage= GetEventDamage()
    local integer iAbilityLevel
    local integer array iLevel
    local real r1
    local real rValue
    
    call DisableTrigger(GetTriggeringTrigger()) //关闭当前触发

    if ( YDWEIsEventAttackDamage() == true ) and ( IsUnitType(uAttacker, UNIT_TYPE_HERO) == true ) or ( IsUnitType(uUnit, UNIT_TYPE_HERO) == true ) then
    //攻击伤害，主要是防止英雄攻击触发的技能造成普通伤害死循环，这里是英雄技能触发
        //复仇天神W荒芜
        set iAbilityLevel=GetUnitAbilityLevel(uAttacker, 'A012')
        if ( iAbilityLevel > 0 ) and ( GetRandomInt(1, 100) <= 10 + 3 * iAbilityLevel ) then
            call youguiWAction(uAttacker)
        endif
        //人马E反击
        set iAbilityLevel=GetUnitAbilityLevel(uUnit, 'A016')
        if ( iAbilityLevel > 0 ) and ( GetRandomInt(1, 100) <= 10 + 5 * iAbilityLevel ) then
            call renma_E_A016(uUnit , uAttacker)
        endif
    
    endif
    
    call EnableTrigger(GetTriggeringTrigger()) //打开当前触发

    set uUnit=null
    set uAttacker=null
endfunction
function Trig_Ability_DamageTriggerConditions takes nothing returns boolean
    return ( GetEventDamage() > 1 ) //收到伤害>1
endfunction
function InitTrig_Ability_DamageTrigger takes nothing returns nothing
    set gg_trg_Ability_DamageTrigger=CreateTrigger()
    call MNAnyUnitDamaged(gg_trg_Ability_DamageTrigger , 60)
    call TriggerAddCondition(gg_trg_Ability_DamageTrigger, Condition(function Trig_Ability_DamageTriggerConditions))
    call TriggerAddAction(gg_trg_Ability_DamageTrigger, function Trig_Ability_DamageTriggerActions)
endfunction//===========================================================================
// Trigger: Trig_UI_PlayTime_Init
//===========================================================================
//TESH.scrollpos=8
//TESH.alwaysfold=0
function UI_PlayTime_Init takes nothing returns nothing
    local integer fFrame
    //背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "frUI_PlayTime0", DzGetGameUI(), "template", 0) //创建Frame[Tag]
set frUI_PlayTime[0]=fFrame
    call DzFrameSetTexture(fFrame, "UI_BackGround3.blp", 0) //设置贴图
call DzFrameSetAbsolutePoint(fFrame, 0, 0.375, 0.595) //绝对位置
call DzFrameSetSize(fFrame, 0.055, 0.032) //I大小
call DzFrameSetAlpha(fFrame, 210) //透明度
//时间
set fFrame=DzCreateFrameByTagName("TEXT", "frUI_PlayTime1", DzGetGameUI(), "template", 0)
    set frUI_PlayTime[1]=fFrame
    call DzFrameSetPoint(fFrame, 3, frUI_PlayTime[0], 3, 0.005, 0) //相对位置
call DzFrameSetText(fFrame, "|cffffff000:00:00|r")
    call DzFrameSetSize(fFrame, 0.08, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.02, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

    call DzFrameSetPriority(frUI_PlayTime[0], 1) //游戏时间
call DzFrameSetPriority(frUI_PlayTime[1], 2) //游戏时间
endfunction
//===========================================================================
// Trigger: Trig_UI_PlayTime_Dynamic
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function TimerActionDispose_PlayTime takes integer iSecond returns nothing
    local string array sString
    local integer iH
    local integer iM
    local integer iS
    set iH=iSecond / 3600
    set iM=( ModuloInteger(iSecond, 3600) ) / 60
    set iS=ModuloInteger(iSecond, 60)
    set sString[1]=I2S(iH)
    if ( iM < 10 ) then
        set sString[2]="0" + I2S(iM)
    else
        set sString[2]=I2S(iM)
    endif
    if ( iS < 10 ) then
        set sString[3]="0" + I2S(iS)
    else
        set sString[3]=I2S(iS)
    endif
    set sString[0]="|cffffff00" + sString[1] + ":" + sString[2] + ":" + sString[3] + "|r"
    call DzFrameSetText(frUI_PlayTime[1], sString[0])
endfunction
function TimerAction_UI_PlayTime_Dynamic takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    call TimerActionDispose_PlayTime(iTimerCount)
    //End
    //call DestroyTimer(tTimer)
    //call FlushChildHashtable(htTimerHT, iTimerID)
    set tTimer=null
endfunction
function UI_PlayTime_Dynamic takes nothing returns nothing
    local integer iTimerCount= 1
    set tTimer_UI_PlayTime=CreateTimer()
    set iTimerID_UI_PlayTime=GetHandleId(tTimer_UI_PlayTime)
    call SaveInteger(htTimerHT, iTimerID_UI_PlayTime, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer_UI_PlayTime, 1, true, function TimerAction_UI_PlayTime_Dynamic)
endfunction
//===========================================================================
// Trigger: UI_LifeBar_Init
//===========================================================================
//TESH.scrollpos=64
//TESH.alwaysfold=0

function UI_LifeBar_Color takes nothing returns nothing
    set sTexture_BlackGound="UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"
    set sTexture_Border="UI\\Widgets\\EscMenu\\Human\\editbox-border.blp"
    set sTexture_Color[12]="ReplaceableTextures\\TeamColor\\TeamColor12.blp" //黑色
set sTexture_Color[0]="ReplaceableTextures\\TeamColor\\TeamColor00.blp" //红
set sTexture_Color[1]="ReplaceableTextures\\TeamColor\\TeamColor01.blp" //蓝
set sTexture_Color[2]="ReplaceableTextures\\TeamColor\\TeamColor02.blp" //青
set sTexture_Color[3]="ReplaceableTextures\\TeamColor\\TeamColor03.blp" //紫
set sTexture_Color[4]="ReplaceableTextures\\TeamColor\\TeamColor04.blp" //黄
set sTexture_Color[5]="ReplaceableTextures\\TeamColor\\TeamColor05.blp" //橙
set sTexture_Color[6]="ReplaceableTextures\\TeamColor\\TeamColor06.blp" //绿
set sTexture_Color[7]="ReplaceableTextures\\TeamColor\\TeamColor07.blp" //粉
set sTexture_Color[8]="ReplaceableTextures\\TeamColor\\TeamColor08.blp" //灰
set sTexture_Color[9]="ReplaceableTextures\\TeamColor\\TeamColor09.blp" //淡蓝
set sTexture_Color[10]="ReplaceableTextures\\TeamColor\\TeamColor10.blp" //深绿
set sTexture_Color[11]="ReplaceableTextures\\TeamColor\\TeamColor11.blp" //棕色
//颜色顺序
set sLifeBarColorIndex[5]="ReplaceableTextures\\TeamColor\\TeamColor12.blp" //黑色
set sLifeBarColorIndex[0]="ReplaceableTextures\\TeamColor\\TeamColor02.blp" //青
set sLifeBarColorIndex[1]="ReplaceableTextures\\TeamColor\\TeamColor06.blp" //绿
set sLifeBarColorIndex[2]="ReplaceableTextures\\TeamColor\\TeamColor04.blp" //黄
set sLifeBarColorIndex[3]="ReplaceableTextures\\TeamColor\\TeamColor05.blp" //橙
set sLifeBarColorIndex[4]="ReplaceableTextures\\TeamColor\\TeamColor00.blp" //红
endfunction
function UI_LifeBarInit takes nothing returns nothing
    local string sString_HeadPortrait
    call UI_LifeBar_Color() //贴图字符串初始化
//call DzLoadToc("UIfdfPath.toc")

    //血条背景
    set rWidth_UI_LifeBar[0]=0.41
    set rHeight_UI_LifeBar[0]=0.05
    set frUI_LifeBar_BackGround=DzCreateFrameByTagName("BACKDROP", "LifeBar_BlackGound", DzGetGameUI(), "template", 0)
    call DzFrameSetTexture(frUI_LifeBar_BackGround, sTexture_BlackGound, 0)
    call DzFrameSetPoint(frUI_LifeBar_BackGround, 1, DzGetGameUI(), 1, 0.02, - 0.07)
    call DzFrameSetSize(frUI_LifeBar_BackGround, rWidth_UI_LifeBar[0], rHeight_UI_LifeBar[0])
    call DzFrameShow(frUI_LifeBar_BackGround, false)
    //头像
    set frUI_LifeBar_HeadPortrait=DzCreateFrameByTagName("BACKDROP", "HeadPortrait", frUI_LifeBar_BackGround, "template", 0)
    set sString_HeadPortrait=( EXExecuteScript("(require'jass.slk').unit[" + I2S('hfoo') + "].Art") )
    call DzFrameSetTexture(frUI_LifeBar_HeadPortrait, sString_HeadPortrait, 0)
    call DzFrameSetPoint(frUI_LifeBar_HeadPortrait, 5, frUI_LifeBar_BackGround, 3, 0, 0)
    call DzFrameSetSize(frUI_LifeBar_HeadPortrait, 0.08, 0.08)
    //血条底层贴图
    set rWidth_UI_LifeBar[1]=rWidth_UI_LifeBar[0] - 0.01
    set rHeight_UI_LifeBar[1]=rHeight_UI_LifeBar[0] - 0.005
    set frUI_LifeBar_Texture_Bottom=DzCreateFrameByTagName("BACKDROP", "LifeBar_Texture_Bottom", frUI_LifeBar_BackGround, "template", 0)
    call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[1], 0)
    call DzFrameSetPoint(frUI_LifeBar_Texture_Bottom, 3, frUI_LifeBar_BackGround, 3, 0.005, 0.00)
    call DzFrameSetSize(frUI_LifeBar_Texture_Bottom, rWidth_UI_LifeBar[1], rHeight_UI_LifeBar[1])
    //血条顶层贴图
    set frUI_LifeBar_Texture_Up=DzCreateFrameByTagName("BACKDROP", "LifeBar_Texture_Up", frUI_LifeBar_BackGround, "template", 0)
    call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[0], 0)
    call DzFrameSetPoint(frUI_LifeBar_Texture_Up, 3, frUI_LifeBar_BackGround, 3, 0.005, 0.00)
    call DzFrameSetSize(frUI_LifeBar_Texture_Up, rWidth_UI_LifeBar[1], rHeight_UI_LifeBar[1])
    //血量文字
    set frUI_LifeBar_Text=DzCreateFrameByTagName("TEXT", "LifeBar_Text", frUI_LifeBar_BackGround, "template", 0)
    call DzFrameSetPoint(frUI_LifeBar_Text, 4, frUI_LifeBar_BackGround, 4, 0.00, 0.00)
    call DzFrameSetFont(frUI_LifeBar_Text, "uizt.ttf", 0.02, 0)
    call DzFrameSetSize(frUI_LifeBar_Text, 0.04, 0.00)
    
endfunction
function InitTrig_UI_LifeBar_Init takes nothing returns nothing
    
    set gg_trg_UI_LifeBar_Init=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_UI_LifeBar_Init, 0.10)
    call TriggerAddAction(gg_trg_UI_LifeBar_Init, function UI_LifeBarInit)
endfunction
//===========================================================================
// Trigger: UI_LifeBar_Dynamic
//===========================================================================
//TESH.scrollpos=33
//TESH.alwaysfold=0
function TimerAction_UI_LifeBar_Dynamic takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uUnit= gg_unit_hfoo_0052
    local real rLife= US_GetUnitLife(uUnit)
    local real rMaxLife= US_GetUnitMaxLife(uUnit)
    local real rLifeWidthPercent= 0
    local real rPercent= 0
    if ( rLife > 0 ) then
        if ( rLife > 0.8 * rMaxLife ) and ( rLife <= rMaxLife ) then
            call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[0], 0)
            call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[1], 0)
            set rLifeWidthPercent=( rLife - 0.8 * rMaxLife ) / ( 0.2 * rMaxLife )
        elseif ( rLife > 0.6 * rMaxLife ) and ( rLife <= 0.8 * rMaxLife ) then
            call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[1], 0)
            call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[2], 0)
            set rLifeWidthPercent=( rLife - 0.6 * rMaxLife ) / ( 0.2 * rMaxLife )
        elseif ( rLife > 0.4 * rMaxLife ) and ( rLife <= 0.6 * rMaxLife ) then
            call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[2], 0)
            call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[3], 0)
            set rLifeWidthPercent=( rLife - 0.4 * rMaxLife ) / ( 0.2 * rMaxLife )
        elseif ( rLife > 0.2 * rMaxLife ) and ( rLife <= 0.4 * rMaxLife ) then
            call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[3], 0)
            call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[4], 0)
            set rLifeWidthPercent=( rLife - 0.2 * rMaxLife ) / ( 0.2 * rMaxLife )
        elseif ( rLife > 0 ) and ( rLife <= 0.2 * rMaxLife ) then
            call DzFrameSetTexture(frUI_LifeBar_Texture_Up, sLifeBarColorIndex[4], 0)
            call DzFrameSetTexture(frUI_LifeBar_Texture_Bottom, sLifeBarColorIndex[5], 0)
            set rLifeWidthPercent=rLife / ( 0.2 * rMaxLife )
        endif
        //血条宽度
        call DzFrameSetSize(frUI_LifeBar_Texture_Up, rWidth_UI_LifeBar[1] * rLifeWidthPercent, rHeight_UI_LifeBar[1])
        //TEXT
        set rPercent=rLife / rMaxLife * 100
        call DzFrameSetText(frUI_LifeBar_Text, I2S(R2I(rPercent)) + "%")
        
    else
        //End
        call DzFrameShow(frUI_LifeBar_BackGround, false)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set uUnit=null
    set tTimer=null
endfunction
function UI_LifeBar_Dynamic_Init takes nothing returns nothing
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    call TimerStart(tTimer, 0.05, true, function TimerAction_UI_LifeBar_Dynamic)
    set tTimer=null
endfunction
//===========================================================================
// Trigger: UI_UnitStateInit
//
// frUI_UnitState_Text
// frUI_UnitState_Data
//===========================================================================
//TESH.scrollpos=72
//TESH.alwaysfold=0
function Trig_UnitState_HeightLight_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
    call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
endfunction
function Trig_UnitState_HeightLight_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
endfunction
function UI_UnitState_Enter takes nothing returns nothing
    local integer iUI_UnitState_State= LoadInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_UnitState_State"))
    if ( iUI_UnitState_State == 0 ) then
        set iUI_UnitState_State=1
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_UnitState_State"), iUI_UnitState_State)
        call DzFrameShow(frUI_UnitState[0], true)
    elseif ( iUI_UnitState_State == 1 ) then
        set iUI_UnitState_State=0
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_UnitState_State"), iUI_UnitState_State)
        call DzFrameShow(frUI_UnitState[0], false)
    endif
endfunction
function UI_UnitStateInitActions takes nothing returns nothing
    local integer fFrame
    local integer i
    local integer j
    local integer iNum
    local string sString
    //单位属性按钮贴图
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_UnitState1", DzGetGameUI(), "template", 0)
    set frUI_UnitState[1]=fFrame
    call DzFrameSetTexture(fFrame, "UI_UnitStateButton.blp", 0)
    call DzFrameSetPoint(fFrame, 6, DzFrameGetMinimap(), 0, 0, 0.01)
    call DzFrameSetSize(fFrame, 0.06, 0.024)
    //单位属性按钮
    set fFrame=DzCreateFrameByTagName("BUTTON", "UI_UnitState2", frUI_UnitState[1], "template", 0)
    set frUI_UnitState[2]=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_UnitState[1])
    if ( GetLocalPlayer() == GetLocalPlayer() ) then
    	call DzFrameSetScriptByCode(fFrame, 1, function UI_UnitState_Enter, false) //鼠标点击
call DzFrameSetScriptByCode(fFrame, 2, function Trig_UnitState_HeightLight_1, false) //鼠标进入
call DzFrameSetScriptByCode(fFrame, 3, function Trig_UnitState_HeightLight_2, false) //鼠标离开
endif
    
    //单位属性页面背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_UnitState0", DzGetGameUI(), "template", 0)
    set frUI_UnitState[0]=fFrame
    call DzFrameSetTexture(fFrame, "UI_UnitStateBlackGround.blp", 0)
    call DzFrameSetPoint(fFrame, 6, frUI_UnitState[1], 0, 0, 0)
    call DzFrameSetSize(fFrame, 0.18, 0.2 * 25 / 18)
    //call DzFrameSetAlpha(fFrame, 255)   //透明度
    call DzFrameShow(fFrame, false)
    
    //单位头像
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_UnitState3", frUI_UnitState[0], "template", 0)
    set frUI_UnitState[3]=fFrame
    call DzFrameSetTexture(fFrame, "ReplaceableTextures\\CommandButtons\\BTNSeal.blp", 0)
    call DzFrameSetPoint(fFrame, 0, frUI_UnitState[0], 0, 0.05, - 0.035)
    call DzFrameSetSize(fFrame, 0.022, 0.022)
    //单位名字
    set fFrame=DzCreateFrameByTagName("TEXT", "UI_UnitState4", frUI_UnitState[0], "template", 0)
    set frUI_UnitState[4]=fFrame
    call DzFrameSetPoint(fFrame, 3, frUI_UnitState[3], 5, 0.01, 0) //相对位置
call DzFrameSetText(fFrame, "|cffff9900?????|r")
    call DzFrameSetSize(fFrame, 0.1, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

    set iNum=1
    set i=1
    loop
        exitwhen i > 2
            set j=1
            loop
                exitwhen j > 11
                //frUI_UnitState_Text1-22：属性黄色名字
                set fFrame=DzCreateFrameByTagName("TEXT", "frUI_UnitState_Text" + I2S(iNum), frUI_UnitState[0], "template", 0)
                set frUI_UnitState_Text[iNum]=fFrame
                call DzFrameSetPoint(fFrame, 0, frUI_UnitState[0], 0, 0.025 + ( 0.07 ) * ( i - 1 ), - 0.05 - 0.018 * j) //相对位置
call DzFrameSetSize(fFrame, 0.01 * 4, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.01, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
//frUI_UnitState_Data1-22：属性数值
set fFrame=DzCreateFrameByTagName("TEXT", "frUI_UnitState_Data" + I2S(iNum), frUI_UnitState[0], "template", 0)
                set frUI_UnitState_Data[iNum]=fFrame
                call DzFrameSetPoint(fFrame, 0, frUI_UnitState[0], 0, 0.025 + 0.04 + ( 0.07 ) * ( i - 1 ), - 0.05 - 0.018 * j) //相对位置
call DzFrameSetText(fFrame, "0")
                call DzFrameSetSize(fFrame, 0.01 * 2, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.01, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
set iNum=iNum + 1
                set j=j + 1
            endloop
        set i=i + 1
    endloop
    
    
    
    
endfunction
//===========================================================================
// Trigger: UI_UnitState_String_Init
//
// frUI_UnitState_Text
// frUI_UnitState_Data
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function UI_UnitState_String_Init takes nothing returns nothing
    //1-22：属性黄色名字
    //左边属性黄色名字
    call DzFrameSetText(frUI_UnitState_Text[1], "移动速度：")
    call DzFrameSetText(frUI_UnitState_Text[2], "攻击速度：")
    call DzFrameSetText(frUI_UnitState_Text[3], "冷却缩短：")
    call DzFrameSetText(frUI_UnitState_Text[4], "|cffffff00闪避率：|r")
    call DzFrameSetText(frUI_UnitState_Text[5], "|cffffff00物理暴击：|r")
    call DzFrameSetText(frUI_UnitState_Text[6], "|cffffff00物理爆伤：|r")
    call DzFrameSetText(frUI_UnitState_Text[7], "护甲：")
    call DzFrameSetText(frUI_UnitState_Text[8], "护甲减伤：")
    call DzFrameSetText(frUI_UnitState_Text[9], "|cffffff00护甲穿透：|r")
    call DzFrameSetText(frUI_UnitState_Text[10], "|cffffff00物理吸血：|r")
    call DzFrameSetText(frUI_UnitState_Text[11], "|cffffff00伤害增幅：|r")
    
    //右边属性黄色名字
    call DzFrameSetText(frUI_UnitState_Text[12], "")
    call DzFrameSetText(frUI_UnitState_Text[13], "攻击间隔：")
    call DzFrameSetText(frUI_UnitState_Text[14], "状态抗性：")
    call DzFrameSetText(frUI_UnitState_Text[15], "|cffffff00命中率：|r")
    call DzFrameSetText(frUI_UnitState_Text[16], "|cffffff00法术暴击：|r")
    call DzFrameSetText(frUI_UnitState_Text[17], "|cffffff00法术爆伤：|r")
    call DzFrameSetText(frUI_UnitState_Text[18], "法术抗性：")
    call DzFrameSetText(frUI_UnitState_Text[19], "法抗减伤：")
    call DzFrameSetText(frUI_UnitState_Text[20], "|cffffff00法术穿透：|r")
    call DzFrameSetText(frUI_UnitState_Text[21], "|cffffff00法术吸血：|r")
    call DzFrameSetText(frUI_UnitState_Text[22], "|cffffff00伤害减免：|r")
    
    call DzFrameSetText(frUI_UnitState_Data[12], "")
endfunction
//===========================================================================
// Trigger: UI_UnitStateDynamic
//
// frUI_UnitState_Text
// frUI_UnitState_Data
// rDamaSyst_ArmorFactor = 100
// rDamaSyst_SpellResisFactor = 100
// US_UnitATKSpeed
// US_UnitMoveSpeed
// US_UnitATKInterval
//===========================================================================
//TESH.scrollpos=34
//TESH.alwaysfold=0

function UI_UnitStateDynamic_Set takes unit uUnit returns nothing
    local real array rValue
    local string array sString
    local integer i
    local integer iNum
    //头像
    set sString[0]=( EXExecuteScript("(require'jass.slk').unit[" + I2S(GetUnitTypeId(uUnit)) + "].Art") )
    call DzFrameSetTexture(frUI_UnitState[3], sString[0], 0)
    //名字
    set sString[0]=( EXExecuteScript("(require'jass.slk').unit[" + I2S(GetUnitTypeId(uUnit)) + "].Name") )
    call DzFrameSetText(frUI_UnitState[4], "|cffff9900" + sString[0] + "|r")
    //左边
    set rValue[1]=US_GetUnitMoveSpeed(uUnit)
    set rValue[2]=US_GetUnitATKSpeed(uUnit)
    set rValue[3]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_CoolingShortening")) //冷却缩短
set rValue[4]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_DodgeRate")) //闪避率
set rValue[5]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_CriticalChance")) //物理暴击率
set rValue[6]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_CriticalDamage")) //物理爆伤
set rValue[7]=US_GetUnitArmor(uUnit) //护甲
set rValue[8]=1 - rDamaSyst_ArmorFactor / ( rDamaSyst_ArmorFactor + US_GetUnitArmor(uUnit) ) //护甲减伤
set rValue[9]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ArmorPenetration")) //护甲穿透
set rValue[10]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Leech")) //物理吸血
set rValue[11]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Increase")) //伤害增幅
//右边
set rValue[12]=0 //闲置
set rValue[13]=US_GetUnitATKInterval(uUnit)
    set rValue[14]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rBuffSystem_StateResistance")) //状态抗性
set rValue[15]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Accuracy")) //命中率
set rValue[16]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellCriticalChance")) //法术暴击
set rValue[17]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellCriticalDamage")) //法术爆伤
set rValue[18]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellResistance")) //法术抗性
set rValue[19]=1 - rDamaSyst_SpellResisFactor / ( rDamaSyst_SpellResisFactor + rValue[14] ) //法抗减伤
set rValue[20]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellResistancePenetration")) //法术穿透
set rValue[21]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellLeech")) //法术吸血
set rValue[22]=LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Reduction")) //伤害减免
//左边
set sString[1]=I2S(R2I(rValue[1])) //移速
set sString[2]=R2S(rValue[2]) //攻速
set sString[3]=I2S(R2I(rValue[3])) + "%" //冷却缩短
set sString[4]=I2S(R2I(rValue[4])) + "%" //闪避率
set sString[5]=I2S(R2I(rValue[5])) + "%" //物理暴击率
set sString[6]=I2S(R2I(rValue[6])) + "%" //物理爆伤
set sString[7]=I2S(R2I(rValue[7])) //护甲
set sString[8]=I2S(R2I(rValue[8] * 100)) + "%" //护甲减伤
set sString[9]=I2S(R2I(rValue[9])) //护甲穿透
set sString[10]=I2S(R2I(rValue[10])) + "%" //物理吸血
set sString[11]=I2S(R2I(rValue[11])) + "%" //伤害增幅
//右边
set sString[12]=null //闲置
set sString[13]=R2S(rValue[13]) //攻击间隔
set sString[14]=I2S(R2I(rValue[14])) + "%" //状态抗性
set sString[15]=I2S(R2I(rValue[15])) + "%" //命中率
set sString[16]=I2S(R2I(rValue[16])) + "%" //法术暴击    
set sString[17]=I2S(R2I(rValue[17])) + "%" //法术爆伤    
set sString[18]=I2S(R2I(rValue[18])) //法术抗性
set sString[19]=I2S(R2I(rValue[19] * 100)) + "%" //法抗减伤 
set sString[20]=I2S(R2I(rValue[20])) //法术穿透 
set sString[21]=I2S(R2I(rValue[21])) + "%" //法术吸血   
set sString[22]=I2S(R2I(rValue[22])) + "%" //伤害减免
//Update,23-40：属性数值
set i=1
    set iNum=1
    loop
        exitwhen i > 22
        call DzFrameSetText(frUI_UnitState_Data[i], sString[iNum])
        set i=i + 1
        set iNum=iNum + 1
    endloop
endfunction
function UI_UnitStateDynamic_Null takes unit uUnit returns nothing
    local integer i
    //头像
    call DzFrameSetTexture(frUI_UnitState[3], "ReplaceableTextures\\CommandButtons\\BTNSeal.blp", 0)
    //名字
    call DzFrameSetText(frUI_UnitState[4], "|cffff9900?????|r")
    set i=1
    loop
        exitwhen i > 22
        if ( i != 12 ) then
            call DzFrameSetText(frUI_UnitState_Data[i], "0")
        else
            call DzFrameSetText(frUI_UnitState_Data[i], "")
        endif
        set i=i + 1
    endloop
    
endfunction
function TimerAction_UI_UnitStateDynamic takes nothing returns nothing
    local unit uUnit
    local string sString
    if GetLocalPlayer() == GetLocalPlayer() then
        set uUnit=LoadUnitHandle(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("uPlayerChoiceUnit"))
        if ( uUnit != null ) then
            call UI_UnitStateDynamic_Set(uUnit)
        else
            call UI_UnitStateDynamic_Null(uUnit)
        endif
    endif
    set uUnit=null
endfunction
function UI_UnitStateDynamic takes nothing returns nothing
    set tTimer_UI_UnitStateDynamic=CreateTimer()
    call TimerStart(tTimer_UI_UnitStateDynamic, 1, true, function TimerAction_UI_UnitStateDynamic)
endfunction
//===========================================================================
// Trigger: UI_UnitStateTrigger
//===========================================================================
//TESH.scrollpos=5
//TESH.alwaysfold=0
function Trig_UI_UnitStateTriggerActions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local player pPlayer= GetTriggerPlayer()
    call SaveUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uPlayerChoiceUnit"), uUnit)
    call TimerAction_UI_UnitStateDynamic()
    set uUnit=null
    set pPlayer=null
endfunction
//玩家1-5选择单位
function InitTrig_UI_UnitStateTrigger takes nothing returns nothing
    local integer i
    set gg_trg_UI_UnitStateTrigger=CreateTrigger()
    set i=1
    loop
        exitwhen i > iPlayerNum
        call TriggerRegisterPlayerSelectionEventBJ(gg_trg_UI_UnitStateTrigger, Player(i - 1), true)
        set i=i + 1
    endloop
    call TriggerAddAction(gg_trg_UI_UnitStateTrigger, function Trig_UI_UnitStateTriggerActions)
endfunction
//===========================================================================
// Trigger: UI_BuffSystemInit
//===========================================================================
//TESH.scrollpos=45
//TESH.alwaysfold=0
//textmacro instance: tmUI_BuffSystem("11")
    function Trig_UIEvent_BuffSystem_11_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[11 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[11 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_11_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[11 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[11 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_11 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[11], 2, function Trig_UIEvent_BuffSystem_11_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[11], 3, function Trig_UIEvent_BuffSystem_11_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("11")
//textmacro instance: tmUI_BuffSystem("12")
    function Trig_UIEvent_BuffSystem_12_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[12 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[12 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_12_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[12 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[12 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_12 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[12], 2, function Trig_UIEvent_BuffSystem_12_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[12], 3, function Trig_UIEvent_BuffSystem_12_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("12")
//textmacro instance: tmUI_BuffSystem("13")
    function Trig_UIEvent_BuffSystem_13_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[13 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[13 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_13_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[13 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[13 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_13 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[13], 2, function Trig_UIEvent_BuffSystem_13_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[13], 3, function Trig_UIEvent_BuffSystem_13_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("13")
//textmacro instance: tmUI_BuffSystem("14")
    function Trig_UIEvent_BuffSystem_14_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[14 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[14 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_14_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[14 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[14 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_14 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[14], 2, function Trig_UIEvent_BuffSystem_14_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[14], 3, function Trig_UIEvent_BuffSystem_14_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("14")
//textmacro instance: tmUI_BuffSystem("15")
    function Trig_UIEvent_BuffSystem_15_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[15 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[15 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_15_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[15 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[15 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_15 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[15], 2, function Trig_UIEvent_BuffSystem_15_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[15], 3, function Trig_UIEvent_BuffSystem_15_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("15")
//textmacro instance: tmUI_BuffSystem("16")
    function Trig_UIEvent_BuffSystem_16_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[16 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[16 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_16_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[16 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[16 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_16 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[16], 2, function Trig_UIEvent_BuffSystem_16_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[16], 3, function Trig_UIEvent_BuffSystem_16_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("16")
//textmacro instance: tmUI_BuffSystem("17")
    function Trig_UIEvent_BuffSystem_17_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[17 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[17 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_17_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[17 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[17 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_17 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[17], 2, function Trig_UIEvent_BuffSystem_17_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[17], 3, function Trig_UIEvent_BuffSystem_17_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("17")
//textmacro instance: tmUI_BuffSystem("18")
    function Trig_UIEvent_BuffSystem_18_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[18 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[18 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_18_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[18 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[18 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_18 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[18], 2, function Trig_UIEvent_BuffSystem_18_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[18], 3, function Trig_UIEvent_BuffSystem_18_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("18")
//textmacro instance: tmUI_BuffSystem("19")
    function Trig_UIEvent_BuffSystem_19_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[19 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[19 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_19_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[19 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[19 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_19 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[19], 2, function Trig_UIEvent_BuffSystem_19_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[19], 3, function Trig_UIEvent_BuffSystem_19_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("19")
//textmacro instance: tmUI_BuffSystem("20")
    function Trig_UIEvent_BuffSystem_20_1 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[20 + iG_UI_BuffNumMax * 1], true)
        call DzFrameShow(frUI_BuffSystem[20 + iG_UI_BuffNumMax * 2], true)
    endfunction
    function Trig_UIEvent_BuffSystem_20_2 takes nothing returns nothing
call DzFrameShow(frUI_BuffSystem[20 + iG_UI_BuffNumMax * 1], false)
        call DzFrameShow(frUI_BuffSystem[20 + iG_UI_BuffNumMax * 2], false)
    endfunction
    function Trig_UIEvent_BuffSystem_20 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_BuffSystem[20], 2, function Trig_UIEvent_BuffSystem_20_1, false)
            call DzFrameSetScriptByCode(frUI_BuffSystem[20], 3, function Trig_UIEvent_BuffSystem_20_2, false)
        endif
        
    endfunction
//end of: tmUI_BuffSystem("20")
function Trig_UI_BuffSystemInitActions takes nothing returns nothing
    local integer fFrame
    local integer i
    //父
    set i=1
    loop
        exitwhen i > iG_UI_BuffNumMax
        //1-10:buff贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_BuffSystem" + I2S(i), DzGetGameUI(), "template", 0)
        set frUI_BuffSystem[i]=fFrame
        //call DzFrameSetTexture(fFrame, "ReplaceableTextures\\PassiveButtons\\PASBTNFireRocks.blp", 0)
        call DzFrameSetAbsolutePoint(fFrame, 0, 0.25 + 0.03 * ( i - 1 ), 0.16) //绝对位置
call DzFrameSetSize(fFrame, 0.03, 0.03)
        call DzFrameShow(fFrame, false)
        
        //41-50冷却模型，放在按钮前面定义，防止遮挡
        set fFrame=DzCreateFrameByTagName("SPRITE", "UI_BuffSystem" + I2S(i + iG_UI_BuffNumMax * 4), frUI_BuffSystem[i], "template", 0)
        set frUI_BuffSystem[i + iG_UI_BuffNumMax * 4]=fFrame
        call DzFrameSetModel(fFrame, "interface\\cooldown ui.mdx", 0, 0)
        //call DzFrameSetPoint(fFrame, 4, frUI_BuffSystem[i], 4, 0, 0)    //相对位置
        call DzFrameSetScale(fFrame, 0.75) //设置缩放
call DzFrameSetAllPoints(fFrame, frUI_BuffSystem[i]) //移动Frame1所有锚点到Frame2
//call DzFrameShow(fFrame, false)

        //11-20:buff按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_BuffSystem" + I2S(i + iG_UI_BuffNumMax), frUI_BuffSystem[i], "template", 0)
        set frUI_BuffSystem[i + iG_UI_BuffNumMax]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_BuffSystem[i])
        //21-30:buff说明文字背景
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_BuffSystem" + I2S(i + iG_UI_BuffNumMax * 2), frUI_BuffSystem[i], "template", 0)
        set frUI_BuffSystem[i + iG_UI_BuffNumMax * 2]=fFrame
        call DzFrameSetTexture(fFrame, "UI_Talent_Text_BlackGround.blp", 0)
        call DzFrameSetPoint(fFrame, 6, frUI_BuffSystem[i], 0, 0, 0)
        call DzFrameSetSize(fFrame, 0.28, 0.11)
        call DzFrameSetAlpha(fFrame, 200) //透明度
call DzFrameShow(fFrame, false)
        //31-40:buff说明文字
        set fFrame=DzCreateFrameByTagName("TEXT", "UI_BuffSystem" + I2S(i + iG_UI_BuffNumMax * 3), frUI_BuffSystem[i], "template", 0)
        set frUI_BuffSystem[i + iG_UI_BuffNumMax * 3]=fFrame
        call DzFrameSetPoint(fFrame, 0, frUI_BuffSystem[i + iG_UI_BuffNumMax * 2], 0, 0.01, - 0.01) //相对位置
call DzFrameSetSize(fFrame, 0.28 - 0.01 * 2, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.015, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
call DzFrameShow(fFrame, false)
        
        
        //call DzFrameSetPriority(frUI_BuffSystem[i], 1)   //优先级
        call DzFrameSetPriority(frUI_BuffSystem[i + iG_UI_BuffNumMax * 4], 1) //优先级，冷却模型最低
call DzFrameSetPriority(frUI_BuffSystem[i + iG_UI_BuffNumMax], 3) //优先级，按钮
call DzFrameSetPriority(frUI_BuffSystem[i + iG_UI_BuffNumMax * 2], 2) //优先级，文字背景
call DzFrameSetPriority(frUI_BuffSystem[i + iG_UI_BuffNumMax * 3], 2) //优先级，文字

        set i=i + 1
    endloop
    
    call Trig_UIEvent_BuffSystem_11()
    call Trig_UIEvent_BuffSystem_12()
    call Trig_UIEvent_BuffSystem_13()
    call Trig_UIEvent_BuffSystem_14()
    call Trig_UIEvent_BuffSystem_15()
    call Trig_UIEvent_BuffSystem_16()
    call Trig_UIEvent_BuffSystem_17()
    call Trig_UIEvent_BuffSystem_18()
    call Trig_UIEvent_BuffSystem_19()
    call Trig_UIEvent_BuffSystem_20()
    
    
endfunction
//===========================================================================
function InitTrig_UI_BuffSystemInit takes nothing returns nothing
    set gg_trg_UI_BuffSystemInit=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_UI_BuffSystemInit, function Trig_UI_BuffSystemInitActions)
endfunction
//===========================================================================
// Trigger: UI_BuffSystemDynamic
//
// buff名字：sBuffName
// 说明：
// 叠加层数：iBuffLayer
// bIsBuffLayer
// 持续伤害：10*叠层/0.3秒
// rBuffDamage
// rBuffTriggerTime
// 属性增益：
// integer iBuffState_Num
//     integer array iBuffState_Type[5]
//     real array rBuffState_Data[5]
// 剩余时间：
// rBuffMoveTime_Duration
// 冷却进度：
// rBuffDuration
// rBuffMoveTime_Duration
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_UI_BuffSystemDynamicActions takes nothing returns nothing
    local integer fFrame
    local unit uBuffUnit
    local integer iBuffNum
    local integer array iBuffDataAdress
local integer st
    local string sBuffName
    local string sString_Icon
    local string sString_Introduction
    local string sString_1
    local string array sString
    local integer i
    local integer j
    local integer iNum
    local real rValue
    if GetLocalPlayer() == GetLocalPlayer() then
        set uBuffUnit=LoadUnitHandle(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("uPlayerChoiceUnit"))
        if ( uBuffUnit != null ) then
            set iBuffNum=LoadInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("BuffSystemiBuffNum")) //BUFF数量
set i=1
            loop
                exitwhen i > iBuffNum
                set st=LoadInteger(htUnitHT, GetHandleId(uBuffUnit), StringHash("iBuffDataAdress" + I2S(i))) //BUFF种类
set sBuffName=s__EachBuffData_sBuffName[st]
                //图标
                set sString_Icon=LoadStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Icon")) //图标字符串
call DzFrameSetTexture(frUI_BuffSystem[i], sString_Icon, 0)
                //说明
                set sString_Introduction=LoadStr(htCommomHT, StringHash("BuffSystInit" + sBuffName), StringHash(sBuffName + "Introduction")) //介绍字符串
//冷却进度更新
set rValue=1 - s__EachBuffData_rBuffMoveTime_Duration[st] / s__EachBuffData_rBuffDuration[st]
                set fFrame=frUI_BuffSystem[i + iG_UI_BuffNumMax * 4]
                call DzFrameSetAnimate(fFrame, 0, false) //播放0号动作
call DzFrameSetAnimateOffset(fFrame, rValue) //动画进度
//文本
set sString[1]="|cffff9900buff：|r" + sBuffName + "|n" //buff名字
set sString[2]="|cffff9900说明：|r" + sString_Introduction + "|n" //buff说明
set iNum=2
                if ( s__EachBuffData_rBuffDamage[st] > 0 ) then //有伤害
if ( s__EachBuffData_bIsBuffLayer[st] == true ) then //有叠层
set iNum=iNum + 1
                        set sString[iNum]="|cffff9900叠加层数：|r" + I2S(s__EachBuffData_iBuffLayer[st]) + "|n" //buff叠加层数
set iNum=iNum + 1
                        set sString[iNum]="|cffff9900持续伤害：|r造成" + R2S(s__EachBuffData_rBuffDamage[st]) + "×" + I2S(s__EachBuffData_iBuffLayer[st]) + "伤害每" + R2S(s__EachBuffData_rBuffTriggerTime[st]) + "秒|n" //buff伤害
else //没叠层
set iNum=iNum + 1
                        set sString[iNum]="|cffff9900持续伤害：|r造成" + R2S(s__EachBuffData_rBuffDamage[st]) + "伤害每" + R2S(s__EachBuffData_rBuffTriggerTime[st]) + "秒|n" //buff伤害
endif
                endif
                if ( s__EachBuffData_iBuffState_Num[st] > 0 ) then //有属性增益
set iNum=iNum + 1
                    set sString[iNum]="|cffff9900属性：|r"
                    set j=1
                    loop
                        exitwhen j > s__EachBuffData_iBuffState_Num[st]
                        set sString_1=LoadStr(htCommomHT, StringHash("BuffSystem_StateInit"), s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[st]+j])
                        //set sString[iNum] = sString[iNum]+sString_1+"+"+I2S(R2I(st.rBuffState_Data[j]))
                        set sString[iNum]=sString[iNum] + sString_1
                        if ( s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+j] >= 0 ) then
                            set sString[iNum]=sString[iNum] + "+"
                        else
                            //set sString[iNum] = sString[iNum]+"-"
                        endif
                        set sString[iNum]=sString[iNum] + R2S(s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[st]+j])
                        if ( j < s__EachBuffData_iBuffState_Num[st] ) then
                            set sString[iNum]=sString[iNum] + "，"
                        elseif ( j == s__EachBuffData_iBuffState_Num[st] ) then
                            set sString[iNum]=sString[iNum] + "|n"
                        endif
                        set j=j + 1
                    endloop
                endif
                set iNum=iNum + 1
                set sString[iNum]="|cffff9900剩余时间：|r" + R2S(s__EachBuffData_rBuffMoveTime_Duration[st]) //剩余时间
set j=1
                loop
                    exitwhen j > iNum
                    set sString[0]=sString[0] + sString[j]
                    set sString[j]=null
                    set j=j + 1
                endloop
                call DzFrameSetText(frUI_BuffSystem[i + iG_UI_BuffNumMax * 3], sString[0])
                call DzFrameShow(frUI_BuffSystem[i], true)
                //Clean
                set sString[0]=null
                set i=i + 1
            endloop
            
            //其他不显示
            set i=iBuffNum + 1
            loop
                exitwhen i > iG_UI_BuffNumMax
                call DzFrameShow(frUI_BuffSystem[i], false)
                set i=i + 1
            endloop
        else
            //选择单位丢失，全部不显示
            set i=1
            loop
                exitwhen i > iG_UI_BuffNumMax
                call DzFrameShow(frUI_BuffSystem[i], false)
                set i=i + 1
            endloop
        endif
    endif
    set uBuffUnit=null
endfunction
//===========================================================================
function InitTrig_UI_BuffSystemDynamic takes nothing returns nothing
    set gg_trg_UI_BuffSystemDynamic=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_UI_BuffSystemDynamic, function Trig_UI_BuffSystemDynamicActions)
endfunction
//===========================================================================
// Trigger: UI_DamageDisPlayInit
//
// UI_DamageDisplay_Title.tga
// UI_DamageDisplay_Red.tga
// UI_DamageDisplay_Blue.tga
// UI_DamageDisplay_Cyan.tga
// UI_DamageDisplay_Purple.tga
//===========================================================================
//TESH.scrollpos=147
//TESH.alwaysfold=0


function UI_DamageDisPlayInit takes nothing returns nothing
    local integer fFrame
    local integer i
    local integer iNum
    local string array sString
    local real rHeight
    
    set rUI_DamaDisp_x=0.025
    set i=1
    loop
        exitwhen i > iPlayerNum
        set rUI_DamaDisp_y[i]=- 0.03 - 0.025 * ( i - 1 )
        set i=i + 1
    endloop
    
    
    
    //玩家数据背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_DamaDisp0", DzGetGameUI(), "template", 0) //创建Frame[Tag]
set frUI_DamaDisp[0]=fFrame
    //call DzFrameSetTexture(fFrame, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", 0) //设置贴图
    call DzFrameSetTexture(fFrame, "UI_BackGround3.blp", 0) //设置贴图
call DzFrameSetAbsolutePoint(fFrame, 2, 0.8 - 0.01, 0.52) //绝对位置
call DzFrameSetSize(fFrame, 0.19, 0.16) //I大小
//玩家
set fFrame=DzCreateFrameByTagName("TEXT", "UI_DamaDisp3", frUI_DamaDisp[0], "template", 0)
    set frUI_DamaDisp[3]=fFrame
    call DzFrameSetPoint(fFrame, 0, frUI_DamaDisp[0], 0, 0.033, - 0.01) //相对位置
call DzFrameSetText(fFrame, "玩家")
    call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
//总伤害
set fFrame=DzCreateFrameByTagName("TEXT", "UI_DamaDisp4", frUI_DamaDisp[0], "template", 0)
    set frUI_DamaDisp[4]=fFrame
    call DzFrameSetPoint(fFrame, 0, frUI_DamaDisp[0], 0, 0.075, - 0.01) //相对位置
call DzFrameSetText(fFrame, "总伤害")
    call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
//治疗量
set fFrame=DzCreateFrameByTagName("TEXT", "UI_DamaDisp5", frUI_DamaDisp[0], "template", 0)
    set frUI_DamaDisp[5]=fFrame
    call DzFrameSetPoint(fFrame, 0, frUI_DamaDisp[0], 0, 0.075 + 0.033, - 0.01) //相对位置
call DzFrameSetText(fFrame, "治疗量")
    call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
//承受伤害
set fFrame=DzCreateFrameByTagName("TEXT", "UI_DamaDisp6", frUI_DamaDisp[0], "template", 0)
    set frUI_DamaDisp[6]=fFrame
    call DzFrameSetPoint(fFrame, 0, frUI_DamaDisp[0], 0, 0.075 + 0.033 * 2, - 0.01) //相对位置
call DzFrameSetText(fFrame, "承受伤害")
    call DzFrameSetSize(fFrame, 0.05, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

    
    set sString[1]="UI_DamageDisplay_Red.tga"
    set sString[2]="UI_DamageDisplay_Blue.tga"
    set sString[3]="UI_DamageDisplay_Cyan.tga"
    set sString[4]="UI_DamageDisplay_Purple.tga"
    set sString[5]="UI_DamageDisplay_Purple.tga"
    
    
    
    set rHeight=0.025
    set i=7
    set iNum=1
    loop
        exitwhen i > ( 7 + iPlayerNum - 1 )
        //颜色条
        set fFrame=DzCreateFrameByTagName("BACKDROP", "frUI_DamaDisp_Color" + I2S(iNum), frUI_DamaDisp[0], "template", 0) //创建Frame[Tag]
set frUI_DamaDisp_Color[iNum]=fFrame
        call DzFrameSetTexture(fFrame, sString[iNum], 0) //设置贴图
call DzFrameSetPoint(fFrame, 0, frUI_DamaDisp[0], 0, rHeight, - 0.03 - rHeight * ( iNum - 1 )) //相对位置
//call DzFrameSetAbsolutePoint(fFrame, 0, 0.6+0.025, 0.52-0.03-rHeight*(iNum-1))   //绝对位置
call DzFrameSetSize(fFrame, 0.19 - rHeight, rHeight) //I大小

        //头像
        set fFrame=DzCreateFrameByTagName("BACKDROP", "frUI_DamaDisp_Portrait" + I2S(iNum), frUI_DamaDisp[0], "template", 0) //创建Frame[Tag]
set frUI_DamaDisp_Portrait[iNum]=fFrame
        call DzFrameSetTexture(fFrame, "ReplaceableTextures\\CommandButtons\\BTNSeal.blp", 0) //设置贴图
call DzFrameSetPoint(fFrame, 5, frUI_DamaDisp_Color[iNum], 3, 0, 0) //相对位置
call DzFrameSetSize(fFrame, rHeight, rHeight) //I大小
//名字
set fFrame=DzCreateFrameByTagName("TEXT", "frUI_DamaDisp_Name" + I2S(iNum), frUI_DamaDisp[0], "template", 0)
        set frUI_DamaDisp_Name[iNum]=fFrame
        call DzFrameSetPoint(fFrame, 3, frUI_DamaDisp_Color[iNum], 3, 0.005, 0) //相对位置
set sString[0]=GetPlayerName(Player(iNum - 1))
        set sString[0]=SubStringBJ(sString[0], 1, 9)
        call DzFrameSetText(fFrame, sString[0])
        call DzFrameSetSize(fFrame, 0.05, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

        //总伤害
        set fFrame=DzCreateFrameByTagName("TEXT", "frUI_DamaDisp_Data1" + I2S(iNum), frUI_DamaDisp[0], "template", 0)
        set frUI_DamaDisp_Data1[iNum]=fFrame
        call DzFrameSetPoint(fFrame, 3, frUI_DamaDisp_Color[iNum], 3, 0.055, 0) //相对位置
call DzFrameSetText(fFrame, "0")
        call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

        //治疗量
        set fFrame=DzCreateFrameByTagName("TEXT", "frUI_DamaDisp_Data2" + I2S(iNum), frUI_DamaDisp[0], "template", 0)
        set frUI_DamaDisp_Data2[iNum]=fFrame
        call DzFrameSetPoint(fFrame, 3, frUI_DamaDisp_Color[iNum], 3, 0.055 + 0.033, 0) //相对位置
call DzFrameSetText(fFrame, "0")
        call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
//承受伤害
set fFrame=DzCreateFrameByTagName("TEXT", "frUI_DamaDisp_Data3" + I2S(iNum), frUI_DamaDisp[0], "template", 0)
        set frUI_DamaDisp_Data3[iNum]=fFrame
        call DzFrameSetPoint(fFrame, 3, frUI_DamaDisp_Color[iNum], 3, 0.055 + 0.033 * 2, 0) //相对位置
call DzFrameSetText(fFrame, "0")
        call DzFrameSetSize(fFrame, 0.04, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.012, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

        set i=i + 1
        set iNum=iNum + 1
    endloop
    
    //伤害初始化
    //5个玩家
    set i=1
    loop
        exitwhen i > iPlayerNum
        call SaveReal(htCommomHT, GetHandleId(Player(i - 1)), StringHash("rUI_DamaDisp_TotalDamage"), 0.1 * ( 5 - i )) //总伤害
call SaveInteger(htCommomHT, GetHandleId(Player(i - 1)), StringHash("iUI_DamaDisp_Location"), i) //排行榜当前位置
set i=i + 1
    endloop
    
    
    
    
endfunction
//===========================================================================
// Trigger: UI_DamageDisplayDynamic
//
// 
//===========================================================================
//TESH.scrollpos=86
//TESH.alwaysfold=0
function TimerAction_UI_DamageDisplayMove takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rUI_Initx= LoadReal(htTimerHT, iTimerID, StringHash("rUI_Initx"))
    local real rUI_Inity= LoadReal(htTimerHT, iTimerID, StringHash("rUI_Inity"))
    local real rUI_Targetx= LoadReal(htTimerHT, iTimerID, StringHash("rUI_Targetx"))
    local real rUI_Targety= LoadReal(htTimerHT, iTimerID, StringHash("rUI_Targety"))
    local real rTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTotalTime"))
    local real rMoveTime= LoadReal(htTimerHT, iTimerID, StringHash("rMoveTime"))
    local real rTotalDistance= LoadReal(htTimerHT, iTimerID, StringHash("rTotalDistance"))
    local real rMoveDistance= LoadReal(htTimerHT, iTimerID, StringHash("rMoveDistance"))
    local real rEveryDistance= LoadReal(htTimerHT, iTimerID, StringHash("rEveryDistance"))
    local integer l__iPlayerNum= LoadInteger(htTimerHT, iTimerID, StringHash("iPlayerNum"))
    local real r1
    if ( rMoveDistance <= rTotalDistance ) then
        set rUI_Inity=rUI_Inity + rEveryDistance
        call DzFrameSetPoint(frUI_DamaDisp_Color[l__iPlayerNum], 0, frUI_DamaDisp[0], 0, rUI_Initx, rUI_Inity) //颜色条
//call DzFrameSetAbsolutePoint(frUI_DamaDisp_Color[iPlayerNum], 0, rUI_Initx, rUI_Inity)   //绝对位置

        set rMoveTime=rMoveTime + rTimerInterval_DamaDisp
        set rMoveDistance=rMoveDistance + RAbs(rEveryDistance)
        call SaveReal(htTimerHT, iTimerID, StringHash("rUI_Inity"), rUI_Inity)
        call SaveReal(htTimerHT, iTimerID, StringHash("rMoveTime"), rMoveTime)
        call SaveReal(htTimerHT, iTimerID, StringHash("rMoveDistance"), rMoveDistance)
    else
        call DzFrameSetPoint(frUI_DamaDisp_Color[l__iPlayerNum], 0, frUI_DamaDisp[0], 0, rUI_Targetx, rUI_Targety) //颜色条

        //call DzFrameSetAbsolutePoint(frUI_DamaDisp_Color[iPlayerNum], 0, rUI_Targetx, rUI_Targety)   //绝对位置
        
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
endfunction
function UI_DamaDisp_NumerCalculation takes string sString returns string
    local integer iNum= StringLength(sString)
local integer iNum_1
    if ( iNum <= 4 ) then //1万以下不处理，1-4位
return sString
    elseif ( iNum >= 5 ) and ( iNum <= 8 ) then //1万到千万，5-8位
set sString=SubStringBJ(sString, 1, iNum - 3)
        set iNum_1=StringLength(sString)
        set sString=SubStringBJ(sString, 1, iNum_1 - 1) + "." + SubStringBJ(sString, iNum_1, iNum_1) + "万"
    elseif ( iNum >= 9 ) and ( iNum <= 12 ) then //1亿
set sString=SubStringBJ(sString, 1, iNum - 3 - 4)
        set iNum_1=StringLength(sString)
        set sString=SubStringBJ(sString, 1, iNum_1 - 1) + "." + SubStringBJ(sString, iNum_1, iNum_1) + "亿"
    endif
    return sString
endfunction
function TimerAction_UI_DamageDisplayDynamic takes nothing returns nothing
    local real array rTotalDamage
local real array rTotalDamage_Sort
local integer array iLocationPast
local integer array iLocationNew
local real rValue
    local integer iValue
    local string sString
    local integer i
    local integer j
    //UI移动数据
    local real rUI_Initx
    local real rUI_Inity
    local real rUI_Targetx
    local real rUI_Targety
    local real rTotalDistance
    local real rTotalTime
    local real rEveryDistance
    
    local timer tTimer
    local integer iTimerID= 0
    
    //UpdateDisplayData    
    set i=1
    loop
        exitwhen i > iPlayerNum
        //总伤害
        set rValue=LoadReal(htCommomHT, GetHandleId(Player(i - 1)), StringHash("rUI_DamaDisp_TotalDamage")) //总伤害
set rTotalDamage[i]=rValue
        set rTotalDamage_Sort[i]=rValue
        set iLocationPast[i]=LoadInteger(htCommomHT, GetHandleId(Player(i - 1)), StringHash("iUI_DamaDisp_Location")) //旧排行
set iValue=R2I(rValue)
        set sString=UI_DamaDisp_NumerCalculation(I2S(iValue))
        call DzFrameSetText(frUI_DamaDisp_Data1[i], sString) //总伤害
//治疗量
//承受伤害
set rValue=LoadReal(htCommomHT, GetHandleId(Player(i - 1)), StringHash("rUI_DamaDisp_TakeDamage"))
        set iValue=R2I(rValue)
        set sString=UI_DamaDisp_NumerCalculation(I2S(iValue))
        call DzFrameSetText(frUI_DamaDisp_Data3[i], sString)
        set i=i + 1
    endloop
    //伤害排序
    set i=1
    loop
        exitwhen i > iPlayerNum
            set j=1
            loop
                exitwhen j > ( iPlayerNum - 1 )
                if ( rTotalDamage_Sort[j] < rTotalDamage_Sort[j + 1] ) then
                    set rValue=rTotalDamage_Sort[j]
                    set rTotalDamage_Sort[j]=rTotalDamage_Sort[j + 1]
                    set rTotalDamage_Sort[j + 1]=rValue
                endif
                set j=j + 1
            endloop
        set i=i + 1
    endloop
    
    //排序后伤害认领,i是排序后伤害序号
    set i=1
    loop
        exitwhen i > iPlayerNum
            set j=1
            loop
                exitwhen j > iPlayerNum
                if ( rTotalDamage[j] == rTotalDamage_Sort[i] ) then
                    set iLocationNew[j]=i
                    call SaveInteger(htCommomHT, GetHandleId(Player(j - 1)), StringHash("iUI_DamaDisp_Location"), i)
                endif
                set j=j + 1
            endloop
        set i=i + 1
    endloop
    //UI移动位置
    set i=1
    loop
        exitwhen i > iPlayerNum
        if ( iLocationPast[i] != iLocationNew[i] ) then
            set tTimer=CreateTimer()
            set iTimerID=GetHandleId(tTimer)
            set rUI_Initx=rUI_DamaDisp_x
            set rUI_Inity=rUI_DamaDisp_y[iLocationPast[i]]
            set rUI_Targetx=rUI_DamaDisp_x
            set rUI_Targety=rUI_DamaDisp_y[iLocationNew[i]]
            set rTotalDistance=RAbs(rUI_Targety - rUI_Inity)
            set rTotalTime=0.5
            set rEveryDistance=rTotalDistance / rTotalTime * rTimerInterval_DamaDisp
            if ( iLocationPast[i] > iLocationNew[i] ) then //新排行序号变小，排行升了
set rEveryDistance=rEveryDistance
            elseif ( iLocationPast[i] < iLocationNew[i] ) then //新排行序号变大，排行降了
set rEveryDistance=- rEveryDistance
            endif
            //call BJDebugMsg("玩家"+I2S(i))
            //call BJDebugMsg("rTotalDistance:"+R2S(rTotalDistance))
            //call BJDebugMsg("rEveryDistance:"+R2S(rEveryDistance))
            call SaveReal(htTimerHT, iTimerID, StringHash("rUI_Initx"), rUI_Initx)
            call SaveReal(htTimerHT, iTimerID, StringHash("rUI_Inity"), rUI_Inity)
            call SaveReal(htTimerHT, iTimerID, StringHash("rUI_Targetx"), rUI_Targetx)
            call SaveReal(htTimerHT, iTimerID, StringHash("rUI_Targety"), rUI_Targety)
            call SaveReal(htTimerHT, iTimerID, StringHash("rTotalTime"), rTotalTime)
            call SaveReal(htTimerHT, iTimerID, StringHash("rMoveTime"), 0 + rTimerInterval_DamaDisp)
            call SaveReal(htTimerHT, iTimerID, StringHash("rTotalDistance"), rTotalDistance)
            call SaveReal(htTimerHT, iTimerID, StringHash("rMoveDistance"), 0 + rEveryDistance)
            call SaveReal(htTimerHT, iTimerID, StringHash("rEveryDistance"), rEveryDistance)
            call SaveInteger(htTimerHT, iTimerID, StringHash("iPlayerNum"), i)
            call TimerStart(tTimer, rTimerInterval_DamaDisp, true, function TimerAction_UI_DamageDisplayMove)
        endif
        set i=i + 1
    endloop
    
    
    set tTimer=null
endfunction
function UI_DamageDisplayDynamic takes nothing returns nothing
    set tTimer_UI_DamaDisp=CreateTimer()
    call TimerStart(tTimer_UI_DamaDisp, 1, true, function TimerAction_UI_DamageDisplayDynamic)
endfunction
//===========================================================================
// Trigger: UI_Talent_Init
//===========================================================================
//TESH.scrollpos=157
//TESH.alwaysfold=0
//高亮事件文本宏
//textmacro instance: tmUI_Talent_HeightLight("2")
    function Trig_Talent_HeightLight_2_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 2 >= 12 ) and ( 2 <= 20 ) then
            call DzFrameShow(frUI_Talent[2 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[2 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_2_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 2 >= 12 ) and ( 2 <= 20 ) then
            call DzFrameShow(frUI_Talent[2 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[2 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_2 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[2], 2, function Trig_Talent_HeightLight_2_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[2], 3, function Trig_Talent_HeightLight_2_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("2")
//textmacro instance: tmUI_Talent_HeightLight("12")
    function Trig_Talent_HeightLight_12_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 12 >= 12 ) and ( 12 <= 20 ) then
            call DzFrameShow(frUI_Talent[12 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[12 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_12_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 12 >= 12 ) and ( 12 <= 20 ) then
            call DzFrameShow(frUI_Talent[12 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[12 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_12 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[12], 2, function Trig_Talent_HeightLight_12_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[12], 3, function Trig_Talent_HeightLight_12_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("12")
//textmacro instance: tmUI_Talent_HeightLight("13")
    function Trig_Talent_HeightLight_13_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 13 >= 12 ) and ( 13 <= 20 ) then
            call DzFrameShow(frUI_Talent[13 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[13 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_13_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 13 >= 12 ) and ( 13 <= 20 ) then
            call DzFrameShow(frUI_Talent[13 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[13 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_13 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[13], 2, function Trig_Talent_HeightLight_13_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[13], 3, function Trig_Talent_HeightLight_13_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("13")
//textmacro instance: tmUI_Talent_HeightLight("14")
    function Trig_Talent_HeightLight_14_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 14 >= 12 ) and ( 14 <= 20 ) then
            call DzFrameShow(frUI_Talent[14 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[14 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_14_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 14 >= 12 ) and ( 14 <= 20 ) then
            call DzFrameShow(frUI_Talent[14 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[14 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_14 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[14], 2, function Trig_Talent_HeightLight_14_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[14], 3, function Trig_Talent_HeightLight_14_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("14")
//textmacro instance: tmUI_Talent_HeightLight("15")
    function Trig_Talent_HeightLight_15_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 15 >= 12 ) and ( 15 <= 20 ) then
            call DzFrameShow(frUI_Talent[15 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[15 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_15_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 15 >= 12 ) and ( 15 <= 20 ) then
            call DzFrameShow(frUI_Talent[15 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[15 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_15 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[15], 2, function Trig_Talent_HeightLight_15_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[15], 3, function Trig_Talent_HeightLight_15_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("15")
//textmacro instance: tmUI_Talent_HeightLight("16")
    function Trig_Talent_HeightLight_16_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 16 >= 12 ) and ( 16 <= 20 ) then
            call DzFrameShow(frUI_Talent[16 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[16 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_16_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 16 >= 12 ) and ( 16 <= 20 ) then
            call DzFrameShow(frUI_Talent[16 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[16 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_16 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[16], 2, function Trig_Talent_HeightLight_16_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[16], 3, function Trig_Talent_HeightLight_16_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("16")
//textmacro instance: tmUI_Talent_HeightLight("17")
    function Trig_Talent_HeightLight_17_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 17 >= 12 ) and ( 17 <= 20 ) then
            call DzFrameShow(frUI_Talent[17 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[17 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_17_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 17 >= 12 ) and ( 17 <= 20 ) then
            call DzFrameShow(frUI_Talent[17 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[17 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_17 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[17], 2, function Trig_Talent_HeightLight_17_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[17], 3, function Trig_Talent_HeightLight_17_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("17")
//textmacro instance: tmUI_Talent_HeightLight("18")
    function Trig_Talent_HeightLight_18_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 18 >= 12 ) and ( 18 <= 20 ) then
            call DzFrameShow(frUI_Talent[18 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[18 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_18_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 18 >= 12 ) and ( 18 <= 20 ) then
            call DzFrameShow(frUI_Talent[18 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[18 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_18 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[18], 2, function Trig_Talent_HeightLight_18_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[18], 3, function Trig_Talent_HeightLight_18_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("18")
//textmacro instance: tmUI_Talent_HeightLight("19")
    function Trig_Talent_HeightLight_19_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 19 >= 12 ) and ( 19 <= 20 ) then
            call DzFrameShow(frUI_Talent[19 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[19 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_19_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 19 >= 12 ) and ( 19 <= 20 ) then
            call DzFrameShow(frUI_Talent[19 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[19 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_19 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[19], 2, function Trig_Talent_HeightLight_19_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[19], 3, function Trig_Talent_HeightLight_19_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("19")
//textmacro instance: tmUI_Talent_HeightLight("20")
    function Trig_Talent_HeightLight_20_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 20 >= 12 ) and ( 20 <= 20 ) then
            call DzFrameShow(frUI_Talent[20 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[20 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_20_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 20 >= 12 ) and ( 20 <= 20 ) then
            call DzFrameShow(frUI_Talent[20 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[20 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_20 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[20], 2, function Trig_Talent_HeightLight_20_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[20], 3, function Trig_Talent_HeightLight_20_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("20")
//textmacro instance: tmUI_Talent_HeightLight("40")
    function Trig_Talent_HeightLight_40_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
        call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
        if ( 40 >= 12 ) and ( 40 <= 20 ) then
            call DzFrameShow(frUI_Talent[40 + 9 * 1], true)
            call DzFrameShow(frUI_Talent[40 + 9 * 2], true)
        endif
    endfunction
    function Trig_Talent_HeightLight_40_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
        if ( 40 >= 12 ) and ( 40 <= 20 ) then
            call DzFrameShow(frUI_Talent[40 + 9 * 1], false)
            call DzFrameShow(frUI_Talent[40 + 9 * 2], false)
        endif
    endfunction
    function Trig_Talent_HeightLight_40 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Talent[40], 2, function Trig_Talent_HeightLight_40_1, false)
            call DzFrameSetScriptByCode(frUI_Talent[40], 3, function Trig_Talent_HeightLight_40_2, false)
        endif
        
    endfunction
//end of: tmUI_Talent_HeightLight("40")
function UI_Talent_Enter takes nothing returns nothing
    local integer iUI_Talent_State= LoadInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Talent_State"))
    if ( iUI_Talent_State == 0 ) then
        set iUI_Talent_State=1
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Talent_State"), iUI_Talent_State)
        call DzFrameShow(frUI_Talent[0], true)
    elseif ( iUI_Talent_State == 1 ) then
        set iUI_Talent_State=0
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Talent_State"), iUI_Talent_State)
        call DzFrameShow(frUI_Talent[0], false)
    endif
endfunction
function UI_Talent_CloseButton takes nothing returns nothing
    local integer iUI_Talent_State= 0
    call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Talent_State"), iUI_Talent_State)
    call DzFrameShow(frUI_Talent[0], false)
endfunction
function UI_Talent_Init takes nothing returns nothing
    local integer fFrame
    local integer i
    local integer j
    local real rUIx
    local real rUIy
    //天赋进入贴图
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Talent1", DzGetGameUI(), "template", 0)
    set frUI_Talent[1]=fFrame
    call DzFrameSetTexture(fFrame, "UI_Talent_Enter.blp", 0)
    call DzFrameSetPoint(fFrame, 3, DzFrameGetMinimapButton(0), 5, 0.01, 0.01)
    call DzFrameSetSize(fFrame, 0.05, 0.05)
    //天赋进入按钮
    set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Talent2", frUI_Talent[1], "template", 0)
    set frUI_Talent[2]=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_Talent[1])
    call Trig_Talent_HeightLight_2() //鼠标进入高亮
//点击事件
if ( GetLocalPlayer() == GetLocalPlayer() ) then
    	call DzFrameSetScriptByCode(fFrame, 1, function UI_Talent_Enter, false) //鼠标点击
endif
    
    //天赋页面背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Talent0", DzGetGameUI(), "template", 0)
    set frUI_Talent[0]=fFrame
    call DzFrameSetTexture(fFrame, "UI_Talent_BlackGround.blp", 0)
    call DzFrameSetPoint(fFrame, 7, frUI_Talent[1], 1, 0, 0.01)
    call DzFrameSetSize(fFrame, 0.23, 0.23 * 1.31)
    call DzFrameSetAlpha(fFrame, 255) //透明度
call DzFrameShow(fFrame, false)
    
    //9个天赋+按钮
    set i=3
    set rUIx=- 1
    set rUIy=1
    loop
        exitwhen i > 11
        //天赋贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Talent" + I2S(i), frUI_Talent[0], "template", 0)
        set frUI_Talent[i]=fFrame
        call DzFrameSetTexture(fFrame, "ReplaceableTextures\\CommandButtons\\BTNAlleriaFlute.blp", 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Talent[0], 1, ( 0.04 + 0.015 ) * rUIx, - 0.023 - ( 0.04 + 0.022 ) * rUIy)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Talent" + I2S(i + 9), frUI_Talent[0], "template", 0)
        set frUI_Talent[i + 9]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Talent[i])
        //文字背景
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Talent" + I2S(i + 9 * 2), frUI_Talent[0], "template", 0)
        set frUI_Talent[i + 9 * 2]=fFrame
        call DzFrameSetTexture(fFrame, "UI_Talent_Text_BlackGround.blp", 0)
        call DzFrameSetPoint(fFrame, 0, frUI_Talent[i], 2, 0.01, 0.01)
        call DzFrameSetSize(fFrame, 0.1, 0.15)
        call DzFrameSetAlpha(fFrame, 200) //透明度
call DzFrameShow(fFrame, false) //是否显示

        //文字
        set fFrame=DzCreateFrameByTagName("TEXT", "UI_Talent" + I2S(i + 9 * 3), frUI_Talent[0], "template", 0)
        set frUI_Talent[i + 9 * 3]=fFrame
        call DzFrameSetPoint(fFrame, 0, frUI_Talent[i], 2, 0.01, 0.01) //相对位置
call DzFrameSetText(fFrame, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        call DzFrameSetSize(fFrame, 0.1, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.02, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大
call DzFrameShow(fFrame, false) //是否显示

        call DzFrameSetPriority(frUI_Talent[i], 1) //优先级
call DzFrameSetPriority(frUI_Talent[i + 9], 2) //优先级
call DzFrameSetPriority(frUI_Talent[i + 9 * 2], 3) //优先级
call DzFrameSetPriority(frUI_Talent[i + 9 * 3], 4) //优先级

        set i=i + 1
        set rUIx=rUIx + 1
        if ( rUIx == 2 ) then
            set rUIx=- 1
            set rUIy=rUIy + 1
        endif
    endloop
    call Trig_Talent_HeightLight_12() //鼠标进入高亮
call Trig_Talent_HeightLight_13() //鼠标进入高亮
call Trig_Talent_HeightLight_14() //鼠标进入高亮
call Trig_Talent_HeightLight_15() //鼠标进入高亮
call Trig_Talent_HeightLight_16() //鼠标进入高亮
call Trig_Talent_HeightLight_17() //鼠标进入高亮
call Trig_Talent_HeightLight_18() //鼠标进入高亮
call Trig_Talent_HeightLight_19() //鼠标进入高亮
call Trig_Talent_HeightLight_20() //鼠标进入高亮

    
    //关闭按钮贴图
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Talent39", frUI_Talent[0], "template", 0)
    set frUI_Talent[39]=fFrame
    call DzFrameSetTexture(fFrame, "UI_CloseButton_1.blp", 0)
    call DzFrameSetPoint(fFrame, 2, frUI_Talent[0], 2, - 0.01, - 0.01)
    call DzFrameSetSize(fFrame, 0.03, 0.03)
    //call DzFrameSetPriority(fFrame, 1)   //优先级
    //关闭按钮
    set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Talent40", frUI_Talent[39], "template", 0)
    set frUI_Talent[40]=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_Talent[39])
    call Trig_Talent_HeightLight_40() //鼠标进入高亮
//点击事件
if ( GetLocalPlayer() == GetLocalPlayer() ) then
    	call DzFrameSetScriptByCode(fFrame, 1, function UI_Talent_CloseButton, false) //鼠标点击
endif
    
    //xw-jnk-qinglan.mdx
    //xw-wpk-qinglan.mdx
    set fFrame=DzCreateFrameByTagName("SPRITE", "name", DzGetGameUI(), "template", 0)
    set frUI_Talent_Model=fFrame
    call DzFrameSetModel(fFrame, "xw-wpk-qinglan.mdx", 0, 0)
    call DzFrameSetScale(fFrame, 1.5)
    call DzFrameSetAllPoints(fFrame, frUI_Talent[1]) //移动Frame1所有锚点到Frame2

endfunction
//===========================================================================
// Trigger: UI_Archive_Init
//===========================================================================
//TESH.scrollpos=54
//TESH.alwaysfold=0
function UI_Archive_NoDisplay takes nothing returns nothing
    local integer i= 0
    set i=13
    loop
        exitwhen i > 62
        call DzFrameShow(frUI_Archive[i], false)
        set i=i + 1
    endloop
endfunction
function UI_Archive_Click takes nothing returns nothing
local integer i= 0
    local integer iNum= 0
    local integer iFlag= 0
    local string sString
    local integer fFrame
    if ( DzGetTriggerUIEventFrame() == frUI_Archive[8] ) then
        set iNum=13
        set iFlag=1
    elseif ( DzGetTriggerUIEventFrame() == frUI_Archive[9] ) then
        set iNum=23
        set iFlag=1
    elseif ( DzGetTriggerUIEventFrame() == frUI_Archive[10] ) then
        set iNum=33
        set iFlag=1
    elseif ( DzGetTriggerUIEventFrame() == frUI_Archive[11] ) then
        set iNum=43
        set iFlag=1
    elseif ( DzGetTriggerUIEventFrame() == frUI_Archive[12] ) then
        set iNum=53
        set iFlag=1
    else
        set iFlag=2
    endif
    if ( iFlag == 1 ) then
    call UI_Archive_NoDisplay()
        set i=iNum
        loop
            exitwhen i > ( iNum + 9 )
            call DzFrameShow(frUI_Archive[i], true)
            set i=i + 1
        endloop
    endif
    if ( iFlag == 2 ) then
        set i=18
        loop
            exitwhen i > 62
            if ( DzGetTriggerUIEventFrame() == frUI_Archive[i] ) then
                set iNum=i
                call DoNothing()
 exitwhen true //(  )
            endif
            set i=i + 1
        endloop
        
        set sString=LoadStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)))
        call DzFrameSetText(frUI_Archive_Text, sString)
    endif
endfunction
function Trig_Archive_HeightLight_1 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, true)
    call DzFrameSetAllPoints(frUI_HeightLight, DzGetTriggerUIEventFrame())
endfunction
function Trig_Archive_HeightLight_2 takes nothing returns nothing
call DzFrameShow(frUI_HeightLight, false)
endfunction
    
//高亮事件文本宏
//textmacro instance: tmUI_Archive_HeightLight("8")
    function Trig_Archive_HeightLight_8 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[8], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[8], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[8], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("8")
//textmacro instance: tmUI_Archive_HeightLight("9")
    function Trig_Archive_HeightLight_9 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[9], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[9], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[9], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("9")
//textmacro instance: tmUI_Archive_HeightLight("10")
    function Trig_Archive_HeightLight_10 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[10], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[10], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[10], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("10")
//textmacro instance: tmUI_Archive_HeightLight("11")
    function Trig_Archive_HeightLight_11 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[11], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[11], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[11], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("11")
//textmacro instance: tmUI_Archive_HeightLight("12")
    function Trig_Archive_HeightLight_12 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[12], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[12], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[12], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("12")
//textmacro instance: tmUI_Archive_HeightLight("18")
    function Trig_Archive_HeightLight_18 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[18], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[18], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[18], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("18")
//textmacro instance: tmUI_Archive_HeightLight("19")
    function Trig_Archive_HeightLight_19 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[19], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[19], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[19], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("19")
//textmacro instance: tmUI_Archive_HeightLight("20")
    function Trig_Archive_HeightLight_20 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[20], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[20], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[20], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("20")
//textmacro instance: tmUI_Archive_HeightLight("21")
    function Trig_Archive_HeightLight_21 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[21], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[21], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[21], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("21")
//textmacro instance: tmUI_Archive_HeightLight("22")
    function Trig_Archive_HeightLight_22 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[22], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[22], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[22], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("22")
//textmacro instance: tmUI_Archive_HeightLight("28")
    function Trig_Archive_HeightLight_28 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[28], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[28], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[28], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("28")
//textmacro instance: tmUI_Archive_HeightLight("29")
    function Trig_Archive_HeightLight_29 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[29], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[29], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[29], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("29")
//textmacro instance: tmUI_Archive_HeightLight("30")
    function Trig_Archive_HeightLight_30 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[30], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[30], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[30], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("30")
//textmacro instance: tmUI_Archive_HeightLight("31")
    function Trig_Archive_HeightLight_31 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[31], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[31], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[31], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("31")
//textmacro instance: tmUI_Archive_HeightLight("32")
    function Trig_Archive_HeightLight_32 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[32], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[32], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[32], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("32")
//textmacro instance: tmUI_Archive_HeightLight("38")
    function Trig_Archive_HeightLight_38 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[38], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[38], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[38], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("38")
//textmacro instance: tmUI_Archive_HeightLight("39")
    function Trig_Archive_HeightLight_39 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[39], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[39], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[39], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("39")
//textmacro instance: tmUI_Archive_HeightLight("40")
    function Trig_Archive_HeightLight_40 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[40], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[40], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[40], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("40")
//textmacro instance: tmUI_Archive_HeightLight("41")
    function Trig_Archive_HeightLight_41 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[41], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[41], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[41], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("41")
//textmacro instance: tmUI_Archive_HeightLight("42")
    function Trig_Archive_HeightLight_42 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[42], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[42], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[42], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("42")
//textmacro instance: tmUI_Archive_HeightLight("48")
    function Trig_Archive_HeightLight_48 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[48], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[48], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[48], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("48")
//textmacro instance: tmUI_Archive_HeightLight("49")
    function Trig_Archive_HeightLight_49 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[49], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[49], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[49], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("49")
//textmacro instance: tmUI_Archive_HeightLight("50")
    function Trig_Archive_HeightLight_50 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[50], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[50], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[50], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("50")
//textmacro instance: tmUI_Archive_HeightLight("51")
    function Trig_Archive_HeightLight_51 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[51], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[51], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[51], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("51")
//textmacro instance: tmUI_Archive_HeightLight("52")
    function Trig_Archive_HeightLight_52 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[52], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[52], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[52], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("52")
//textmacro instance: tmUI_Archive_HeightLight("58")
    function Trig_Archive_HeightLight_58 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[58], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[58], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[58], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("58")
//textmacro instance: tmUI_Archive_HeightLight("59")
    function Trig_Archive_HeightLight_59 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[59], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[59], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[59], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("59")
//textmacro instance: tmUI_Archive_HeightLight("60")
    function Trig_Archive_HeightLight_60 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[60], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[60], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[60], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("60")
//textmacro instance: tmUI_Archive_HeightLight("61")
    function Trig_Archive_HeightLight_61 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[61], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[61], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[61], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("61")
//textmacro instance: tmUI_Archive_HeightLight("62")
    function Trig_Archive_HeightLight_62 takes nothing returns nothing
        if GetLocalPlayer() == GetLocalPlayer() then
            call DzFrameSetScriptByCode(frUI_Archive[62], 1, function UI_Archive_Click, false)
            call DzFrameSetScriptByCode(frUI_Archive[62], 2, function Trig_Archive_HeightLight_1, false)
            call DzFrameSetScriptByCode(frUI_Archive[62], 3, function Trig_Archive_HeightLight_2, false)
        endif
    endfunction
//end of: tmUI_Archive_HeightLight("62")
function UI_Archive_Enter_Visible takes nothing returns nothing
    local integer i= 0
    local integer iNum= 13
    call UI_Archive_NoDisplay()
    set i=iNum
    loop
        exitwhen i > ( iNum + 9 )
        call DzFrameShow(frUI_Archive[i], true)
        set i=i + 1
    endloop
endfunction
function UI_Archive_Enter takes nothing returns nothing
    local integer iUI_Archive_State= LoadInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Archive_State"))
    if ( iUI_Archive_State == 0 ) then
        set iUI_Archive_State=1
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Archive_State"), iUI_Archive_State)
        call DzFrameShow(frUI_Archive[0], true) //显示存档背景
        call UI_Archive_Enter_Visible() //显示存档页面1
call DzFrameSetText(frUI_Archive_Text, " ")
    elseif ( iUI_Archive_State == 1 ) then
        set iUI_Archive_State=0
        call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Archive_State"), iUI_Archive_State)
        call DzFrameShow(frUI_Archive[0], false)
    endif
endfunction
function UI_Archive_CloseButton takes nothing returns nothing
    local integer iUI_Archive_State= 0
    call SaveInteger(htCommomHT, GetHandleId(GetLocalPlayer()), StringHash("iUI_Archive_State"), iUI_Archive_State)
    call DzFrameShow(frUI_Archive[0], false)
endfunction
    
function UI_Archive_Init takes nothing returns nothing
    local integer fFrame
    local integer i
    local integer j
    local real rUIx
    local real rUIy
    local string array sString
    //存档进入贴图
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive1", DzGetGameUI(), "template", 0)
    set frUI_Archive[1]=fFrame
    call DzFrameSetTexture(fFrame, "UI_Archive_Enter.blp", 0)
    call DzFrameSetAbsolutePoint(fFrame, 0, 0.02, 0.5) //绝对位置
call DzFrameSetSize(fFrame, 0.05, 0.05)
    //存档进入按钮
    set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive2", frUI_Archive[1], "template", 0)
    set frUI_Archive[2]=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_Archive[1])
    
    if ( GetLocalPlayer() == GetLocalPlayer() ) then
    	call DzFrameSetScriptByCode(fFrame, 1, function UI_Archive_Enter, false) //点击事件 
call DzFrameSetScriptByCode(fFrame, 2, function Trig_Archive_HeightLight_1, false) //鼠标进入
        call DzFrameSetScriptByCode(fFrame, 3, function Trig_Archive_HeightLight_2, false) //鼠标离开
    endif
    //存档页面背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive0", DzGetGameUI(), "template", 0)
    set frUI_Archive[0]=fFrame
    call DzFrameSetTexture(fFrame, "UI_BackGround1.blp", 0)
    call DzFrameSetPoint(fFrame, 4, DzGetGameUI(), 4, 0, 0.05)
    call DzFrameSetSize(fFrame, 0.35 * 1.25, 0.35)
    call DzFrameSetAlpha(fFrame, 255) //透明度
call DzFrameShow(fFrame, false)
    
    set sString[5]="UI_Archive_Button5.blp"
    set sString[1]="UI_Archive_Button1.blp"
    set sString[2]="UI_Archive_Button2.blp"
    set sString[3]="UI_Archive_Button3.blp"
    set sString[4]="UI_Archive_Button4.blp"
    
    set i=3
    set rUIy=2
    loop
        exitwhen i > 7
        //按钮贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[i - 2], 0)
        call DzFrameSetPoint(fFrame, 5, frUI_Archive[0], 3, 0.01, ( 0.07 ) * rUIy)
        call DzFrameSetSize(fFrame, 0.05, 0.05)
        //按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        
        set rUIy=rUIy - 1
        set i=i + 1
    endloop
    call Trig_Archive_HeightLight_8() //鼠标进入高亮
call Trig_Archive_HeightLight_9() //鼠标进入高亮
call Trig_Archive_HeightLight_10() //鼠标进入高亮
call Trig_Archive_HeightLight_11() //鼠标进入高亮
call Trig_Archive_HeightLight_12() //鼠标进入高亮

    set sString[1]="ReplaceableTextures\\CommandButtons\\BTNIceShard.blp"
    set sString[2]="ReplaceableTextures\\CommandButtons\\BTNSnazzyScrollPurple.blp"
    set sString[3]="ReplaceableTextures\\CommandButtons\\BTNPotionBlueBig.blp"
    set sString[4]="ReplaceableTextures\\CommandButtons\\BTNPotionGreen.blp"
    set sString[5]="ReplaceableTextures\\CommandButtons\\BTNDoomGuard.blp"
    
    //存档页面1
    set i=13
    set j=1
    set rUIx=- 2
    loop
        exitwhen i > 17
        //存档1贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[1], 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Archive[0], 1, 0.06 * rUIx, - 0.02)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //存档1按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        set rUIx=rUIx + 1
        set i=i + 1
        set j=j + 1
    endloop
    call Trig_Archive_HeightLight_18() //鼠标进入高亮
call Trig_Archive_HeightLight_19() //鼠标进入高亮
call Trig_Archive_HeightLight_20() //鼠标进入高亮
call Trig_Archive_HeightLight_21() //鼠标进入高亮
call Trig_Archive_HeightLight_22() //鼠标进入高亮

    //存档页面2
    set i=23
    set j=1
    set rUIx=- 2
    loop
        exitwhen i > 27
        //存档1贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[2], 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Archive[0], 1, 0.06 * rUIx, - 0.02)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //存档1按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        set rUIx=rUIx + 1
        set i=i + 1
        set j=j + 1
    endloop
    call Trig_Archive_HeightLight_28() //鼠标进入高亮
call Trig_Archive_HeightLight_29() //鼠标进入高亮
call Trig_Archive_HeightLight_30() //鼠标进入高亮
call Trig_Archive_HeightLight_31() //鼠标进入高亮
call Trig_Archive_HeightLight_32() //鼠标进入高亮

    //存档页面3
    set i=33
    set j=1
    set rUIx=- 2
    loop
        exitwhen i > 37
        //存档1贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[3], 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Archive[0], 1, 0.06 * rUIx, - 0.02)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //存档1按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        set rUIx=rUIx + 1
        set i=i + 1
        set j=j + 1
    endloop
    call Trig_Archive_HeightLight_38() //鼠标进入高亮
call Trig_Archive_HeightLight_39() //鼠标进入高亮
call Trig_Archive_HeightLight_40() //鼠标进入高亮
call Trig_Archive_HeightLight_41() //鼠标进入高亮
call Trig_Archive_HeightLight_42() //鼠标进入高亮

    //存档页面4
    set i=43
    set j=1
    set rUIx=- 2
    loop
        exitwhen i > 47
        //存档1贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[4], 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Archive[0], 1, 0.06 * rUIx, - 0.02)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //存档1按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        set rUIx=rUIx + 1
        set i=i + 1
        set j=j + 1
    endloop
    call Trig_Archive_HeightLight_48() //鼠标进入高亮
call Trig_Archive_HeightLight_49() //鼠标进入高亮
call Trig_Archive_HeightLight_50() //鼠标进入高亮
call Trig_Archive_HeightLight_51() //鼠标进入高亮
call Trig_Archive_HeightLight_52() //鼠标进入高亮

    
    //存档页面5
    set i=53
    set j=1
    set rUIx=- 2
    loop
        exitwhen i > 57
        //存档1贴图
        set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_Archive" + I2S(i), frUI_Archive[0], "template", 0)
        set frUI_Archive[i]=fFrame
        call DzFrameSetTexture(fFrame, sString[5], 0)
        call DzFrameSetPoint(fFrame, 1, frUI_Archive[0], 1, 0.06 * rUIx, - 0.02)
        call DzFrameSetSize(fFrame, 0.04, 0.04)
        //存档1按钮
        set fFrame=DzCreateFrameByTagName("BUTTON", "UI_Archive" + I2S(i + 5), frUI_Archive[0], "template", 0)
        set frUI_Archive[i + 5]=fFrame
        call DzFrameSetAllPoints(fFrame, frUI_Archive[i])
        set rUIx=rUIx + 1
        set i=i + 1
        set j=j + 1
    endloop
    call Trig_Archive_HeightLight_58() //鼠标进入高亮
call Trig_Archive_HeightLight_59() //鼠标进入高亮
call Trig_Archive_HeightLight_60() //鼠标进入高亮
call Trig_Archive_HeightLight_61() //鼠标进入高亮
call Trig_Archive_HeightLight_62() //鼠标进入高亮

    //文字背景
    set fFrame=DzCreateFrameByTagName("BACKDROP", "frUI_Archive_Text_BlackGround", frUI_Archive[0], "template", 0)
    set frUI_Archive_Text_BlackGround=fFrame
    call DzFrameSetTexture(fFrame, "UI_BackGround3.blp", 0)
    call DzFrameSetPoint(fFrame, 7, frUI_Archive[0], 7, 0, 0.03)
    call DzFrameSetSize(fFrame, 0.2 * 1.25, 0.2)
    call DzFrameSetAlpha(fFrame, 200) //透明度
//文字
set fFrame=DzCreateFrameByTagName("TEXT", "frUI_Archive_Text", frUI_Archive[0], "template", 0)
    set frUI_Archive_Text=fFrame
    call DzFrameSetPoint(fFrame, 1, frUI_Archive_Text_BlackGround, 1, 0, - 0.01) //相对位置
//call DzFrameSetText(fFrame, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
call DzFrameSetSize(fFrame, 0.2 * 1.25 - 0.01 * 2, 0) // 设置显示文本的地方的大小，一般只需要设置宽即可，高默认0.0，可自动换行
call DzFrameSetFont(fFrame, "uizt.ttf", 0.02, 0) // 设置文本的 字体 和字体大小   字体大小算法也跟像素一样算  0.01 = 一个字16个像素大

    //关闭按钮贴图
    set fFrame=DzCreateFrameByTagName("BACKDROP", "frUI_Archive_CloseButton_BlackGround", frUI_Archive[0], "template", 0)
    set frUI_Archive_CloseButton_BlackGround=fFrame
    call DzFrameSetTexture(fFrame, "UI_CloseButton_2.blp", 0)
    call DzFrameSetPoint(fFrame, 2, frUI_Archive[0], 2, 0, 0)
    call DzFrameSetSize(fFrame, 0.04, 0.04)
    //关闭按钮
    set fFrame=DzCreateFrameByTagName("BUTTON", "frUI_Archive_CloseButton", frUI_Archive[0], "template", 0)
    set frUI_Archive_CloseButton=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_Archive_CloseButton_BlackGround)
    if ( GetLocalPlayer() == GetLocalPlayer() ) then
    	call DzFrameSetScriptByCode(fFrame, 1, function UI_Archive_CloseButton, false) //鼠标点击
call DzFrameSetScriptByCode(fFrame, 2, function Trig_Archive_HeightLight_1, false) //鼠标进入
        call DzFrameSetScriptByCode(fFrame, 3, function Trig_Archive_HeightLight_2, false) //鼠标离开
    endif
endfunction
//===========================================================================
// Trigger: UI_Archive_String_Init
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function UI_Archive_String_Init takes nothing returns nothing
    local string sString
    local integer iNum
    local integer i
    //存档页面1**********************
    //存档1
    set iNum=18 //对应按钮
set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档2
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档3
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档4
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档5
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    
    //存档页面2**********************
    //存档1
    set iNum=28 //对应按钮
set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档2
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档3
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档4
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档5
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    
    
    //存档页面3**********************
    //存档1
    set iNum=38 //对应按钮
set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档2
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档3
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档4
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档5
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    
    
    //存档页面4**********************
    //存档1
    set iNum=48 //对应按钮
set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档2
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档3
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档4
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档5
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    
    
    //存档页面5**********************
    //存档1
    set iNum=58 //对应按钮
set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档2
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档3
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档4
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    //存档5
    set iNum=iNum + 1
    set sString=I2S(iNum)
    call SaveStr(htCommomHT, frUI_Archive[iNum], StringHash("UI_Archive" + I2S(iNum)), sString)
    
    
endfunction
//===========================================================================
// Trigger: UI_HighlightInit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function UI_HighlightInit takes nothing returns nothing
    local integer fFrame
    set fFrame=DzCreateFrameByTagName("BACKDROP", "UI_HeightLight", DzGetGameUI(), "template", 0) //创建Frame[Tag]
set frUI_HeightLight=fFrame
    call DzFrameSetAllPoints(fFrame, frUI_Talent[3]) //移动Frame1所有锚点到Frame2
call DzFrameSetTexture(fFrame, "UI_HighlightBlackGround.blp", 0) //设置贴图
call DzFrameSetAlpha(fFrame, 150) //透明度
call DzFrameShow(fFrame, false) //是否显示

endfunction
//===========================================================================
// Trigger: UIInit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_UIInitActions takes nothing returns nothing
    
    call UI_PlayTime_Dynamic()
    call UI_PlayTime_Init() //游戏时间
call UI_LifeBar_Dynamic_Init() //动态血条UI初始化
call UI_UnitStateInitActions() //单位属性
call UI_UnitState_String_Init() //单位属性
call UI_UnitStateDynamic() //单位属性动态显示
call Trig_UI_BuffSystemInitActions() //buffSystemInit
call UI_DamageDisPlayInit() //伤害显示UI
call UI_DamageDisplayDynamic()
    call UI_Talent_Init() //天赋UI初始化
call UI_Archive_Init() //存档UI初始化
call UI_Archive_String_Init() //存档文本，要放在存档UI初始化之后

    call UI_HighlightInit() //高亮背景图，最后初始化

    
    //UI优先级，父是游戏UI
    
    call DzFrameSetPriority(frUI_LifeBar_BackGround, 1) //血条
call DzFrameSetPriority(frUI_UnitState[0], 2) //属性
call DzFrameSetPriority(frUI_DamaDisp[0], 2) //伤害显示
call DzFrameSetPriority(frUI_Talent[0], 3) //天赋
call DzFrameSetPriority(frUI_Archive[0], 4) //存档
call DzFrameSetPriority(frUI_HeightLight, 5) //高亮

    
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_UIInit takes nothing returns nothing
    set gg_trg_UIInit=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_UIInit, 0.10)
    call TriggerAddAction(gg_trg_UIInit, function Trig_UIInitActions)
endfunction
//===========================================================================
// Trigger: 0_2_LeakDetection
//
// 泄露检测
//===========================================================================
function Trig_0_2_LeakDetectionActions takes nothing returns nothing
    call Cheat("exec-lua:test")
endfunction
//===========================================================================
function InitTrig_0_2_LeakDetection takes nothing returns nothing
    set gg_trg_0_2_LeakDetection=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_0_2_LeakDetection, Player(0))
    call TriggerAddAction(gg_trg_0_2_LeakDetection, function Trig_0_2_LeakDetectionActions)
endfunction
//===========================================================================
// Trigger: 1_4_HeroInit
//===========================================================================
//TESH.scrollpos=27
//TESH.alwaysfold=0
function Action_HeroInit takes nothing returns nothing
    local integer i
    call SetUnitInvulnerable(GetEnumUnit(), true)
    call UnitAddAbility(GetEnumUnit(), 'A019') //出售物品
call UnitAddAbility(GetEnumUnit(), 'A00P') //选择英雄
call AddItemToStock(GetEnumUnit(), 'I001', 1, 1) //添加出售物品：选择英雄
//为中立英雄添加6个占位物品
set i=0
    loop
        exitwhen i > 5
        call UnitAddItemToSlotById(GetEnumUnit(), 'I003', i)
        set i=i + 1
    endloop
endfunction
function Condition_HeroInit takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true ) and ( IsUnitOwnedByPlayer(GetFilterUnit(), Player(PLAYER_NEUTRAL_PASSIVE)) == true )
endfunction
//中立英雄初始化
function HeroInit takes nothing returns nothing
    local group gGroup= CreateGroup()
    local unit uMJUnit_ChoiceHero
    local real x= GetRectCenterX(gg_rct_Rect_ChoiceHero)
    local real y= GetRectCenterY(gg_rct_Rect_ChoiceHero)
    local integer i
    call GroupEnumUnitsInRect(gGroup, gg_rct_Rect_ChoiceHero, Condition(function Condition_HeroInit))
    call ForGroup(gGroup, function Action_HeroInit)
    call DestroyGroup(gGroup)
    //选择英雄视野马甲
    set i=0
    loop
        exitwhen i > ( iPlayerNum - 1 )
        if ( GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING ) then
            set uMJUnit_ChoiceHero=CreateUnit(Player(i), 'e00F', x, y, 0)
            call SaveUnitHandle(htCommomHT, GetHandleId(Player(i)), StringHash("uMJUnit_ChoiceHero"), uMJUnit_ChoiceHero)
        else //离开游戏不能选英雄
            call SaveInteger(htCommomHT, GetHandleId(Player(i)), StringHash("IsChoiceHero"), 1)
        endif
        set i=i + 1
    endloop
    set gGroup=null
    set uMJUnit_ChoiceHero=null
endfunction
//===========================================================================
// Trigger: 1_3ChoiceHero_1
//===========================================================================
//TESH.scrollpos=33
//TESH.alwaysfold=0
function Condition_GetRandomHero_Trig_1_3 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true ) and ( IsUnitOwnedByPlayer(GetFilterUnit(), Player(PLAYER_NEUTRAL_PASSIVE)) == true ) and ( GetUnitTypeId(GetFilterUnit()) != 'U003' )
endfunction
function GetRandomHeroId takes nothing returns integer
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local integer iUnitId
    local integer iGroupCount
    call GroupEnumUnitsInRect(gGroup, gg_rct_Rect_ChoiceHero, Condition(function Condition_GetRandomHero_Trig_1_3))
    set iGroupCount=CountUnitsInGroup(gGroup)
    if ( iGroupCount > 0 ) then
        set uGroupUnit=GroupPickRandomUnit(gGroup)
        set iUnitId=GetUnitTypeId(uGroupUnit)
        call RemoveUnit(uGroupUnit)
    else
        set iUnitId=0
    endif
    call DestroyGroup(gGroup)
    set gGroup=null
    set uGroupUnit=null
    return iUnitId
endfunction
function Trig_1_3ChoiceHero_1Actions takes nothing returns nothing
    local string sString
    local integer iNum
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(GetBuyingUnit())
    local unit uPet
    local unit uMJUnit_ChoiceHero= LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uMJUnit_ChoiceHero"))
    local integer iHeroId= GetUnitTypeId(uHero)
    local integer iIsChoiceHero= LoadInteger(htCommomHT, GetHandleId(pPlayer), StringHash("IsChoiceHero"))
    call RemoveItem(GetSoldItem()) //删除售出物品
call AddItemToStock(uHero, 'I001', 1, 1) //添加出售物品：选择英雄
if ( iIsChoiceHero == 0 ) then //还没选英雄
//call BJDebugMsg("ChoiceHero")
if ( iHeroId == 'U003' ) then //随机英雄
set iHeroId=GetRandomHeroId()
        else
            call RemoveUnit(uHero)
        endif
        call RemoveUnit(uMJUnit_ChoiceHero) //删除选择英雄马甲
call SaveInteger(htCommomHT, GetHandleId(pPlayer), StringHash("IsChoiceHero"), 1)
        set uHero=CreateUnit(pPlayer, iHeroId, GrHeroBirth_x, GrHeroBirth_y, 270)
        call SaveUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uHero"), uHero)
        set uPet=CreateUnit(pPlayer, 'e001', GrHeroBirth_x, GrHeroBirth_y + 300, 270)
        call SaveUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uPet"), uPet)
        if ( GetLocalPlayer() == pPlayer ) then //指定玩家镜头平移
call PanCameraToTimed(GrHeroBirth_x, GrHeroBirth_y, 0.2)
        endif
        call SelectUnitForPlayerSingle(uHero, pPlayer)
        //UI头像改变
        set sString=( EXExecuteScript("(require'jass.slk').unit[" + I2S(GetUnitTypeId(uHero)) + "].Art") )
        set iNum=GetPlayerId(pPlayer) + 1
        call DzFrameSetTexture(frUI_DamaDisp_Portrait[iNum], sString, 0) //设置贴图
else
        call DisplayTextToPlayer(pPlayer, 0, 0, "你已经选择了英雄，请勿再次选择")
    endif
    
    set uMJUnit_ChoiceHero=null
    set uHero=null
    set pPlayer=null
    set uPet=null
endfunction
function Trig_1_3ChoiceHero_1Conditions takes nothing returns boolean
    return ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( GetItemTypeId(GetSoldItem()) == 'I001' ) )
endfunction
//中立被动的单位出售物品，是英雄、售出物品是选择英雄
function InitTrig_1_3ChoiceHero_1 takes nothing returns nothing
    set gg_trg_1_3ChoiceHero_1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_1_3ChoiceHero_1, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_1_3ChoiceHero_1, Condition(function Trig_1_3ChoiceHero_1Conditions))
    call TriggerAddAction(gg_trg_1_3ChoiceHero_1, function Trig_1_3ChoiceHero_1Actions)
endfunction
//===========================================================================
// Trigger: 1_3ChoiceHero_2_Reskill
//
// 中立英雄学习技能，使用在训练之书
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_1_3ChoiceHero_2Actions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    call RemoveItem(UnitItemInSlot(uHero, 0))
    call UnitAddItemToSlotById(uHero, 'I002', 0) //再训练之书
    call UnitUseItem(uHero, UnitItemInSlot(uHero, 0))
    call UnitAddItemToSlotById(uHero, 'I003', 0) //占位物品
    set uHero=null
endfunction
function Trig_1_3ChoiceHero_2Conditions takes nothing returns boolean
    return ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) )
endfunction
//===========================================================================
function InitTrig_1_3ChoiceHero_2_Reskill takes nothing returns nothing
    set gg_trg_1_3ChoiceHero_2_Reskill=CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_1_3ChoiceHero_2_Reskill, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_1_3ChoiceHero_2_Reskill, Condition(function Trig_1_3ChoiceHero_2Conditions))
    call TriggerAddAction(gg_trg_1_3ChoiceHero_2_Reskill, function Trig_1_3ChoiceHero_2Actions)
endfunction
//===========================================================================
// Trigger: 1_5_F2Home
//
// F2回城
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_1_5_F2HomeActions takes nothing returns nothing
    local player pPlayer= DzGetTriggerKeyPlayer()
    local unit uHero= LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uHero"))
    call SetUnitX(uHero, GrHeroBirth_x) //立即移动
call SetUnitY(uHero, GrHeroBirth_y) //立即移动
if ( GetLocalPlayer() == pPlayer ) then //指定玩家镜头平移
call PanCameraToTimed(GrHeroBirth_x, GrHeroBirth_y, 0.2)
    endif
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", GrHeroBirth_x, GrHeroBirth_y))
    set pPlayer=null
    set uHero=null
endfunction
//===========================================================================
function InitTrig_1_5_F2Home takes nothing returns nothing
    set gg_trg_1_5_F2Home=CreateTrigger()
    call DzTriggerRegisterKeyEventTrg(gg_trg_1_5_F2Home , 1 , 113)
    call TriggerAddAction(gg_trg_1_5_F2Home, function Trig_1_5_F2HomeActions)
endfunction
//===========================================================================
// Trigger: 1_6_pet
//
// 宠物瞬移
// 宠物在选择英雄后创建
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function Trig_1_6_Conditions takes nothing returns boolean
    return ( ( GetUnitTypeId(GetTriggerUnit()) == 'e001' ) )
endfunction
function Trig_1_6_Actions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local location lLoc= GetOrderPointLoc()
    call SetUnitPositionLoc(uUnit, lLoc)
    call RemoveLocation(lLoc)
    set uUnit=null
    set lLoc=null
endfunction
//===========================================================================
function InitTrig_1_6_pet takes nothing returns nothing
    set gg_trg_1_6_pet=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_1_6_pet, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddCondition(gg_trg_1_6_pet, Condition(function Trig_1_6_Conditions))
    call TriggerAddAction(gg_trg_1_6_pet, function Trig_1_6_Actions)
endfunction
//===========================================================================
// Trigger: 1_7_RightClick
//
// 双击右键给予物品
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_Trig_1_7_RightClick takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uUnit"))
    local unit uAcceptItem= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uAcceptItem"))
    local item iItem= LoadItemHandle(htTimerHT, iTimerID, StringHash("iItem"))
    local integer iItemNumber1= LoadInteger(htTimerHT, iTimerID, StringHash("iItemNumber1"))
    local integer iItemNumber2= - 1
    local integer i
    set i=0
    loop
        exitwhen i > 5
        if ( iItem == UnitItemInSlot(uUnit, i) ) then
            set iItemNumber2=i
            call DoNothing()
 exitwhen true //(  )
        endif
        set i=i + 1
    endloop
    if ( iItemNumber1 == iItemNumber2 ) then
        call UnitAddItem(uAcceptItem, iItem)
    endif
    //End
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set tTimer=null
    set uUnit=null
    set uAcceptItem=null
    set iItem=null
endfunction
function Trig_1_7_RightClickActions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uUnit)
    local unit uHero
    local unit uPet
    local unit uAcceptItem
    local item iItem= GetOrderTargetItem()
    local integer i
    local integer iItemNumber1= - 1
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    call DisableTrigger(GetTriggeringTrigger()) //关闭触发
set uHero=LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uHero"))
    set uPet=LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uPet"))
    if ( uUnit == uHero ) then
        set uAcceptItem=uPet
    elseif ( uUnit == uPet ) then
        set uAcceptItem=uHero
    else
        return
    endif
    //call BJDebugMsg("GiveItem")
    set i=0
    loop
        exitwhen i > 5
        if ( iItem == UnitItemInSlot(uUnit, i) ) then
            set iItemNumber1=i
            call DoNothing()
 exitwhen true //(  )
        endif
        set i=i + 1
    endloop
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uUnit"), uUnit)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uAcceptItem"), uAcceptItem)
    call SaveItemHandle(htTimerHT, iTimerID, StringHash("iItem"), iItem)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iItemNumber1"), iItemNumber1)
    call TimerStart(tTimer, 0.1, false, function TimerAction_Trig_1_7_RightClick)
    
    call EnableTrigger(GetTriggeringTrigger()) //开启触发
set uUnit=null
    set pPlayer=null
    set uHero=null
    set uPet=null
    set uAcceptItem=null
    set iItem=null
    set tTimer=null
endfunction
//===========================================================================
function InitTrig_1_7_RightClick takes nothing returns nothing
    set gg_trg_1_7_RightClick=CreateTrigger()
    call YDWESyStemItemUnmovableRegistTrigger(gg_trg_1_7_RightClick)
    call TriggerAddAction(gg_trg_1_7_RightClick, function Trig_1_7_RightClickActions)
endfunction
//===========================================================================
// Trigger: 1_8_HeroRevive
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function TimerAction_Trig_1_8_HeroRevive takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local timerdialog tdTimerDialog= LoadTimerDialogHandle(htTimerHT, iTimerID, StringHash("tdTimerDialog"))
    call ReviveHero(uHero, GrHeroBirth_x, GrHeroBirth_y, true)
    call SetUnitLifePercentBJ(uHero, 100) //生命值100%
call SetUnitManaPercentBJ(uHero, 100) //魔法值100%
//End
call DestroyTimerDialog(tdTimerDialog)
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    set uHero=null
    set tTimer=null
    set tdTimerDialog=null
endfunction
function Trig_1_8_HeroReviveActions takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local timerdialog tdTimerDialog= CreateTimerDialog(tTimer)
    local string sTimerDialogTitle= ( GetUnitName(uHero) + "的复活时间：" )
    call TimerDialogSetTitle(tdTimerDialog, sTimerDialogTitle)
    call TimerDialogDisplay(tdTimerDialog, true)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveTimerDialogHandle(htTimerHT, iTimerID, StringHash("tdTimerDialog"), tdTimerDialog)
    call TimerStart(tTimer, 8., false, function TimerAction_Trig_1_8_HeroRevive)
    set uHero=null
    set tTimer=null
    set tdTimerDialog=null
endfunction
function Trig_1_8_HeroReviveConditions takes nothing returns boolean
    return ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( GetPlayerController(GetOwningPlayer(GetTriggerUnit())) == MAP_CONTROL_USER ) )
endfunction
function InitTrig_1_8_HeroRevive takes nothing returns nothing
    set gg_trg_1_8_HeroRevive=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_1_8_HeroRevive, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_1_8_HeroRevive, Condition(function Trig_1_8_HeroReviveConditions))
    call TriggerAddAction(gg_trg_1_8_HeroRevive, function Trig_1_8_HeroReviveActions)
endfunction
//===========================================================================
// Trigger: 1_9_Victory
//===========================================================================
function Trig_1_9_VictoryActions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_1_9_Victory takes nothing returns nothing
    set gg_trg_1_9_Victory=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_1_9_Victory, function Trig_1_9_VictoryActions)
endfunction
//===========================================================================
// Trigger: 1_10_Defeat
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_Trig_1_10_Defeat takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer i= 0
    loop
        exitwhen i > 3
        call CustomDefeatBJ(Player(i), "失败!")
        set i=i + 1
    endloop
    call DestroyTimer(tTimer)
    set tTimer=null
endfunction
function Trig_1_10_DefeatActions takes nothing returns nothing
    local timer tTimer= CreateTimer()
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "守护失败，游戏将在10s后结束")
    call TimerStart(tTimer, 10., false, function TimerAction_Trig_1_10_Defeat)
    set tTimer=null
endfunction
//===========================================================================
function InitTrig_1_10_Defeat takes nothing returns nothing
    set gg_trg_1_10_Defeat=CreateTrigger()
    call DoNothing()
    call TriggerRegisterUnitEvent(gg_trg_1_10_Defeat, gg_unit_nbfl_0009, EVENT_UNIT_DEATH)
    call TriggerAddAction(gg_trg_1_10_Defeat, function Trig_1_10_DefeatActions)
endfunction
//===========================================================================
// Trigger: 1_0_MapInit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function PanoramicView takes nothing returns nothing
    call FogMaskEnable(false) //禁止黑色阴影
call FogEnable(false) //禁止战争迷雾
call MeleeStartingVisibility() //对战昼夜
endfunction
function Trig_1_0_MapInitActions takes nothing returns nothing
    call PanoramicView() //全图视野

endfunction
//===========================================================================
function InitTrig_1_0_MapInit takes nothing returns nothing
    set gg_trg_1_0_MapInit=CreateTrigger()
    call TriggerAddAction(gg_trg_1_0_MapInit, function Trig_1_0_MapInitActions)
endfunction
//===========================================================================
// Trigger: 0_1_Global
//
// 矩形区域初始化
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

// Trigger: 1_1_Init
//
// 游戏开始0秒
//===========================================================================
//TESH.scrollpos=2
//TESH.alwaysfold=0
function Trig_1_1InitActions takes nothing returns nothing
    //Init
    call PanCameraToTimed(- 6350, - 6700, 0.) //所有玩家镜头平移到选择英雄区域
call HeroInit() //中立英雄初始化
call BrushUnitInit() //刷兵类型初始化
//call StartBrushTimer()          //开启刷兵计时器

    
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_1_1_Init takes nothing returns nothing
    set gg_trg_1_1_Init=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_1_1_Init, 0.00)
    call TriggerAddAction(gg_trg_1_1_Init, function Trig_1_1InitActions)
endfunction
//===========================================================================
// Trigger: Test2
//===========================================================================
function Trig_Test2Actions takes nothing returns nothing
    call DzSetUnitModel(gg_unit_E002_0017, "units\\human\\Footman\\Footman")
endfunction
//===========================================================================
function InitTrig_Test2 takes nothing returns nothing
    set gg_trg_Test2=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_Test2, function Trig_Test2Actions)
endfunction
//===========================================================================
// Trigger: MapTest
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_MapTestActions takes nothing returns nothing
    local integer i
    local integer value
    //call test_Brush()    
    call Cheat("thereisnospoon")
    set i=1
    loop
        exitwhen i > 5
        call SetPlayerAlliance(Player(i), Player(0), ALLIANCE_SHARED_CONTROL, true)
        set i=i + 1
    endloop
    call SetPlayerAlliance(Player(11), Player(0), ALLIANCE_SHARED_CONTROL, true)
    set value=GetHeroStr(gg_unit_E003_0037, true) + 10
    call SetHeroStr(gg_unit_E003_0037, value, true)
endfunction
//===========================================================================
function InitTrig_MapTest takes nothing returns nothing
    set gg_trg_MapTest=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_MapTest, 5.00)
    call TriggerAddAction(gg_trg_MapTest, function Trig_MapTestActions)
endfunction
//===========================================================================
// Trigger: BuffSystemTest1
//
// 输入9，刷新200个骑士
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_BuffSystemTest1Actions takes nothing returns nothing
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    local unit uMJUnit
    set i=1
    loop
        exitwhen i > 300
        set rDistance=I2R(GetRandomInt(1, 1000))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=- 5000 + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=- 2500 + rDistance * Sin(rDegree * bj_DEGTORAD)
        set uMJUnit=CreateUnit(Player(11), 'h008', x, y, 0)
        set i=i + 1
    endloop
    
    
    
    
    set uMJUnit=null
endfunction
//===========================================================================
function InitTrig_BuffSystemTest1 takes nothing returns nothing
    set gg_trg_BuffSystemTest1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_BuffSystemTest1, Player(0), "9", true)
    call TriggerAddAction(gg_trg_BuffSystemTest1, function Trig_BuffSystemTest1Actions)
endfunction
//===========================================================================
// Trigger: test_Animation
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_test11111111111111Actions takes nothing returns nothing
    local string sString= GetEventPlayerChatString()
    local unit uUnit= gg_unit_N00I_0136
    local integer i= 0
    //call SetUnitTimeScale(gg_unit_N000_0016, 3.)   //动画速度
    loop
        exitwhen i >= 12
        if ( sString == I2S(i) ) then
            call SetUnitAnimationByIndex(uUnit, i)
        endif
        set i=i + 1
    endloop
    set uUnit=null
endfunction
//===========================================================================
function InitTrig_test_Animation takes nothing returns nothing
    set gg_trg_test_Animation=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_test_Animation, Player(0), "", true)
    call TriggerAddAction(gg_trg_test_Animation, function Trig_test11111111111111Actions)
endfunction
//===========================================================================
// Trigger: test_Hero
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_test_HeroActions takes nothing returns nothing
    local player pPlayer= GetTriggerPlayer()
    local unit uHero= LoadUnitHandle(htCommomHT, GetHandleId(pPlayer), StringHash("uHero"))
    call SetHeroLevelBJ(uHero, 50, true)
    call SetHeroLevelBJ(gg_unit_E003_0037, 50, true)
    set pPlayer=null
    set uHero=null
endfunction
//===========================================================================
function InitTrig_test_Hero takes nothing returns nothing
    set gg_trg_test_Hero=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_test_Hero, Player(0), "50", true)
    call TriggerAddAction(gg_trg_test_Hero, function Trig_test_HeroActions)
endfunction
//===========================================================================
// Trigger: DamageSystemTest
//===========================================================================
//TESH.scrollpos=10
//TESH.alwaysfold=0
function Trig_DamageSystemTestActions takes nothing returns nothing
    local unit uAttacker= gg_unit_E003_0037
    local unit uUnit= gg_unit_hfoo_0052
    
    call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rLifeRecoCoef"), 100) //生命恢复系数
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rNonLifeReco"), 0) //禁止生命恢复

    //call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rManaRecoCoef"), 100)    //魔法恢复系数
    //call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rNonManaReco"), 0)  //禁止魔法恢复
    
    //攻击者属性
    call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_CriticalChance"), 50) //攻击单位暴击率
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_CriticalDamage"), 200) //攻击单位暴击伤害
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_ArmorPenetration"), 50) //攻击单位穿甲
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_Leech"), 10) //吸血

    call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellCriticalChance"), 50) //攻击单位法术暴击率
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellCriticalDamage"), 125) //攻击单位法术暴击伤害
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellResistancePenetration"), 42.3) //攻击单位法术穿透
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_SpellLeech"), 10) //攻击单位法术吸血
call SaveReal(htUnitHT, GetHandleId(uAttacker), StringHash("rDamageSystem_Increase"), 60) //攻击单位伤害增幅

    //被攻击者属性
    call US_SetUnitArmor(uUnit , 34.5) //被攻击单位护甲
call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_SpellResistance"), 30) //被攻击单位法术抗性
call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_Reduction"), 30) //被攻击单位伤害减免
call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamageSystem_ShieldValue"), 500) //被攻击单位护盾
call SaveReal(htUnitHT, GetHandleId(uUnit), StringHash("rBuffSystem_StateResistance"), 50) //被攻击单位状态抗性%

    set uAttacker=null
    set uUnit=null
endfunction
//===========================================================================
function InitTrig_DamageSystemTest takes nothing returns nothing
    set gg_trg_DamageSystemTest=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_DamageSystemTest, 0.50)
    call TriggerAddAction(gg_trg_DamageSystemTest, function Trig_DamageSystemTestActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    //Function not found: call InitTrig_View()
    //Function not found: call InitTrig_Math()
    //Function not found: call InitTrig_RB()
    //Function not found: call InitTrig_Commom()
    //Function not found: call InitTrig_UnitState()
    //Function not found: call InitTrig_HT()
    //Function not found: call InitTrig_ChargeSystem()
    //Function not found: call InitTrig_ChargeTraceSystem()
    //Function not found: call InitTrig_ChargeArrowSystem()
    //Function not found: call InitTrig_ChargeParabolaSystem()
    //Function not found: call InitTrig_SurroundSystem()
    //Function not found: call InitTrig_VerticalSurroundSystem()
    //Function not found: call InitTrig_SetHeightWay()
    //Function not found: call InitTrig_SetHeight_Acceleration()
    //Function not found: call InitTrig_SetDamageWay()
    //Function not found: call InitTrig_BarrageSystem()
    //Function not found: call InitTrig_DeleteDeathUnit()
    //Function not found: call InitTrig_Brush()
    call InitTrig_Award()
    //Function not found: call InitTrig_BuffSystemAction()
    call InitTrig_BuffSystemWork()
    //Function not found: call InitTrig_BuffSystemTimer()
    call InitTrig_BuffSystem_Add()
    //Function not found: call InitTrig_BuffSystem_StateInit()
    call InitTrig_BuffSystem_BuffTypeInit()
    //Function not found: call InitTrig_BuffSystem_StructInit()
    //Function not found: call InitTrig_Test_Buff1_A01C()
    //Function not found: call InitTrig_Test_Buff2_A01D()
    //Function not found: call InitTrig_Test_Buff3_A01E()
    //Function not found: call InitTrig_Test_Buff4_A01N()
    //Function not found: call InitTrig_Test_Buff4_A01V()
    //Function not found: call InitTrig_Test_Buff5_A01Q()
    //Function not found: call InitTrig_Test_Buff6_A01R()
    //Function not found: call InitTrig_Test_Buff7_A01S()
    //Function not found: call InitTrig_fuwang_Q_A005()
    call InitTrig_fuwang_E_A008()
    call InitTrig_fuwang_E_A008_Learn()
    //Function not found: call InitTrig_fuwang_R_A007()
    //Function not found: call InitTrig_siling_Q_A00B()
    //Function not found: call InitTrig_siling_W_A009()
    //Function not found: call InitTrig_siling_E()
    //Function not found: call InitTrig_siling_R_A00C()
    //Function not found: call InitTrig_siling_R_explode()
    //Function not found: call InitTrig_xiaoxiao_Q_A00H()
    //Function not found: call InitTrig_xiaoxiao_W_A00I()
    call InitTrig_xiaoxiao_E_A00J()
    call InitTrig_xiaoxiao_E_A00J_Learn()
    call InitTrig_xiaoxiao_R_Learn()
    //Function not found: call InitTrig_zhuzai_Q_A00W()
    //Function not found: call InitTrig_zhuzai_R_A00M()
    //Function not found: call InitTrig_yougui_Q_A010()
    //Function not found: call InitTrig_youguiW()
    call InitTrig_youguiE()
    //Function not found: call InitTrig_yougui_R_A00O()
    //Function not found: call InitTrig_renma_Q_A018()
    //Function not found: call InitTrig_renma_W_A017()
    //Function not found: call InitTrig_renma_E_A016()
    //Function not found: call InitTrig_renma_R_A015()
    call InitTrig_AbilityTrigger()
    call InitTrig_LearnAbilityTrigger()
    call InitTrig_UnitDeath()
    //Function not found: call InitTrig_EffectFontInit()
    //Function not found: call InitTrig_DamageDisplay()
    call InitTrig_DamageSystem()
    call InitTrig_Ability_DamageTrigger()
    //Function not found: call InitTrig_Trig_UI_PlayTime_Init()
    //Function not found: call InitTrig_Trig_UI_PlayTime_Dynamic()
    call InitTrig_UI_LifeBar_Init()
    //Function not found: call InitTrig_UI_LifeBar_Dynamic()
    //Function not found: call InitTrig_UI_UnitStateInit()
    //Function not found: call InitTrig_UI_UnitState_String_Init()
    //Function not found: call InitTrig_UI_UnitStateDynamic()
    call InitTrig_UI_UnitStateTrigger()
    call InitTrig_UI_BuffSystemInit()
    call InitTrig_UI_BuffSystemDynamic()
    //Function not found: call InitTrig_UI_DamageDisPlayInit()
    //Function not found: call InitTrig_UI_DamageDisplayDynamic()
    //Function not found: call InitTrig_UI_Talent_Init()
    //Function not found: call InitTrig_UI_Archive_Init()
    //Function not found: call InitTrig_UI_Archive_String_Init()
    //Function not found: call InitTrig_UI_HighlightInit()
    call InitTrig_UIInit()
    call InitTrig_0_2_LeakDetection()
    //Function not found: call InitTrig_1_4_HeroInit()
    call InitTrig_1_3ChoiceHero_1()
    call InitTrig_1_3ChoiceHero_2_Reskill()
    call InitTrig_1_5_F2Home()
    call InitTrig_1_6_pet()
    call InitTrig_1_7_RightClick()
    call InitTrig_1_8_HeroRevive()
    call InitTrig_1_9_Victory()
    call InitTrig_1_10_Defeat()
    call InitTrig_1_0_MapInit()
    //Function not found: call InitTrig_0_1_Global()
    call InitTrig_1_1_Init()
    call InitTrig_Test2()
    call InitTrig_MapTest()
    call InitTrig_BuffSystemTest1()
    call InitTrig_test_Animation()
    call InitTrig_test_Hero()
    call InitTrig_DamageSystemTest()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_1_0_MapInit)
    call ConditionalTriggerExecute(gg_trg_Test2)
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)
    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)
    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(6), false)
    call SetPlayerController(Player(6), MAP_CONTROL_COMPUTER)
    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_COMPUTER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
    // Player 9
    call SetPlayerStartLocation(Player(9), 9)
    call ForcePlayerStartLocation(Player(9), 9)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(9), false)
    call SetPlayerController(Player(9), MAP_CONTROL_COMPUTER)
    // Player 10
    call SetPlayerStartLocation(Player(10), 10)
    call ForcePlayerStartLocation(Player(10), 10)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(10), false)
    call SetPlayerController(Player(10), MAP_CONTROL_COMPUTER)
    // Player 11
    call SetPlayerStartLocation(Player(11), 11)
    call ForcePlayerStartLocation(Player(11), 11)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(11), false)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_014
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    // Force: TRIGSTR_015
    call SetPlayerTeam(Player(6), 1)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(7), 1)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 1)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 4)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 4)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 4)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 4)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 4)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateRegions()
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs448185671")
call ExecuteFunc("DeleteDeathUnit___DeleteDeathUnitInit")
call ExecuteFunc("HashTable___HashTableInit")
call ExecuteFunc("EffectFontInit")
call ExecuteFunc("SetDamageWay___SetDamageWayInit")
call ExecuteFunc("SetHeightAcceleration___SetHeight_AcceInit")
call ExecuteFunc("SetHeightWay___SetHeightWayInit")
call ExecuteFunc("View__ViewInit")
call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("BarrageSystem___BarrageSystemInit")
call ExecuteFunc("YDWETimerSystem___Init")
call ExecuteFunc("ChargeArrowSystem___ChargeArrowSystemInit")
call ExecuteFunc("ChargeParabolaSystem___ChargeParabolaSystemInit")
call ExecuteFunc("ChargeSystem___ChargeSystemInit")
call ExecuteFunc("ChargeTraceSystem___ChargeTraceSystemInit")
call ExecuteFunc("SurroundSystemInit")
call ExecuteFunc("VerticalSurroundSystemInit")

    call InitGlobals()
    call InitCustomTriggers()
    call RunInitializationTriggers()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("Defense")
    call SetMapDescription("没有说明")
    call SetPlayers(12)
    call SetTeams(12)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, - 576.0, - 7296.0)
    call DefineStartLocation(1, - 576.0, - 7296.0)
    call DefineStartLocation(2, - 576.0, - 7296.0)
    call DefineStartLocation(3, - 576.0, - 7296.0)
    call DefineStartLocation(4, - 576.0, - 7296.0)
    call DefineStartLocation(5, - 576.0, - 7296.0)
    call DefineStartLocation(6, - 512.0, 6784.0)
    call DefineStartLocation(7, - 512.0, 6784.0)
    call DefineStartLocation(8, - 512.0, 6784.0)
    call DefineStartLocation(9, - 512.0, 6784.0)
    call DefineStartLocation(10, - 512.0, 6784.0)
    call DefineStartLocation(11, - 512.0, 6784.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction
//===========================================================================  
//===========================================================================  
//自定义事件 
//===========================================================================
//===========================================================================   
//===========================================================================
//系统-TimerSystem
//===========================================================================
    
    




//Struct method generated initializers/callers:
function sa__DamageData_TimerAction_Damage takes nothing returns boolean

            local integer i= 1
            local integer Num= SetDamageWay___iNum_Damage
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            if Num == 0 then
                call PauseTimer(SetDamageWay___tTimer_Damage)
                set SetDamageWay___bTimerState_Damage=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(SetDamageWay___iData_Damage[i])
                if ( SetDamageWay___iData_Damage[i] != 0 ) and ( s__DamageData_uUnit[st] != null ) and ( s__DamageData_iDamageWay[st] != 0 ) and ( s__DamageData_rMoveTime[st] <= s__DamageData_rTotalTime[st] ) then
                    set s__DamageData_rMoveTime[st]=s__DamageData_rMoveTime[st] + rTimerInterval_Damage
                    set s__DamageData_rCount[st]=s__DamageData_rCount[st] + rTimerInterval_Damage
                    if ( s__DamageData_rCount[st] >= s__DamageData_iDamageTimeInterval[st] ) then //相当于取余，因为实数取余有问题，所以用if代替
set s__DamageData_rCount[st]=0.
                        if ( s__DamageData_iDamageWay[st] == 11 ) then
                            call sc__DamageData_Damage_Single(st)
                        elseif ( s__DamageData_iDamageWay[st] == 1 ) or ( s__DamageData_iDamageWay[st] == 2 ) then
                            call sc__DamageData_Damage_Group(st)
                        endif
                    endif
                else
                    set SetDamageWay___iData_Damage[i]=0
                    set SetDamageWay___iNum_Damage=SetDamageWay___iNum_Damage - 1
                    call sc__DamageData_deallocate(st)
                    if ( i != Num ) then //伤害完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetDamageWay___iData_Damage[i]=SetDamageWay___iData_Damage[Num]
                    endif
                    set SetDamageWay___iData_Damage[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__DamageData_Damage_Single takes nothing returns boolean
local integer st=f__arg_integer1
            local player pPlayer= GetOwningPlayer(s__DamageData_uUnit[st])
            if ( GetUnitState(s__DamageData_uGetDamageUnit[st], UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(s__DamageData_uGetDamageUnit[st], pPlayer) == false ) then
                 call UnitDamageTarget(s__DamageData_uUnit[st], s__DamageData_uGetDamageUnit[st], s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            endif
            set pPlayer=null
   return true
endfunction
function sa__DamageData_Damage_Group takes nothing returns boolean
local integer st=f__arg_integer1
            local real x= GetUnitX(s__DamageData_uUnit[st])
            local real y= GetUnitY(s__DamageData_uUnit[st])
            local player pPlayer= GetOwningPlayer(s__DamageData_uUnit[st])
            local group gGroup= CreateGroup()
            local unit uGroupUnit
            call GroupEnumUnitsInRange(gGroup, x, y, s__DamageData_rDamageRange[st], null)
            loop
                set uGroupUnit=FirstOfGroup(gGroup)
                exitwhen uGroupUnit == null
                call GroupRemoveUnit(gGroup, uGroupUnit)
                if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
                    if ( s__DamageData_iDamageWay[st] == 2 ) then //多次伤害
call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                    elseif ( s__DamageData_iDamageWay[st] == 1 ) then //1次伤害
if ( IsUnitInGroup(uGroupUnit, s__DamageData_gGroup[st]) == false ) then
                            call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                            call GroupAddUnit(s__DamageData_gGroup[st], uGroupUnit)
                        endif
                    endif
                endif
            endloop
            call DestroyGroup(gGroup)
            set pPlayer=null
            set uGroupUnit=null
            set gGroup=null
   return true
endfunction
function sa__DamageData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__DamageData_iDamageWay[this] == 1 ) then
                call DestroyGroup(s__DamageData_gGroup[this])
            endif
            set s__DamageData_iDamageWay[this]=0 //1:群体一次伤害，2:群体多次伤害，11.单体伤害
set s__DamageData_uUnit[this]=null //单位
set s__DamageData_rDamage[this]=0. //伤害
set s__DamageData_rTotalTime[this]=0. //伤害时间限制
set s__DamageData_rMoveTime[this]=0. //已经伤害的时间
set s__DamageData_iDamageTimeInterval[this]=0. //伤害时间间隔
set s__DamageData_uGetDamageUnit[this]=null
            set s__DamageData_rDamageRange[this]=0. //伤害半径范围
set s__DamageData_gGroup[this]=null //伤害单位组
            set s__DamageData_rCount[this]=0. //每移动一次加0.1，用于伤害结算
   return true
endfunction
function sa__EachBuffData_create takes nothing returns boolean

        local integer st
        set st=s__EachBuffData__allocate()
set f__result_integer= st
   return true
endfunction
function sa__EachBuffData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
        local integer i
        set s__EachBuffData_uBuffUnit[this]=null
        set s__EachBuffData_uAttackerUnit[this]=null
        set s__EachBuffData_sBuffName[this]=null
        set s__EachBuffData_iBuffPolarity[this]=0
        set s__EachBuffData_rBuffDuration[this]=0.
        set s__EachBuffData_rBuffTriggerTime[this]=0.
        set s__EachBuffData_rBuffMoveTime_Duration[this]=0.
        set s__EachBuffData_rBuffMoveTime_TriggerTime[this]=0.
        set s__EachBuffData_bIsBuffClean[this]=false
        set s__EachBuffData_rBuffDamage[this]=0.
        set s__EachBuffData_bIsBuffLayer[this]=false
        set s__EachBuffData_iBuffLayer[this]=0
        set s__EachBuffData_iBuffLayerMax[this]=0
        set s__EachBuffData_iIsBuffDizziness[this]=0 //眩晕
set s__EachBuffData_iIsBuffChangeShape[this]=0 //变形
set s__EachBuffData_iIsBuffScare[this]=0 //惊吓
set s__EachBuffData_iIsBuffBlind[this]=0 //致盲
set s__EachBuffData_iIsImmovable[this]=0 //定身，不能移动
set s__EachBuffData_iBuffState_Num[this]=0
        set i=1
        loop
            exitwhen i > 5
            set s___EachBuffData_iBuffState_Type[s__EachBuffData_iBuffState_Type[this]+i]=0
            set s___EachBuffData_rBuffState_Data[s__EachBuffData_rBuffState_Data[this]+i]=0.
            set i=i + 1
        endloop
        set s__EachBuffData_eBuffEffect[this]=null
   return true
endfunction
function sa__VerticalSurroundData_TimerAction_VerticalSurround takes nothing returns boolean

            local integer i= 1
            local integer Num= VerticalSurroundSystem___iNum_VerticalSurround
            local integer st
            local real x
            local real y
            local real rDegree_Centre
            if ( Num == 0 ) then
                call PauseTimer(VerticalSurroundSystem___tTimer_VerticalSurround)
                set VerticalSurroundSystem___bTimerState_VerticalSurround=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(VerticalSurroundSystem___iData_VerticalSurround[i])
                if ( VerticalSurroundSystem___iData_VerticalSurround[i] != 0 ) and ( s__VerticalSurroundData_uOutsideUnit[st] != null ) and ( GetUnitState(s__VerticalSurroundData_uOutsideUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__VerticalSurroundData_rMoveTime[st] <= s__VerticalSurroundData_rTotalTime[st] ) and ( s__VerticalSurroundData_rMoveSurrDegree[st] <= s__VerticalSurroundData_rTotalSurrDegree[st] ) then
                    set rDegree_Centre=GetUnitFacing(s__VerticalSurroundData_uCentreUnit[st])
                    set x=GetUnitX(s__VerticalSurroundData_uCentreUnit[st])
                    set y=GetUnitY(s__VerticalSurroundData_uCentreUnit[st])
                    set x=x + ( s__VerticalSurroundData_rCentreDistance[st] * Sin(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) ) * Cos(( rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st] ) * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=y + ( s__VerticalSurroundData_rCentreDistance[st] * Sin(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) ) * Sin(( rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st] ) * bj_DEGTORAD)
                    set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
call SetUnitX(s__VerticalSurroundData_uOutsideUnit[st], x)
                    call SetUnitY(s__VerticalSurroundData_uOutsideUnit[st], y)
                    call SetUnitFlyHeight(s__VerticalSurroundData_uOutsideUnit[st], s__VerticalSurroundData_rCentreDistance[st] * Cos(s__VerticalSurroundData_rNowSurrDegree[st] * bj_DEGTORAD) + s__VerticalSurroundData_rAddHeight[st], 0.) //高度
call SetUnitFacing(s__VerticalSurroundData_uOutsideUnit[st], rDegree_Centre + s__VerticalSurroundData_rSurrOffsetAngle[st])
                    set s__VerticalSurroundData_rNowSurrDegree[st]=s__VerticalSurroundData_rNowSurrDegree[st] + s__VerticalSurroundData_rEverySurrDegree[st] //实际角度
set s__VerticalSurroundData_rMoveSurrDegree[st]=s__VerticalSurroundData_rMoveSurrDegree[st] + s__VerticalSurroundData_rEverySurrDegree[st] //已经完成(当前)的环绕角度
if ( s__VerticalSurroundData_rEveryDistance[st] > 0 ) then
                        set s__VerticalSurroundData_rCentreDistance[st]=s__VerticalSurroundData_rCentreDistance[st] + s__VerticalSurroundData_rEveryDistance[st] //中心距离变化
endif
                    set s__VerticalSurroundData_rMoveTime[st]=s__VerticalSurroundData_rMoveTime[st] + rTimerInterval_VerticalSurround
                else
                    set VerticalSurroundSystem___iData_VerticalSurround[i]=0
                    set VerticalSurroundSystem___iNum_VerticalSurround=VerticalSurroundSystem___iNum_VerticalSurround - 1
                    call sc__VerticalSurroundData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set VerticalSurroundSystem___iData_VerticalSurround[i]=VerticalSurroundSystem___iData_VerticalSurround[Num]
                    endif
                    set VerticalSurroundSystem___iData_VerticalSurround[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__VerticalSurroundData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__VerticalSurroundData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__VerticalSurroundData_uOutsideUnit[this])
            endif
            set s__VerticalSurroundData_uCentreUnit[this]=null //中心单位
set s__VerticalSurroundData_uOutsideUnit[this]=null //外围单位
set s__VerticalSurroundData_bIsDestroyUnit[this]=false //环绕结束是否删除单位
            set s__VerticalSurroundData_rSurrOffsetAngle[this]=0.
            set s__VerticalSurroundData_rNowSurrDegree[this]=0. //初始环绕角度，实际角度
set s__VerticalSurroundData_rTotalSurrDegree[this]=0. //总环绕角度
set s__VerticalSurroundData_rMoveSurrDegree[this]=0. //已经完成(当前)的环绕角度
set s__VerticalSurroundData_rEverySurrDegree[this]=0. //每次移动的环绕角度
            set s__VerticalSurroundData_rTotalTime[this]=0. //环绕时间限制
set s__VerticalSurroundData_rMoveTime[this]=0. //已经环绕的时间
            set s__VerticalSurroundData_rCentreDistance[this]=0. //当前与中心的距离，需要输入参数，相当于初始距离
set s__VerticalSurroundData_rEveryDistance[this]=0. //每0.03秒移动的距离，可以小于0
set s__VerticalSurroundData_rAddHeight[this]=0. //附加高度
   return true
endfunction
function sa__SurroundData_TimerAction_Surround takes nothing returns boolean

            local integer i= 1
            local integer Num= SurroundSystem___iNum_Surround
            local integer st
            local real x
            local real y
            if ( Num == 0 ) then
                call PauseTimer(SurroundSystem___tTimer_Surround)
                set SurroundSystem___bTimerState_Surround=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(SurroundSystem___iData_Surround[i])
                if ( SurroundSystem___iData_Surround[i] != 0 ) and ( s__SurroundData_uOutsideUnit[st] != null ) and ( GetUnitState(s__SurroundData_uOutsideUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__SurroundData_iSurroundMode[st] != 0 ) and ( s__SurroundData_rMoveTime[st] <= s__SurroundData_rTotalTime[st] ) and ( s__SurroundData_rMoveSurrDegree[st] <= s__SurroundData_rTotalSurrDegree[st] ) then
                    if ( s__SurroundData_iSurroundMode[st] == 1 ) then //1:Coord,2:Unit
set x=s__SurroundData_rSurrx[st]
                        set y=s__SurroundData_rSurry[st]
                    elseif ( s__SurroundData_iSurroundMode[st] == 2 ) then
                        set x=GetUnitX(s__SurroundData_uCentreUnit[st])
                        set y=GetUnitY(s__SurroundData_uCentreUnit[st])
                    endif
                    set x=x + s__SurroundData_rCentreDistance[st] * Cos(s__SurroundData_rNowSurrDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=y + s__SurroundData_rCentreDistance[st] * Sin(s__SurroundData_rNowSurrDegree[st] * bj_DEGTORAD)
                    set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
call SetUnitX(s__SurroundData_uOutsideUnit[st], x)
                    call SetUnitY(s__SurroundData_uOutsideUnit[st], y)
                    call SetUnitFacing(s__SurroundData_uOutsideUnit[st], s__SurroundData_rNowSurrDegree[st] + s__SurroundData_rUnitFacDegree[st])
                    set s__SurroundData_rNowSurrDegree[st]=s__SurroundData_rNowSurrDegree[st] + s__SurroundData_rEverySurrDegree[st] //实际角度
set s__SurroundData_rMoveSurrDegree[st]=s__SurroundData_rMoveSurrDegree[st] + s__SurroundData_rEverySurrDegree[st] //已经完成(当前)的环绕角度
set s__SurroundData_rCentreDistance[st]=s__SurroundData_rCentreDistance[st] + s__SurroundData_rEveryDistance[st] //中心距离变化
                    set s__SurroundData_rMoveTime[st]=s__SurroundData_rMoveTime[st] + rTimerInterval_Surround
                else
                    set SurroundSystem___iData_Surround[i]=0
                    set SurroundSystem___iNum_Surround=SurroundSystem___iNum_Surround - 1
                    call sc__SurroundData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SurroundSystem___iData_Surround[i]=SurroundSystem___iData_Surround[Num]
                    endif
                    set SurroundSystem___iData_Surround[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__SurroundData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__SurroundData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__SurroundData_uOutsideUnit[this])
            endif
            set s__SurroundData_iSurroundMode[this]=0 //环绕模式,1:Coord,2:Unit
set s__SurroundData_rSurrx[this]=0. //初始坐标
set s__SurroundData_rSurry[this]=0. //初始坐标
set s__SurroundData_uCentreUnit[this]=null //中心单位
set s__SurroundData_uOutsideUnit[this]=null //外围单位
set s__SurroundData_bIsDestroyUnit[this]=false //环绕结束是否删除单位
            set s__SurroundData_rUnitFacDegree[this]=0. //单位面向角度，直接加到rMoveSurrDegree上
            set s__SurroundData_rNowSurrDegree[this]=0. //初始环绕角度，实际角度
set s__SurroundData_rTotalSurrDegree[this]=0. //总环绕角度
set s__SurroundData_rMoveSurrDegree[this]=0. //已经完成(当前)的环绕角度
set s__SurroundData_rEverySurrDegree[this]=0. //每次移动的环绕角度
            set s__SurroundData_rTotalTime[this]=0. //环绕时间限制
set s__SurroundData_rMoveTime[this]=0. //已经环绕的时间
            set s__SurroundData_rCentreDistance[this]=0. //当前与中心的距离，需要输入参数，相当于初始距离
set s__SurroundData_rEveryDistance[this]=0. //每0.03秒移动的距离，可以小于0
   return true
endfunction
function sa__ChargeTraceData_TimerAction_ChargeTrace takes nothing returns boolean

            local integer i= 1
            local integer Num= ChargeTraceSystem___iNum_ChargeTrace
            local integer st
            local real Distance1
            if Num == 0 then
                call PauseTimer(ChargeTraceSystem___tTimer_ChargeTrace)
                set ChargeTraceSystem___bTimerState_ChargeTrace=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(ChargeTraceSystem___iData_ChargeTrace[i])
                if ( ChargeTraceSystem___iData_ChargeTrace[i] != 0 ) and ( s__ChargeTraceData_uUnit[st] != null ) and ( GetUnitState(s__ChargeTraceData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeTraceData_rMoveTime[st] <= s__ChargeTraceData_rTotalTime[st] ) then
                    set Distance1=Math_GetUnitDistance(s__ChargeTraceData_uUnit[st] , s__ChargeTraceData_uTargetUnit[st])
                    set s__ChargeTraceData_rDegree[st]=Math_GetUnitDegree(s__ChargeTraceData_uUnit[st] , s__ChargeTraceData_uTargetUnit[st])
                    set s__ChargeTraceData_rEveryDistance[st]=Distance1 / ( s__ChargeTraceData_rTotalTime[st] - s__ChargeTraceData_rMoveTime[st] ) * rTimerInterval_ChargeTrace
                    set s__ChargeTraceData_rInitx[st]=s__ChargeTraceData_rInitx[st] + s__ChargeTraceData_rEveryDistance[st] * Cos(s__ChargeTraceData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeTraceData_rInity[st]=s__ChargeTraceData_rInity[st] + s__ChargeTraceData_rEveryDistance[st] * Sin(s__ChargeTraceData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeTraceData_rInitx[st]=IsXExceedBoundary(s__ChargeTraceData_rInitx[st]) //x坐标边界检测
set s__ChargeTraceData_rInity[st]=IsYExceedBoundary(s__ChargeTraceData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rInitx[st])
                    call SetUnitY(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rInity[st])
                    call SetUnitFacing(s__ChargeTraceData_uUnit[st], s__ChargeTraceData_rDegree[st])
                    set s__ChargeTraceData_rMoveTime[st]=s__ChargeTraceData_rMoveTime[st] + rTimerInterval_ChargeTrace
                else
                    set ChargeTraceSystem___iData_ChargeTrace[i]=0
                    set ChargeTraceSystem___iNum_ChargeTrace=ChargeTraceSystem___iNum_ChargeTrace - 1
                    call sc__ChargeTraceData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeTraceSystem___iData_ChargeTrace[i]=ChargeTraceSystem___iData_ChargeTrace[Num]
                    endif
                    set ChargeTraceSystem___iData_ChargeTrace[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__ChargeTraceData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__ChargeTraceData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeTraceData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeTraceData_uUnit[this]), StringHash("iUnitChargeTraceDataAdress"), 0)
            set s__ChargeTraceData_uUnit[this]=null //单位
set s__ChargeTraceData_uTargetUnit[this]=null //目标单位
set s__ChargeTraceData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeTraceData_rInitx[this]=0. //初始坐标
set s__ChargeTraceData_rInity[this]=0. //初始坐标
set s__ChargeTraceData_rDegree[this]=0. //角度
set s__ChargeTraceData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeTraceData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeTraceData_rEveryDistance[this]=0. //每0.03秒移动的距离
   return true
endfunction
function sa__ChargeData_TimerAction_Charge takes nothing returns boolean

            local integer i= 1
            local integer Num= ChargeSystem___iNum_Charge
            local integer st
            if Num == 0 then
                call PauseTimer(ChargeSystem___tTimer_Charge)
                set ChargeSystem___bTimerState_Charge=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(ChargeSystem___iData_Charge[i])
                if ( ChargeSystem___iData_Charge[i] != 0 ) and ( s__ChargeData_uUnit[st] != null ) and ( GetUnitState(s__ChargeData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeData_rMoveTime[st] <= s__ChargeData_rTotalTime[st] ) and ( s__ChargeData_rMoveDistance[st] <= s__ChargeData_rTotalDistance[st] ) then
                    set s__ChargeData_rInitx[st]=s__ChargeData_rInitx[st] + s__ChargeData_rEveryDistance[st] * Cos(s__ChargeData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeData_rInity[st]=s__ChargeData_rInity[st] + s__ChargeData_rEveryDistance[st] * Sin(s__ChargeData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeData_rInitx[st]=IsXExceedBoundary(s__ChargeData_rInitx[st]) //x坐标边界检测
set s__ChargeData_rInity[st]=IsYExceedBoundary(s__ChargeData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeData_uUnit[st], s__ChargeData_rInitx[st])
                    call SetUnitY(s__ChargeData_uUnit[st], s__ChargeData_rInity[st])
                    call SetUnitFacing(s__ChargeData_uUnit[st], s__ChargeData_rDegree[st])
                    set s__ChargeData_rMoveDistance[st]=s__ChargeData_rMoveDistance[st] + s__ChargeData_rEveryDistance[st]
                    set s__ChargeData_rMoveTime[st]=s__ChargeData_rMoveTime[st] + rTimerInterval_Charge
                else
                    call s__ChargeData_ChargeTriggerAction(st)
                    set ChargeSystem___iData_Charge[i]=0
                    set ChargeSystem___iNum_Charge=ChargeSystem___iNum_Charge - 1
                    call sc__ChargeData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeSystem___iData_Charge[i]=ChargeSystem___iData_Charge[Num]
                    endif
                    set ChargeSystem___iData_Charge[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__ChargeData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__ChargeData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeData_uUnit[this]), StringHash("iUnitChargeDataAdress"), 0)
            set s__ChargeData_uUnit[this]=null //单位
set s__ChargeData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeData_rInitx[this]=0. //初始坐标
set s__ChargeData_rInity[this]=0. //初始坐标
set s__ChargeData_rDegree[this]=0. //角度
set s__ChargeData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeData_rTotalDistance[this]=0. //总距离
set s__ChargeData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeData_rEveryDistance[this]=0. //每0.03秒移动的距离
   return true
endfunction
function sa__ChargeParabolaData_TimerAction_ChargeParabola takes nothing returns boolean

            local integer i= 1
            local integer Num= ChargeParabolaSystem___iNum_ChargeParabola
            local integer st
            local real rMoveHeight
            if Num == 0 then
                call PauseTimer(ChargeParabolaSystem___tTimer_ChargeParabola)
                set ChargeParabolaSystem___bTimerState_ChargeParabola=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(ChargeParabolaSystem___iData_ChargeParabola[i])
                if ( ChargeParabolaSystem___iData_ChargeParabola[i] != 0 ) and ( s__ChargeParabolaData_uUnit[st] != null ) and ( GetUnitState(s__ChargeParabolaData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeParabolaData_rMoveTime[st] <= s__ChargeParabolaData_rTotalTime[st] ) and ( s__ChargeParabolaData_rMoveDistance[st] <= s__ChargeParabolaData_rTotalDistance[st] ) then
                    set s__ChargeParabolaData_rInitx[st]=s__ChargeParabolaData_rInitx[st] + s__ChargeParabolaData_rEveryDistance[st] * Cos(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeParabolaData_rInity[st]=s__ChargeParabolaData_rInity[st] + s__ChargeParabolaData_rEveryDistance[st] * Sin(s__ChargeParabolaData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeParabolaData_rInitx[st]=IsXExceedBoundary(s__ChargeParabolaData_rInitx[st]) //x坐标边界检测
set s__ChargeParabolaData_rInity[st]=IsYExceedBoundary(s__ChargeParabolaData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rInitx[st])
                    call SetUnitY(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rInity[st])
                    call SetUnitFacing(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rDegree[st])
                    set s__ChargeParabolaData_rMoveDistance[st]=s__ChargeParabolaData_rMoveDistance[st] + s__ChargeParabolaData_rEveryDistance[st]
                    set s__ChargeParabolaData_rMoveTime[st]=s__ChargeParabolaData_rMoveTime[st] + rTimerInterval_ChargeParabola
                    set s__ChargeParabolaData_rMoveTime_Switch[st]=s__ChargeParabolaData_rMoveTime_Switch[st] + rTimerInterval_ChargeParabola
                    if ( s__ChargeParabolaData_iUpDownFlag[st] == 1 ) then //上升
                        set rMoveHeight=s__ChargeParabolaData_rInitSpeed[st] * s__ChargeParabolaData_rMoveTime_Switch[st] - 0.5 * s__ChargeParabolaData_rAcceleration[st] * Pow(s__ChargeParabolaData_rMoveTime_Switch[st], 2)
                        set s__ChargeParabolaData_rCurrentHeight[st]=s__ChargeParabolaData_rInitHeight[st] + rMoveHeight
                    elseif ( s__ChargeParabolaData_iUpDownFlag[st] == 2 ) then //下降
                        set rMoveHeight=s__ChargeParabolaData_rInitSpeed[st] * s__ChargeParabolaData_rMoveTime_Switch[st] + 0.5 * s__ChargeParabolaData_rAcceleration[st] * Pow(s__ChargeParabolaData_rMoveTime_Switch[st], 2)
                        set s__ChargeParabolaData_rCurrentHeight[st]=s__ChargeParabolaData_rInitHeight[st] - rMoveHeight
                    endif
                    call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rCurrentHeight[st], 0.)
                    if ( s__ChargeParabolaData_rMoveTime_Switch[st] >= s__ChargeParabolaData_rSwitchTime[st] ) then
                        set s__ChargeParabolaData_rMoveTime_Switch[st]=0
                        if ( s__ChargeParabolaData_iUpDownFlag[st] == 1 ) then //0:Stop,1:Up,2:Down，到最高点
                            set s__ChargeParabolaData_iUpDownFlag[st]=2
                            set s__ChargeParabolaData_rInitHeight[st]=s__ChargeParabolaData_rMaxHeight[st]
                            set s__ChargeParabolaData_rTargetHeight[st]=s__ChargeParabolaData_rMinHeight[st]
                            call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rMaxHeight[st], 0.)
                            set s__ChargeParabolaData_rInitSpeed[st]=0
                            call s__ChargeParabolaData_ChargeParabolaCreateMJUnit(st)
                        elseif ( s__ChargeParabolaData_iUpDownFlag[st] == 2 ) then //最低点
set s__ChargeParabolaData_iUpDownFlag[st]=1
                            set s__ChargeParabolaData_rInitHeight[st]=s__ChargeParabolaData_rMinHeight[st]
                            set s__ChargeParabolaData_rTargetHeight[st]=s__ChargeParabolaData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__ChargeParabolaData_uUnit[st], s__ChargeParabolaData_rMinHeight[st], 0.)
                            set s__ChargeParabolaData_rInitSpeed[st]=s__ChargeParabolaData_rAcceleration[st] * s__ChargeParabolaData_rSwitchTime[st] //初始速度
call s__ChargeParabolaData_ChargeParabolaTriggerAction(st)
                        endif
                    endif
                else
                    call s__ChargeParabolaData_ChargeParabolaTriggerAction(st)
                    set ChargeParabolaSystem___iData_ChargeParabola[i]=0
                    set ChargeParabolaSystem___iNum_ChargeParabola=ChargeParabolaSystem___iNum_ChargeParabola - 1
                    call sc__ChargeParabolaData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeParabolaSystem___iData_ChargeParabola[i]=ChargeParabolaSystem___iData_ChargeParabola[Num]
                    endif
                    set ChargeParabolaSystem___iData_ChargeParabola[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__ChargeParabolaData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__ChargeParabolaData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeParabolaData_uUnit[this])
            endif
            call UnitRemoveAbility(s__ChargeParabolaData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
call SaveInteger(htUnitHT, GetHandleId(s__ChargeParabolaData_uUnit[this]), StringHash("iUnitChargeParabolaDataAdress"), 0)
            set s__ChargeParabolaData_uUnit[this]=null //单位
set s__ChargeParabolaData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeParabolaData_rInitx[this]=0. //初始坐标
set s__ChargeParabolaData_rInity[this]=0. //初始坐标
set s__ChargeParabolaData_rDegree[this]=0. //角度
set s__ChargeParabolaData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeParabolaData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeParabolaData_rTotalDistance[this]=0. //总距离
set s__ChargeParabolaData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeParabolaData_rEveryDistance[this]=0. //每0.03秒移动的距离
set s__ChargeParabolaData_rSwitchTime[this]=0. //到最高/最低点时切换的时间
set s__ChargeParabolaData_rMoveTime_Switch[this]=0. //用于切换时间
set s__ChargeParabolaData_rParabolaTimes[this]=0. //抛物线次数
set s__ChargeParabolaData_rReduceHeight[this]=0. //每完成一次抛物线减少的最大高度
set s__ChargeParabolaData_iUpDownFlag[this]=0 //0:Stop,1:Up,2:Down
set s__ChargeParabolaData_rInitHeight[this]=0. //初始高度
set s__ChargeParabolaData_rTargetHeight[this]=0. //目标高度
set s__ChargeParabolaData_rMaxHeight[this]=0. //最高高度
set s__ChargeParabolaData_rMinHeight[this]=0. //最低高度
set s__ChargeParabolaData_rCurrentHeight[this]=0. //当前高度
set s__ChargeParabolaData_rInitSpeed[this]=0. //初始速度
set s__ChargeParabolaData_rAcceleration[this]=0. //加速度
   return true
endfunction
function sa__ChargeArrowData_TimerAction_ChargeArrow takes nothing returns boolean

            local integer i= 1
            local integer Num= ChargeArrowSystem___iNum_ChargeArrow
            local integer st
            if Num == 0 then
                call PauseTimer(ChargeArrowSystem___tTimer_ChargeArrow)
                set ChargeArrowSystem___bTimerState_ChargeArrow=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(ChargeArrowSystem___iData_ChargeArrow[i])
                if ( ChargeArrowSystem___iData_ChargeArrow[i] != 0 ) and ( s__ChargeArrowData_uUnit[st] != null ) and ( GetUnitState(s__ChargeArrowData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__ChargeArrowData_bIsHitUnit[st] == false ) and ( s__ChargeArrowData_rMoveTime[st] <= s__ChargeArrowData_rTotalTime[st] ) and ( s__ChargeArrowData_rMoveDistance[st] <= s__ChargeArrowData_rTotalDistance[st] ) then
                    call s__ChargeArrowData_ChargeArrowAction(st)
                    if ( s__ChargeArrowData_bIsHitUnit[st] == true ) then
return true
                    endif
                    set s__ChargeArrowData_rInitx[st]=s__ChargeArrowData_rInitx[st] + s__ChargeArrowData_rEveryDistance[st] * Cos(s__ChargeArrowData_rDegree[st] * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__ChargeArrowData_rInity[st]=s__ChargeArrowData_rInity[st] + s__ChargeArrowData_rEveryDistance[st] * Sin(s__ChargeArrowData_rDegree[st] * bj_DEGTORAD)
                    set s__ChargeArrowData_rInitx[st]=IsXExceedBoundary(s__ChargeArrowData_rInitx[st]) //x坐标边界检测
set s__ChargeArrowData_rInity[st]=IsYExceedBoundary(s__ChargeArrowData_rInity[st]) //y坐标边界检测
call SetUnitX(s__ChargeArrowData_uUnit[st], s__ChargeArrowData_rInitx[st])
                    call SetUnitY(s__ChargeArrowData_uUnit[st], s__ChargeArrowData_rInity[st])
                    set s__ChargeArrowData_rMoveDistance[st]=s__ChargeArrowData_rMoveDistance[st] + s__ChargeArrowData_rEveryDistance[st]
                    set s__ChargeArrowData_rMoveTime[st]=s__ChargeArrowData_rMoveTime[st] + rTimerInterval_ChargeArrow
                else
                    call s__ChargeArrowData_ChargeArrowTriggerAction(st)
                    set ChargeArrowSystem___iData_ChargeArrow[i]=0
                    set ChargeArrowSystem___iNum_ChargeArrow=ChargeArrowSystem___iNum_ChargeArrow - 1
                    call sc__ChargeArrowData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set ChargeArrowSystem___iData_ChargeArrow[i]=ChargeArrowSystem___iData_ChargeArrow[Num]
                    endif
                    set ChargeArrowSystem___iData_ChargeArrow[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__ChargeArrowData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__ChargeArrowData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__ChargeArrowData_uUnit[this])
            endif
            call SaveInteger(htUnitHT, GetHandleId(s__ChargeArrowData_uUnit[this]), StringHash("iUnitChargeArrowDataAdress"), 0)
            set s__ChargeArrowData_uUnit[this]=null //单位
set s__ChargeArrowData_bIsDestroyUnit[this]=false //冲锋结束是否删除单位
set s__ChargeArrowData_rInitx[this]=0. //初始坐标
set s__ChargeArrowData_rInity[this]=0. //初始坐标
set s__ChargeArrowData_rDegree[this]=0. //角度
set s__ChargeArrowData_rTotalTime[this]=0. //冲锋时间限制
set s__ChargeArrowData_rMoveTime[this]=0. //已经冲锋的时间
set s__ChargeArrowData_rTotalDistance[this]=0. //总距离
set s__ChargeArrowData_rMoveDistance[this]=0. //已经移动的距离
set s__ChargeArrowData_rEveryDistance[this]=0. //每0.03秒移动的距离
set s__ChargeArrowData_bIsHitUnit[this]=false //月神箭到最后是否击中单位
set s__ChargeArrowData_uHitUnit[this]=null //被月神箭击中的单位
   return true
endfunction
function sa__BarrageData_SetControlPoint takes nothing returns boolean
local integer st=f__arg_integer1
local real rReverseDegree= GetDegree(s__BarrageData_P0_x[st] , s__BarrageData_P0_y[st] , s__BarrageData_P3_x[st] , s__BarrageData_P3_y[st]) + 180.
            local real rRadius_P1= GetRandomReal(200., 800.)
            local real rRadius_P2= GetRandomReal(200., 800.)
            local real rDegree_P1= rReverseDegree + GetRandomReal(- 60., 60.)
            local real rDegree_P2= GetRandomReal(0., 360.)
            set s__BarrageData_P1_x[st]=s__BarrageData_P0_x[st] + rRadius_P1 * Cos(rDegree_P1 * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__BarrageData_P1_y[st]=s__BarrageData_P0_y[st] + rRadius_P1 * Sin(rDegree_P1 * bj_DEGTORAD)
            set s__BarrageData_P2_x[st]=s__BarrageData_P3_x[st] + rRadius_P2 * Cos(rDegree_P2 * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set s__BarrageData_P2_y[st]=s__BarrageData_P3_y[st] + rRadius_P2 * Sin(rDegree_P2 * bj_DEGTORAD)
   return true
endfunction
function sa__BarrageData_TimerAction_Barrage takes nothing returns boolean

            local integer i= 1
            local integer Num= BarrageSystem___iNum_Barrage
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            if Num == 0 then
                call PauseTimer(BarrageSystem___tTimer_Barrage)
                set BarrageSystem___bTimerState_Barrage=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(BarrageSystem___iData_Barrage[i])
                if ( BarrageSystem___iData_Barrage[i] != 0 ) and ( s__BarrageData_uUnit[st] != null ) and ( GetUnitState(s__BarrageData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__BarrageData_t[st] < 1. ) and ( s__BarrageData_rMoveTime[st] <= s__BarrageData_rTotalTime[st] ) then
                    set s__BarrageData_rMoveTime[st]=s__BarrageData_rMoveTime[st] + rTimerInterval_Barrage
                    set s__BarrageData_t[st]=s__BarrageData_t[st] + s__BarrageData_Everyt[st]
                    call s__BarrageData_BesselCurveFormula(st)
                else
                    set BarrageSystem___iData_Barrage[i]=0
                    set BarrageSystem___iNum_Barrage=BarrageSystem___iNum_Barrage - 1
                    call sc__BarrageData_deallocate(st)
                    if ( i != Num ) then //弹幕完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set BarrageSystem___iData_Barrage[i]=BarrageSystem___iData_Barrage[Num]
                    endif
                    set BarrageSystem___iData_Barrage[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__BarrageData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            if ( s__BarrageData_bIsDestroyUnit[this] == true ) then
                call KillUnit(s__BarrageData_uUnit[this])
            endif
            set s__BarrageData_uUnit[this]=null //单位
set s__BarrageData_uTargetUnit[this]=null
            set s__BarrageData_bIsDestroyUnit[this]=false //弹幕结束是否删除单位
set s__BarrageData_rTotalTime[this]=0. //弹幕时间限制
set s__BarrageData_rMoveTime[this]=0. //已经弹幕的时间
set s__BarrageData_t[this]=0. //取值：0-1
set s__BarrageData_Everyt[this]=0. //每0.03秒变化的
set s__BarrageData_rBt_x[this]=0.
            set s__BarrageData_rBt_y[this]=0.
            set s__BarrageData_P0_x[this]=0.
            set s__BarrageData_P0_y[this]=0.
            set s__BarrageData_P1_x[this]=0.
            set s__BarrageData_P1_y[this]=0.
            set s__BarrageData_P2_x[this]=0.
            set s__BarrageData_P2_y[this]=0.
            set s__BarrageData_P3_x[this]=0.
            set s__BarrageData_P3_y[this]=0.
   return true
endfunction
function sa__HeightData_TimerAction_Height takes nothing returns boolean

            local integer i= 1
            local integer Num= SetHeightWay___iNum_Height
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            if Num == 0 then
                call PauseTimer(SetHeightWay___tTimer_Height)
                set SetHeightWay___bTimerState_Height=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(SetHeightWay___iData_Height[i])
                if ( SetHeightWay___iData_Height[i] != 0 ) and ( s__HeightData_uUnit[st] != null ) and ( GetUnitState(s__HeightData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__HeightData_rMoveTime[st] <= s__HeightData_rTotalTime[st] ) then
                    set s__HeightData_rMoveTime[st]=s__HeightData_rMoveTime[st] + rTimerInterval_Height
                    call s__HeightData_SetHeight(st)
                else
                    set SetHeightWay___iData_Height[i]=0
                    set SetHeightWay___iNum_Height=SetHeightWay___iNum_Height - 1
                    call sc__HeightData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetHeightWay___iData_Height[i]=SetHeightWay___iData_Height[Num]
                    endif
                    set SetHeightWay___iData_Height[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__HeightData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call UnitRemoveAbility(s__HeightData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__HeightData_uUnit[this]=null
            set s__HeightData_rTotalTime[this]=0.
            set s__HeightData_rMoveTime[this]=0.
            set s__HeightData_iFlyMode[this]=0
            set s__HeightData_iUpDownFlag[this]=0
            set s__HeightData_rExtremeHeight[this]=0.
            set s__HeightData_rCurrentHeight[this]=0.
            set s__HeightData_rEveryHeight[this]=0.
   return true
endfunction
function sa__SetHeight_AcceData_TimerAction_SetHeight_Acce takes nothing returns boolean

            local integer i= 1
            local integer Num= SetHeightAcceleration___iNum_SetHeight_Acce
            local integer st
            local real rDistance1
            local real rUnitx
            local real rUnity
            local real rMoveHeight
            if Num == 0 then
                call PauseTimer(SetHeightAcceleration___tTimer_SetHeight_Acce)
                set SetHeightAcceleration___bTimerState_SetHeight_Acce=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(SetHeightAcceleration___iData_SetHeight_Acce[i])
                if ( SetHeightAcceleration___iData_SetHeight_Acce[i] != 0 ) and ( s__SetHeight_AcceData_uUnit[st] != null ) and ( GetUnitState(s__SetHeight_AcceData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__SetHeight_AcceData_rTotalMoveTime[st] <= s__SetHeight_AcceData_rTotalTime[st] ) then
                    set s__SetHeight_AcceData_rTotalMoveTime[st]=s__SetHeight_AcceData_rTotalMoveTime[st] + rTimerInterval_SetHeight_Acce
                    set s__SetHeight_AcceData_rMoveTime_Switch[st]=s__SetHeight_AcceData_rMoveTime_Switch[st] + rTimerInterval_SetHeight_Acce
                    if ( s__SetHeight_AcceData_iUpDownFlag[st] == 1 ) then //上升
                        set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] - 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] + rMoveHeight
                    elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //下降
                        set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] + 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] - rMoveHeight
                    endif
                    call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rCurrentHeight[st], 0.)
                    if ( s__SetHeight_AcceData_rMoveTime_Switch[st] >= s__SetHeight_AcceData_rSwitchTime[st] ) then
                        set s__SetHeight_AcceData_rMoveTime_Switch[st]=0
                        if ( s__SetHeight_AcceData_iUpDownFlag[st] == 1 ) then //0:Stop,1:Up,2:Down，到最高点
                            set s__SetHeight_AcceData_iUpDownFlag[st]=2
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMaxHeight[st], 0.)
                            set s__SetHeight_AcceData_rInitSpeed[st]=0
                        elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //最低点
set s__SetHeight_AcceData_iUpDownFlag[st]=1
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMinHeight[st], 0.)
                            set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st]
                        endif
                    endif
                else
                    set SetHeightAcceleration___iData_SetHeight_Acce[i]=0
                    set SetHeightAcceleration___iNum_SetHeight_Acce=SetHeightAcceleration___iNum_SetHeight_Acce - 1
                    call sc__SetHeight_AcceData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set SetHeightAcceleration___iData_SetHeight_Acce[i]=SetHeightAcceleration___iData_SetHeight_Acce[Num]
                    endif
                    set SetHeightAcceleration___iData_SetHeight_Acce[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__SetHeight_AcceData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call UnitRemoveAbility(s__SetHeight_AcceData_uUnit[this], 'Arav') //乌鸦技能，可以设置高度
set s__SetHeight_AcceData_uUnit[this]=null //单位
set s__SetHeight_AcceData_rTotalTime[this]=0. //总时间
set s__SetHeight_AcceData_rTotalMoveTime[this]=0. //已经走的时间
set s__SetHeight_AcceData_rSwitchTime[this]=0. //到最高/最低点时切换的时间
set s__SetHeight_AcceData_rMoveTime_Switch[this]=0. //用于切换时间.
set s__SetHeight_AcceData_iUpDownFlag[this]=0 //0:Stop,1:Up,2:Down
set s__SetHeight_AcceData_iFlyMode[this]=0 //飞行模式,0:没有,1:只上升,2:只下降,3:先升后降
set s__SetHeight_AcceData_rInitHeight[this]=0. //初始高度
set s__SetHeight_AcceData_rTargetHeight[this]=0. //目标高度
set s__SetHeight_AcceData_rMaxHeight[this]=0. //最高高度
set s__SetHeight_AcceData_rMinHeight[this]=0. //最低高度
set s__SetHeight_AcceData_rCurrentHeight[this]=0. //当前高度
set s__SetHeight_AcceData_rInitSpeed[this]=0. //初始速度
set s__SetHeight_AcceData_rAcceleration[this]=0. //加速度
   return true
endfunction

function jasshelper__initstructs448185671 takes nothing returns nothing
    set st__DamageData_TimerAction_Damage=CreateTrigger()
    call TriggerAddCondition(st__DamageData_TimerAction_Damage,Condition( function sa__DamageData_TimerAction_Damage))
    set st__DamageData_Damage_Single=CreateTrigger()
    call TriggerAddCondition(st__DamageData_Damage_Single,Condition( function sa__DamageData_Damage_Single))
    set st__DamageData_Damage_Group=CreateTrigger()
    call TriggerAddCondition(st__DamageData_Damage_Group,Condition( function sa__DamageData_Damage_Group))
    set st__DamageData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__DamageData_onDestroy,Condition( function sa__DamageData_onDestroy))
    set st__EachBuffData_create=CreateTrigger()
    call TriggerAddCondition(st__EachBuffData_create,Condition( function sa__EachBuffData_create))
    set st__EachBuffData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__EachBuffData_onDestroy,Condition( function sa__EachBuffData_onDestroy))
    set st__VerticalSurroundData_TimerAction_VerticalSurround=CreateTrigger()
    call TriggerAddCondition(st__VerticalSurroundData_TimerAction_VerticalSurround,Condition( function sa__VerticalSurroundData_TimerAction_VerticalSurround))
    set st__VerticalSurroundData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__VerticalSurroundData_onDestroy,Condition( function sa__VerticalSurroundData_onDestroy))
    set st__SurroundData_TimerAction_Surround=CreateTrigger()
    call TriggerAddCondition(st__SurroundData_TimerAction_Surround,Condition( function sa__SurroundData_TimerAction_Surround))
    set st__SurroundData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__SurroundData_onDestroy,Condition( function sa__SurroundData_onDestroy))
    set st__ChargeTraceData_TimerAction_ChargeTrace=CreateTrigger()
    call TriggerAddCondition(st__ChargeTraceData_TimerAction_ChargeTrace,Condition( function sa__ChargeTraceData_TimerAction_ChargeTrace))
    set st__ChargeTraceData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__ChargeTraceData_onDestroy,Condition( function sa__ChargeTraceData_onDestroy))
    set st__ChargeData_TimerAction_Charge=CreateTrigger()
    call TriggerAddCondition(st__ChargeData_TimerAction_Charge,Condition( function sa__ChargeData_TimerAction_Charge))
    set st__ChargeData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__ChargeData_onDestroy,Condition( function sa__ChargeData_onDestroy))
    set st__ChargeParabolaData_TimerAction_ChargeParabola=CreateTrigger()
    call TriggerAddCondition(st__ChargeParabolaData_TimerAction_ChargeParabola,Condition( function sa__ChargeParabolaData_TimerAction_ChargeParabola))
    set st__ChargeParabolaData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__ChargeParabolaData_onDestroy,Condition( function sa__ChargeParabolaData_onDestroy))
    set st__ChargeArrowData_TimerAction_ChargeArrow=CreateTrigger()
    call TriggerAddCondition(st__ChargeArrowData_TimerAction_ChargeArrow,Condition( function sa__ChargeArrowData_TimerAction_ChargeArrow))
    set st__ChargeArrowData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__ChargeArrowData_onDestroy,Condition( function sa__ChargeArrowData_onDestroy))
    set st__BarrageData_SetControlPoint=CreateTrigger()
    call TriggerAddCondition(st__BarrageData_SetControlPoint,Condition( function sa__BarrageData_SetControlPoint))
    set st__BarrageData_TimerAction_Barrage=CreateTrigger()
    call TriggerAddCondition(st__BarrageData_TimerAction_Barrage,Condition( function sa__BarrageData_TimerAction_Barrage))
    set st__BarrageData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__BarrageData_onDestroy,Condition( function sa__BarrageData_onDestroy))
    set st__HeightData_TimerAction_Height=CreateTrigger()
    call TriggerAddCondition(st__HeightData_TimerAction_Height,Condition( function sa__HeightData_TimerAction_Height))
    set st__HeightData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__HeightData_onDestroy,Condition( function sa__HeightData_onDestroy))
    set st__SetHeight_AcceData_TimerAction_SetHeight_Acce=CreateTrigger()
    call TriggerAddCondition(st__SetHeight_AcceData_TimerAction_SetHeight_Acce,Condition( function sa__SetHeight_AcceData_TimerAction_SetHeight_Acce))
    set st__SetHeight_AcceData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__SetHeight_AcceData_onDestroy,Condition( function sa__SetHeight_AcceData_onDestroy))














endfunction

