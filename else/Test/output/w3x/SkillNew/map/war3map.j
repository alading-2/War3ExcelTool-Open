globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from HashTable:
constant boolean LIBRARY_HashTable=true
hashtable htCommomHT
hashtable htTimerHT
hashtable htUnitHT
hashtable htTriggerHT
//endglobals from HashTable
//globals from I2H:
constant boolean LIBRARY_I2H=true
hashtable I2H___ht=InitHashtable()
//endglobals from I2H
//globals from LBKKAPI:
constant boolean LIBRARY_LBKKAPI=true
string MOVE_TYPE_NONE= "none"
string MOVE_TYPE_FOOT= "foot"
string MOVE_TYPE_HORSE= "horse"
string MOVE_TYPE_FLY= "fly"
string MOVE_TYPE_HOVER= "hover"
string MOVE_TYPE_FLOAT= "float"
string MOVE_TYPE_AMPH= "amph"
string MOVE_TYPE_UNBUILD= "unbuild"
constant integer DEFENSE_TYPE_LIGHT= 0
constant integer DEFENSE_TYPE_MEDIUM= 1
constant integer DEFENSE_TYPE_LARGE= 2
constant integer DEFENSE_TYPE_FORT= 3
constant integer DEFENSE_TYPE_NORMAL= 4
constant integer DEFENSE_TYPE_HERO= 5
constant integer DEFENSE_TYPE_DIVINE= 6
constant integer DEFENSE_TYPE_NONE= 7
//endglobals from LBKKAPI
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
constant integer SetHeight_Acce_ConstantSpeed= 1
constant integer SetHeight_Acce_AcceleratedSpeed= 2
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
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//ȫ�ֹ�ϣ�� 
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
string array YDWEBase__yd_PlayerColor
trigger array YDWEBase__AbilityCastingOverEventQueue
integer array YDWEBase__AbilityCastingOverEventType
integer YDWEBase__AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEEventDamageData:
constant boolean LIBRARY_YDWEEventDamageData=true
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_VAILD= 0
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL= 1
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK= 2
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED= 3
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE= 4
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_WEAPON_TYPE= 5
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE= 6
//endglobals from YDWEEventDamageData
//globals from YDWEGetUnitsInRectMatchingNull:
constant boolean LIBRARY_YDWEGetUnitsInRectMatchingNull=true
group yd_NullTempGroup
//endglobals from YDWEGetUnitsInRectMatchingNull
//globals from YDWEJapiEffect:
constant boolean LIBRARY_YDWEJapiEffect=true
//endglobals from YDWEJapiEffect
//globals from YDWEJapiUnit:
constant boolean LIBRARY_YDWEJapiUnit=true
//endglobals from YDWEJapiUnit
//globals from YDWETriggerEvent:
constant boolean LIBRARY_YDWETriggerEvent=true
trigger yd_DamageEventTrigger= null
trigger array YDWETriggerEvent__DamageEventQueue
integer YDWETriggerEvent__DamageEventNumber= 0
	
item bj_lastMovedItemInItemSlot= null
	
trigger YDWETriggerEvent__MoveItemEventTrigger= null
trigger array YDWETriggerEvent__MoveItemEventQueue
integer YDWETriggerEvent__MoveItemEventNumber= 0
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
//globals from BarrageSystem:
constant boolean LIBRARY_BarrageSystem=true
timer BarrageSystem___tTimer_Barrage
integer BarrageSystem___iTimerID_Barrage
integer BarrageSystem___iNum_Barrage= 0
integer array BarrageSystem___iData_Barrage
boolean BarrageSystem___bTimerState_Barrage= false
constant real rTimerInterval_Barrage= 0.03
        
constant integer iBarrageMode_Coord= 1
constant integer iBarrageMode_Unit= 2
//endglobals from BarrageSystem
//globals from Commom:
constant boolean LIBRARY_Commom=true
constant integer PlayerNum= 4
//endglobals from Commom
//globals from YDWEGetUnitsInRectAllNull:
constant boolean LIBRARY_YDWEGetUnitsInRectAllNull=true
//endglobals from YDWEGetUnitsInRectAllNull
//globals from YDWETimerSystem:
constant boolean LIBRARY_YDWETimerSystem=true
integer YDWETimerSystem__CurrentTime
integer YDWETimerSystem__CurrentIndex
integer YDWETimerSystem__TaskListHead
integer YDWETimerSystem__TaskListIdleHead
integer YDWETimerSystem__TaskListIdleMax
integer array YDWETimerSystem__TaskListIdle
integer array YDWETimerSystem__TaskListNext
integer array YDWETimerSystem__TaskListTime
trigger array YDWETimerSystem__TaskListProc
trigger YDWETimerSystem__fnRemoveUnit
trigger YDWETimerSystem__fnDestroyTimer
trigger YDWETimerSystem__fnRemoveItem
trigger YDWETimerSystem__fnDestroyEffect
trigger YDWETimerSystem__fnDestroyLightning
trigger YDWETimerSystem__fnRunTrigger
timer YDWETimerSystem__Timer
integer YDWETimerSystem__TimerHandle
integer YDWETimerSystem__TimerSystem_RunIndex= 0
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
//globals from FollowSystem:
constant boolean LIBRARY_FollowSystem=true
timer FollowSystem___tTimer_Follow
integer FollowSystem___iTimerID_Follow
integer FollowSystem___iNum_Follow= 0
integer array FollowSystem___iData_Follow
boolean FollowSystem___bTimerState_Follow= false
constant real rTimerInterval_Follow= 0.03
        
//endglobals from FollowSystem
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
    // User-defined
hashtable udg_htHashTable= null
integer udg_PlayerNum= 0
    // Generated
rect gg_rct______________000= null
rect gg_rct______________001= null
camerasetup gg_cam_Camera_001= null
sound gg_snd_BlizzardTarget2= null
trigger gg_trg_Init= null
trigger gg_trg_Init1= null
trigger gg_trg_TX= null
trigger gg_trg_TX_Cycle= null
trigger gg_trg_reset= null
trigger gg_trg_50Level= null
trigger gg_trg_TXtest= null
trigger gg_trg_1= null
trigger gg_trg_Damage= null
trigger gg_trg_UnitDeath= null
trigger gg_trg_test111= null
trigger gg_trg_test1= null
trigger gg_trg_J2= null
trigger gg_trg_J= null
trigger gg_trg_Init2= null
trigger gg_trg_View= null
trigger gg_trg_Math= null
trigger gg_trg_RB= null
trigger gg_trg_Commom= null
trigger gg_trg_UnitState= null
trigger gg_trg_HashTable= null
trigger gg_trg_Template______________________u= null
trigger gg_trg_FollowSystem= null
trigger gg_trg_ChargeSystem_11= null
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
trigger gg_trg_JASSTemplate= null
trigger gg_trg_3C______u= null
trigger gg_trg_2_A00B_1= null
trigger gg_trg_2_A00B_____________u= null
trigger gg_trg_1_A00H________________u= null
trigger gg_trg_3_A001__________u= null
trigger gg_trg_4_A00F________________u= null
trigger gg_trg_5_A00C___________________u= null
trigger gg_trg_6_A00J________________u= null
trigger gg_trg_7_A00N________________u= null
trigger gg_trg_9_A00P= null
trigger gg_trg_10_A00Q_____________u= null
trigger gg_trg_11_A00R_________________________u= null
trigger gg_trg_20_A005= null
trigger gg_trg_28_A01N________________u= null
trigger gg_trg_29_A01O= null
trigger gg_trg_24_A01J________________u= null
trigger gg_trg_19_A01D________________u= null
trigger gg_trg_8_A00O________________u= null
trigger gg_trg_12_A00U________________u= null
trigger gg_trg_13_A00Z________________u= null
trigger gg_trg_14_A010________________u= null
trigger gg_trg_15_A011________________u= null
trigger gg_trg_16_A012________________u= null
trigger gg_trg_17_A016__________u= null
trigger gg_trg_18_A019________________u= null
trigger gg_trg_22_A01G________________u= null
trigger gg_trg_23_A01H________________u= null
trigger gg_trg_30_A01Q___________________u= null
trigger gg_trg_21_A01F__________u= null
trigger gg_trg_25_A01K________________u= null
trigger gg_trg_26_A01L________________u= null
trigger gg_trg_27_A01M__________u= null
trigger gg_trg_31_A01S= null
trigger gg_trg_33_A01U________________u= null
trigger gg_trg_32_A01T__________u= null
trigger gg_trg_34_A01W________________u= null
trigger gg_trg_AbilityTrigger= null
trigger gg_trg_AbilityTrigger_Summon= null
trigger gg_trg_DamageTrigger= null
trigger gg_trg_Demo1___________________u= null
trigger gg_trg_Demo2________________u= null
trigger gg_trg_HeroRevive= null
trigger gg_trg_HeroBagUnit________________u= null
trigger gg_trg_Move_Attack_Defence_Type= null
trigger gg_trg_ChangeProperty_Technology= null
trigger gg_trg_JASS_Skill= null
trigger gg_trg_test1______________________u= null
trigger gg_trg_test2______________________u= null
trigger gg_trg_test3__________u= null
trigger gg_trg_test4_______________________________u= null
trigger gg_trg_test4_1_____________________________u= null
trigger gg_trg_Ability5_____________u= null
trigger gg_trg_Ability5_1________________u= null
trigger gg_trg_Ability6_____________u= null
trigger gg_trg_Ability7________________u= null
trigger gg_trg_Ability8__9_________________u= null
trigger gg_trg_Ability9_____________________________u= null
trigger gg_trg_Ability9_New= null
trigger gg_trg_Ability10________________u= null
trigger gg_trg_Ability10_1__________u= null
unit gg_unit_hgtw_0001= null
unit gg_unit_H000_0019= null
unit gg_unit_e009_0127= null
unit gg_unit_e00G_0128= null
unit gg_unit_e00I_0130= null
unit gg_unit_H00B_0152= null
integer array iMJUnitType_Abili_A00J

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
integer array s__SetHeight_AcceData_iSpeedMode
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
integer array s__BarrageData_iBarrageMode
real array s__BarrageData_rTargetx
real array s__BarrageData_rTargety
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
constant integer si__FollowData=9
integer si__FollowData_F=0
integer si__FollowData_I=0
integer array si__FollowData_V
unit array s__FollowData_uUnit
unit array s__FollowData_uTargetUnit
real array s__FollowData_rTotalTime
real array s__FollowData_rMoveTime
constant integer si__SurroundData=10
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
constant integer si__VerticalSurroundData=11
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
trigger st__FollowData_TimerAction_Follow
trigger st__FollowData_onDestroy
trigger st__FollowData_destroy
trigger st__SurroundData_TimerAction_Surround
trigger st__SurroundData_onDestroy
trigger st__SurroundData_destroy
trigger st__VerticalSurroundData_TimerAction_VerticalSurround
trigger st__VerticalSurroundData_onDestroy
trigger st__VerticalSurroundData_destroy
integer f__arg_integer1
integer f__arg_this

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
        native DzGetSelectedLeaderUnit takes nothing returns unit 
        native DzIsChatBoxOpen takes nothing returns boolean 
        native DzSetUnitPreselectUIVisible takes unit whichUnit, boolean visible returns nothing 
        native DzSetEffectAnimation takes effect whichEffect, integer index, integer flag returns nothing 
        native DzSetEffectPos takes effect whichEffect, real x, real y, real z returns nothing 
        native DzSetEffectVertexColor takes effect whichEffect, integer color returns nothing 
        native DzSetEffectVertexAlpha takes effect whichEffect, integer alpha returns nothing 
        native DzSetEffectModel takes effect whichEffect, string model returns nothing
        native DzSetEffectTeamColor takes effect whichHandle, integer playerId returns nothing
        native DzFrameSetClip takes integer whichframe, boolean enable returns nothing 
        native DzChangeWindowSize takes integer width, integer height returns boolean 
        native DzPlayEffectAnimation takes effect whichEffect, string anim, string link returns nothing 
        native DzBindEffect takes widget parent, string attachPoint, effect whichEffect returns nothing 
        native DzUnbindEffect takes effect whichEffect returns nothing 
        native DzSetWidgetSpriteScale takes widget whichUnit, real scale returns nothing 
        native DzSetEffectScale takes effect whichHandle, real scale returns nothing 
        native DzGetEffectVertexColor takes effect whichEffect returns integer 
        native DzGetEffectVertexAlpha takes effect whichEffect returns integer 
        native DzGetItemAbility takes item whichEffect, integer index returns ability 
        native DzFrameGetChildrenCount takes integer whichframe returns integer 
        native DzFrameGetChild takes integer whichframe, integer index returns integer 
        native DzUnlockBlpSizeLimit takes boolean enable returns nothing 
        native DzGetActivePatron takes unit store, player p returns unit 
        native DzGetLocalSelectUnitCount takes nothing returns integer 
        native DzGetLocalSelectUnit takes integer index returns unit 
        native DzGetJassStringTableCount takes nothing returns integer 
        native DzModelRemoveFromCache takes string path returns nothing 
        native DzModelRemoveAllFromCache takes nothing returns nothing 
        native DzFrameGetInfoPanelSelectButton takes integer index returns integer 
        native DzFrameGetInfoPanelBuffButton takes integer index returns integer 
        native DzFrameGetPeonBar takes nothing returns integer 
        native DzFrameGetCommandBarButtonNumberText takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonNumberOverlay takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonCooldownIndicator takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonAutoCastIndicator takes integer whichframe returns integer 
        native DzToggleFPS takes boolean show returns nothing 
        native DzGetFPS takes nothing returns integer 
        native DzFrameWorldToMinimapPosX takes real x, real y returns real 
        native DzFrameWorldToMinimapPosY takes real x, real y returns real 
        native DzWidgetSetMinimapIcon takes unit whichunit, string path returns nothing 
        native DzWidgetSetMinimapIconEnable takes unit whichunit, boolean enable returns nothing 
        native DzFrameGetWorldFrameMessage takes nothing returns integer 
        native DzSimpleMessageFrameAddMessage takes integer whichframe, string text, integer color, real duration, boolean permanent returns nothing 
        native DzSimpleMessageFrameClear takes integer whichframe returns nothing 
        native DzConvertScreenPositionX takes real x, real y returns real 
        native DzConvertScreenPositionY takes real x, real y returns real 
        native DzRegisterOnBuildLocal takes code func returns nothing 
        native DzGetOnBuildOrderId takes nothing returns integer 
        native DzGetOnBuildOrderType takes nothing returns integer 
        native DzGetOnBuildAgent takes nothing returns widget 
        native DzRegisterOnTargetLocal takes code func returns nothing 
        native DzGetOnTargetAbilId takes nothing returns integer 
        native DzGetOnTargetOrderId takes nothing returns integer 
        native DzGetOnTargetOrderType takes nothing returns integer 
        native DzGetOnTargetAgent takes nothing returns widget 
        native DzGetOnTargetInstantTarget takes nothing returns widget 
        native DzOpenQQGroupUrl takes string url returns boolean 
        native DzFrameEnableClipRect takes boolean enable returns nothing 
        native DzSetUnitName takes unit whichUnit, string name returns nothing 
        native DzSetUnitPortrait takes unit whichUnit, string modelFile returns nothing 
        native DzSetUnitDescription takes unit whichUnit, string value returns nothing 
        native DzSetUnitMissileArc takes unit whichUnit, real arc returns nothing 
        native DzSetUnitMissileModel takes unit whichUnit, string modelFile returns nothing 
        native DzSetUnitProperName takes unit whichUnit, string name returns nothing 
        native DzSetUnitMissileHoming takes unit whichUnit, boolean enable returns nothing 
        native DzSetUnitMissileSpeed takes unit whichUnit, real speed returns nothing 
        native DzSetEffectVisible takes effect whichHandle, boolean enable returns nothing 
        native DzReviveUnit takes unit whichUnit, player whichPlayer, real hp, real mp, real x, real y returns nothing 
        native DzGetAttackAbility takes unit whichUnit returns ability 
        native DzAttackAbilityEndCooldown takes ability whichHandle returns nothing 
        native EXSetUnitArrayString takes integer uid, integer id, integer n, string name returns boolean 
        native EXSetUnitInteger takes integer uid, integer id, integer n returns boolean 
        native DzDoodadCreate takes integer id, integer var, real x, real y, real z, real rotate, real scale returns integer 
        native DzDoodadGetTypeId takes integer doodad returns integer 
        native DzDoodadSetModel takes integer doodad, string modelFile returns nothing 
        native DzDoodadSetTeamColor takes integer doodad, integer color returns nothing 
        native DzDoodadSetColor takes integer doodad, integer color returns nothing 
        native DzDoodadGetX takes integer doodad returns real 
        native DzDoodadGetY takes integer doodad returns real 
        native DzDoodadGetZ takes integer doodad returns real 
        native DzDoodadSetPosition takes integer doodad, real x, real y, real z returns nothing 
        native DzDoodadSetOrientMatrixRotate takes integer doodad, real angle, real axisX, real axisY, real axisZ returns nothing 
        native DzDoodadSetOrientMatrixScale takes integer doodad, real x, real y, real z returns nothing 
        native DzDoodadSetOrientMatrixResize takes integer doodad returns nothing 
        native DzDoodadSetVisible takes integer doodad, boolean enable returns nothing 
        native DzDoodadSetAnimation takes integer doodad, string animName, boolean animRandom returns nothing 
        native DzDoodadSetTimeScale takes integer doodad, real scale returns nothing 
        native DzDoodadGetTimeScale takes integer doodad returns real 
        native DzDoodadGetCurrentAnimationIndex takes integer doodad returns integer 
        native DzDoodadGetAnimationCount takes integer doodad returns integer 
        native DzDoodadGetAnimationName takes integer doodad, integer index returns string 
        native DzDoodadGetAnimationTime takes integer doodad, integer index returns integer 
        native DzUnitFindAbility takes unit whichUnit, integer abilcode returns ability
        native DzAbilitySetStringData takes ability whichAbility, string key, string value returns nothing
        native DzAbilitySetEnable takes ability whichAbility, boolean enable, boolean hideUI returns nothing
        native DzUnitSetMoveType takes unit whichUnit, string moveType returns nothing
        native DzFrameGetWidth takes integer frame returns real
        native DzFrameSetAnimateByIndex takes integer frame, integer index, integer flag returns nothing
        native DzSetUnitDataCacheInteger takes integer uid, integer id,integer index,integer v returns nothing
        native DzUnitUIAddLevelArrayInteger takes integer uid, integer id,integer lv,integer v returns nothing
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

//Generated method caller for FollowData.TimerAction_Follow
function sc__FollowData_TimerAction_Follow takes nothing returns nothing
    call TriggerEvaluate(st__FollowData_TimerAction_Follow)
endfunction

//Generated method caller for FollowData.onDestroy
function sc__FollowData_onDestroy takes integer this returns nothing
            set s__FollowData_uUnit[this]=null //单位
set s__FollowData_uTargetUnit[this]=null //目标单位
set s__FollowData_rTotalTime[this]=0.
            set s__FollowData_rMoveTime[this]=0. //已经运行的时间
endfunction

//Generated allocator of FollowData
function s__FollowData__allocate takes nothing returns integer
 local integer this=si__FollowData_F
    if (this!=0) then
        set si__FollowData_F=si__FollowData_V[this]
    else
        set si__FollowData_I=si__FollowData_I+1
        set this=si__FollowData_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: FollowData")
        return 0
    endif

   set s__FollowData_rTotalTime[this]= 0.
   set s__FollowData_rMoveTime[this]= 0.
    set si__FollowData_V[this]=-1
 return this
endfunction

//Generated destructor of FollowData
function sc__FollowData_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: FollowData")
        return
    elseif (si__FollowData_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: FollowData")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__FollowData_onDestroy)
    set si__FollowData_V[this]=si__FollowData_F
    set si__FollowData_F=this
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

   set s__BarrageData_iBarrageMode[this]= 0
   set s__BarrageData_rTargetx[this]= 0.
   set s__BarrageData_rTargety[this]= 0.
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
set s__SetHeight_AcceData_iSpeedMode[this]=0
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
   set s__SetHeight_AcceData_iSpeedMode[this]= 0
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
//library LBKKAPI:












































        //转换屏幕坐标到世界坐标  


        //监听建筑选位置  

        //等于0时是结束事件  



        //监听技能选目标  

        //等于0时是结束事件  





        // 打开QQ群链接  
















        function DzSetHeroTypeProperName takes integer uid,string name returns nothing
                call EXSetUnitArrayString(uid, 61, 0, name)
                call EXSetUnitInteger(uid, 61, 1)
        endfunction 
        function DzSetUnitTypeName takes integer uid,string name returns nothing
                call EXSetUnitArrayString(uid, 10, 0, name)
                call EXSetUnitInteger(uid, 10, 1)
        endfunction 
        function DzIsUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns boolean
                return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16 + 19 * index)))) == attackType
        endfunction 
        function DzSetUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns nothing
                call SetUnitState(whichUnit, ConvertUnitState(16 + 19 * index), GetHandleId(attackType))
        endfunction 
        function DzIsUnitDefenseType takes unit whichUnit,integer defenseType returns boolean
                return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50))) == defenseType
        endfunction 
        function DzSetUnitDefenseType takes unit whichUnit,integer defenseType returns nothing
                call SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType)
        endfunction 
        // 地形装饰物




















        
        // 查找单位技能

        // 修改技能数据-字符串

                
        // 启用/禁用技能

        // 设置单位移动类型

        // 获取控件宽度




        function KKWESetUnitDataCacheInteger takes integer uid,integer id,integer v returns nothing
                call DzSetUnitDataCacheInteger(uid, id, 0, v)
        endfunction
        function KKWEUnitUIAddUpgradesIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 94, id, v)
        endfunction
        function KKWEUnitUIAddBuildsIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 100, id, v)
        endfunction
        function KKWEUnitUIAddResearchesIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 112, id, v)
        endfunction
        function KKWEUnitUIAddTrainsIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 106, id, v)
        endfunction
        function KKWEUnitUIAddSellsUnitIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 118, id, v)
        endfunction
        function KKWEUnitUIAddSellsItemIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 124, id, v)
        endfunction
        function KKWEUnitUIAddMakesItemIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 130, id, v)
        endfunction
        function KKWEUnitUIAddRequiresUnitCode takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 166, id, v)
        endfunction
        function KKWEUnitUIAddRequiresTechcode takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 166, id, v)
        endfunction
        function KKWEUnitUIAddRequiresAmounts takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 172, id, v)
        endfunction

//library LBKKAPI ends
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
            local string sString_Effect= LoadStr(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("sString_Effect"))
            local string sString_AttachPoint= LoadStr(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("sString_AttachPoint"))
            local real rEffectSize= LoadReal(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("rEffectSize"))
            local effect eEffect
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
                        //Effect
                        if ( sString_Effect != null ) then
                            set eEffect=AddSpecialEffectTarget(sString_Effect, uGroupUnit, sString_AttachPoint)
                            call EXSetEffectSize(eEffect, rEffectSize)
                            call DestroyEffect(eEffect)
                        endif
                    elseif ( s__DamageData_iDamageWay[st] == 1 ) then //1次伤害
if ( IsUnitInGroup(uGroupUnit, s__DamageData_gGroup[st]) == false ) then
                            call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                            call GroupAddUnit(s__DamageData_gGroup[st], uGroupUnit)
                            //Effect
                            if ( sString_Effect != null ) then
                                set eEffect=AddSpecialEffectTarget(sString_Effect, uGroupUnit, sString_AttachPoint)
                                call EXSetEffectSize(eEffect, rEffectSize)
                                call DestroyEffect(eEffect)
                            endif
                        endif
                    endif
                endif
            endloop
            call DestroyGroup(gGroup)
            set pPlayer=null
            set uGroupUnit=null
            set gGroup=null
            set eEffect=null
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

        function s__SetHeight_AcceData_create takes unit uUnit,real rTotalTime,integer iFlyMode,integer iSpeedMode,real rInitHeight,real rTargetHeight,real rMaxHeight,real rMinHeight returns integer
            local integer st
            if ( SetHeightAcceleration___iNum_SetHeight_Acce < 8190 ) then //已经在冲锋的单位无法再被设置冲锋
set st=s__SetHeight_AcceData__allocate()
                set s__SetHeight_AcceData_uUnit[st]=uUnit
                set s__SetHeight_AcceData_rTotalTime[st]=rTotalTime
                set s__SetHeight_AcceData_iSpeedMode[st]=iSpeedMode
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
                if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set s__SetHeight_AcceData_rInitSpeed[st]=RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / s__SetHeight_AcceData_rSwitchTime[st]
                    set s__SetHeight_AcceData_rAcceleration[st]=0
                elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set s__SetHeight_AcceData_rAcceleration[st]=2 * RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / Pow(s__SetHeight_AcceData_rSwitchTime[st], 2) //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st] //初始速度
if ( s__SetHeight_AcceData_iFlyMode[st] == SetHeight_Acce_Down ) then
                        set s__SetHeight_AcceData_rInitSpeed[st]=0
                    endif
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
                        if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st]
                        elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] - 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        endif
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] + rMoveHeight
                    elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //下降
                        if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st]
                        elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] + 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        endif
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
                            if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set s__SetHeight_AcceData_rInitSpeed[st]=RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / s__SetHeight_AcceData_rSwitchTime[st]
                            elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=0
                            endif
                        elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //最低点
set s__SetHeight_AcceData_iUpDownFlag[st]=1
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMinHeight[st], 0.)
                            if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set s__SetHeight_AcceData_rInitSpeed[st]=RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / s__SetHeight_AcceData_rSwitchTime[st]
                            elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st]
                            endif
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
set s__SetHeight_AcceData_iSpeedMode[this]=0
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
    function View___ViewInit takes nothing returns nothing
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
        exitwhen i >= YDWEBase__AbilityCastingOverEventNumber
        if YDWEBase__AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase__AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase__AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase__AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase__AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase__AbilityCastingOverEventQueue[YDWEBase__AbilityCastingOverEventNumber]=trg
	set YDWEBase__AbilityCastingOverEventType[YDWEBase__AbilityCastingOverEventNumber]=index
	set YDWEBase__AbilityCastingOverEventNumber=YDWEBase__AbilityCastingOverEventNumber + 1
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
    return YDWEBase__yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
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
	
    set YDWEBase__yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase__yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase__yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase__yd_PlayerColor[3]="|cFF540081"
    set YDWEBase__yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase__yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase__yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase__yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase__yd_PlayerColor[8]="|cFF959697"
    set YDWEBase__yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase__yd_PlayerColor[10]="|cFF106246"
    set YDWEBase__yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase__yd_PlayerColor[12]="|cFF282828"
    set YDWEBase__yd_PlayerColor[13]="|cFF282828"
    set YDWEBase__yd_PlayerColor[14]="|cFF282828"
    set YDWEBase__yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEEventDamageData:


	
 function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)
	endfunction
 function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)
	endfunction
	
 function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)
	endfunction
	
 function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE))
	endfunction
 function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_WEAPON_TYPE))
	endfunction
	
 function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE))
	endfunction
	
 function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
	
	

//library YDWEEventDamageData ends
//library YDWEGetUnitsInRectMatchingNull:
function YDWEGetUnitsInRectMatchingNull takes rect r,boolexpr filter returns group
    local group g= CreateGroup()
    call GroupEnumUnitsInRect(g, r, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup=g
    set g=null
    return yd_NullTempGroup
endfunction

//library YDWEGetUnitsInRectMatchingNull ends
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
        exitwhen i >= YDWETriggerEvent__DamageEventNumber
        if YDWETriggerEvent__DamageEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__DamageEventQueue[i]) then
            call TriggerExecute(YDWETriggerEvent__DamageEventQueue[i])
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
        
    if YDWETriggerEvent__DamageEventNumber == 0 then
        set yd_DamageEventTrigger=CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction)
        call YDWEAnyUnitDamagedEnumUnit()
    endif
    
    set YDWETriggerEvent__DamageEventQueue[YDWETriggerEvent__DamageEventNumber]=trg
    set YDWETriggerEvent__DamageEventNumber=YDWETriggerEvent__DamageEventNumber + 1
endfunction
//===========================================================================  
//移动物品事件 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i= 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		set bj_lastMovedItemInItemSlot=GetOrderTargetItem()
    	loop
        	exitwhen i >= YDWETriggerEvent__MoveItemEventNumber
        	if YDWETriggerEvent__MoveItemEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__MoveItemEventQueue[i]) then
        	    call TriggerExecute(YDWETriggerEvent__MoveItemEventQueue[i])
        	endif
        	set i=i + 1
    	endloop
	endif
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__MoveItemEventNumber == 0 then
        set YDWETriggerEvent__MoveItemEventTrigger=CreateTrigger()
        call TriggerAddAction(YDWETriggerEvent__MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction)
        call TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent__MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif
    
    set YDWETriggerEvent__MoveItemEventQueue[YDWETriggerEvent__MoveItemEventNumber]=trg
    set YDWETriggerEvent__MoveItemEventNumber=YDWETriggerEvent__MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction

//library YDWETriggerEvent ends
//library YDWEYDWEJapiScript:


//library YDWEYDWEJapiScript ends
//library BarrageSystem:
        
    function BarrageSystem___BarrageSystemInit takes nothing returns nothing
        set BarrageSystem___tTimer_Barrage=CreateTimer()
        //call TimerStart(tTimer_Barrage, rTimerInterval_Barrage, true, function BarrageData.TimerAction_Barrage)
        set BarrageSystem___iTimerID_Barrage=GetHandleId(BarrageSystem___tTimer_Barrage)
    endfunction
    

        //Barrage
        
        function s__BarrageData_create takes integer iBarrageMode,real rTargetx,real rTargety,unit u,unit TargetUnit,boolean IsDestroyUnit,real TotalTime returns integer
            local real rCount
local integer st
            if ( BarrageSystem___iNum_Barrage < 8190 ) then
                set st=s__BarrageData__allocate()
                set s__BarrageData_iBarrageMode[st]=iBarrageMode //1:坐标,2:单位
set s__BarrageData_rTargetx[st]=rTargetx
                set s__BarrageData_rTargety[st]=rTargety
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
                if ( s__BarrageData_iBarrageMode[st] == iBarrageMode_Coord ) then
                    set s__BarrageData_P3_x[st]=s__BarrageData_rTargetx[st]
                    set s__BarrageData_P3_y[st]=s__BarrageData_rTargety[st]
                elseif ( s__BarrageData_iBarrageMode[st] == iBarrageMode_Unit ) then
                    set s__BarrageData_P3_x[st]=GetUnitX(s__BarrageData_uTargetUnit[st])
                    set s__BarrageData_P3_y[st]=GetUnitY(s__BarrageData_uTargetUnit[st])
                endif
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
            if ( s__BarrageData_iBarrageMode[st] == iBarrageMode_Coord ) then
                set s__BarrageData_P3_x[st]=s__BarrageData_rTargetx[st]
                set s__BarrageData_P3_y[st]=s__BarrageData_rTargety[st]
            elseif ( s__BarrageData_iBarrageMode[st] == iBarrageMode_Unit ) then
                set s__BarrageData_P3_x[st]=GetUnitX(s__BarrageData_uTargetUnit[st])
                set s__BarrageData_P3_y[st]=GetUnitY(s__BarrageData_uTargetUnit[st])
            endif
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
            set s__BarrageData_iBarrageMode[this]=0 //1:坐标,2:单位
set s__BarrageData_rTargetx[this]=0.
            set s__BarrageData_rTargety[this]=0.
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
//library YDWEGetUnitsInRectAllNull:
function YDWEGetUnitsInRectAllNull takes rect r returns group
    return YDWEGetUnitsInRectMatchingNull(r , null)
endfunction

//library YDWEGetUnitsInRectAllNull ends
//library YDWETimerSystem:
function YDWETimerSystem__NewTaskIndex takes nothing returns integer
 local integer h= YDWETimerSystem__TaskListIdleHead
	if YDWETimerSystem__TaskListIdleHead < 0 then
		if YDWETimerSystem__TaskListIdleMax >= 8000 then
    call BJDebugMsg("中心计时器任务队列溢出！")
			return 8100
		else
			set YDWETimerSystem__TaskListIdleMax=YDWETimerSystem__TaskListIdleMax + 1
			return YDWETimerSystem__TaskListIdleMax
		endif
	endif
	set YDWETimerSystem__TaskListIdleHead=YDWETimerSystem__TaskListIdle[h]
	return h
endfunction
function YDWETimerSystem__DeleteTaskIndex takes integer index returns nothing
	set YDWETimerSystem__TaskListIdle[index]=YDWETimerSystem__TaskListIdleHead
	set YDWETimerSystem__TaskListIdleHead=index
endfunction
//该函数序列处理
function YDWETimerSystem__NewTask takes real time,trigger proc returns integer
 local integer index= YDWETimerSystem__NewTaskIndex()
 local integer h= YDWETimerSystem__TaskListHead
 local integer t= R2I(100. * time) + YDWETimerSystem__CurrentTime
 local integer p
	set YDWETimerSystem__TaskListProc[index]=proc
	set YDWETimerSystem__TaskListTime[index]=t
	loop
		set p=YDWETimerSystem__TaskListNext[h]
		if p < 0 or YDWETimerSystem__TaskListTime[p] >= t then
		//	call BJDebugMsg("NewTask:"+I2S(index))
			set YDWETimerSystem__TaskListNext[h]=index
			set YDWETimerSystem__TaskListNext[index]=p
			return index
		endif
		set h=p
	endloop
	return index
endfunction
function YDWETimerSystemNewTask takes real time,trigger proc returns integer
	return YDWETimerSystem__NewTask(time , proc)
endfunction
function YDWETimerSystemGetCurrentTask takes nothing returns integer
	return YDWETimerSystem__CurrentIndex
endfunction
//删除单位
function YDWETimerSystem__RemoveUnit_CallBack takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRemoveUnit takes real time,unit u returns nothing
    call SaveUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRemoveUnit), u)
endfunction
//摧毁计时器
function YDWETimerSystem__DestroyTimer_CallBack takes nothing returns nothing
    call DestroyTimer(LoadTimerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyTimer takes real time,timer t returns nothing
    call SaveTimerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyTimer), t)
endfunction
//删除物品
function YDWETimerSystem__RemoveItem_CallBack takes nothing returns nothing
    call RemoveItem(LoadItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRemoveItem takes real time,item it returns nothing
    call SaveItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRemoveItem), it)
endfunction
//删除特效
function YDWETimerSystem__DestroyEffect_CallBack takes nothing returns nothing
    call DestroyEffect(LoadEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyEffect takes real time,effect e returns nothing
    call SaveEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyEffect), e)
endfunction
//删除闪电特效
function YDWETimerSystem__DestroyLightning_CallBack takes nothing returns nothing
    call DestroyLightning(LoadLightningHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyLightning takes real time,lightning lt returns nothing
 local integer i= YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyLightning)
    call SaveLightningHandle(YDHT, YDWETimerSystem__TimerHandle, i, lt)
endfunction
//运行触发器
function YDWETimerSystem__RunTrigger_CallBack takes nothing returns nothing
    call TriggerExecute(LoadTriggerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRunTrigger takes real time,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRunTrigger), trg)
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
function YDWETimerSystem__Main takes nothing returns nothing
 local integer h= YDWETimerSystem__TaskListHead
 local integer p
	loop
		set YDWETimerSystem__CurrentIndex=YDWETimerSystem__TaskListNext[h]
		exitwhen YDWETimerSystem__CurrentIndex < 0 or YDWETimerSystem__CurrentTime < YDWETimerSystem__TaskListTime[YDWETimerSystem__CurrentIndex]
		//call BJDebugMsg("Task:"+I2S(CurrentIndex))
		call TriggerEvaluate(YDWETimerSystem__TaskListProc[YDWETimerSystem__CurrentIndex])
		call YDWETimerSystem__DeleteTaskIndex(YDWETimerSystem__CurrentIndex)
		set YDWETimerSystem__TaskListNext[h]=YDWETimerSystem__TaskListNext[YDWETimerSystem__CurrentIndex]
	endloop
	set YDWETimerSystem__CurrentTime=YDWETimerSystem__CurrentTime + 1
endfunction
//初始化函数
function YDWETimerSystem__Init takes nothing returns nothing
    set YDWETimerSystem__Timer=CreateTimer()
	set YDWETimerSystem__TimerHandle=GetHandleId(YDWETimerSystem__Timer)
	set YDWETimerSystem__CurrentTime=0
	set YDWETimerSystem__TaskListHead=0
	set YDWETimerSystem__TaskListNext[0]=- 1
	set YDWETimerSystem__TaskListIdleHead=1
	set YDWETimerSystem__TaskListIdleMax=1
	set YDWETimerSystem__TaskListIdle[1]=- 1
	
	set YDWETimerSystem__fnRemoveUnit=CreateTrigger()
	set YDWETimerSystem__fnDestroyTimer=CreateTrigger()
	set YDWETimerSystem__fnRemoveItem=CreateTrigger()
	set YDWETimerSystem__fnDestroyEffect=CreateTrigger()
	set YDWETimerSystem__fnDestroyLightning=CreateTrigger()
	set YDWETimerSystem__fnRunTrigger=CreateTrigger()
	call TriggerAddCondition(YDWETimerSystem__fnRemoveUnit, Condition(function YDWETimerSystem__RemoveUnit_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyTimer, Condition(function YDWETimerSystem__DestroyTimer_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnRemoveItem, Condition(function YDWETimerSystem__RemoveItem_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyEffect, Condition(function YDWETimerSystem__DestroyEffect_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyLightning, Condition(function YDWETimerSystem__DestroyLightning_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnRunTrigger, Condition(function YDWETimerSystem__RunTrigger_CallBack))
	
    call TimerStart(YDWETimerSystem__Timer, 0.01, true, function YDWETimerSystem__Main)
endfunction
//循环类仍用独立计时器
function YDWETimerSystemGetRunIndex takes nothing returns integer
    return YDWETimerSystem__TimerSystem_RunIndex
endfunction
function YDWETimerSystem__RunPeriodicTriggerFunction takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set trg=null
endfunction
function YDWETimerSystem__RunPeriodicTriggerFunctionByTimes takes nothing returns nothing
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
    set YDWETimerSystem__TimerSystem_RunIndex=YDWETimerSystem__TimerSystem_RunIndex + 1
	call SaveTriggerHandle(YDHT, tid, $D0001, trg)
	call SaveInteger(YDHT, tid, $D0002, YDWETimerSystem__TimerSystem_RunIndex)
	set index=LoadInteger(YDHT, GetHandleId(trg), 'YDTS' + data)
    set index=index + 1
	call SaveInteger(YDHT, GetHandleId(trg), 'YDTS' + data, index)
	call SaveTimerHandle(YDHT, GetHandleId(trg), ( 'YDTS' + data ) * index, t)
	
    if b == false then
		call SaveInteger(YDHT, tid, $D0003, times)
        call TimerStart(t, timeout, true, function YDWETimerSystem__RunPeriodicTriggerFunctionByTimes)
      else
        call TimerStart(t, timeout, true, function YDWETimerSystem__RunPeriodicTriggerFunction)
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
//library FollowSystem:
    
        
    function FollowSystem___FollowSystemInit takes nothing returns nothing
        set FollowSystem___tTimer_Follow=CreateTimer()
        //call TimerStart(tTimer_Follow, rTimerInterval_Follow, true, function FollowData.TimerAction_Follow)
        set FollowSystem___iTimerID_Follow=GetHandleId(FollowSystem___tTimer_Follow)
    endfunction
    
function s__FollowData_create takes unit uUnit,unit uTargetUnit,real rTotalTime returns integer
            local integer st
            if ( FollowSystem___iNum_Follow < 8190 ) then
                set st=s__FollowData__allocate()
                set s__FollowData_uUnit[st]=uUnit
                set s__FollowData_uTargetUnit[st]=uTargetUnit
                set s__FollowData_rTotalTime[st]=rTotalTime
                
                set FollowSystem___iNum_Follow=FollowSystem___iNum_Follow + 1
                set FollowSystem___iData_Follow[FollowSystem___iNum_Follow]=(st)
                
                if FollowSystem___bTimerState_Follow == false then
                    call TimerStart(FollowSystem___tTimer_Follow, rTimerInterval_Follow, true, function sc__FollowData_TimerAction_Follow)
                    set FollowSystem___bTimerState_Follow=true
                endif
                return st
            else
                return 0
            endif
        endfunction
        
        function s__FollowData_TimerAction_Follow takes nothing returns nothing
            local integer i= 1
            local integer Num= FollowSystem___iNum_Follow
            local integer st
            if Num == 0 then
                call PauseTimer(FollowSystem___tTimer_Follow)
                set FollowSystem___bTimerState_Follow=false
                return
            endif
            
            loop
                exitwhen i > Num
                set st=(FollowSystem___iData_Follow[i])
                if ( FollowSystem___iData_Follow[i] != 0 ) and ( s__FollowData_uUnit[st] != null ) and ( GetUnitState(s__FollowData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__FollowData_rMoveTime[st] <= s__FollowData_rTotalTime[st] ) then
                    call SetUnitFacing(s__FollowData_uUnit[st], GetUnitFacing(s__FollowData_uTargetUnit[st]))
                    call SetUnitX(s__FollowData_uUnit[st], GetUnitX(s__FollowData_uTargetUnit[st]))
                    call SetUnitY(s__FollowData_uUnit[st], GetUnitY(s__FollowData_uTargetUnit[st]))
                    set s__FollowData_rMoveTime[st]=s__FollowData_rMoveTime[st] + rTimerInterval_Follow
                else
                    //Done
                    set FollowSystem___iData_Follow[i]=0
                    set FollowSystem___iNum_Follow=FollowSystem___iNum_Follow - 1
                    call sc__FollowData_deallocate(st)
                    //排序
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set FollowSystem___iData_Follow[i]=FollowSystem___iData_Follow[Num]
                    endif
                    set FollowSystem___iData_Follow[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
            
        endfunction
        
        function s__FollowData_onDestroy takes integer this returns nothing
            set s__FollowData_uUnit[this]=null //单位
set s__FollowData_uTargetUnit[this]=null //目标单位
set s__FollowData_rTotalTime[this]=0.
            set s__FollowData_rMoveTime[this]=0. //已经运行的时间
endfunction

//Generated destructor of FollowData
function s__FollowData_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: FollowData")
        return
    elseif (si__FollowData_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: FollowData")
        return
    endif
    call s__FollowData_onDestroy(this)
    set si__FollowData_V[this]=si__FollowData_F
    set si__FollowData_F=this
endfunction

//library FollowSystem ends
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
// 111
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Fri Feb 21 16:24:26 2025
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    set udg_PlayerNum=4
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
function InitSounds takes nothing returns nothing
    set gg_snd_BlizzardTarget2=CreateSound("Abilities\\Spells\\Human\\Blizzard\\BlizzardTarget2.wav", false, true, true, 10, 10, "SpellsEAX")
    call SetSoundParamsFromLabel(gg_snd_BlizzardTarget2, "BlizzardWave")
    call SetSoundDuration(gg_snd_BlizzardTarget2, 3000)
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('blba', 2265.8, 3105.0)
    call CreateItem('blba', 2120.1, 3106.9)
    call CreateItem('blba', 2264.1, 3168.5)
    call CreateItem('blba', 2200.9, 3168.5)
    call CreateItem('blba', 2127.6, 3170.5)
    call CreateItem('blba', 2175.3, 3105.0)
    call CreateItem('ckng', 1427.4, 3418.0)
    call CreateItem('ckng', 1549.5, 3401.4)
    call CreateItem('ckng', 1485.1, 3409.7)
    call CreateItem('ckng', 1429.3, 3342.8)
    call CreateItem('ckng', 1578.6, 3274.6)
    call CreateItem('ckng', 1523.8, 3274.6)
    call CreateItem('ckng', 1431.7, 3282.3)
    call CreateItem('ckng', 1569.0, 3329.0)
    call CreateItem('ckng', 1516.5, 3330.9)
    call CreateItem('kybl', 2242.4, 3344.8)
    call CreateItem('kybl', 2315.7, 3342.6)
    call CreateItem('kybl', 2271.2, 3417.6)
    call CreateItem('kybl', 2324.6, 3419.9)
    call CreateItem('kybl', 2176.3, 3347.0)
    call CreateItem('kybl', 2196.2, 3417.6)
    call CreateItem('kysn', 1865.5, 3338.1)
    call CreateItem('kysn', 1808.2, 3413.0)
    call CreateItem('kysn', 1863.0, 3410.7)
    call CreateItem('kysn', 1927.0, 3410.7)
    call CreateItem('kysn', 1801.0, 3342.6)
    call CreateItem('kysn', 1951.6, 3342.6)
    call CreateItem('mlst', 1779.4, 3112.8)
    call CreateItem('mlst', 1902.0, 3168.5)
    call CreateItem('mlst', 1845.6, 3168.5)
    call CreateItem('mlst', 1789.2, 3174.6)
    call CreateItem('mlst', 1831.5, 3114.7)
    call CreateItem('mlst', 1905.2, 3103.0)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateBuildingsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_hgtw_0001=CreateUnit(p, 'hgtw', 1856.0, 3776.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'H00C', - 446.3, 2601.2, 7.530)
    call SetUnitState(u, UNIT_STATE_MANA, 1285)
    set gg_unit_H000_0019=CreateUnit(p, 'H000', - 55.8, 2889.5, 81.680)
    call SetUnitState(gg_unit_H000_0019, UNIT_STATE_MANA, 1285)
    set u=CreateUnit(p, 'h005', 901.8, 2761.6, 12.140)
    set u=CreateUnit(p, 'H00D', - 63.5, 2567.2, 141.760)
    call SetUnitState(u, UNIT_STATE_MANA, 1000)
    set u=CreateUnit(p, 'H00E', - 292.0, 2427.8, 79.530)
    call SetUnitState(u, UNIT_STATE_MANA, 1285)
    set u=CreateUnit(p, 'H00G', - 718.3, 2686.7, 298.780)
    call SetUnitState(u, UNIT_STATE_MANA, 1285)
    set u=CreateUnit(p, 'H00I', - 671.3, 2451.6, 225.010)
    set u=CreateUnit(p, 'H00J', - 14.4, 2269.4, 321.060)
    set u=CreateUnit(p, 'hpea', 1164.9, 135.8, 87.949)
    set gg_unit_H00B_0152=CreateUnit(p, 'H00B', 211.4, 2587.3, 223.530)
    call SetUnitState(gg_unit_H00B_0152, UNIT_STATE_MANA, 1285)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hfoo', - 777.7, 4493.9, 21.556)
    set u=CreateUnit(p, 'hfoo', - 700.1, 4497.2, 244.025)
    set u=CreateUnit(p, 'hfoo', - 617.0, 4500.5, 211.460)
    set u=CreateUnit(p, 'hfoo', - 549.2, 4497.2, 316.954)
    set u=CreateUnit(p, 'hfoo', - 463.0, 4497.2, 122.710)
    set u=CreateUnit(p, 'hfoo', - 370.7, 4490.7, 237.905)
    set u=CreateUnit(p, 'hfoo', - 276.5, 4490.7, 143.980)
    set u=CreateUnit(p, 'hfoo', - 206.5, 4490.7, 43.540)
    set u=CreateUnit(p, 'hfoo', - 125.8, 4490.7, 283.511)
    set u=CreateUnit(p, 'hfoo', - 39.7, 4490.7, 317.339)
    set u=CreateUnit(p, 'hfoo', 49.1, 4490.7, 195.046)
    set u=CreateUnit(p, 'hfoo', 137.9, 4490.7, 131.609)
    set u=CreateUnit(p, 'hfoo', 234.8, 4490.7, 236.620)
    set u=CreateUnit(p, 'hfoo', 321.0, 4490.7, 191.366)
    set u=CreateUnit(p, 'hfoo', 390.9, 4490.7, 181.126)
    set u=CreateUnit(p, 'hfoo', - 773.4, 4295.5, 21.556)
    set u=CreateUnit(p, 'hfoo', - 695.8, 4298.8, 244.025)
    set u=CreateUnit(p, 'hfoo', - 612.7, 4302.0, 211.460)
    set u=CreateUnit(p, 'hfoo', - 544.9, 4298.8, 316.954)
    set u=CreateUnit(p, 'hfoo', - 458.7, 4298.8, 122.710)
    set u=CreateUnit(p, 'hfoo', - 366.4, 4292.2, 237.905)
    set u=CreateUnit(p, 'hfoo', - 272.2, 4292.2, 143.980)
    set u=CreateUnit(p, 'hfoo', - 202.3, 4292.2, 43.540)
    set u=CreateUnit(p, 'hfoo', - 121.5, 4292.2, 283.511)
    set u=CreateUnit(p, 'hfoo', - 35.4, 4292.2, 317.339)
    set u=CreateUnit(p, 'hfoo', 53.4, 4292.2, 195.046)
    set u=CreateUnit(p, 'hfoo', 142.2, 4292.2, 131.609)
    set u=CreateUnit(p, 'hfoo', 239.1, 4292.2, 236.620)
    set u=CreateUnit(p, 'hfoo', 325.2, 4292.2, 191.366)
    set u=CreateUnit(p, 'hfoo', 395.2, 4292.2, 181.126)
    set u=CreateUnit(p, 'hfoo', - 744.5, 4066.4, 21.556)
    set u=CreateUnit(p, 'hfoo', - 666.9, 4069.6, 244.025)
    set u=CreateUnit(p, 'hfoo', - 583.9, 4072.9, 211.460)
    set u=CreateUnit(p, 'hfoo', - 516.0, 4069.6, 316.954)
    set u=CreateUnit(p, 'hfoo', - 429.8, 4069.6, 122.710)
    set u=CreateUnit(p, 'hfoo', - 337.6, 4063.1, 237.905)
    set u=CreateUnit(p, 'hfoo', - 243.4, 4063.1, 143.980)
    set u=CreateUnit(p, 'hfoo', - 173.4, 4063.1, 43.540)
    set u=CreateUnit(p, 'hfoo', - 92.6, 4063.1, 283.511)
    set u=CreateUnit(p, 'hfoo', - 6.5, 4063.1, 317.339)
    set u=CreateUnit(p, 'hfoo', 82.3, 4063.1, 195.046)
    set u=CreateUnit(p, 'hfoo', 171.1, 4063.1, 131.609)
    set u=CreateUnit(p, 'hfoo', 268.0, 4063.1, 236.620)
    set u=CreateUnit(p, 'hfoo', 354.1, 4063.1, 191.366)
    set u=CreateUnit(p, 'hfoo', 424.1, 4063.1, 181.126)
    set u=CreateUnit(p, 'hfoo', - 725.8, 3865.3, 21.556)
    set u=CreateUnit(p, 'hfoo', - 648.2, 3868.6, 244.025)
    set u=CreateUnit(p, 'hfoo', - 565.1, 3871.9, 211.460)
    set u=CreateUnit(p, 'hfoo', - 497.3, 3868.6, 316.954)
    set u=CreateUnit(p, 'hfoo', - 411.1, 3868.6, 122.710)
    set u=CreateUnit(p, 'hfoo', - 318.8, 3862.1, 237.905)
    set u=CreateUnit(p, 'hfoo', - 224.6, 3862.1, 143.980)
    set u=CreateUnit(p, 'hfoo', - 154.7, 3862.1, 43.540)
    set u=CreateUnit(p, 'hfoo', - 73.9, 3862.1, 283.511)
    set u=CreateUnit(p, 'hfoo', 12.2, 3862.1, 317.339)
    set u=CreateUnit(p, 'hfoo', 101.0, 3862.1, 195.046)
    set u=CreateUnit(p, 'hfoo', 189.8, 3862.1, 131.609)
    set u=CreateUnit(p, 'hfoo', 286.7, 3862.1, 236.620)
    set u=CreateUnit(p, 'hfoo', 372.8, 3862.1, 191.366)
    set u=CreateUnit(p, 'hfoo', 442.8, 3862.1, 181.126)
    set u=CreateUnit(p, 'hfoo', - 747.2, 4755.1, 21.556)
    set u=CreateUnit(p, 'hfoo', - 669.6, 4758.4, 244.025)
    set u=CreateUnit(p, 'hfoo', - 586.6, 4761.7, 211.460)
    set u=CreateUnit(p, 'hfoo', - 518.7, 4758.4, 316.954)
    set u=CreateUnit(p, 'hfoo', - 432.5, 4758.4, 122.710)
    set u=CreateUnit(p, 'hfoo', - 340.3, 4751.8, 237.905)
    set u=CreateUnit(p, 'hfoo', - 246.1, 4751.8, 143.980)
    set u=CreateUnit(p, 'hfoo', - 176.1, 4751.8, 43.540)
    set u=CreateUnit(p, 'hfoo', - 95.3, 4751.8, 283.511)
    set u=CreateUnit(p, 'hfoo', - 9.2, 4751.8, 317.339)
    set u=CreateUnit(p, 'hfoo', 79.6, 4751.8, 195.046)
    set u=CreateUnit(p, 'hfoo', 168.4, 4751.8, 131.609)
    set u=CreateUnit(p, 'hfoo', 265.3, 4751.8, 236.620)
    set u=CreateUnit(p, 'hfoo', 351.4, 4751.8, 191.366)
    set u=CreateUnit(p, 'hfoo', 421.4, 4751.8, 181.126)
    set u=CreateUnit(p, 'hspt', - 1633.7, 4317.5, 338.741)
    set u=CreateUnit(p, 'hspt', - 1889.9, 4423.4, 284.313)
    set u=CreateUnit(p, 'hspt', - 2043.0, 4413.7, 33.356)
    set u=CreateUnit(p, 'hspt', - 2090.5, 4251.5, 290.026)
    set u=CreateUnit(p, 'hspt', - 2027.0, 4104.3, 347.761)
    set u=CreateUnit(p, 'hspt', - 1890.1, 4068.3, 198.529)
    set u=CreateUnit(p, 'hspt', - 1795.6, 4246.8, 291.070)
    set u=CreateUnit(p, 'hspt', - 1771.6, 4331.8, 80.499)
    set u=CreateUnit(p, 'hspt', - 1872.3, 4279.6, 236.916)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n000', 1792.0, 4096.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'e00E', - 3861.9, - 1382.6, 127.429)
    set u=CreateUnit(p, 'e015', - 346.8, - 4181.2, 12.624)
    set u=CreateUnit(p, 'e007', - 3881.7, - 295.9, 64.271)
    set u=CreateUnit(p, 'e006', - 2583.5, - 413.3, 48.273)
    set u=CreateUnit(p, 'e005', - 1434.5, - 459.7, 324.898)
    set u=CreateUnit(p, 'e008', - 459.4, - 482.7, 27.446)
    set gg_unit_e009_0127=CreateUnit(p, 'e009', - 1470.5, - 1287.8, 253.385)
    set gg_unit_e00G_0128=CreateUnit(p, 'e00G', - 301.3, - 1265.7, 90.757)
    set u=CreateUnit(p, 'e00F', - 2617.7, - 1243.5, 20.092)
    set gg_unit_e00I_0130=CreateUnit(p, 'e00I', - 3882.8, - 2377.9, 43.421)
    set u=CreateUnit(p, 'e00H', - 2516.1, - 2179.7, 13.402)
    set u=CreateUnit(p, 'e00J', - 3874.7, - 3130.8, 345.553)
    set u=CreateUnit(p, 'e011', - 1488.0, - 2133.1, 10.998)
    set u=CreateUnit(p, 'e013', - 311.2, - 2279.5, 210.548)
    set u=CreateUnit(p, 'e012', - 2614.3, - 3203.3, 114.624)
    set u=CreateUnit(p, 'e018', - 1431.9, - 3227.9, 245.675)
    set u=CreateUnit(p, 'e019', - 301.4, - 3157.0, 131.895)
    set u=CreateUnit(p, 'e016', - 3794.4, - 4120.9, 149.298)
    set u=CreateUnit(p, 'e017', - 2590.3, - 4113.8, 271.375)
    set u=CreateUnit(p, 'e014', - 1376.1, - 4151.3, 239.180)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer0()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer11()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings()
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
    set gg_rct______________000=Rect(1728.0, 3360.0, 1984.0, 3648.0)
    set gg_rct______________001=Rect(2656.0, 3040.0, 3072.0, 3584.0)
endfunction
//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************
function CreateCameras takes nothing returns nothing
    set gg_cam_Camera_001=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ZOFFSET, 300.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROTATION, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ANGLE_OF_ATTACK, 300.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_TARGET_DISTANCE, 1000.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FIELD_OF_VIEW, 120.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_001, 502.7, 1103.0, 0.0)
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
// Trigger: Init
//===========================================================================
function Trig_InitActions takes nothing returns nothing
    call FogEnableOff()
    call FogMaskEnableOff()
    call AdjustPlayerStateBJ(10000, Player(0), PLAYER_STATE_RESOURCE_GOLD)
    call SetPlayerAlliance(Player(11), Player(0), ALLIANCE_SHARED_CONTROL, true)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_Init takes nothing returns nothing
    set gg_trg_Init=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_Init, function Trig_InitActions)
endfunction
//===========================================================================
// Trigger: Init1
//===========================================================================
function Trig_Init1Actions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, GetUnitX(gg_unit_hgtw_0001), GetUnitY(gg_unit_hgtw_0001), 3000.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        if ( ( IsUnitType(ydl_unit, UNIT_TYPE_HERO) == true ) ) then
            call SetHeroLevelBJ(ydl_unit, 10, true)
        else
        endif
    endloop
    call DestroyGroup(ydl_group)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x64766007, gg_unit_H000_0019)
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x64766007)))
    set udg_htHashTable=InitHashtable()
    call SaveUnitHandle(YDHT, GetHandleId(ConvertedPlayer(1)), 0xB06AB615, gg_unit_H000_0019)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_Init1 takes nothing returns nothing
    set gg_trg_Init1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_Init1, 0.00)
    call TriggerAddAction(gg_trg_Init1, function Trig_Init1Actions)
endfunction
//===========================================================================
// Trigger: TX
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TXActions takes nothing returns nothing
    local effect eEffect
    
    set eEffect=AddSpecialEffectTarget("Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", gg_unit_H00B_0152, "left hand")
    call EXSetEffectSize(eEffect, 0.3)
    set eEffect=AddSpecialEffectTarget("Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", gg_unit_H00B_0152, "right hand")
    call EXSetEffectSize(eEffect, 0.3)
    set eEffect=null
endfunction
//===========================================================================
function InitTrig_TX takes nothing returns nothing
    set gg_trg_TX=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_TX, 0.00)
    call TriggerAddAction(gg_trg_TX, function Trig_TXActions)
endfunction
//===========================================================================
// Trigger: TX_Cycle
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TX_CycleActions takes nothing returns nothing
    //call SetUnitAnimation(gg_unit_e01E_0165, "birth")   //动画
endfunction
//===========================================================================
function InitTrig_TX_Cycle takes nothing returns nothing
    set gg_trg_TX_Cycle=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_TX_Cycle, 2.)
    call TriggerAddAction(gg_trg_TX_Cycle, function Trig_TX_CycleActions)
endfunction
//===========================================================================
// Trigger: reset
//===========================================================================
function Trig_resetFunc002A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
endfunction
function Trig_resetActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x891DF9DD, YDWEGetUnitsInRectAllNull(GetPlayableMapRect()))
    call ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x891DF9DD), function Trig_resetFunc002A)
    call DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x891DF9DD))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_reset takes nothing returns nothing
    set gg_trg_reset=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_reset, Player(0), "reset", true)
    call TriggerAddAction(gg_trg_reset, function Trig_resetActions)
endfunction
//===========================================================================
// Trigger: 50Level
//===========================================================================
function Trig_50LevelActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, 0, 0, 50000.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        if ( ( IsUnitType(ydl_unit, UNIT_TYPE_HERO) == true ) ) then
            call SetHeroLevelBJ(ydl_unit, 50, true)
        else
        endif
    endloop
    call DestroyGroup(ydl_group)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_50Level takes nothing returns nothing
    set gg_trg_50Level=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_50Level, Player(0), "50", true)
    call TriggerAddAction(gg_trg_50Level, function Trig_50LevelActions)
endfunction
//===========================================================================
// Trigger: TXtest
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TXtestActions takes nothing returns nothing
    local effect ef= AddSpecialEffect("units\\human\\Peasant\\Peasant.mdl", 0, 0)
    call EXEffectMatRotateZ(ef, 90)
    call EXEffectMatRotateX(ef, 90)
    call DzEnableWideScreen(true)
endfunction
//===========================================================================
function InitTrig_TXtest takes nothing returns nothing
    set gg_trg_TXtest=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_TXtest, 0.00)
    call TriggerAddAction(gg_trg_TXtest, function Trig_TXtestActions)
endfunction
//===========================================================================
// Trigger: 1
//===========================================================================
function Trig_1Actions takes nothing returns nothing
    call Cheat("exec-lua:test")
endfunction
//===========================================================================
function InitTrig_1 takes nothing returns nothing
    set gg_trg_1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_1, Player(0))
    call TriggerAddAction(gg_trg_1, function Trig_1Actions)
endfunction
//===========================================================================
// Trigger: Damage
//===========================================================================
function Trig_DamageConditions takes nothing returns boolean
    return ( ( GetEventDamage() >= 1.00 ) )
endfunction
function Trig_DamageActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetTriggerUnit())
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6856D322, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x51990A95, GetEventDamageSource())
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xEB6D5784, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x51990A95)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC0ABED4A, GetEventDamage())
    call CreateTextTagUnitBJ(I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC0ABED4A))), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), 0, 14.00, 100, 0.00, 0.00, 0)
    call SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5F5D2B52, GetLastCreatedTextTag())
    call SetTextTagVisibility(LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5F5D2B52), true)
    call SetTextTagVelocity(LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5F5D2B52), 0.00, 0.05)
    call YDWETimerDestroyTextTag(2.00 , LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5F5D2B52))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Damage takes nothing returns nothing
    set gg_trg_Damage=CreateTrigger()
    call DoNothing()
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_Damage)
    call TriggerAddCondition(gg_trg_Damage, Condition(function Trig_DamageConditions))
    call TriggerAddAction(gg_trg_Damage, function Trig_DamageActions)
endfunction
//===========================================================================
// Trigger: UnitDeath
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_UnitDeathActions takes nothing returns nothing
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false ) ) then
        call YDWETimerRemoveUnit(2.00 , GetTriggerUnit())
        call FlushChildHashtable(htUnitHT, GetHandleId(GetTriggerUnit()))
    else
    endif
endfunction
//===========================================================================
function InitTrig_UnitDeath takes nothing returns nothing
    set gg_trg_UnitDeath=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_UnitDeath, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_UnitDeath, function Trig_UnitDeathActions)
endfunction
//===========================================================================
// Trigger: Init2
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Init2Actions takes nothing returns nothing
    
endfunction
//===========================================================================
function InitTrig_Init2 takes nothing returns nothing
    set gg_trg_Init2=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Init2, 0.00)
    call TriggerAddAction(gg_trg_Init2, function Trig_Init2Actions)
endfunction
//===========================================================================
// Trigger: View
//
// 向前：滚轮变化为120
// 向后：滚轮变化为-120
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
//
// GetRectMinX(bj_mapInitialPlayableArea)
// GetRectMaxX(bj_mapInitialPlayableArea)
// GetRectMinY(bj_mapInitialPlayableArea)
// GetRectMaxY(bj_mapInitialPlayableArea)
//===========================================================================
//TESH.scrollpos=23
//TESH.alwaysfold=0
//===========================================================================
// Trigger: UnitState
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
//===========================================================================
// Trigger: HashTable
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// Trigger: FollowSystem
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
//冲锋系统只负责冲锋，完成冲锋后的复杂动作需要技能另外加计时器完成，冲锋系统不能完成
//===========================================================================
// Trigger: ChargeSystem
//===========================================================================
//TESH.scrollpos=11
//TESH.alwaysfold=0
//冲锋系统只负责冲锋，完成冲锋后的复杂动作需要技能另外加计时器完成，冲锋系统不能完成
//===========================================================================
// Trigger: ChargeTraceSystem
//===========================================================================
//TESH.scrollpos=119
//TESH.alwaysfold=0
//冲锋跟踪系统
//===========================================================================
// Trigger: ChargeArrowSystem
//
// 
//===========================================================================
//TESH.scrollpos=129
//TESH.alwaysfold=0
//月神箭系统
//===========================================================================
// Trigger: ChargeParabolaSystem
//
// 每次“落地”运行对应触发器
//===========================================================================
//TESH.scrollpos=84
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
//TESH.scrollpos=105
//TESH.alwaysfold=0
//===========================================================================
// Trigger: SetHeightWay
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
//===========================================================================
// Trigger: SetHeight_Acceleration
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0
//设置高度，有加速度
//===========================================================================
// Trigger: SetDamageWay
//===========================================================================
//TESH.scrollpos=152
//TESH.alwaysfold=0
//===========================================================================
// Trigger: BarrageSystem
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: 3C剑圣
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
    
function TimerAction_AbilityAction_A01E takes nothing returns nothing
    
endfunction
function AbilityAction_A01E takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    //local player pPlayer = GetOwningPlayer(uHero)
    //local real rHerox = GetUnitX(uHero)
    //local real rHeroy = GetUnitY(uHero)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 6
    local real rRange= 800
    local real rDamage= 300 * rLevel + 3 * rGetHeroAgi(uHero)
local real rDamage_MJUnit= 50 * rLevel + 0.5 * rGetHeroAgi(uHero)
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.5
local real rTimerCount= rTimerInterval
    
    set rDamage=rDamage / ( rDuration / rTimerInterval )
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    //call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    //call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_MJUnit"), rDamage_MJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01E)
    
    set uHero=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 2_A00B_1
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_2_A00B_1Conditions takes nothing returns boolean
    return ( ( GetUnitTypeId(GetTriggerUnit()) == 'e003' ) )
endfunction
function Trig_2_A00B_1Actions takes nothing returns nothing
    local unit uUnit= GetTriggerUnit()
    local location lLoc= GetOrderPointLoc()
    call SetUnitPositionLoc(uUnit, lLoc)
    call RemoveLocation(lLoc)
    set uUnit=null
    set lLoc=null
endfunction
//===========================================================================
function InitTrig_2_A00B_1 takes nothing returns nothing
    set gg_trg_2_A00B_1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_2_A00B_1, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddCondition(gg_trg_2_A00B_1, Condition(function Trig_2_A00B_1Conditions))
    call TriggerAddAction(gg_trg_2_A00B_1, function Trig_2_A00B_1Actions)
endfunction
//===========================================================================
// Trigger: 2_A00B/*七连斩*/
//
// 七连斩
//===========================================================================
//TESH.scrollpos=25
//TESH.alwaysfold=0
function TimerAction_A00B takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local unit uMJUnitSword
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    //ChargeData
    local integer stCharge
    local real rDegree= GetDegree(rHerox , rHeroy , GetUnitX(uMJUnit) , GetUnitY(uMJUnit))
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= LoadReal(htTimerHT, iTimerID, StringHash("rTotalDistance"))
    local real rTotalTime_Charge= 1.0
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTotalTime_Damage= 1.0
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 250.
    
    
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    if ( iTimerCount < 10 ) then
        call SelectUnitForPlayerSingle(uMJUnit, pPlayer)
        if ( ModuloInteger(iTimerCount, 2) == 0 ) then
            call SetUnitAnimation(uHero, "spell Throw")
        endif
        set uMJUnitSword=CreateUnit(pPlayer, 'e004', rHerox, rHeroy, rDegree)
        //Charge
        set uChargeUnit=uMJUnitSword
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //Damage
        set uSetDamageUnit=uMJUnitSword
        set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
        call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    else
        //End
        call PauseUnit(uHero, false)
        call IssueImmediateOrder(uHero, "stop")
        call SelectUnitForPlayerSingle(uHero, pPlayer)
        call RemoveUnit(uMJUnit)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    
    set tTimer=null
    set pPlayer=null
    set uHero=null
    set uMJUnit=null
    set uMJUnitSword=null
    set uChargeUnit=null
    set uSetDamageUnit=null
endfunction
function AbilityAction_A00B takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    
    local unit uMJUnit= CreateUnit(pPlayer, 'e003', rTargetx, rTargety, rDegree)
    local real rTotalDistance= S2R(EXExecuteScript("(require'jass.slk').ability[" + I2S('A00B') + "].Rng1"))
    
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, 'A00B')
    local real rDamage= I2R(GetHeroAgi(uHero, true)) * I2R(iAbilityLevel)
    
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 0
    //call BJDebugMsg(I2S(StringHash("uHero")))
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rTotalDistance"), rTotalDistance)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    
    //Action
    call PauseUnit(uHero, true)
    //Timer
    call TimerStart(tTimer, 0.5, true, function TimerAction_A00B)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    
endfunction
//===========================================================================
// Trigger: 1_A00H/*马甲冲锋*/
//
// 马甲冲锋
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
function AbilityAction_A00H takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uMJUnit= CreateUnit(pPlayer, 'e002', rHerox, rHeroy, rDegree)
    
    //ChargeData
    local integer stCharge
    local unit uChargeUnit= uMJUnit
    local boolean bIsDestroyUnit= true
    //local real rDegree
    local real rTotalDistance= S2R(EXExecuteScript("(require'jass.slk').ability[" + I2S('A00H') + "].Rng1"))
    local real rTotalTime_Charge= 1.0
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge
    
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit= uMJUnit
    local real rDamage= I2R(GetHeroStr(uHero, true) + GetHeroAgi(uHero, true) + GetHeroInt(uHero, true))
    local real rTotalTime_Damage= 1.0
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 250.
    
    //Charge
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Damage
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    
    call SetUnitFlyHeight(uChargeUnit, 100.00, 1000.00)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set uSetDamageUnit=null
endfunction
    
//===========================================================================
// Trigger: 3_A001/*旋涡*/
//
// 旋涡
//===========================================================================
//TESH.scrollpos=110
//TESH.alwaysfold=0
function TimerAction_A001 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
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
    
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 500.00, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Orc\\StasisTrap\\StasisTotemTarget.mdl", rHerox, rHeroy))
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", rHerox, rHeroy))
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
            set rx=GetUnitX(uGroupUnit)
            set ry=GetUnitY(uGroupUnit)
            set rDegree=GetDegree(rHerox , rHeroy , rx , ry)
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
function AbilityAction_A001 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uEffectMJUnit
    local unit uAbilityMJUnit
    local integer iAbilityLevel= GetUnitAbilityLevel(uHero, 'A001')
    local real rDamage= ( 300 * I2R(iAbilityLevel) ) + I2R(GetHeroStr(uHero, true))
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local real rx
    local real ry
    local real rDistance
local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer i= 0
    
    //ChargeData
    local integer stCharge
    local real rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance
    local real rTotalTime_Charge= 3.0
    local real rEveryDistance
    //EffectMJUnit
    loop
        set i=i + 1
        exitwhen i > 2
        set uEffectMJUnit=CreateUnit(pPlayer, 'e00C', rHerox, rHeroy, 0.)
        call UnitApplyTimedLife(uEffectMJUnit, 'BHwe', 5.00)
    endloop
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rHerox"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHeroy"), rHeroy)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, 800.00, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(uGroupUnit, UNIT_TYPE_HERO) == false ) then
            set uAbilityMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0.)
            call UnitApplyTimedLife(uAbilityMJUnit, 'BHwe', 3.00)
            call UnitAddAbility(uAbilityMJUnit, 'A003')
            call IssueTargetOrder(uAbilityMJUnit, "fingerofdeath", uGroupUnit)
            
            set rx=GetUnitX(uGroupUnit)
            set ry=GetUnitY(uGroupUnit)
            set rDistance=GetDistance(rx , ry , rHerox , rHeroy)
            if ( rDistance > 200.0 ) then
                set rDegree=GetDegree(rx , ry , rHerox , rHeroy)
                set rTotalDistance=rDistance - 200.0
            elseif ( rDistance == 200.0 ) then
                set rDegree=GetDegree(rx , ry , rHerox , rHeroy)
                set rTotalDistance=100.0
            elseif ( rDistance < 200.0 ) then
                set rDegree=GetDegree(rHerox , rHeroy , rx , ry)
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
    call TimerStart(tTimer, 3.1, false, function TimerAction_A001)
    
    set uHero=null
    set pPlayer=null
    set uEffectMJUnit=null
    set uAbilityMJUnit=null
    set gGroup=null
    set uGroupUnit=null
    set tTimer=null
    set uChargeUnit=null
endfunction
//===========================================================================
// Trigger: 4_A00F/*火龙环绕*/
//
// 火龙冲锋
//===========================================================================
//TESH.scrollpos=78
//TESH.alwaysfold=0
function TimerAction_A00F_Hero takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local integer j= LoadInteger(htTimerHT, iTimerID, StringHash("j"))
    set j=j + 1
    call SaveInteger(htTimerHT, iTimerID, StringHash("j"), j)
    if ( j <= 5 ) then
        call SetUnitAnimation(uHero, "spell Throw")
    else
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
endfunction
function TimerAction_A00F_2 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uMJUnit_e00A= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_e00A"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local real rDamage= 3000.0
    //BoomEffect
    local effect eEffectBoom= AddSpecialEffect("nuclearexplosion.mdx", rTargetx, rTargety)
    call EXSetEffectSize(eEffectBoom, 2.00)
    call DestroyEffect(eEffectBoom)
    //Damage
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 500.00, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", uGroupUnit, "origin"))
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        endif
    endloop
    call DestroyGroup(gGroup)
    //End
    call PauseUnit(uHero, false)
    call IssueImmediateOrder(uHero, "stop")
    call RemoveUnit(uMJUnit_e00A)
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    
    set tTimer=null
    set uHero=null
    set uMJUnit_e00A=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
endfunction
function TimerAction_A00F_1 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //local unit uHero = LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero") )
    //local unit uMJUnit_e00A = LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_e00A") )
    local unit uMJUnit_e002= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_e002"))
    local real rUnitx= GetUnitX(uMJUnit_e002)
    local real rUnity= GetUnitY(uMJUnit_e002)
    
    //ChargeData
    local integer stCharge
    local real rDegree= GetDegree(rUnitx , rUnity , rTargetx , rTargety)
    local unit uChargeUnit= uMJUnit_e002
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= GetDistance(rUnitx , rUnity , rTargetx , rTargety)
    local real rTotalTime_Charge= 1.0
    local real rEveryDistance
    //Height
    local unit uSetHeightUnit= uMJUnit_e002
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer stHeight
    local integer iFlyMode= SetHeightWay_Down
    local real rCurrentHeight= LoadReal(htTimerHT, iTimerID, StringHash("rNowHeight"))
    local real rExtremeHeight= 2000.
    local real rEveryHeight= rCurrentHeight / rTotalTime_SetHeight * 0.03
    
    //Charge
    set rEveryDistance=rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge //0.03
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Height
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    
    call PauseTimer(tTimer)
    call TimerStart(tTimer, 1.1, false, function TimerAction_A00F_2)
    
    set tTimer=null
    set uMJUnit_e002=null
    set uChargeUnit=null
    set uSetHeightUnit=null
endfunction
function AbilityAction_A00F takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit_e00A
local unit uMJUnit_e002
local real x
    local real y
    //SurroundData
    local integer stSurround
    local integer iSurroundMode= iSurroundMode_Coord
    local real rSurrx= rHerox
    local real rSurry= rHeroy
    local unit uCentreUnit= uHero
    local unit uOutsideUnit
    local boolean bIsDestroyUnit= false
    local real rUnitFacDegree= 90.
    local real rNowSurrDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rTotalTime_Surround= 5.
    local real rTotalSurrDegree= 360. * 3. - 90.
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 250.
    local real rEveryDistance= 2.
    //Height
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Surround
    local integer stHeight
    local integer iFlyMode= SetHeightWay_Up
    local real rCurrentHeight= 100.
    local real rExtremeHeight= 2000.
    local real rEveryHeight= 2.
    //计算大概环绕结束的高度
    //rSurrCount环绕运行次数
    local real rSurrCount= I2R(R2I(rTotalTime_Surround / 0.03))
    local real rNowHeight= rCurrentHeight + rEveryHeight * rSurrCount
    //Store
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer j
    
    //Action
    call PauseUnit(uHero, true)
    call SetUnitFacing(uHero, rNowSurrDegree)
    call SetUnitAnimation(uHero, "spell Throw")
    set uMJUnit_e00A=CreateUnit(pPlayer, 'e00A', rHerox, rHeroy, rNowSurrDegree)
    
    set x=rHerox + rCentreDistance * Cos(rNowSurrDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rCentreDistance * Sin(rNowSurrDegree * bj_DEGTORAD)
    set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit_e002=CreateUnit(pPlayer, 'e002', x, y, rNowSurrDegree)
    call SetUnitScale(uMJUnit_e002, 0.1, 0.1, 0.1)
    
    //Surround
    set uOutsideUnit=uMJUnit_e002
    set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit)
    call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryDistance)
    //Height
    set uSetHeightUnit=uMJUnit_e002
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    
    //Store
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_e00A"), uMJUnit_e00A)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit_e002"), uMJUnit_e002)
    call SaveReal(htTimerHT, iTimerID, StringHash("rNowHeight"), rNowHeight)
    call TimerStart(tTimer, 5.1, false, function TimerAction_A00F_1)
    
    set tTimer=CreateTimer()
    set iTimerID=GetHandleId(tTimer)
    set j=0
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveInteger(htTimerHT, iTimerID, StringHash("j"), j)
    call TimerStart(tTimer, 1, true, function TimerAction_A00F_Hero)
    
    //Set null
    set uHero=null
    set pPlayer=null
    set uMJUnit_e00A=null
    set uMJUnit_e002=null
    set uCentreUnit=null
    set uOutsideUnit=null
    set uSetHeightUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 5_A00C/*闪电球环绕*/
//
// 闪电球环绕
//===========================================================================
//TESH.scrollpos=39
//TESH.alwaysfold=0
function AbilityAction_A00C takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uMJUnit_e00D
    
    //SurroundData
    //constant integer iSurroundMode_Coord = 1     //环绕坐标
    //constant integer iSurroundMode_Unit  = 2     //环绕单位
    local integer stSurround
    local integer iSurroundMode= iSurroundMode_Unit
    local real rSurrx= rHerox
    local real rSurry= rHeroy
    local unit uCentreUnit= uHero
    local unit uOutsideUnit
    local boolean bIsDestroyUnit= true
    local real rUnitFacDegree= 0.0
    local real rNowSurrDegree= 45.0
    local real rTotalTime_Surround= 5.0
    local real rTotalSurrDegree= 90.0
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 200.0
    local real rEveryDistance= 0.0
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit
    local real rHeroATK= GetUnitState(uHero, ConvertUnitState(0x12))
    local real rDamage= rHeroATK * 3
    local real rTotalTime_Damage= rTotalTime_Surround
    local real iDamageTimeInterval= 0.3
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 128.
    
    
    local integer i= 0
local integer j= 0

    loop
        set i=i + 1
        exitwhen i > 5
        set rNowSurrDegree=45.
        set j=0
        loop
            set j=j + 1
            exitwhen j > 4
            set uMJUnit_e00D=CreateUnit(pPlayer, 'e00D', rHerox, rHeroy, 0.)
            //Surround
            set uOutsideUnit=uMJUnit_e00D
            set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit)
            call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryDistance)
            //Damage
            set uSetDamageUnit=uMJUnit_e00D
            set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
            call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
            
            set rNowSurrDegree=rNowSurrDegree + 90.
        endloop
        set rCentreDistance=rCentreDistance + 256.
    endloop
    
    set uHero=null
    set pPlayer=null
    set uMJUnit_e00D=null
    set uCentreUnit=null
    set uOutsideUnit=null
    set uSetDamageUnit=null
endfunction
//===========================================================================
// Trigger: 6_A00J/*灵子崩坏*/
//
// 万物终结——灵子崩坏
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function MagicCircleEffectInit takes nothing returns nothing
    set iMJUnitType_Abili_A00J[0]='e00Q'
    set iMJUnitType_Abili_A00J[1]='e00M'
    set iMJUnitType_Abili_A00J[2]='e00P'
    set iMJUnitType_Abili_A00J[3]='e00S' //Large
set iMJUnitType_Abili_A00J[4]='e00O'
    set iMJUnitType_Abili_A00J[5]='e00K'
    set iMJUnitType_Abili_A00J[6]='e00R' //Large
endfunction
function TimerAction_A00J takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uSpellTargetUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"))
    local real rTargetx= GetUnitX(uSpellTargetUnit)
    local real rTargety= GetUnitY(uSpellTargetUnit)
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local unit uMJUnit
    
    call MagicCircleEffectInit()
    
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    if ( iTimerCount <= 10 ) then
        call SetUnitAnimation(uHero, "spell Throw")
        if ( iTimerCount <= 6 ) then
            set uMJUnit=CreateUnit(pPlayer, iMJUnitType_Abili_A00J[iTimerCount], rTargetx, rTargety, 0.)
            if ( ( iTimerCount == 3 ) or ( iTimerCount == 6 ) ) then
                call SetUnitAnimation(uMJUnit, "Stand Large")
            endif
            call UnitApplyTimedLife(uMJUnit, 'BHwe', I2R(10 - iTimerCount))
        endif
        if ( iTimerCount == 7 ) then
            call DestroyEffect(AddSpecialEffect("Lasercannon.mdl", rTargetx, rTargety))
        endif
        
        
    else
        call KillUnit(uSpellTargetUnit)
        call PauseUnit(uHero, false)
        call IssueImmediateOrder(uHero, "stop")
        call PauseUnit(uSpellTargetUnit, false)
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
    set pPlayer=null
    set uSpellTargetUnit=null
    set uMJUnit=null
endfunction
function AbilityAction_A00J takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local unit uSpellTargetUnit= GetSpellTargetUnit()
    
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 0
    
    call PauseUnit(uHero, true)
    call PauseUnit(uSpellTargetUnit, true)
    
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"), uSpellTargetUnit)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer, 1, true, function TimerAction_A00J)
    
    set uHero=null
    set uSpellTargetUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 7_A00N/*冰锥风暴*/
//
// 冰锥风暴
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A00N takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit_e00X= CreateUnit(pPlayer, 'e00X', rTargetx, rTargety, 0.)
local unit uMJUnit_e00W
//SurroundData
local integer stSurround
    local integer iSurroundMode= iSurroundMode_Coord
    local real rSurrx= rTargetx
    local real rSurry= rTargety
    local unit uCentreUnit= uMJUnit_e00X
    local unit uOutsideUnit
    local boolean bIsDestroyUnit= true
    local real rUnitFacDegree= 90.
    local real rNowSurrDegree= 0.
    local real rTotalTime_Surround= 5.
    local real rTotalSurrDegree= 360. * 10.
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 500.
    local real rEveryDistance= 0.
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit= uMJUnit_e00X
    local real rHeroATK= GetUnitState(uHero, ConvertUnitState(0x12))
    local real rDamage= 100.
    local real rTotalTime_Damage= 5.
    local real iDamageTimeInterval= 0.5
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 500.
    
    //Height
    local real rCurrentHeight= 50.
    //冰锥数量
    local integer i= 0
    
    loop
        set i=i + 1
        exitwhen i > 5
        set uMJUnit_e00W=CreateUnit(pPlayer, 'e00W', rTargetx, rTargety, 0.) //冰棺底座
//Surround
set uOutsideUnit=uMJUnit_e00W
        set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit)
        call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryDistance)
        //Height
        call SetUnitFlyHeight(uMJUnit_e00W, rCurrentHeight, 2000.)
        set rCurrentHeight=rCurrentHeight + 50.
    endloop
    
    //Unit_e00X
    call SetUnitAnimation(uMJUnit_e00X, "Stand Large")
    call UnitApplyTimedLife(uMJUnit_e00X, 'BHwe', rTotalTime_Damage)
    //Damage
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit_e00X=null
    set uMJUnit_e00W=null
    set uCentreUnit=null
    set uOutsideUnit=null
    set uSetDamageUnit=null
endfunction
//===========================================================================
// Trigger: 9_A00P
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
function ChargeArrowTriggerAction_A00P takes nothing returns nothing
    local unit uUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uUnit"))
local unit uHitUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uHitUnit"))
local unit uHero= LoadUnitHandle(htUnitHT, GetHandleId(uUnit), StringHash("uHero"))
    local real rDamage= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamage"))
    //Damage
    call UnitDamageTarget(uHero, uHitUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", uHitUnit, "origin"))
    set uHero=null
    set uUnit=null
    set uHitUnit=null
endfunction
function AbilityAction_A00P takes nothing returns nothing
    local unit uHero= GetEventDamageSource()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rDamage= 100.
    //ChargeArrowData
    local integer stChargeArrow
    local real rDegree_ChargeArrow
    local unit uChargeArrowUnit
    local boolean bIsDestroyUnit_ChargeArrow= true
    local real rTotalDistance_ChargeArrow= 1000.
    local real rTotalTime_ChargeArrow= 1.5
    local real rEveryDistance_ChargeArrow= rTotalDistance_ChargeArrow / rTotalTime_ChargeArrow * 0.03
    local integer i
    set rDegree_ChargeArrow=GetUnitFacing(uHero) - 20 * 3
    //call BJDebugMsg("*********")
    set i=1
    loop
        exitwhen i > 7
        set uChargeArrowUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree_ChargeArrow)
        call DzSetUnitModel(uChargeArrowUnit, "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
        //ChargeArrow
        set stChargeArrow=s__ChargeArrowData_create(uChargeArrowUnit , bIsDestroyUnit_ChargeArrow , rDegree_ChargeArrow , rTotalDistance_ChargeArrow , rTotalTime_ChargeArrow , rEveryDistance_ChargeArrow)
        call SaveUnitHandle(htUnitHT, GetHandleId(uChargeArrowUnit), StringHash("uHero"), uHero)
        call SaveReal(htUnitHT, GetHandleId(uChargeArrowUnit), StringHash("rDamage"), rDamage)
        call SaveTriggerHandle(htUnitHT, GetHandleId(uChargeArrowUnit), StringHash("tTrigger"), gg_trg_9_A00P)
        set rDegree_ChargeArrow=rDegree_ChargeArrow + 20.
        set i=i + 1
    endloop
    set uHero=null
    set pPlayer=null
    set uChargeArrowUnit=null
endfunction
//===========================================================================
function InitTrig_9_A00P takes nothing returns nothing
    set gg_trg_9_A00P=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_9_A00P, function ChargeArrowTriggerAction_A00P)
endfunction
//===========================================================================
// Trigger: 10_A00Q/*无敌斩*/
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HeroAction_A00Q takes unit uHero,unit uSpellTargetUnit,real rDamage returns nothing
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDistance= I2R(GetRandomInt(0, 50))
    local real rDegree= I2R(GetRandomInt(0, 359))
    local real x= GetUnitX(uSpellTargetUnit) + rDistance * Cos(Deg2Rad(rDegree))
    local real y= GetUnitY(uSpellTargetUnit) + rDistance * Sin(Deg2Rad(rDegree))
    set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
call SetUnitX(uHero, x)
    call SetUnitY(uHero, y)
    call SetUnitFacing(uHero, rDegree + 180.)
    call SetUnitAnimation(uHero, "attack")
    if ( GetUnitState(uSpellTargetUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uSpellTargetUnit, pPlayer) == false ) then
        call UnitDamageTarget(uHero, uSpellTargetUnit, rDamage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
    endif
    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl", uHero, "chest"))
    set pPlayer=null
endfunction
function Condition_TimerAction_A00Q takes nothing returns boolean
    local integer iHeroId= LoadInteger(htTimerHT, GetHandleId(GetExpiredTimer()), StringHash("iHeroId"))
    return ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(I2U(iHeroId))) == false )
endfunction
function TimerAction_A00Q takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uSpellTargetUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local effect eHeroWeaponEffect= LoadEffectHandle(htTimerHT, iTimerID, StringHash("eHeroWeaponEffect"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local group gGroup= CreateGroup()
    local integer iGroupCount
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    
    call SaveInteger(htTimerHT, iTimerID, StringHash("iHeroId"), GetHandleId(uHero))
    call GroupEnumUnitsInRange(gGroup, GetUnitX(uHero), GetUnitY(uHero), 666., Condition(function Condition_TimerAction_A00Q))
    set iGroupCount=CountUnitsInGroup(gGroup)
    if ( iTimerCount <= 30 ) and ( iGroupCount > 0 ) then
        set uSpellTargetUnit=GroupPickRandomUnit(gGroup)
        call HeroAction_A00Q(uHero , uSpellTargetUnit , rDamage)
    else
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
function AbilityAction_A00Q takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local unit uSpellTargetUnit= GetSpellTargetUnit()
    local real rDamage= 3. * I2R(GetHeroAgi(uHero, true))
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local effect eHeroWeaponEffect= AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl", uHero, "weapon")
    //Action
    call PauseUnit(uHero, true)
    call SetUnitPathing(uHero, false) //无视碰撞
call SetUnitInvulnerable(uHero, true) //无敌
    call SetUnitTimeScale(uHero, 3.) //动画速度
call SetUnitVertexColor(uHero, 255, 255, 255, 84) //255:正常，0：不显示
    call HeroAction_A00Q(uHero , uSpellTargetUnit , rDamage)
    //Store
    call SaveEffectHandle(htTimerHT, iTimerID, StringHash("eHeroWeaponEffect"), eHeroWeaponEffect)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uSpellTargetUnit"), uSpellTargetUnit)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    //Timer
    call TimerStart(tTimer, 0.3, true, function TimerAction_A00Q)
    
    set uHero=null
    set uSpellTargetUnit=null
    set tTimer=null
endfunction//===========================================================================
// Trigger: 11_A00R/*仙法大玉螺旋丸*/
//
// set sModelString[0] = "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl"    //光，精灵龙投射物
//     set sModelString[1] = "Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl"      //红光，毒蛇守卫
//     set sModelString[2] = "Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl"      //蓝，复仇天神
//     set sModelString[3] = "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl"             //炎魔投射物
//     set sModelString[4] = "Abilities\\Weapons\\IllidanMissile\\IllidanMissile.mdl"         //绿，尤迪安（邪恶的）
//     set sModelString[5] = "Abilities\\Weapons\\LichMissile\\LichMissile.mdl"                //巫妖
//     set sModelString[6] = "Abilities\\Weapons\\DemonHunterMissile\\DemonHunterMissile.mdl"         //恶魔猎手投射物
//     set sModelString[7] = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl"         //电球
//     set sModelString[8] = "Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl"    //龙鹰攻击
//     set sModelString[9] = "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl"       //火凤凰
//===========================================================================
//TESH.scrollpos=212
//TESH.alwaysfold=0
function TimerAction_A00R_2 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //loop
    local integer i
    local integer j
    local string array sEffectString
    local integer array iCount_Effect
    //Effect极坐标信息
    local real rDegree
    local real rEveryDegree
    local real rDistance= 150.
    local real rEffectx
    local real rEffecty
    //DamageGroup
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    local real rDamage= 2000.
    //1是最内的圈
    set sEffectString[1]="Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl"
    set sEffectString[2]="Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl"
    set sEffectString[3]="Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl"
    set sEffectString[4]="Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl"
    set sEffectString[5]="Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl"
    set iCount_Effect[1]=12
    set iCount_Effect[2]=18
    set iCount_Effect[3]=24
    set iCount_Effect[4]=30
    set iCount_Effect[5]=36
    //Effect
    set i=0
    loop
        set i=i + 1
        exitwhen i > 5
        set rDegree=0.
        set rEveryDegree=360. / I2R(iCount_Effect[i])
        set j=0
        loop
            set j=j + 1
            exitwhen j > iCount_Effect[i]
            set rEffectx=rTargetx + rDistance * Cos(Deg2Rad(rDegree))
            set rEffecty=rTargety + rDistance * Sin(Deg2Rad(rDegree))
            call DestroyEffect(AddSpecialEffect(sEffectString[i], rEffectx, rEffecty))
            set rDegree=rDegree + rEveryDegree
        endloop
        set rDistance=rDistance + 150.
    endloop
    
    //Damage
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 750., null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        endif
    endloop
    call DestroyGroup(gGroup)
    
    //End
    call PauseUnit(uHero, false)
    call IssueImmediateOrder(uHero, "stop")
    call SetUnitInvulnerable(uHero, false) //无敌
    call SetUnitFlyHeight(uHero, 0., 0.)
    call UnitRemoveAbility(uHero, 'Arav')
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    
    set uHero=null
    set pPlayer=null
    set gGroup=null
    set uGroupUnit=null
    set tTimer=null
endfunction
function TimerAction_A00R_1 takes nothing returns nothing
    //英雄和球体冲锋+降低高度
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uMJUnit
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //Globe
    local real rGlobe_x= LoadReal(htTimerHT, iTimerID, StringHash("rGlobe_x"))
    local real rGlobe_y= LoadReal(htTimerHT, iTimerID, StringHash("rGlobe_y"))
    local real rGlobe_z= LoadReal(htTimerHT, iTimerID, StringHash("rGlobe_z"))
    local real rGlobe_R= LoadReal(htTimerHT, iTimerID, StringHash("rGlobe_R"))
    
    //ChargeData
    local integer stCharge
    local real rDegree= GetDegree(rGlobe_x , rGlobe_y , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance= GetDistance(rGlobe_x , rGlobe_y , rTargetx , rTargety)
    local real rTotalTime_Charge= 2.
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer iFlyMode= SetHeightWay_Down
    local real rCurrentHeight
    local real rExtremeHeight= 2000.
    local real rEveryHeight= ( ( rGlobe_z - rGlobe_R ) - 50. ) / rTotalTime_SetHeight * rTimerInterval_Height
    //loop
    local integer iCount_Unit= LoadInteger(htTimerHT, iTimerID, StringHash("iCount_Unit"))
    local integer i= 0
    
    //HeroAction
    //Charge
    set uChargeUnit=uHero
    set bIsDestroyUnit=false
    set rEveryDistance=rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge //0.03
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Height
    set uSetHeightUnit=uHero
    set rCurrentHeight=GetUnitFlyHeight(uSetHeightUnit)
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    
    loop
        exitwhen i > iCount_Unit
        set uMJUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit") + i)
        //Charge
        set uChargeUnit=uMJUnit
        set bIsDestroyUnit=true
        set rEveryDistance=rTotalDistance / rTotalTime_Charge * rTimerInterval_Charge //0.03
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //Height
        set uSetHeightUnit=uMJUnit
        set rCurrentHeight=GetUnitFlyHeight(uSetHeightUnit)
        set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
        call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    
        set i=i + 1
    endloop
    
    
    //End
    call PauseTimer(tTimer)
    call TimerStart(tTimer, 2.1, false, function TimerAction_A00R_2)
    
    set tTimer=null
    set uHero=null
    set uMJUnit=null
    set uChargeUnit=null
    set uSetHeightUnit=null
endfunction
function TimerAction_A00R_MJUnit takes nothing returns nothing
    //MJUnit旋转动作
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uMJUnit
    //RotationData
    local real rMoveTime_Rotation= LoadReal(htTimerHT, iTimerID, StringHash("rMoveTime_Rotation"))
    local real rTotalTime_Rotation= LoadReal(htTimerHT, iTimerID, StringHash("rTotalTime_Rotation"))
    local real rNowDegree= LoadReal(htTimerHT, iTimerID, StringHash("rNowDegree"))
    local real rTotalDegree= LoadReal(htTimerHT, iTimerID, StringHash("rTotalDegree"))
    local real rEveryDegree= LoadReal(htTimerHT, iTimerID, StringHash("rEveryDegree"))
    //loop
    local integer iCount_Unit= LoadInteger(htTimerHT, iTimerID, StringHash("iCount_Unit"))
    local integer i= 0
    
    if ( rMoveTime_Rotation <= rTotalTime_Rotation ) then
        loop
            exitwhen i > iCount_Unit
            set uMJUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit") + i)
            call SetUnitFacing(uMJUnit, rNowDegree)
            set i=i + 1
        endloop
        set rNowDegree=rNowDegree + rEveryDegree
        set rMoveTime_Rotation=rMoveTime_Rotation + 0.03
        call SaveReal(htTimerHT, iTimerID, StringHash("rNowDegree"), rNowDegree)
        call SaveReal(htTimerHT, iTimerID, StringHash("rMoveTime_Rotation"), rMoveTime_Rotation)
    else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uMJUnit=null
endfunction
function TimerAction_A00R_Hero takes nothing returns nothing
    //HeroSpell动作
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    if ( iTimerCount <= 4 ) then
        call SetUnitAnimation(uHero, "spell Throw")
    else //>4就结束，动作只做4次
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
endfunction
function RandomModel_A00R takes nothing returns string
    //local integer iIndex = GetRandomInt(0, 6)
    local string array sModelString
    local integer iModelIndex= LoadInteger(htUnitHT, GetHandleId(GetTriggerUnit()), StringHash("iModelIndex"))
    if ( iModelIndex == 10 ) then
        set iModelIndex=0
    endif
    call SaveInteger(htUnitHT, GetHandleId(GetTriggerUnit()), StringHash("iModelIndex"), iModelIndex + 1)
    set sModelString[0]="Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl" //光，精灵龙投射物
set sModelString[1]="Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl" //红光，毒蛇守卫
set sModelString[2]="Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl" //蓝，复仇天神
set sModelString[3]="Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl" //炎魔投射物
set sModelString[4]="Abilities\\Weapons\\IllidanMissile\\IllidanMissile.mdl" //绿，尤迪安（邪恶的）
set sModelString[5]="Abilities\\Weapons\\LichMissile\\LichMissile.mdl" //巫妖
set sModelString[6]="Abilities\\Weapons\\DemonHunterMissile\\DemonHunterMissile.mdl" //恶魔猎手投射物
set sModelString[7]="Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl" //电球
set sModelString[8]="Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl" //龙鹰攻击
set sModelString[9]="Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl" //火凤凰

    return sModelString[iModelIndex]
    
endfunction
function AbilityAction_A00R takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rDegree_Unit= 0.
    local real rEveryDegree_Unit= 0.
    local unit uMJUnit
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= 2.
    local integer iFlyMode= SetHeightWay_Up
    local real rCurrentHeight= 50.
    local real rExtremeHeight
    local real rEveryHeight
//旋转Data
local real rNowDegree= 0.
    local real rMoveTime_Rotation= 0.03
    local real rTotalTime_Rotation= 4.5
    local real rTotalDegree= 360. * 9.
    local real rEveryDegree= rTotalDegree / rTotalTime_Rotation * 0.03
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    //MJUnit旋转动作计时器
    local timer tTimer_MJUnit= CreateTimer()
    local integer iTimerID_MJUnit= GetHandleId(tTimer_MJUnit)
    local real rMoveTime_MJUnit= 0.03
    
    //GlobeData
    local real rGlobe_R= 350.
    local real rCircle_r
local real rh
local real rGlobe_x= rHerox + 500. * Cos(Deg2Rad(rDegree))
local real rGlobe_y= rHeroy + 500. * Sin(Deg2Rad(rDegree))
local real rGlobe_z= 1000.

    local real rUnit_x
local real rUnit_y
local real rUnit_z= rGlobe_z - rGlobe_R
//RandomModelString
local string sModelString
    //loop
    local integer i
    local integer j
    local integer array iCount_CircleUnit
local integer iCount_Unit= 0
    local real array rHeight
    set iCount_CircleUnit[1]=1
    set iCount_CircleUnit[2]=10
    set iCount_CircleUnit[3]=20
    set iCount_CircleUnit[4]=20
    set iCount_CircleUnit[5]=20
    set iCount_CircleUnit[6]=20
    set iCount_CircleUnit[7]=20
    set iCount_CircleUnit[8]=20
    set iCount_CircleUnit[9]=20
    set iCount_CircleUnit[10]=20
    set iCount_CircleUnit[11]=20
    set iCount_CircleUnit[12]=10
    set iCount_CircleUnit[13]=1
    //Height
    set rHeight[1]=rGlobe_z - rGlobe_R
    set rHeight[2]=rGlobe_z - rGlobe_R + 20.
    set rHeight[3]=rGlobe_z - ( rGlobe_R / 5. ) * 4.
    set rHeight[4]=rGlobe_z - ( rGlobe_R / 5. ) * 3.
    set rHeight[5]=rGlobe_z - ( rGlobe_R / 5. ) * 2.
    set rHeight[6]=rGlobe_z - ( rGlobe_R / 5. ) * 1.
    set rHeight[7]=rGlobe_z
    set rHeight[8]=rGlobe_z + ( rGlobe_R / 5. ) * 1.
    set rHeight[9]=rGlobe_z + ( rGlobe_R / 5. ) * 2.
    set rHeight[10]=rGlobe_z + ( rGlobe_R / 5. ) * 3.
    set rHeight[11]=rGlobe_z + ( rGlobe_R / 5. ) * 4.
    set rHeight[12]=rGlobe_z + rGlobe_R - 20.
    set rHeight[13]=rGlobe_z + rGlobe_R
    
    
    //HeroAction
    call PauseUnit(uHero, true)
    call SetUnitInvulnerable(uHero, true) //无敌
    call UnitAddAbility(uHero, 'Arav')
    call SetUnitAnimation(uHero, "spell Throw")
    set uSetHeightUnit=uHero
    set rExtremeHeight=rGlobe_z
    set rEveryHeight=( rGlobe_z + rGlobe_R ) / rTotalTime_SetHeight * rTimerInterval_Height
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    call BJDebugMsg("***********")
    //RandomModel
    set sModelString=RandomModel_A00R()
    //loop
    set i=1
    loop
        exitwhen i > 13
        set rDegree_Unit=0
        set rEveryDegree_Unit=360. / I2R(iCount_CircleUnit[i])
        set rUnit_z=rHeight[i]
        set j=1
        loop
            exitwhen j > iCount_CircleUnit[i]
            //MJUnitAction
            set rh=RAbsBJ(rGlobe_z - rUnit_z)
            set rCircle_r=SquareRoot(Pow(rGlobe_R, 2.) - Pow(rh, 2.)) //圆的半径
set rUnit_x=rGlobe_x + rCircle_r * Cos(Deg2Rad(rDegree_Unit))
            set rUnit_y=rGlobe_y + rCircle_r * Sin(Deg2Rad(rDegree_Unit))
            set rDegree=GetDegree(rUnit_x , rUnit_y , rGlobe_x , rGlobe_y)
            set uMJUnit=CreateUnit(pPlayer, 'e000', rUnit_x, rUnit_y, rDegree)
            //call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\LichMissile\\LichMissile.mdl")
            call DzSetUnitModel(uMJUnit, sModelString)
            call SetUnitScale(uMJUnit, 1.5, 1.5, 1.5)
            //Height
            set uSetHeightUnit=uMJUnit
            set rExtremeHeight=rUnit_z
            set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
            call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
            
            call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit") + iCount_Unit, uMJUnit)
            call SaveInteger(htTimerHT, iTimerID, StringHash("iCount_Unit"), iCount_Unit)
            
            call SaveUnitHandle(htTimerHT, iTimerID_MJUnit, StringHash("uMJUnit") + iCount_Unit, uMJUnit)
            call SaveInteger(htTimerHT, iTimerID_MJUnit, StringHash("iCount_Unit"), iCount_Unit)
            set iCount_Unit=iCount_Unit + 1
            
            set rDegree_Unit=rDegree_Unit + rEveryDegree_Unit
            set j=j + 1
        endloop
        //set rUnit_z = rUnit_z + rGlobe_R/7.
        
        call BJDebugMsg(I2S(i))
        set i=i + 1
    endloop
    
    //Store
    
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rGlobe_x"), rGlobe_x)
    call SaveReal(htTimerHT, iTimerID, StringHash("rGlobe_y"), rGlobe_y)
    call SaveReal(htTimerHT, iTimerID, StringHash("rGlobe_z"), rGlobe_z)
    call SaveReal(htTimerHT, iTimerID, StringHash("rGlobe_R"), rGlobe_R)
    call TimerStart(tTimer, 2.5, false, function TimerAction_A00R_1)
    
    //MJUnitTimer
    call SaveReal(htTimerHT, iTimerID_MJUnit, StringHash("rNowDegree"), rNowDegree)
    call SaveReal(htTimerHT, iTimerID_MJUnit, StringHash("rMoveTime_Rotation"), rMoveTime_Rotation)
    call SaveReal(htTimerHT, iTimerID_MJUnit, StringHash("rTotalTime_Rotation"), rTotalTime_Rotation)
    call SaveReal(htTimerHT, iTimerID_MJUnit, StringHash("rTotalDegree"), rTotalDegree)
    call SaveReal(htTimerHT, iTimerID_MJUnit, StringHash("rEveryDegree"), rEveryDegree)
    call TimerStart(tTimer_MJUnit, 0.03, true, function TimerAction_A00R_MJUnit)
    
    //HeroTimer
    set tTimer=CreateTimer()
    set iTimerID=GetHandleId(tTimer)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer, 1., true, function TimerAction_A00R_Hero)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uSetHeightUnit=null
    set tTimer=null
    set tTimer_MJUnit=null
endfunction//===========================================================================
// Trigger: 20_A005
//===========================================================================
//TESH.scrollpos=45
//TESH.alwaysfold=0
function ChargeParabolaTriggerAction_A005 takes nothing returns nothing
    local unit uUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uUnit"))
local unit uHero= LoadUnitHandle(htUnitHT, GetHandleId(uUnit), StringHash("uHero"))
    local real rDamage= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamage"))
    local real rRange= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rRange"))
    local real x= GetUnitX(uUnit)
    local real y= GetUnitY(uUnit)
    //Damage
    call RangeDamage(x , y , rRange , uHero , rDamage)
    //effect
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", x, y))
    set uHero=null
    set uUnit=null
endfunction
function AbilityAction_A005 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rRange= 250
    local real rDamage= 105.
    //ParabolaData
    local integer stParabola
    local real rDegree_Parabola= 0
    local unit uParabolaUnit
    local boolean bIsDestroyUnit_Parabola= true
    local real rTotalDistance_Parabola= 1000.
    local real rParabolaTimes= 4
local real rTotalTime_Parabola= 1.5 * rParabolaTimes
local real rEveryDistance_Parabola= rTotalDistance_Parabola / rTotalTime_Parabola * 0.03
    local real rReduceHeight_Parabola= 25
local real rMaxHeight_Parabola= 300
    local real rMinHeight_Parabola= 50
    local real rCurrentHeight_Parabola= rMinHeight_Parabola
    local integer i
    
    set rDegree_Parabola=GetUnitFacing(uHero)
    set i=1
    loop
        exitwhen i > 7
        set uParabolaUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree_Parabola)
        call Com_SetUnitScale(uParabolaUnit , 3.) //体积
call DzSetUnitModel(uParabolaUnit, "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl")
        //ParabolaData
        set stParabola=s__ChargeParabolaData_create(uParabolaUnit , bIsDestroyUnit_Parabola , rDegree_Parabola , rTotalDistance_Parabola , rTotalTime_Parabola , rEveryDistance_Parabola)
        call s__ChargeParabolaData_SetParabolaData(stParabola , rParabolaTimes , rReduceHeight_Parabola , rCurrentHeight_Parabola , rMaxHeight_Parabola , rMinHeight_Parabola)
        //Trigger
        call SaveUnitHandle(htUnitHT, GetHandleId(uParabolaUnit), StringHash("uHero"), uHero)
        call SaveReal(htUnitHT, GetHandleId(uParabolaUnit), StringHash("rDamage"), rDamage)
        call SaveReal(htUnitHT, GetHandleId(uParabolaUnit), StringHash("rRange"), rRange)
        call SaveTriggerHandle(htUnitHT, GetHandleId(uParabolaUnit), StringHash("tTrigger"), gg_trg_20_A005)
        //伤害提示圈马甲单位数据
        call SaveStr(htUnitHT, GetHandleId(uParabolaUnit), StringHash("MJUnit_ModelString"), "Ember_Ring_Aura_red.mdx") //模型
call SaveInteger(htUnitHT, GetHandleId(uParabolaUnit), StringHash("MJUnit_Id"), 'e000') //不隐藏马甲
call SaveReal(htUnitHT, GetHandleId(uParabolaUnit), StringHash("MJUnit_Scale"), 1.5) //体积
set rDegree_Parabola=rDegree_Parabola + 360 / 7
        set i=i + 1
    endloop
    
    
    set uHero=null
    set pPlayer=null
    set uParabolaUnit=null
endfunction
//===========================================================================
function InitTrig_20_A005 takes nothing returns nothing
    set gg_trg_20_A005=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_20_A005, function ChargeParabolaTriggerAction_A005)
endfunction
//===========================================================================
// Trigger: 28_A01N/*血肉傀儡*/
//
// units\other\FleshGolem\FleshGolem
// 1.75
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01N takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local group gGroup
    local unit uGroupUnit
    //Barrage
    local integer stBarrage
    local integer iMode_Barrage= iBarrageMode_Unit
    local real rTargetx_Barrage= 0
    local real rTargety_Barrage= 0
    local unit uBarrageUnit
    local unit uBarrageTargetUnit
    local boolean bIsDestroyUnit= true
    local real rTotalTime_Barrage= 1.5
    local real P0_x
    local real P0_y
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        call SetUnitAnimation(uMJUnit, "Attack") //动画
set gGroup=CreateGroup()
        call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, rRange, null)
        loop
            set uGroupUnit=FirstOfGroup(gGroup)
            exitwhen uGroupUnit == null
            call GroupRemoveUnit(gGroup, uGroupUnit)
            if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            //生命值>0，是敌人，不是建筑，不是马甲单位
                //Barrage
                set P0_x=GetUnitX(uGroupUnit)
                set P0_y=GetUnitY(uGroupUnit)
                set uBarrageUnit=CreateUnit(pPlayer, 'e000', P0_x, P0_y, 0)
                set uBarrageTargetUnit=uMJUnit
                call DzSetUnitModel(uBarrageUnit, "Abilities\\Weapons\\IllidanMissile\\IllidanMissile.mdl")
                call Com_SetUnitScale(uBarrageUnit , 1.) //体积
call SetUnitFlyHeight(uBarrageUnit, 50, 0.) //高度
set stBarrage=s__BarrageData_create(iMode_Barrage , rTargetx_Barrage , rTargety_Barrage , uBarrageUnit , uBarrageTargetUnit , bIsDestroyUnit , rTotalTime_Barrage)
                call s__BarrageData_SetBarrageData(stBarrage , P0_x , P0_y)
                //Damage
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            endif
        endloop
        call DestroyGroup(gGroup)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    set gGroup=null
    set uGroupUnit=null
    set uBarrageUnit=null
    set uBarrageTargetUnit=null
endfunction
function AbilityAction_A01N takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 6
    local real rRange= 500
    local real rDamage= 100
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 1
local real rTimerCount= rTimerInterval
    
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, rDegree)
    call DzSetUnitModel(uMJUnit, "units\\demon\\Infernal\\Infernal.mdl")
    call Com_SetUnitScale(uMJUnit , 1.) //体积
//call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration+2)    //生命周期
call SetUnitFlyHeight(uMJUnit, 50, 0.) //高度
call YDWETimerRemoveUnit(rDuration + 2 , uMJUnit) //几秒后删除
call SetUnitAnimation(uMJUnit, "Attack") //动画

    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01N)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 29_A01O
//
// 燃烧之油Abilities\Weapons\DemolisherFireMissile\DemolisherFireMissile.mdl
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function ChargeTriggerAction_A01O takes nothing returns nothing
    local unit uUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uUnit"))
local unit uHero= LoadUnitHandle(htUnitHT, GetHandleId(uUnit), StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDamage= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamage"))
    local real rRange= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rRange"))
    local real x= GetUnitX(uUnit)
    local real y= GetUnitY(uUnit)
    local unit uMJUnit
    //DamageData
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit
    local real rDamage_Syst= rDamage
    local real rTotalTime_Damage= 3
    local real iDamageTimeInterval= 0.5
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    
    //范围Damage
    call RangeDamage(x , y , rRange , uHero , rDamage)
    //effect
    set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
    call UnitAddAbility(uMJUnit, 'A01R') //技能
call IssuePointOrder(uMJUnit, "flamestrike", x, y)
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//持续Damage
set uSetDamageUnit=uMJUnit
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Syst , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    
    set uHero=null
    set uUnit=null
    set uMJUnit=null
    set pPlayer=null
    set uSetDamageUnit=null
endfunction
function TimerAction_AbilityAction_A01O takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uChargeUnit_Init= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit"))
    local unit uMJUnit
    //local real rDegree_Charge = LoadReal(htTimerHT, iTimerID, StringHash("rDegree_Charge"))
    local real rATK= LoadReal(htTimerHT, iTimerID, StringHash("rATK"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage_Duration= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_Duration"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= LoadReal(htTimerHT, iTimerID, StringHash("rDegree_Charge"))
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 400
    local real rTotalTime_Charge= 1.5
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer iFlyMode= SetHeightWay_Down
    local real rCurrentHeight= 500
    local real rExtremeHeight= 2000.
    local real rEveryHeight= rCurrentHeight / rTotalTime_SetHeight * 0.03
    
    //SetHeight_Acceleration
    local integer stHeight_Acce
    local unit uUnit_HeightAcce
    local real rTotalTime_HeightAcce= rTotalTime_Charge
    local integer iFlyMode_HeightAcce= SetHeight_Acce_Down
    local integer iSpeedMode_HeightAcce= SetHeight_Acce_AcceleratedSpeed
    local real rInitHeight_HeightAcce= 500
    local real rTargetHeight_HeightAcce= 0
    local real rMaxHeight_HeightAcce= 500
    local real rMinHeight_HeightAcce= 0
    
    local real x= GetUnitX(uChargeUnit_Init)
    local real y= GetUnitY(uChargeUnit_Init)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
        call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl")
        call Com_SetUnitScale(uMJUnit , 2.) //体积
call SetUnitFlyHeight(uMJUnit, 500, 0.) //高度
set uChargeUnit=uMJUnit
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //Trigger
        call SaveUnitHandle(htUnitHT, GetHandleId(uMJUnit), StringHash("uHero"), uHero)
        call SaveReal(htUnitHT, GetHandleId(uMJUnit), StringHash("rDamage"), rDamage_Duration)
        call SaveReal(htUnitHT, GetHandleId(uMJUnit), StringHash("rRange"), rRange)
        call SaveTriggerHandle(htUnitHT, GetHandleId(uMJUnit), StringHash("tTrigger"), gg_trg_29_A01O)
        //Height
        set uUnit_HeightAcce=uChargeUnit
        set stHeight_Acce=s__SetHeight_AcceData_create(uUnit_HeightAcce , rTotalTime_HeightAcce , iFlyMode_HeightAcce , iSpeedMode_HeightAcce , rInitHeight_HeightAcce , rTargetHeight_HeightAcce , rMaxHeight_HeightAcce , rMinHeight_HeightAcce)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set uChargeUnit_Init=null
    set uSetHeightUnit=null
    set tTimer=null
endfunction
function AbilityAction_A01O takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit
    local real rDuration= 2.5
    local real rRange= 300
    local real rDamage_Duration= 50 + 0.1 * rGetHeroInt(uHero)
    local real rATK= 50 + 2 * rGetHeroInt(uHero)
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 2000
    local real rTotalTime_Charge= 3
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.5
local real rTimerCount= rTimerInterval
    local real rDegree
    local real rDistance
    local real x
    local real y
    //Charge
    set rDistance=- 500
    set rDegree=GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    set x=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
    set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e001', x, y, rDegree_Charge)
    //call DzSetUnitModel(uMJUnit, "units\\human\\Gyrocopter\\Gyrocopter")
    call Com_SetUnitScale(uMJUnit , 2.) //体积
call SetUnitFlyHeight(uMJUnit, 500, 0.) //高度
set uChargeUnit=uMJUnit
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit"), uChargeUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDegree_Charge"), rDegree_Charge)
    call SaveReal(htTimerHT, iTimerID, StringHash("rATK"), rATK)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_Duration"), rDamage_Duration)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01O)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set tTimer=null
endfunction
function InitTrig_29_A01O takes nothing returns nothing
    set gg_trg_29_A01O=CreateTrigger()
    call TriggerAddAction(gg_trg_29_A01O, function ChargeTriggerAction_A01O)
endfunction
//===========================================================================
// Trigger: 24_A01J/*散开冲锋*/
//
// iTimerCount
//===========================================================================
//TESH.scrollpos=116
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01J_2 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uMJUnit
    local player pPlayer= GetOwningPlayer(uHero)
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    //local real rDamage = LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local integer iNum_MJUnit= LoadInteger(htTimerHT, iTimerID, StringHash("iNum_MJUnit"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //ChargeData
    local integer stCharge
    local real rDegree_Charge
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance
    local real rTotalTime_Charge= 1
    local real rEveryDistance
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    
    local real x
    local real y
    local integer i
    set i=1
    loop
        exitwhen i > iNum_MJUnit
        //Charge
        set uMJUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)))
        set x=GetUnitX(uMJUnit)
        set y=GetUnitY(uMJUnit)
        set rDegree_Charge=GetDegree(x , y , rTargetx , rTargety)
        set rTotalDistance=GetDistance(x , y , rTargetx , rTargety)
        call Com_SetUnitScale(uMJUnit , 3.) //体积
call SetUnitFacing(uMJUnit, rDegree_Charge)
        set uChargeUnit=uMJUnit
        set rEveryDistance=rTotalDistance / rTotalTime_Charge * 0.03
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //Damage
        set uSetDamageUnit=uChargeUnit
        set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
        call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
        set i=i + 1
    endloop
    //End
    call FlushChildHashtable(htTimerHT, iTimerID)
    call DestroyTimer(tTimer)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set uSetDamageUnit=null
    set tTimer=null
endfunction
function TimerAction_AbilityAction_A01J_1 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    //local real rDamage = LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local unit uMJUnit
    //ChargeData
    local integer stCharge
    local real rDegree_Charge
    local unit uChargeUnit
    local boolean bIsDestroyUnit= false
    local real rTotalDistance
    local real rTotalTime_Charge= 1
    local real rEveryDistance
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    //Timer
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        set rDegree_Charge=I2R(GetRandomInt(0, 359))
        set rTotalDistance=I2R(GetRandomInt(400, 600))
        //Charge
        set uMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree_Charge)
        call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl")
        call Com_SetUnitScale(uMJUnit , 2.) //体积
call SetUnitFlyHeight(uMJUnit, 50, 0.) //高度
//call SetUnitVertexColor(uMJUnit, 0, 255, 0, 255)  //颜色透明度
set uChargeUnit=uMJUnit
        set rEveryDistance=rTotalDistance / rTotalTime_Charge * 0.03
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(iTimerCount)), uMJUnit)
        //Damage
        set uSetDamageUnit=uChargeUnit
        set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
        call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    else
        //End
        set rTimerInterval=rTotalTime_Charge
        call SaveInteger(htTimerHT, iTimerID, StringHash("iNum_MJUnit"), iTimerCount)
        //call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
        call PauseTimer(tTimer)
        call TimerStart(tTimer, rTimerInterval, false, function TimerAction_AbilityAction_A01J_2)
    endif
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set uSetDamageUnit=null
    set tTimer=null
endfunction
function AbilityAction_A01J takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    //local real rLevel = I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration
    local real rRange= 200
local real rDamage= 100
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local real rTimerInterval= 0.05
local real rTimerCount= rTimerInterval
    
    //Timer
    set rDuration=rTimerInterval * 20 //多少个冲锋
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHerox"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHeroy"), rHeroy)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01J_1)
    
    set uHero=null
    set pPlayer=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 19_A01D/*瀑布环绕*/
//===========================================================================
//TESH.scrollpos=50
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01D takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local effect eEffect
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        //Damage
        call RangeDamage(rTargetx , rTargety , rRange , uHero , rDamage)
        //TX
        set i=1
        set rDegree=0
        loop
            exitwhen i > 20
            set rDistance=I2R(GetRandomInt(100, 500))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set eEffect=AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x, y)
            call EXSetEffectSize(eEffect, 2.5)
            call DestroyEffect(eEffect)
            set rDegree=rDegree + 30
            set i=i + 1
        endloop
    else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set uHero=null
    set pPlayer=null
    set eEffect=null
    set tTimer=null
endfunction
function AbilityAction_A01D takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 6
    local real rRange= 600
    local real rDamage= 300 * rLevel + 2 * rGetHeroAllState(uHero)
    local unit uMJUnit
    local effect eEffect
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 1
local real rTimerCount= rTimerInterval
    set rDamage=rDamage / ( rDuration / rTimerInterval )
    //瀑布
    set i=1
    set rDistance=400
    set rDegree=0
    loop
        exitwhen i > 20
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e024', x, y, rDegree + 180) //不隐藏，且有死亡效果
call DzSetUnitModel(uMJUnit, "Doodads\\Terrain\\CliffDoodad\\Waterfall\\Waterfall.mdl")
        //call Com_SetUnitScale(uMJUnit, 1)       //体积
        call UnitApplyTimedLife(uMJUnit, 'BHwe', 6.00) //生命周期
set rDegree=rDegree + 18
        set i=i + 1
    endloop
    //TX
    set i=1
    set rDegree=0
    loop
        exitwhen i > 20
        set rDistance=I2R(GetRandomInt(100, 500))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set eEffect=AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x, y)
        call EXSetEffectSize(eEffect, 2.5)
        call DestroyEffect(eEffect)
        set rDegree=rDegree + 30
        set i=i + 1
    endloop
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01D)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set eEffect=null
    set tTimer=null
endfunction//===========================================================================
// Trigger: 8_A00O/*冰锥弹幕*/
//
// 弹幕
//===========================================================================
//TESH.scrollpos=33
//TESH.alwaysfold=0
function RandomModel_A00O takes nothing returns string
    local integer iIndex= GetRandomInt(0, 6)
    local string array sModelString
    set sModelString[0]="Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl" //光，精灵龙投射物
set sModelString[1]="Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl" //红光，毒蛇守卫
set sModelString[2]="Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl" //蓝，复仇天神
set sModelString[3]="Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl" //绿，奇美拉
set sModelString[4]="Abilities\\Weapons\\BlackKeeperMissile\\BlackKeeperMissile.mdl" //紫色
set sModelString[5]="Abilities\\Weapons\\MurgulMagicMissile\\MurgulMagicMissile.mdl" //青色
set sModelString[6]="Abilities\\Weapons\\SorceressMissile\\SorceressMissile.mdl" //金色
return sModelString[iIndex]
endfunction
function Trig_8_A00O_Condition takes nothing returns boolean
    return ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false )
endfunction
function AbilityAction_A00O takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uTargetUnit
    local real rTargetx
    local real rTargety
    local unit uMJUnit
    local string sModel
    local real rDegree
    local real rSpellDistance= S2R(EXExecuteScript("(require'jass.slk').ability[" + I2S('A00O') + "].Rng1"))
    local group gGroup= CreateGroup()
    local integer i= 0
    local integer iGroupCount

    //Barrage
    local integer stBarrage
    local integer iMode_Barrage= iBarrageMode_Unit
    local real rTargetx_Barrage= 0
    local real rTargety_Barrage= 0
    local unit uBarrageUnit
    local unit uBarrageTargetUnit
    local boolean bIsDestroyUnit= true
    local real rTotalTime_Barrage= 2.
    
    local real P0_x
    local real P0_y
    
    
    //Damage
    local integer stDamage
    local integer iDamageWay= SingleDamage
    local unit uSetDamageUnit= uHero
    local real rDamage= 10.
    local real rTotalTime_Damage= rTotalTime_Barrage
    local real iDamageTimeInterval= rTotalTime_Damage
    //iDamageWay==11时是单体伤害
    local unit uGetDamageUnit
    
    call GroupEnumUnitsInRange(gGroup, rHerox, rHeroy, rSpellDistance, Condition(function Trig_8_A00O_Condition))
    set iGroupCount=CountUnitsInGroup(gGroup)
    if ( iGroupCount != 0 ) then
        loop
            set i=i + 1
            exitwhen i > 20
            set uTargetUnit=GroupPickRandomUnit(gGroup)
            set rTargetx=GetUnitX(uTargetUnit)
            set rTargety=GetUnitY(uTargetUnit)
            set rDegree=GetDegree(rHerox , rHeroy , rTargetx , rTargety) + 180.
            set uMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree)
            //call DzSetUnitModel(uMJUnit, RandomModel_A00O())
            call DzSetUnitModel(uMJUnit, "blizmissile.mdl")
            call SetUnitScale(uMJUnit, 0.5, 0.5, 0.5)
            //Barrage
            set uBarrageUnit=uMJUnit
            set uBarrageTargetUnit=uTargetUnit
            set P0_x=rHerox
            set P0_y=rHeroy
            set stBarrage=s__BarrageData_create(iMode_Barrage , rTargetx_Barrage , rTargety_Barrage , uBarrageUnit , uBarrageTargetUnit , bIsDestroyUnit , rTotalTime_Barrage)
            call s__BarrageData_SetBarrageData(stBarrage , P0_x , P0_y)
            //Damage
            set uGetDamageUnit=uTargetUnit
            set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
            call s__DamageData_SetDamageData_Single(stDamage , uGetDamageUnit)
        endloop
    endif
    call DestroyGroup(gGroup)
    
    set uHero=null
    set pPlayer=null
    set uTargetUnit=null
    set uMJUnit=null
    set gGroup=null
    set uBarrageUnit=null
    set uBarrageTargetUnit=null
    set uSetDamageUnit=null
    set uGetDamageUnit=null
endfunction
//===========================================================================
// Trigger: 12_A00U/*冰锥坠落*/
//===========================================================================
//TESH.scrollpos=66
//TESH.alwaysfold=0
function TimerAction_A00U_1 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local unit uMJUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, rTargetx, rTargety, 256., null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( IsUnitAlly(uGroupUnit, pPlayer) == false ) then
            call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        endif
    endloop
    call DestroyGroup(gGroup)
    
    //Effect
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0.)
    call DzSetUnitModel(uMJUnit, "EMPBomb.mdl")
    call SetUnitFlyHeight(uMJUnit, 100., 0.)
    call SetUnitAnimation(uMJUnit, "birth")
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.)
    //End
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    
    set tTimer=null
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set gGroup=null
    set uGroupUnit=null
endfunction
function TimerAction_A00U takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit_e010
    local unit uMJUnit_ring
    local real rDistance= I2R(GetRandomInt(200, 800))
    local real rDegree= I2R(GetRandomInt(0, 359))
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx
    local real rTargety
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= 1.5
    local integer iFlyMode= SetHeightWay_Down
    local real rCurrentHeight= 1500.
    local real rExtremeHeight= 2000.
    local real rEveryHeight= ( rCurrentHeight - 300. ) / rTotalTime_SetHeight * 0.03
    //Timer1
    local timer tTimer_1= CreateTimer()
    local integer iTimerID_1= GetHandleId(tTimer_1)
    
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    
    set rTargetx=rHerox + rDistance * Cos(Deg2Rad(rDegree))
    set rTargety=rHeroy + rDistance * Sin(Deg2Rad(rDegree))
    set rTargetx=YDWECoordinateX(rTargetx)
    set rTargety=YDWECoordinateY(rTargety)
    if ( iTimerCount <= 20 ) then
        //提示圈
        set uMJUnit_ring=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0.)
        call UnitApplyTimedLife(uMJUnit_ring, 'BHwe', rTotalTime_SetHeight)
        call DzSetUnitModel(uMJUnit_ring, "Ember_Ring_Aura_blue.mdl") //model
call SetUnitScale(uMJUnit_ring, 2., 2., 2.) //体积
//冰晶
set uMJUnit_e010=CreateUnit(pPlayer, 'e010', rTargetx, rTargety, 0.)
        call UnitApplyTimedLife(uMJUnit_e010, 'BHwe', rTotalTime_SetHeight)
        set uSetHeightUnit=uMJUnit_e010
        set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
        call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
        
        call SaveUnitHandle(htTimerHT, iTimerID_1, StringHash("uHero"), uHero)
        call SaveReal(htTimerHT, iTimerID_1, StringHash("rDamage"), rDamage)
        call SaveReal(htTimerHT, iTimerID_1, StringHash("rTargetx"), rTargetx)
        call SaveReal(htTimerHT, iTimerID_1, StringHash("rTargety"), rTargety)
        call TimerStart(tTimer_1, rTotalTime_SetHeight, false, function TimerAction_A00U_1)
    else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    
    set uHero=null
    set pPlayer=null
    set uMJUnit_e010=null
    set uMJUnit_ring=null
    set uSetHeightUnit=null
    set tTimer=null
    set tTimer_1=null
endfunction
function AbilityAction_A00U takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local real rHeroATK= GetUnitState(uHero, ConvertUnitState(0x12))
    local real rDamage= rHeroATK * 5.
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call TimerStart(tTimer, 0.5, true, function TimerAction_A00U)
    
    set uHero=null
    set tTimer=null
endfunction//===========================================================================
// Trigger: 13_A00Z/*冰魄锤击*/
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A00Z takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    
    
    
    
endfunction
//===========================================================================
// Trigger: 14_A010/*寒冰龙卷*/
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A010 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local effect eEffect
    local unit uMJUnit
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 0.25)
    if ( rTimerCount <= rDuration ) then
        //Damage
        call RangeDamage(rTargetx , rTargety , 800 , uHero , rDamage)
    else
        set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
        call DzSetUnitModel(uMJUnit, "IceTornado.mdl")
        call Com_SetUnitScale(uMJUnit , 4.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 1.00) //生命周期
//Effect
set eEffect=AddSpecialEffect("bingTX0_Birth.mdx", rTargetx, rTargety)
        call EXSetEffectSize(eEffect, 1)
        call DestroyEffect(eEffect)
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set uMJUnit=null
    set tTimer=null
    set uHero=null
    set pPlayer=null
    set eEffect=null
endfunction
function AbilityAction_A010 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 3
    local real rDamage= ( 100 * rLevel + 5 * rGetHeroStr(uHero) ) / 4
    local real x
    local real y
    local real rDegree
    local real rDistance
    local integer i
    //SurroundData
    local integer stSurround
    local integer iSurroundMode= iSurroundMode_Coord
    local real rSurrx= rTargetx
    local real rSurry= rTargety
    local unit uCentreUnit= null
    local unit uOutsideUnit
    local boolean bIsDestroyUnit= true
    local real rUnitFacDegree= 90.
    local real rNowSurrDegree
    local real rTotalTime_Surround= 3.
    local real rTotalSurrDegree= 360. * 3.
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 800.
    local real rEveryDistance= - rCentreDistance / rTotalTime_Surround * 0.03
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerCount= 0.25
    //冰阵
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call DzSetUnitModel(uMJUnit, "bingzhen.mdl")
    call SetUnitScale(uMJUnit, 5., 5., 5.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//减速马甲
set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A013') //技能
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//龙卷
set i=1
    set rDistance=rCentreDistance
    set rDegree=0
    loop
        exitwhen i > 2
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree)
        call DzSetUnitModel(uMJUnit, "IceTornado.mdl")
        call SetUnitScale(uMJUnit, 2., 2., 2.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//Surround
set uOutsideUnit=uMJUnit
        set rNowSurrDegree=rDegree
        set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit)
        call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryDistance)
        
        set i=i + 1
        set rDegree=rDegree + 180
    endloop
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 0.25, true, function TimerAction_AbilityAction_A010)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uCentreUnit=null
    set uOutsideUnit=null
    set tTimer=null
    
endfunction
//===========================================================================
// Trigger: 15_A011/*千里冰封*/
//
// "bingci4.mdl"
// "bingci5.mdl"
// "bingci6.mdl"
// "bingci7.mdl"
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A011 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit
    local integer i
    local integer j
    local integer iUnitCount
    local real rDegree
    local real rDistance
    local real x
    local real y
    local string array sUnitModelString
        
    set sUnitModelString[1]="bingci4.mdl"
    set sUnitModelString[2]="bingci5.mdl"
    set sUnitModelString[3]="bingci6.mdl"
    set sUnitModelString[4]="bingci7.mdl"
    //冻结
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A014') //技能
//call SetUnitAbilityLevel(uMJUnit, 'A014', iTimerCount)
call IssueImmediateOrder(uMJUnit, "stomp")
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//大尖冰
set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call DzSetUnitModel(uMJUnit, "bingjing.mdl")
    call Com_SetUnitScale(uMJUnit , 1.2) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//Loop
set i=1
    set iUnitCount=10
    set rDistance=300
    loop
        exitwhen i > 3
            set rDegree=0
            set j=1
            loop
                exitwhen j > iUnitCount
                //Action
                set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
                set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree)
                call DzSetUnitModel(uMJUnit, sUnitModelString[GetRandomInt(1, 4)])
                call Com_SetUnitScale(uMJUnit , 3.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 3.00) //生命周期
//Effect
call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", x, y))
                set rDegree=rDegree + 360 / I2R(iUnitCount)
                set j=j + 1
            endloop
        set iUnitCount=iUnitCount + 3
        set rDistance=rDistance + 300
        set i=i + 1
    endloop
    
    call DestroyEffect(AddSpecialEffect("bingTX0_Birth.mdx", rTargetx, rTargety))
    //Damage
    call RangeDamage(rTargetx , rTargety , 1000 , uHero , rDamage)
    //End
    call DestroyTimer(tTimer)
    call FlushChildHashtable(htTimerHT, iTimerID)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
endfunction
function AbilityAction_A011 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    //local player pPlayer = GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uMJUnit
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDamage= 500 * rLevel + 3 * rGetHeroAllState(uHero)
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //Action
    //call SetUnitTimeScale(uHero, 1.)   //动画速度
    call SetUnitAnimation(uHero, "Spell") //动画
//Timer
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rHeroy)
    call TimerStart(tTimer, 0.5, false, function TimerAction_AbilityAction_A011)
    
    set uHero=null
    set uMJUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 16_A012/*极冰绽放*/
//
// bingci0.mdl
// blizmissile.mdl
//===========================================================================
//TESH.scrollpos=45
//TESH.alwaysfold=0
//扇形范围伤害特效
//call Com_RangeDamage_Cone_A012(x, y, rDistance, rDegree_Min, rDegree_Max, uHero, rDamage)
function Com_RangeDamage_Cone_A012 takes real x,real y,real rDistance,real rDegree_Centre,real rDegree_Range,unit uHero,real rDamage returns nothing
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
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", uGroupUnit, "origin"))
        endif
    endloop
    call DestroyGroup(gGroup)
    set gGroup=null
    set uGroupUnit=null
endfunction
function TimerAction_AbilityAction_A012 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local real rDegree= LoadReal(htTimerHT, iTimerID, StringHash("rDegree"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    //ChargeData
    local integer stCharge
    local real rDegree_Charge
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 1000
    local real rTotalTime_Charge= 1
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    
    local integer i= 1
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 0.5)
    if ( rTimerCount <= rDuration ) then
        //Charge
        set rDegree_Charge=rDegree - 40
        loop
            exitwhen i > 5
            set i=i + 1
            set uChargeUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree_Charge)
            call DzSetUnitModel(uChargeUnit, "blizmissile.mdl")
            call Com_SetUnitScale(uChargeUnit , 1.) //体积
call UnitAddAbility(uChargeUnit, 'A015') //技能
set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
            set rDegree_Charge=rDegree_Charge + 20
        endloop
        //Damage
        if ( ModuloInteger(iTimerCount, 2) == 0 ) then
            call Com_RangeDamage_Cone_A012(rHerox , rHeroy , 1000 , rDegree , 40 , uHero , rDamage)
        endif
    else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
    set pPlayer=null
    set uChargeUnit=null
endfunction
function AbilityAction_A012 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 3
    local real rDamage= ( 100 * rLevel + 3 * rGetHeroStr(uHero) ) / 3
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local real rTimerCount= 0.5
    call BJDebugMsg("rDegree:" + R2S(rDegree))
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHerox"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHeroy"), rHeroy)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDegree"), rDegree)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call TimerStart(tTimer, 0.5, true, function TimerAction_AbilityAction_A012)
    
    set uHero=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 17_A016/*冰雹*/
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A016 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local integer i
    local real rDegree
    local real rDistance
    local real x
    local real y
    
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    //local integer iTimerCount = LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount") , iTimerCount + 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        //Damage
        call RangeDamage(rTargetx , rTargety , rRange , uHero , rDamage)
        //Effect
        set i=1
        loop
            exitwhen i > 20
            set i=i + 1
            set rDistance=GetRandomInt(1, 600)
            set rDegree=I2R(GetRandomInt(0, 359))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Blizzard\\BlizzardTarget.mdl", x, y))
        endloop
    else
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set tTimer=null
    set uHero=null
endfunction
function AbilityAction_A016 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 5
    local real rRange= 600
    local real rDamage= 30 * rLevel + 0.5 * rGetHeroStr(uHero)
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 1
    local real rTimerCount= rTimerInterval
    local integer i
    //MJ
    set i=1
    loop
        exitwhen i > 3
        set i=i + 1
        set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
        call UnitAddAbility(uMJUnit, 'A017') //减速技能，600范围
call DzSetUnitModel(uMJUnit, "bingTX5bingbao.mdl")
        call Com_SetUnitScale(uMJUnit , 3.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 5.5) //生命周期
endloop
    
    //Sound
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call ShowUnit(uMJUnit, false) //隐藏单位
call UnitAddAbility(uMJUnit, 'A018') //技能
call IssuePointOrder(uMJUnit, "blizzard", rTargetx, rTargety)
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 5.5) //生命周期
//Timer
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount") , iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A016)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
endfunction
//===========================================================================
// Trigger: 18_A019/*永罪冰狱*/
//
// 差音效
// bingci3_juda_Crystal.mdl
//===========================================================================
//TESH.scrollpos=78
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A019 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit array uMJUnit
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local integer i
    local real rDegree
    local real rDistance
    local real x
    local real y
    local real array rDegree_1
    local effect eEffect
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local integer iTimerCount= LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount + 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    set rDegree_1[1]=0
    set rDegree_1[2]=180
    set rDegree_1[3]=240
    //Sound
    if ( rTimerCount <= rDuration ) then
        if ( rTimerCount == 2 ) then
            //冰箭阵亡特效
            set uMJUnit[1]=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
            call DzSetUnitModel(uMJUnit[1], "bingTX1.mdl")
            call Com_SetUnitScale(uMJUnit[1] , 3.) //体积
call UnitApplyTimedLife(uMJUnit[1], 'BHwe', 7.00) //生命周期
elseif ( rTimerCount == 3 ) then
            set rDistance=100
            set rDegree=45
            set i=1
            loop
                exitwhen i > 3
                set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
                set uMJUnit[i]=CreateUnit(pPlayer, 'e000', x, y, rDegree_1[i])
                call DzSetUnitModel(uMJUnit[i], "bingci3_juda_Crystal.mdl")
                call Com_SetUnitScale(uMJUnit[i] , 2.) //体积
//call SetUnitVertexColor(uMJUnit[i], 255, 255, 255, 255)  //颜色透明度
call UnitApplyTimedLife(uMJUnit[i], 'BHwe', 3.00) //生命周期
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)), uMJUnit[i])
                set i=i + 1
                set rDegree=rDegree + 120
            endloop
            //眩晕5秒
            set uMJUnit[1]=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
            call ShowUnit(uMJUnit[1], false) //隐藏单位
call UnitAddAbility(uMJUnit[1], 'A01B') //技能
call IssueImmediateOrder(uMJUnit[1], "stomp")
            call UnitApplyTimedLife(uMJUnit[1], 'BHwe', 1) //生命周期
elseif ( rTimerCount == 4 ) then
            set i=1
            loop
                exitwhen i > 3
                set uMJUnit[i]=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)))
                call Com_SetUnitScale(uMJUnit[i] , 3.) //体积
set i=i + 1
            endloop
        elseif ( rTimerCount == 5 ) then
            set i=1
            loop
                exitwhen i > 3
                set uMJUnit[i]=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)))
                call Com_SetUnitScale(uMJUnit[i] , 4.) //体积
set i=i + 1
            endloop
        endif
    else
        //Effect
        //冰踩地板
        set i=1
        loop
            exitwhen i > 8
            set rDistance=GetRandomInt(100, 800)
            set rDegree=I2R(GetRandomInt(0, 359))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            set eEffect=AddSpecialEffect("bingTX3.mdl", x, y)
            call EXSetEffectSize(eEffect, 4.00)
            call DestroyEffect(eEffect)
            set i=i + 1
        endloop
        set eEffect=AddSpecialEffect("bingTX0_Birth.mdl", rTargetx, rTargety)
        call EXSetEffectSize(eEffect, 1.5)
        call DestroyEffect(eEffect)
        //Damage
        call RangeDamage(rTargetx , rTargety , rRange , uHero , rDamage)
        //End
        call DestroyTimer(tTimer)
        call FlushChildHashtable(htTimerHT, iTimerID)
    endif
    set i=1
    loop
        exitwhen i > 3
        set uMJUnit[i]=null
        set i=i + 1
    endloop
    set uHero=null
    set pPlayer=null
    set tTimer=null
    set eEffect=null
endfunction
function AbilityAction_A019 takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rDistance= GetDistance(rHerox , rHeroy , rTargetx , rTargety)
    local unit uMJUnit_Bow
    local unit uMJUnit_Arrow
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 5
    local real rRange= 1000
    local real rDamage= 300 * rLevel + 5 * rGetHeroStr(uHero)
    local real rInitHeight= 500
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= rDistance
    local real rTotalTime_Charge= 2
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Height
    local integer stHeight
    local unit uSetHeightUnit
    local real rTotalTime_SetHeight= rTotalTime_Charge
    local integer iFlyMode= SetHeightWay_Down
    local real rCurrentHeight= rInitHeight
    local real rExtremeHeight= 2000.
    local real rEveryHeight= ( rCurrentHeight - 100 ) / rTotalTime_SetHeight * 0.03
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local integer iTimerCount= 1
    local real rTimerInterval= 1
local real rTimerCount= rTimerInterval
    
    //Action
    //弓
    set uMJUnit_Bow=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree)
    call DzSetUnitModel(uMJUnit_Bow, "binggong_new.mdl")
    call Com_SetUnitScale(uMJUnit_Bow , 10.) //体积
call UnitApplyTimedLife(uMJUnit_Bow, 'BHwe', 5.00) //生命周期
call SetUnitFlyHeight(uMJUnit_Bow, rInitHeight, 0.) //高度
//箭
set uMJUnit_Arrow=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree)
    call DzSetUnitModel(uMJUnit_Arrow, "IceArrow2BirthStand.mdl")
    call Com_SetUnitScale(uMJUnit_Arrow , 7.) //体积
call UnitApplyTimedLife(uMJUnit_Arrow, 'BHwe', 5.00) //生命周期
call SetUnitFlyHeight(uMJUnit_Arrow, rInitHeight, 0.) //高度
call UnitAddAbility(uMJUnit_Arrow, 'A01C') //减速技能
//Charge
set uChargeUnit=uMJUnit_Arrow
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Height
    set uSetHeightUnit=uMJUnit_Arrow
    set stHeight=s__HeightData_create(uSetHeightUnit , rTotalTime_SetHeight)
    call s__HeightData_SetHeightData(stHeight , iFlyMode , rCurrentHeight , rExtremeHeight , rEveryHeight)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A019)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit_Bow=null
    set uMJUnit_Arrow=null
    set tTimer=null
    set uChargeUnit=null
endfunction
//===========================================================================
// Trigger: 22_A01G/*寒冰冲刺*/
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01G takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    //local real rDamage = LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= 0
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 600
    local real rTotalTime_Charge= 0.7
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Damage
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    
    local real rDegree
    local real rDistance= 200
    local real x= GetUnitX(uMJUnit)
    local real y= GetUnitY(uMJUnit)
    local integer i
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        set rDegree=0
        set i=1
        loop
            exitwhen i > 12
            //Charge
            set x=GetUnitX(uMJUnit) + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=GetUnitY(uMJUnit) + rDistance * Sin(rDegree * bj_DEGTORAD)
            set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set rDegree_Charge=rDegree
            set uChargeUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree)
            call DzSetUnitModel(uChargeUnit, "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
            call Com_SetUnitScale(uChargeUnit , 2) //体积
set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
            //Damage
            set uSetDamageUnit=uChargeUnit
            set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage , rTotalTime_Damage , iDamageTimeInterval)
            call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
            
            set rDegree=rDegree + 360 / 12
            set i=i + 1
        endloop
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set uSetDamageUnit=null
    set tTimer=null
endfunction
function AbilityAction_A01G takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 2
    local real rRange= 200
local real rDamage= 50 * rLevel + 0.5 * rGetHeroStr(uHero)
    local unit uMJUnit
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= rDegree
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 800
    local real rTotalTime_Charge= 2.1
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.5
local real rTimerCount= rTimerInterval
    
    //Charge
    set uMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0)
    //call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
    //call Com_SetUnitScale(uMJUnit, 3.)       //体积
    //call SetUnitVertexColor(uMJUnit, 0, 255, 0, 255)  //颜色透明度
    set uChargeUnit=uMJUnit
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01G)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set uChargeUnit=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 23_A01H/*寒冰吐息*/
//
// 攻击马甲在很高的地方攻击
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function AbilityAction_A01H takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //local real rHerox = GetUnitX(uHero)
    //local real rHeroy = GetUnitY(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local unit uMJUnit
    local real rATK= 50 + 2 * rGetHeroInt(uHero)
    
    set uMJUnit=CreateUnit(pPlayer, 'h00F', rTargetx, rTargety, 0)
    call UnitApplyTimedLife(uMJUnit, 'BHwe', 6.00) //生命周期
call US_SetUnitATK(uMJUnit , rATK) //基础伤害
call BJDebugMsg("rATK:" + R2S(US_GetUnitATK(uMJUnit)))
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
endfunction

//===========================================================================
// Trigger: 30_A01Q/*千旋冰轮破*/
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//伤害特效
function TimerAction_AbilityAction_A01Q_3 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rRange= 500
    local integer i
    local integer iNum
    //Damage
    call RangeDamage(rTargetx , rTargety , rRange , uHero , rDamage)
    //Effect
    call DestroyEffect(AddSpecialEffect("bingTX0_Birth.mdl", rTargetx, rTargety))
    //End
    call FlushChildHashtable(htTimerHT, iTimerID)
    call DestroyTimer(tTimer)
    set tTimer=null
    set uHero=null
endfunction
//大冰轮
function TimerAction_AbilityAction_A01Q_2 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    //local unit uMJUnit = LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //local real rDuration = 2
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage_Duration= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_Duration"))
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= GetDistance(rHerox , rHeroy , rTargetx , rTargety)
    local real rTotalTime_Charge= 2
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    //constant integer SingleDamage = 11          //单体伤害
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage_Duration_Syst= rDamage_Duration
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.2
    //iDamageWay==1或2时是群体伤害
    local real rDamage_DurationRange= 500
    
    //SurroundData
    local integer stSurround
    local integer iSurroundMode= iSurroundMode_Unit
    local real rSurrx= 0
    local real rSurry= 0
    local unit uCentreUnit
    local unit uOutsideUnit
    local boolean bIsDestroyUnit_Surround= true
    local real rUnitFacDegree= 45
    local real rNowSurrDegree
    local real rTotalTime_Surround= 5
    local real rTotalSurrDegree= 360 * 3
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 300
    local real rEveryCentreDistance= 0
    
    local integer i
    local integer iNum
    
    //Charge
    set uChargeUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0)
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Damage
    set uSetDamageUnit=uChargeUnit
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Duration_Syst , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamage_DurationRange)
    call SaveStr(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("sString_Effect"), "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
    call SaveStr(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("sString_AttachPoint"), "origin")
    call SaveReal(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("rEffectSize"), 0.5)
    set rNowSurrDegree=0
    set i=1
    set iNum=6
    loop
        exitwhen i > iNum
        set uCentreUnit=uChargeUnit
        set uOutsideUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rNowSurrDegree)
        call DzSetUnitModel(uOutsideUnit, "blizmissile.mdl")
        call Com_SetUnitScale(uOutsideUnit , 1.5) //体积
call SetUnitFlyHeight(uOutsideUnit, 100, 0.) //高度
set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit_Surround)
        call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryCentreDistance)
        set rNowSurrDegree=rNowSurrDegree + 360 / I2R(iNum)
        set i=i + 1
    endloop
    //Pause
    call PauseTimer(tTimer)
    call TimerStart(tTimer, rTotalTime_Charge, false, function TimerAction_AbilityAction_A01Q_3)
    set uHero=null
    set pPlayer=null
    set tTimer=null
    set uChargeUnit=null
    set uSetDamageUnit=null
    set uCentreUnit=null
    set uOutsideUnit=null
endfunction
//冰轮曲线弹道，收回
function TimerAction_AbilityAction_A01Q_1 takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    //Barrage
    local integer stBarrage
    local integer iMode_Barrage= iBarrageMode_Coord
    local real rTargetx_Barrage= rHerox
    local real rTargety_Barrage= rHeroy
    local unit uBarrageUnit
    local unit uBarrageTargetUnit= null
    local boolean bIsDestroyUnit_Barrage= true
    local real rTotalTime_Barrage= 1.5
    local real P0_x
    local real P0_y
    local integer i
    local integer iNum
    set i=1
    set iNum=LoadInteger(htTimerHT, iTimerID, StringHash("iMJUnitNum"))
    loop
        exitwhen i > iNum
        set uBarrageUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uBarrageUnit" + I2S(i)))
        set P0_x=GetUnitX(uBarrageUnit)
        set P0_y=GetUnitY(uBarrageUnit)
        set stBarrage=s__BarrageData_create(iMode_Barrage , rTargetx_Barrage , rTargety_Barrage , uBarrageUnit , uBarrageTargetUnit , bIsDestroyUnit_Barrage , rTotalTime_Barrage)
        call s__BarrageData_SetBarrageData(stBarrage , P0_x , P0_y)
        set i=i + 1
    endloop
    //End
    call PauseTimer(tTimer)
    call TimerStart(tTimer, rTotalTime_Barrage + 0.5, false, function TimerAction_AbilityAction_A01Q_2)
    set tTimer=null
    set uBarrageUnit=null
    set uBarrageTargetUnit=null
endfunction
//冰轮曲线弹道，发出
function TimerAction_AbilityAction_A01Q takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    //local unit uMJUnit = LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local integer iMJUnitNum= LoadInteger(htTimerHT, iTimerID, StringHash("iMJUnitNum"))
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //local real rDuration = 2
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage_Duration= LoadReal(htTimerHT, iTimerID, StringHash("rDamage_Duration"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //Barrage
    local integer stBarrage
    local integer iMode_Barrage= iBarrageMode_Coord
    local real rTargetx_Barrage
    local real rTargety_Barrage
    local unit uBarrageUnit
    local unit uBarrageTargetUnit= null
    local boolean bIsDestroyUnit_Barrage= false
    local real rTotalTime_Barrage= 1.5
    local real P0_x= rHerox
    local real P0_y= rHeroy
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    //constant integer SingleDamage = 11          //单体伤害
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit
    local real rDamage_Duration_Syst= rDamage_Duration
    local real rTotalTime_Damage= 5
    local real iDamageTimeInterval= 1
    //iDamageWay==1或2时是群体伤害
    local real rDamage_DurationRange= rRange
    
    //SurroundData
    local integer stSurround
    local integer iSurroundMode= iSurroundMode_Unit
    local real rSurrx= 0
    local real rSurry= 0
    local unit uCentreUnit
    local unit uOutsideUnit
    local boolean bIsDestroyUnit_Surround= true
    local real rUnitFacDegree= 45
    local real rNowSurrDegree
    local real rTotalTime_Surround= 5
    local real rTotalSurrDegree= 360 * 3
    local real rEverySurrDegree= rTotalSurrDegree / rTotalTime_Surround * 0.03
    local real rCentreDistance= 100
    local real rEveryDistance= 0
    
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    local integer iNum
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rTimerTotalTime ) then
        set rDistance=I2R(GetRandomInt(1, 400))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
//Barrage
set uBarrageUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, 0)
        set rTargetx_Barrage=x
        set rTargety_Barrage=y
        set iMJUnitNum=iMJUnitNum + 1
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uBarrageUnit" + I2S(iMJUnitNum)), uBarrageUnit)
        call SaveInteger(htTimerHT, iTimerID, StringHash("iMJUnitNum"), iMJUnitNum)
        set stBarrage=s__BarrageData_create(iMode_Barrage , rTargetx_Barrage , rTargety_Barrage , uBarrageUnit , uBarrageTargetUnit , bIsDestroyUnit_Barrage , rTotalTime_Barrage)
        call s__BarrageData_SetBarrageData(stBarrage , P0_x , P0_y)
        //Damage
        set uSetDamageUnit=uBarrageUnit
        set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Duration_Syst , rTotalTime_Damage , iDamageTimeInterval)
        call s__DamageData_SetDamageData_Group(stDamage , rDamage_DurationRange)
        //DamageEffect
        //call SaveStr(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("sString_Effect"), "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
        //call SaveStr(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("sString_AttachPoint"), "origin")
        //call SaveReal(htUnitHT, GetHandleId(uSetDamageUnit), StringHash("rEffectSize"), 0.5)
        set rNowSurrDegree=0
        set i=1
        set iNum=6
        loop
            exitwhen i > iNum
            set uCentreUnit=uBarrageUnit
            set uOutsideUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rNowSurrDegree)
            call DzSetUnitModel(uOutsideUnit, "blizmissile.mdl")
            call Com_SetUnitScale(uOutsideUnit , 0.5) //体积
call SetUnitFlyHeight(uOutsideUnit, 100, 0.) //高度
set stSurround=s__SurroundData_create(iSurroundMode , rSurrx , rSurry , uCentreUnit , uOutsideUnit , bIsDestroyUnit_Surround)
            call s__SurroundData_SetSurroundData(stSurround , rUnitFacDegree , rNowSurrDegree , rTotalSurrDegree , rEverySurrDegree , rTotalTime_Surround , rCentreDistance , rEveryDistance)
            set rNowSurrDegree=rNowSurrDegree + 360 / I2R(iNum)
            set i=i + 1
        endloop
    else
        //Pause
        call PauseTimer(tTimer)
        call TimerStart(tTimer, rTotalTime_Barrage + 0.5, false, function TimerAction_AbilityAction_A01Q_1)
    endif
    set uHero=null
    set pPlayer=null
    set tTimer=null
    set uBarrageUnit=null
    set uBarrageTargetUnit=null
    set uSetDamageUnit=null
    set uCentreUnit=null
    set uOutsideUnit=null
endfunction
//巫妖动作
function TimerAction_MJUnitAnimation_A01Q takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + 1)
    if ( rTimerCount <= rTimerTotalTime ) then
        call SetUnitAnimation(uMJUnit, "Stand Channel") //动画
else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set tTimer=null
    set uMJUnit=null
endfunction
function AbilityAction_A01Q takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rRange= 200
local real rDamage= 100 * rLevel + 2 * rGetHeroAllState(uHero)
    local real rDamage_Duration= 50 + 0.1 * rGetHeroAllState(uHero)
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rDistance= GetDistance(rHerox , rHeroy , rTargetx , rTargety)
    local effect eEffect
    local unit uMJUnit= CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree)
local real rMJUnitLifeTime= 8
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.1
local real rTimerTotalTime= rTimerInterval * 10
local real rTimerCount= rTimerInterval
    call DzSetUnitModel(uMJUnit, "units\\undead\\HeroLich\\HeroLich.mdl")
    call Com_SetUnitScale(uMJUnit , 2) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', rMJUnitLifeTime) //生命周期
call SetUnitFlyHeight(uMJUnit, 100, 0.) //高度
call SetUnitAnimation(uMJUnit, "Stand Channel") //动画
set eEffect=AddSpecialEffectTarget("Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", uMJUnit, "left hand")
    call EXSetEffectSize(eEffect, 0.5)
    call YDWETimerDestroyEffect(rMJUnitLifeTime , eEffect)
    set eEffect=AddSpecialEffectTarget("Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl", uMJUnit, "right hand")
    call EXSetEffectSize(eEffect, 0.5)
    call YDWETimerDestroyEffect(rMJUnitLifeTime , eEffect)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHerox"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHeroy"), rHeroy)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage_Duration"), rDamage_Duration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), rTimerTotalTime)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01Q)
    
    set tTimer=CreateTimer()
    set iTimerID=GetHandleId(tTimer)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), 5)
    call TimerStart(tTimer, 1, true, function TimerAction_MJUnitAnimation_A01Q)
    
    set uHero=null
    set pPlayer=null
    set eEffect=null
    set uMJUnit=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 21_A01F/*玄光*/
//
// 数量都是18个
// 最外面：
// 隐身特效：Abilities\Spells\Items\AIvi\AIviTarget.mdl
// 大小：2
// 高度：50
// 移动命令
// 中间：
// 符咒特效：Abilities\Spells\Other\Charm\CharmTarget.mdl
// 最里面：
// 恢复特效：Abilities\Spells\Items\AIre\AIreTarget.mdl
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function AbilityAction_A01F takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    //Target
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    //local real rLevel = I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    //local real rDuration
    local real rRange= 600
    local real rDamage= 300
    local unit uMJUnit
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    //Damage
    call RangeDamage(rTargetx , rTargety , rRange , uHero , rDamage)
    //Effect
    set rDegree=0
    set i=1
    loop
        exitwhen i > 18
        set rDistance=600
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call DzSetUnitModel(uMJUnit, "Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl")
        call Com_SetUnitScale(uMJUnit , 2.) //体积
call SetUnitFlyHeight(uMJUnit, 100, 0.) //高度
call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.5) //生命周期
call US_SetUnitMoveSpeed(uMJUnit , 500)
        call IssuePointOrder(uMJUnit, "move", rTargetx, rTargety)
        
        set rDistance=500
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call DzSetUnitModel(uMJUnit, "Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl")
        call SetUnitFlyHeight(uMJUnit, 50, 0.) //高度
call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.5) //生命周期

        set rDistance=300
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIre\\AIreTarget.mdl", x, y))
        set rDegree=rDegree + 360 / 18
        set i=i + 1
    endloop
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
endfunction
//===========================================================================
// Trigger: 25_A01K/*生命之轮*/
//
// 巫医投射物：Abilities\Weapons\WitchDoctorMissile\WitchDoctorMissile.mdl
// 复活英雄TX：Abilities\Spells\Human\ReviveHuman\ReviveHuman.mdl
// 复活单位：Abilities\Spells\Human\Resurrect\ResurrectTarget.mdl
// 神圣之光：Abilities\Spells\Human\HolyBolt\HolyBoltSpecialArt.mdl
// 先知W：Abilities\Spells\Other\Andt\Andt.mdl
// 闪电效果：医疗波主
// 天使模型：archangel.mdx
//===========================================================================
//TESH.scrollpos=140
//TESH.alwaysfold=0
function GroupAction_A01K takes real x,real y,real rDistance,unit uHero,real rDamage returns nothing
    local group gGroup= CreateGroup()
    local unit uGroupUnit
    call GroupEnumUnitsInRange(gGroup, x, y, rDistance, null)
    loop
        set uGroupUnit=FirstOfGroup(gGroup)
        exitwhen uGroupUnit == null
        call GroupRemoveUnit(gGroup, uGroupUnit)
        if ( GetUnitState(uGroupUnit, UNIT_STATE_LIFE) > 0 ) and ( GetUnitAbilityLevel(uGroupUnit, 'Aloc') == 0 ) then
            //Action
            if ( IsUnitAlly(uGroupUnit, GetOwningPlayer(uHero)) == false ) then
                //敌人
                call UnitDamageTarget(uHero, uGroupUnit, rDamage, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            else
                //友军
                call US_AddUnitLife(uGroupUnit , rDamage / 2)
                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", uGroupUnit, "origin"))
            endif
        endif
    endloop
    call DestroyGroup(gGroup)
    set gGroup=null
    set uGroupUnit=null
endfunction
function TimerAction_AbilityAction_A01K takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    //local integer iTimerCount = LoadInteger(htTimerHT, iTimerID, StringHash("iTimerCount"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local effect eEffect
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount") , iTimerCount + 1)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        //Damage/Cure
        call GroupAction_A01K(rTargetx , rTargety , rRange , uHero , rDamage)
        //Effect
        //call DestroyEffect("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", uMJUnit, "origin")
        set eEffect=AddSpecialEffect("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", rTargetx, rTargety)
        call EXSetEffectSize(eEffect, 3.00)
        call DestroyEffect(eEffect)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set eEffect=null
    set tTimer=null
endfunction
function AbilityAction_A01K takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    //local real rLevel = I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 6
    local real rRange= 600
    local real rDamage= 300
    local unit uMJUnit
    local real rDegree
    local real rDistance
    local real x
    local real y
    local real x1
    local real y1
    local integer i
    local integer iNum
    local lightning lLightning
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 1
local real rTimerCount= rTimerInterval
    
    set rDistance=600
    set rDegree=0
    set i=1
    set iNum=36
    loop
        exitwhen i > iNum
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\WitchDoctorMissile\\WitchDoctorMissile.mdl")
        call Com_SetUnitScale(uMJUnit , 2.5) //体积
//call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration+1)    //生命周期
call YDWETimerRemoveUnit(rDuration + 1 , uMJUnit)
        call SetUnitFlyHeight(uMJUnit, 50, 0.) //高度
set rDegree=rDegree + 360 / I2R(iNum)
        set i=i + 1
    endloop
    
    set rDistance=200
    set rDegree=60
    set i=1
    set iNum=10
    loop
        exitwhen i > iNum
        set rDistance=200
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call DzSetUnitModel(uMJUnit, "Abilities\\Weapons\\WitchDoctorMissile\\WitchDoctorMissile.mdl")
        call Com_SetUnitScale(uMJUnit , 2.5) //体积
//call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration+1)    //生命周期
call YDWETimerRemoveUnit(rDuration + 1 , uMJUnit)
        call SetUnitFlyHeight(uMJUnit, 50, 0.) //高度

        set rDistance=600
        set x1=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y1=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x1=IsXExceedBoundary(x1) //x坐标边界检测
set y1=IsYExceedBoundary(y1) //y坐标边界检测
set lLightning=AddLightning("HWPB", false, x, y, x1, y1)
        call YDWETimerDestroyLightning(rDuration + 1 , lLightning)
        set rDegree=rDegree + 360 / I2R(iNum)
        set i=i + 1
    endloop
    
    //中间马甲
    set rDegree=GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, rDegree)
    call DzSetUnitModel(uMJUnit, "archangel.mdx")
    call Com_SetUnitScale(uMJUnit , 1) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration + 1) //生命周期
call SetUnitFlyHeight(uMJUnit, 100, 0.) //高度
call SetUnitAnimation(uMJUnit, "Stand Channel") //动画

    //Timer
    //set rDamage = rDamage/(rDuration/rTimerInterval)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01K)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set lLightning=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 26_A01L/*旋转火焰*/
//
// 火凤凰Abilities\Weapons\PhoenixMissile\Phoenix_Missile.mdl
// 凤凰火焰Abilities\Weapons\PhoenixMissile\Phoenix_Missile_mini.mdl
// 虚空龙投射物Abilities\Weapons\AvengerMissile\AvengerMissile.mdl
// 魔鬼缠身Abilities\Spells\Other\Doom\DoomTarget.mdl
// 魔鬼缠身爆炸Abilities\Spells\Other\Doom\DoomDeath.mdl
//===========================================================================
//TESH.scrollpos=84
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01L takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local unit uChargeUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit"))
    local real rDegree_Charge= LoadReal(htTimerHT, iTimerID, StringHash("rDegree_Charge"))
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        set i=1
        loop
            exitwhen i > 1
            set rDistance=I2R(GetRandomInt(- 350, 350))
            set rDegree=rDegree_Charge + 90
            set x=GetUnitX(uChargeUnit) + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=GetUnitY(uChargeUnit) + rDistance * Sin(rDegree * bj_DEGTORAD)
            set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
//Damage
//call RangeDamage(x, y, rRange, uHero, rDamage)
//Effect
call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", x, y))
            set i=i + 1
        endloop
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set uChargeUnit=null
    set pPlayer=null
    set tTimer=null
endfunction
function AbilityAction_A01L takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 4
    local real rRange= 100
    local real rDamage= 100
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 1000
    local real rTotalTime_Charge= rDuration
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //VerticalSurroundData
    local integer stVertSurr
    local unit uCentreUnit_VertSurr
    local unit uOutsideUnit_VertSurr
    local boolean bIsDestroyUnit_VertSurr= true
    local real rOffsetAngle_VertSurr
    local real rNowDegree_VertSurr
local real rTotalTime__VertSurr= rTotalTime_Charge
    local real rTotalDegree_VertSurr= 360 * 10
    local real rEveryDegree_VertSurr= 20
    local real rCentreDistance_VertSurr
    local real rEveryDistance_VertSurr= 0
    local real rAddHeight_VertSurr= 500
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage_Syst= rDamage
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.2
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 500
    
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.1
local real rTimerCount= rTimerInterval
    
    local integer i
    local integer j
    local integer iNum_Charge= 4
    local integer iNum_VertSurr= 3
    local real rDegree= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rDistance= - 25 * ( I2R(iNum_Charge) / 2 )
    local real x
    local real y
    
    
    set i=1
    loop
        exitwhen i > iNum_Charge
        set x=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
//Charge
set uChargeUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        
        set rNowDegree_VertSurr=360 / I2R(iNum_Charge) * ( i - 1 )
        set j=1
        loop
            exitwhen j > iNum_VertSurr
            //VerticalSurround
            //外面火焰
            set rOffsetAngle_VertSurr=90 //逆时针
set uCentreUnit_VertSurr=uChargeUnit
            set uOutsideUnit_VertSurr=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge + 90)
            call DzSetUnitModel(uOutsideUnit_VertSurr, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl")
            call Com_SetUnitScale(uOutsideUnit_VertSurr , 2.) //体积
set rCentreDistance_VertSurr=350 //距离
set stVertSurr=s__VerticalSurroundData_create(uCentreUnit_VertSurr , uOutsideUnit_VertSurr , bIsDestroyUnit_VertSurr)
            call s__VerticalSurroundData_SetVerticalSurroundData(stVertSurr , rOffsetAngle_VertSurr , rNowDegree_VertSurr , rTotalDegree_VertSurr , rEveryDegree_VertSurr , rTotalTime__VertSurr , rCentreDistance_VertSurr , rEveryDistance_VertSurr , rAddHeight_VertSurr)
            //里面黑火焰
            set rOffsetAngle_VertSurr=- 90 //顺时针
set uCentreUnit_VertSurr=uChargeUnit
            set uOutsideUnit_VertSurr=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge - 90)
            call DzSetUnitModel(uOutsideUnit_VertSurr, "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            call Com_SetUnitScale(uOutsideUnit_VertSurr , 2.) //体积
set rCentreDistance_VertSurr=250 //距离
set stVertSurr=s__VerticalSurroundData_create(uCentreUnit_VertSurr , uOutsideUnit_VertSurr , bIsDestroyUnit_VertSurr)
            call s__VerticalSurroundData_SetVerticalSurroundData(stVertSurr , rOffsetAngle_VertSurr , rNowDegree_VertSurr , rTotalDegree_VertSurr , rEveryDegree_VertSurr , rTotalTime__VertSurr , rCentreDistance_VertSurr , rEveryDistance_VertSurr , rAddHeight_VertSurr)
            
            set rNowDegree_VertSurr=rNowDegree_VertSurr + 360 / I2R(iNum_VertSurr)
            set j=j + 1
        endloop
        
        set rDistance=rDistance + 25
        set i=i + 1
    endloop
    
    //Charge
    set uChargeUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, rDegree_Charge)
    set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
    //Damage
    set uSetDamageUnit=uChargeUnit
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Syst , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit"), uChargeUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDegree_Charge"), rDegree_Charge)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01L)
    
    set uHero=null
    set pPlayer=null
    set uChargeUnit=null
    set uCentreUnit_VertSurr=null
    set uOutsideUnit_VertSurr=null
    set uSetDamageUnit=null
    set tTimer=null
endfunction

//===========================================================================
// Trigger: 27_A01M/*火轮*/
//===========================================================================
//TESH.scrollpos=90
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01M takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local unit uChargeUnit
    local real rDuration= LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local integer i
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rDuration ) then
        set i=1
        loop
            exitwhen i > 2
            set uChargeUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit" + I2S(i)))
            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", GetUnitX(uChargeUnit), GetUnitY(uChargeUnit)))
            set i=i + 1
        endloop
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set tTimer=null
    set uHero=null
    set uChargeUnit=null
endfunction
function AbilityAction_A01M takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rDegree_Init= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 2
    local real rRange= 200
    local real rDamage= 100
    //ChargeData
    local integer stCharge
    local real rDegree_Charge
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance= 1500
    local real rTotalTime_Charge= 2
    local real rEveryDistance= rTotalDistance / rTotalTime_Charge * 0.03
    //VerticalSurroundData
    local integer stVertSurr
    local unit uCentreUnit_VertSurr
    local unit uOutsideUnit_VertSurr
    local boolean bIsDestroyUnit_VertSurr= true
    local real rOffsetAngle_VertSurr= 0
    local real rNowDegree_VertSurr
local real rTotalTime__VertSurr= rTotalTime_Charge
    local real rTotalDegree_VertSurr= 360 * 5
    local real rEveryDegree_VertSurr= rTotalDegree_VertSurr / rTotalTime__VertSurr * 0.03
    local real rCentreDistance_VertSurr= 350
    local real rEveryDistance_VertSurr= 0
    local real rAddHeight_VertSurr= 500
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    local integer stDamage
    local integer iDamageWay= GroupDamage_Once
    local unit uSetDamageUnit
    local real rDamage_Syst= rDamage
    local real rTotalTime_Damage= rTotalTime_Charge
    local real iDamageTimeInterval= 0.1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= 250
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer iNum
    local integer i
    local integer j
    local real rValue1= 90
    local real rValue2= - 35
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 0.1
local real rTimerCount= rTimerInterval
    
    set i=1
    loop
        exitwhen i > 2
        
        //Charge
        set rDistance=350
        set rDegree=rDegree_Init + rValue1
        set x=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set rDegree_Charge=rDegree_Init + rValue2
        set uChargeUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uChargeUnit" + I2S(i)), uChargeUnit)
        //Damage
        set uSetDamageUnit=uChargeUnit
        set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Syst , rTotalTime_Damage , iDamageTimeInterval)
        call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
        
        set rNowDegree_VertSurr=0
        set iNum=5
        set j=1
        loop
            exitwhen j > iNum
            //VerticalSurround
            //凤凰火焰
            set rOffsetAngle_VertSurr=0 //逆时针
set uCentreUnit_VertSurr=uChargeUnit
            set uOutsideUnit_VertSurr=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
            call DzSetUnitModel(uOutsideUnit_VertSurr, "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl")
            call Com_SetUnitScale(uOutsideUnit_VertSurr , 2.) //体积
set rCentreDistance_VertSurr=350 //距离
set stVertSurr=s__VerticalSurroundData_create(uCentreUnit_VertSurr , uOutsideUnit_VertSurr , bIsDestroyUnit_VertSurr)
            call s__VerticalSurroundData_SetVerticalSurroundData(stVertSurr , rOffsetAngle_VertSurr , rNowDegree_VertSurr , rTotalDegree_VertSurr , rEveryDegree_VertSurr , rTotalTime__VertSurr , rCentreDistance_VertSurr , rEveryDistance_VertSurr , rAddHeight_VertSurr)
            //黑色火焰
            set rOffsetAngle_VertSurr=0 //逆时针
set uCentreUnit_VertSurr=uChargeUnit
            set uOutsideUnit_VertSurr=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
            call DzSetUnitModel(uOutsideUnit_VertSurr, "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            call Com_SetUnitScale(uOutsideUnit_VertSurr , 2.) //体积
set rCentreDistance_VertSurr=250 //距离
set stVertSurr=s__VerticalSurroundData_create(uCentreUnit_VertSurr , uOutsideUnit_VertSurr , bIsDestroyUnit_VertSurr)
            call s__VerticalSurroundData_SetVerticalSurroundData(stVertSurr , rOffsetAngle_VertSurr , rNowDegree_VertSurr , rTotalDegree_VertSurr , rEveryDegree_VertSurr , rTotalTime__VertSurr , rCentreDistance_VertSurr , rEveryDistance_VertSurr , rAddHeight_VertSurr)
            
            set rNowDegree_VertSurr=rNowDegree_VertSurr + 360 / I2R(iNum)
            set j=j + 1
        endloop
        
        set rValue1=rValue1 - 2 * rValue1
        set rValue2=rValue2 - 2 * rValue2
        set i=i + 1
    endloop
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDuration"), rDuration)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01M)
    
    set uHero=null
    set pPlayer=null
    set uChargeUnit=null
    set uCentreUnit_VertSurr=null
    set uOutsideUnit_VertSurr=null
    set uSetDamageUnit=null
endfunction

//===========================================================================
// Trigger: 31_A01S
//
// 黑暗召唤Abilities\Spells\Undead\Darksummoning\DarkSummonTarget.mdl
// 黑暗召唤（投射物）Abilities\Spells\Undead\DarkSummoning\DarkSummonMissile.mdl
// 操纵死尸Abilities\Spells\Undead\AnimateDead\AnimateDeadTarget.mdl
// 复活死尸Abilities\Spells\Undead\RaiseSkeletonWarrior\RaiseSkeleton.mdl
//===========================================================================
//TESH.scrollpos=93
//TESH.alwaysfold=0
function ChargeTriggerAction_A01S takes nothing returns nothing
    local unit uUnit= LoadUnitHandle(htTriggerHT, GetHandleId(GetTriggeringTrigger()), StringHash("uUnit"))
local unit uHero= LoadUnitHandle(htUnitHT, GetHandleId(uUnit), StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rDamage= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rDamage"))
    local real rRange= LoadReal(htUnitHT, GetHandleId(uUnit), StringHash("rRange"))
    local real x= GetUnitX(uUnit)
    local real y= GetUnitY(uUnit)
    //范围Damage
    call RangeDamage(x , y , rRange , uHero , rDamage)
    //effect
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Undead\\Darksummoning\\DarkSummonTarget.mdl", x, y))
    set uHero=null
    set uUnit=null
    set pPlayer=null
endfunction
function TimerAction_AbilityAction_A01S takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= LoadReal(htTimerHT, iTimerID, StringHash("rHerox"))
    local real rHeroy= LoadReal(htTimerHT, iTimerID, StringHash("rHeroy"))
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //local real rDuration = LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    //local real rDegree = GetDegree(rHerox, rHeroy, rTargetx, rTargety)
    //local real rDistance = GetDistance(rHerox, rHeroy, rTargetx, rTargety)
    //ChargeData
    local integer stCharge
    local real rDegree_Charge= GetDegree(rHerox , rHeroy , rTargetx , rTargety)
    local unit uChargeUnit
    local boolean bIsDestroyUnit= true
    local real rTotalDistance
    local real rTotalTime_Charge= 1
    local real rEveryDistance
    //SetHeight_Acceleration
    //constant integer SetHeight_Acce_Up = 1
    //constant integer SetHeight_Acce_Down = 2
    //constant integer SetHeight_Acce_UpAndDown = 3
    //constant integer SetHeight_Acce_ConstantSpeed = 1   //匀速
    //constant integer SetHeight_Acce_AcceleratedSpeed = 2    //加速度
    local integer stHeight_Acce
    local unit uUnit_HeightAcce
    local real rTotalTime_HeightAcce= rTotalTime_Charge
    local integer iFlyMode_HeightAcce= SetHeight_Acce_Down
    local integer iSpeedMode_HeightAcce= SetHeight_Acce_ConstantSpeed
    local real rInitHeight_HeightAcce= 800
    local real rTargetHeight_HeightAcce= 0
    local real rMaxHeight_HeightAcce= 1000
    local real rMinHeight_HeightAcce= 0
    
    local real rDegree
    local real rDistance
    local real x
    local real y
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rTimerTotalTime ) then
        //Charge
        //ChargeInit
        set rDistance=I2R(GetRandomInt(1, 500))
        set rDegree=GetDegree(rHerox , rHeroy , rTargetx , rTargety) + 180 + I2R(GetRandomInt(- 60, 60))
        set x=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uChargeUnit=CreateUnit(pPlayer, 'e000', x, y, rDegree_Charge)
        call DzSetUnitModel(uChargeUnit, "Units\\Demon\\Infernal\\InfernalBirth.mdl")
        call Com_SetUnitScale(uChargeUnit , 1.) //体积
//ChargeTarget
set rDistance=I2R(GetRandomInt(1, 600))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
//set rDegree_Charge = GetDegree(GetUnitX(uChargeUnit), GetUnitY(uChargeUnit), x, y)
set rTotalDistance=GetDistance(GetUnitX(uChargeUnit) , GetUnitY(uChargeUnit) , x , y)
        set rEveryDistance=rTotalDistance / rTotalTime_Charge * 0.03
        set stCharge=s__ChargeData_create(uChargeUnit , bIsDestroyUnit , rDegree_Charge , rTotalDistance , rTotalTime_Charge , rEveryDistance)
        //Trigger
        call SaveUnitHandle(htUnitHT, GetHandleId(uChargeUnit), StringHash("uHero"), uHero)
        call SaveReal(htUnitHT, GetHandleId(uChargeUnit), StringHash("rDamage"), rDamage)
        call SaveReal(htUnitHT, GetHandleId(uChargeUnit), StringHash("rRange"), rRange)
        call SaveTriggerHandle(htUnitHT, GetHandleId(uChargeUnit), StringHash("tTrigger"), gg_trg_31_A01S)
        //SetHeight_Acceleration
        set uUnit_HeightAcce=uChargeUnit
        set stHeight_Acce=s__SetHeight_AcceData_create(uUnit_HeightAcce , rTotalTime_HeightAcce , iFlyMode_HeightAcce , iSpeedMode_HeightAcce , rInitHeight_HeightAcce , rTargetHeight_HeightAcce , rMaxHeight_HeightAcce , rMinHeight_HeightAcce)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set tTimer=null
    set uChargeUnit=null
    set uUnit_HeightAcce=null
endfunction
    
function AbilityAction_A01S takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rRange= 200
    local real rDamage= 100 * rLevel + 0.1 * rGetHeroStr(uHero)
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.1
local real rTimerTotalTime= rTimerInterval * 30
local real rTimerCount= rTimerInterval
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHerox"), rHerox)
    call SaveReal(htTimerHT, iTimerID, StringHash("rHeroy"), rHeroy)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), rTimerTotalTime)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01S)
    set uHero=null
    set pPlayer=null
    set tTimer=null
endfunction
function InitTrig_31_A01S takes nothing returns nothing
    set gg_trg_31_A01S=CreateTrigger()
    call TriggerAddAction(gg_trg_31_A01S, function ChargeTriggerAction_A01S)
endfunction
//===========================================================================
// Trigger: 33_A01U/*三千雷动*/
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01U takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local unit uMJUnit= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local real rDistance_Move
    local real rDegree
    local real rDistance
    local real x
    local real y
    local real rTargetx
    local real rTargety
    local lightning lLightning
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    set rDistance_Move=LoadReal(htTimerHT, iTimerID, StringHash("rDistance_Move"))
    call SaveReal(htTimerHT, iTimerID, StringHash("rDistance_Move"), rDistance_Move + ( 1200 / rTimerTotalTime * rTimerInterval ))
    
    set rDistance=rDistance_Move
    set rDegree=GetUnitFacing(uHero)
    set rTargetx=rHerox + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set rTargety=rHeroy + rDistance * Sin(rDegree * bj_DEGTORAD)
    set rTargetx=IsXExceedBoundary(rTargetx) //x坐标边界检测
set rTargety=IsYExceedBoundary(rTargety) //y坐标边界检测

    if ( rTimerCount <= rTimerTotalTime ) then
        call SetUnitAnimation(uMJUnit, "Stand-1") //动画
set rDistance=I2R(GetRandomInt(1, 500))
        set rDegree=GetUnitFacing(uHero) + I2R(GetRandomInt(- 90, 90))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
//Lighting
set lLightning=AddLightningEx("CLPB", false, GetUnitX(uMJUnit), GetUnitY(uMJUnit), 500, x, y, 0)
        call YDWETimerDestroyLightning(0.5 , lLightning)
        //Effect
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", x, y))
        //Damage
        call RangeDamage(x , y , rRange , uHero , rDamage)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    set lLightning=null
endfunction
function AbilityAction_A01U takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rHerox= GetUnitX(uHero)
    local real rHeroy= GetUnitY(uHero)
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 5
    local real rRange= 200
    local real rDamage= 100 * rLevel + 0.1 * rGetHeroStr(uHero)
    local unit uMJUnit
    //FollowData
    local integer stFollow
    local unit uUnit_Follow
    local unit uTargetUnit_Follow
    local real rTotalTime_Follow= rDuration
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 0.1
local real rTimerTotalTime= rDuration
local real rTimerCount= rTimerInterval
    
    set uMJUnit=CreateUnit(pPlayer, 'e000', rHerox, rHeroy, GetUnitFacing(uHero))
    call DzSetUnitModel(uMJUnit, "Effect_Orb\\OrbLightningX.mdx")
    call Com_SetUnitScale(uMJUnit , 4.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration + 1) //生命周期
call SetUnitFlyHeight(uMJUnit, 200, 0.) //高度
call SetUnitAnimation(uMJUnit, "Stand-1") //动画
//Follow
set uUnit_Follow=uMJUnit
    set uTargetUnit_Follow=uHero
    set stFollow=s__FollowData_create(uUnit_Follow , uTargetUnit_Follow , rTotalTime_Follow)
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit"), uMJUnit)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDistance_Move"), 200) //闪电移动距离
call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), rTimerTotalTime)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01U)
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    set uUnit_Follow=null
    set uTargetUnit_Follow=null
endfunction
//===========================================================================
// Trigger: 32_A01T/*雷鸣*/
//
// 闪电：Doodads\Cinematic\Lightningbolt\Lightningbolt.mdl
// 大小：5
//===========================================================================
//TESH.scrollpos=48
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01T takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    //local real rDuration = LoadReal(htTimerHT, iTimerID, StringHash("rDuration"))
    local real rRange= LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    local real rDamage= LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local unit uMJUnit
    local effect eEffect
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rTimerTotalTime ) then
        set i=1
            loop
            exitwhen i > 3
            //中间大闪电
            set rDistance=I2R(GetRandomInt(1, 200))
            set rDegree=I2R(GetRandomInt(0, 359))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
            call DzSetUnitModel(uMJUnit, "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl")
            call Com_SetUnitScale(uMJUnit , 10.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.00) //生命周期
//Effect
set eEffect=AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", rTargetx, rTargety)
            call EXSetEffectSize(eEffect, 2.00)
            call DestroyEffect(eEffect)
            
            //外围小闪电+特效
            set rDistance=I2R(GetRandomInt(400, 900))
            set rDegree=I2R(GetRandomInt(0, 359))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
            call DzSetUnitModel(uMJUnit, "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl")
            call Com_SetUnitScale(uMJUnit , 3.) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', 2.00) //生命周期
//Effect
set eEffect=AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", x, y)
            call EXSetEffectSize(eEffect, 1.5)
            call DestroyEffect(eEffect)
            set i=i + 1
        endloop
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uMJUnit=null
    set uHero=null
    set tTimer=null
    set pPlayer=null
    set eEffect=null
endfunction
function AbilityAction_A01T takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rRange= 1000
    local real rDamage= 1000
    local unit uMJUnit
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    //constant integer SingleDamage = 11          //单体伤害
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit
    local real rDamage_Syst= rDamage
    local real rTotalTime_Damage= 3
    local real iDamageTimeInterval= 0.5
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    //Timer
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    //local integer iTimerCount = 1
    local real rTimerInterval= 0.1
local real rTimerTotalTime= 3
local real rTimerCount= rTimerInterval
    
    set uMJUnit=CreateUnit(pPlayer, 'e000', rTargetx, rTargety, 0)
    call DzSetUnitModel(uMJUnit, "Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl")
    call Com_SetUnitScale(uMJUnit , 5.) //体积
call YDWETimerRemoveUnit(3.1 , uMJUnit) //几秒后删除
//Damage
set uSetDamageUnit=uMJUnit
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Syst , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    
    //Timer
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    //call SaveInteger(htTimerHT, iTimerID, StringHash("iTimerCount"), iTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), rTimerTotalTime)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01T)
    
    set uMJUnit=null
    set uHero=null
    set pPlayer=null
    set tTimer=null
    set uSetDamageUnit=null
endfunction

//===========================================================================
// Trigger: 34_A01W/*无尽水域*/
//
// 冲击波·Abilities\Spells\Other\CrushingWave\CrushingWaveMissile.mdl
// 水花Objects\Spawnmodels\Naga\NagaDeath\NagaDeath.mdl
//===========================================================================
//TESH.scrollpos=36
//TESH.alwaysfold=0
function TimerAction_AbilityAction_A01W takes nothing returns nothing
    local timer tTimer= GetExpiredTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local unit uHero= LoadUnitHandle(htTimerHT, iTimerID, StringHash("uHero"))
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= LoadReal(htTimerHT, iTimerID, StringHash("rTargetx"))
    local real rTargety= LoadReal(htTimerHT, iTimerID, StringHash("rTargety"))
    local unit uMJUnit
    //local real rRange = LoadReal(htTimerHT, iTimerID, StringHash("rRange"))
    //local real rDamage = LoadReal(htTimerHT, iTimerID, StringHash("rDamage"))
    local real rTimerInterval= LoadReal(htTimerHT, iTimerID, StringHash("rTimerInterval"))
    local real rTimerTotalTime= LoadReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"))
    local real rTimerCount= LoadReal(htTimerHT, iTimerID, StringHash("rTimerCount"))
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    local integer iNum
    local effect eEffect
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount + rTimerInterval)
    if ( rTimerCount <= rTimerTotalTime ) then
        set iNum=6
        set i=1
        loop
            exitwhen i > iNum
            //发布命令
            set uMJUnit=LoadUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)))
            set rDegree=GetDegree(rTargetx , rTargety , GetUnitX(uMJUnit) , GetUnitY(uMJUnit))
            set rDistance=GetDistance(rTargetx , rTargety , GetUnitX(uMJUnit) , GetUnitY(uMJUnit)) + 100
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            call IssuePointOrder(uMJUnit, "carrionswarm", x, y)
            //移动位置
            set rDegree=rDegree - 10
            set rDistance=GetDistance(rTargetx , rTargety , GetUnitX(uMJUnit) , GetUnitY(uMJUnit))
            set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
            call SetUnitX(uMJUnit, x)
            call SetUnitY(uMJUnit, y)
            call SetUnitFacing(uMJUnit, rDegree)
            set i=i + 1
        endloop
        //Effect
        set rDistance=I2R(GetRandomInt(1, 500))
        set rDegree=I2R(GetRandomInt(0, 359))
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=IsXExceedBoundary(x) //x坐标边界检测
set y=IsYExceedBoundary(y) //y坐标边界检测
set eEffect=AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x, y)
        call EXSetEffectSize(eEffect, 3.00)
        call DestroyEffect(eEffect)
    else
        //End
        call FlushChildHashtable(htTimerHT, iTimerID)
        call DestroyTimer(tTimer)
    endif
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    set eEffect=null
endfunction
function AbilityAction_A01W takes nothing returns nothing
    local unit uHero= GetTriggerUnit()
    local player pPlayer= GetOwningPlayer(uHero)
    local real rTargetx= GetSpellTargetX()
    local real rTargety= GetSpellTargetY()
    local real rLevel= I2R(GetUnitAbilityLevel(uHero, GetSpellAbilityId()))
    local real rDuration= 6
    local real rRange= 1000
    local real rDamage= 2 * US_GetUnitATK(uHero)
    local unit uMJUnit
    //Damage
    //constant integer GroupDamage_Once = 1       //群体伤害1次
    //constant integer GroupDamage_Multi = 2      //群体伤害多次
    //constant integer SingleDamage = 11          //单体伤害
    local integer stDamage
    local integer iDamageWay= GroupDamage_Multi
    local unit uSetDamageUnit
    local real rDamage_Syst= rDamage
    local real rTotalTime_Damage= rDuration
    local real iDamageTimeInterval= 1
    //iDamageWay==1或2时是群体伤害
    local real rDamageRange= rRange
    local real rDegree
    local real rDistance
    local real x
    local real y
    local integer i
    local integer iNum
    local timer tTimer= CreateTimer()
    local integer iTimerID= GetHandleId(tTimer)
    local real rTimerInterval= 0.1
local real rTimerTotalTime= rDuration
local real rTimerCount= rTimerInterval
    
    //水球
    set uMJUnit=CreateUnit(pPlayer, 'e024', rTargetx, rTargety, 0) //不隐藏，且有死亡效果
call DzSetUnitModel(uMJUnit, "Effect_Orb\\OrbWaterX.mdx")
    call Com_SetUnitScale(uMJUnit , 7) //体积
call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration + 0.1) //生命周期
call SetUnitFlyHeight(uMJUnit, 80, 0.) //高度
//Damage
set uSetDamageUnit=uMJUnit
    set stDamage=s__DamageData_create(iDamageWay , uSetDamageUnit , rDamage_Syst , rTotalTime_Damage , iDamageTimeInterval)
    call s__DamageData_SetDamageData_Group(stDamage , rDamageRange)
    //瀑布
    set i=1
    set iNum=12
    set rDistance=400
    set rDegree=0
    loop
        exitwhen i > iNum
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e024', x, y, rDegree + 180) //不隐藏，且有死亡效果
call DzSetUnitModel(uMJUnit, "Doodads\\Terrain\\CliffDoodad\\Waterfall\\Waterfall.mdl")
        call Com_SetUnitScale(uMJUnit , 1.5) //体积
call YDWETimerRemoveUnit(rDuration , uMJUnit) //几秒后删除
set rDegree=rDegree + 360 / I2R(iNum)
        set i=i + 1
    endloop
    //技能马甲
    set i=1
    set iNum=6
    set rDistance=100
    set rDegree=0
    loop
        exitwhen i > iNum
        set x=rTargetx + rDistance * Cos(rDegree * bj_DEGTORAD) //Cos的参数是弧度，角度转化成弧度
set y=rTargety + rDistance * Sin(rDegree * bj_DEGTORAD)
        set x=YDWECoordinateX(x) //x坐标边界检测
set y=YDWECoordinateY(y) //y坐标边界检测
set uMJUnit=CreateUnit(pPlayer, 'e000', x, y, 0)
        call UnitAddAbility(uMJUnit, 'A01V') //技能
call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uMJUnit" + I2S(i)), uMJUnit)
        call UnitApplyTimedLife(uMJUnit, 'BHwe', rDuration) //生命周期
set rDegree=rDegree + 360 / I2R(iNum)
        set i=i + 1
    endloop
    
    call SaveUnitHandle(htTimerHT, iTimerID, StringHash("uHero"), uHero)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargetx"), rTargetx)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTargety"), rTargety)
    //call SaveReal(htTimerHT, iTimerID, StringHash("rRange"), rRange)
    //call SaveReal(htTimerHT, iTimerID, StringHash("rDamage"), rDamage)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerCount"), rTimerCount)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerInterval"), rTimerInterval)
    call SaveReal(htTimerHT, iTimerID, StringHash("rTimerTotalTime"), rTimerTotalTime)
    call TimerStart(tTimer, rTimerInterval, true, function TimerAction_AbilityAction_A01W)
    
    set uHero=null
    set pPlayer=null
    set uMJUnit=null
    set tTimer=null
    set uSetDamageUnit=null
endfunction

//===========================================================================
// Trigger: AbilityTrigger
//===========================================================================
//TESH.scrollpos=31
//TESH.alwaysfold=0
function Trig_AbilityTriggerActions takes nothing returns nothing
    local integer id= GetSpellAbilityId()
    if ( id == 'A00H' ) then
        call AbilityAction_A00H()
//textmacro instance: IfAbilityID("A00B")
    elseif ( id == 'A00B' ) then
        call AbilityAction_A00B()
//end of: IfAbilityID("A00B")
//textmacro instance: IfAbilityID("A001")
    elseif ( id == 'A001' ) then
        call AbilityAction_A001()
//end of: IfAbilityID("A001")
//textmacro instance: IfAbilityID("A00F")
    elseif ( id == 'A00F' ) then
        call AbilityAction_A00F()
//end of: IfAbilityID("A00F")
//textmacro instance: IfAbilityID("A00C")
    elseif ( id == 'A00C' ) then
        call AbilityAction_A00C()
//end of: IfAbilityID("A00C")
//textmacro instance: IfAbilityID("A00J")
    elseif ( id == 'A00J' ) then
        call AbilityAction_A00J()
//end of: IfAbilityID("A00J")
//textmacro instance: IfAbilityID("A00N")
    elseif ( id == 'A00N' ) then
        call AbilityAction_A00N()
//end of: IfAbilityID("A00N")
//textmacro instance: IfAbilityID("A00O")
    elseif ( id == 'A00O' ) then
        call AbilityAction_A00O()
//end of: IfAbilityID("A00O")
//textmacro instance: IfAbilityID("A00Q")
    elseif ( id == 'A00Q' ) then
        call AbilityAction_A00Q()
//end of: IfAbilityID("A00Q")
//textmacro instance: IfAbilityID("A00R")
    elseif ( id == 'A00R' ) then
        call AbilityAction_A00R()
//end of: IfAbilityID("A00R")
//textmacro instance: IfAbilityID("A00U")
    elseif ( id == 'A00U' ) then
        call AbilityAction_A00U()
//end of: IfAbilityID("A00U")
//textmacro instance: IfAbilityID("A00Z")
    elseif ( id == 'A00Z' ) then
        call AbilityAction_A00Z()
//end of: IfAbilityID("A00Z")
//textmacro instance: IfAbilityID("A010")
    elseif ( id == 'A010' ) then
        call AbilityAction_A010()
//end of: IfAbilityID("A010")
//textmacro instance: IfAbilityID("A011")
    elseif ( id == 'A011' ) then
        call AbilityAction_A011()
//end of: IfAbilityID("A011")
//textmacro instance: IfAbilityID("A012")
    elseif ( id == 'A012' ) then
        call AbilityAction_A012()
//end of: IfAbilityID("A012")
//textmacro instance: IfAbilityID("A016")
    elseif ( id == 'A016' ) then
        call AbilityAction_A016()
//end of: IfAbilityID("A016")
//textmacro instance: IfAbilityID("A019")
    elseif ( id == 'A019' ) then
        call AbilityAction_A019()
//end of: IfAbilityID("A019")
//textmacro instance: IfAbilityID("A01D")
    elseif ( id == 'A01D' ) then
        call AbilityAction_A01D()
//end of: IfAbilityID("A01D")
//textmacro instance: IfAbilityID("A01E")
    elseif ( id == 'A01E' ) then
        call AbilityAction_A01E()
//end of: IfAbilityID("A01E")
//textmacro instance: IfAbilityID("A005")
    elseif ( id == 'A005' ) then
        call AbilityAction_A005()
//end of: IfAbilityID("A005")
//textmacro instance: IfAbilityID("A01F")
    elseif ( id == 'A01F' ) then
        call AbilityAction_A01F()
//end of: IfAbilityID("A01F")
//textmacro instance: IfAbilityID("A01G")
    elseif ( id == 'A01G' ) then
        call AbilityAction_A01G()
//end of: IfAbilityID("A01G")
//textmacro instance: IfAbilityID("A01H")
    elseif ( id == 'A01H' ) then
        call AbilityAction_A01H()
//end of: IfAbilityID("A01H")
//textmacro instance: IfAbilityID("A01J")
    elseif ( id == 'A01J' ) then
        call AbilityAction_A01J()
//end of: IfAbilityID("A01J")
//textmacro instance: IfAbilityID("A01K")
    elseif ( id == 'A01K' ) then
        call AbilityAction_A01K()
//end of: IfAbilityID("A01K")
//textmacro instance: IfAbilityID("A01L")
    elseif ( id == 'A01L' ) then
        call AbilityAction_A01L()
//end of: IfAbilityID("A01L")
//textmacro instance: IfAbilityID("A01M")
    elseif ( id == 'A01M' ) then
        call AbilityAction_A01M()
//end of: IfAbilityID("A01M")
//textmacro instance: IfAbilityID("A01N")
    elseif ( id == 'A01N' ) then
        call AbilityAction_A01N()
//end of: IfAbilityID("A01N")
//textmacro instance: IfAbilityID("A01O")
    elseif ( id == 'A01O' ) then
        call AbilityAction_A01O()
//end of: IfAbilityID("A01O")
//textmacro instance: IfAbilityID("A01Q")
    elseif ( id == 'A01Q' ) then
        call AbilityAction_A01Q()
//end of: IfAbilityID("A01Q")
//textmacro instance: IfAbilityID("A01S")
    elseif ( id == 'A01S' ) then
        call AbilityAction_A01S()
//end of: IfAbilityID("A01S")
//textmacro instance: IfAbilityID("A01T")
    elseif ( id == 'A01T' ) then
        call AbilityAction_A01T()
//end of: IfAbilityID("A01T")
//textmacro instance: IfAbilityID("A01U")
    elseif ( id == 'A01U' ) then
        call AbilityAction_A01U()
//end of: IfAbilityID("A01U")
//textmacro instance: IfAbilityID("A01W")
    elseif ( id == 'A01W' ) then
        call AbilityAction_A01W()
//end of: IfAbilityID("A01W")
    endif
    
    
endfunction
function InitTrig_AbilityTrigger takes nothing returns nothing
    set gg_trg_AbilityTrigger=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AbilityTrigger, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AbilityTrigger, function Trig_AbilityTriggerActions)
endfunction
//===========================================================================
// Trigger: DamageTrigger
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_DamageTriggerActions takes nothing returns nothing
    local unit uAttackUnit= GetEventDamageSource()
    local unit uGetDamageUnit= GetTriggerUnit()
    call DisableTrigger(GetTriggeringTrigger())
    
    //物理
    if ( ( YDWEIsEventPhysicalDamage() == true ) and ( YDWEIsEventAttackDamage() == true ) ) then
        if ( GetUnitAbilityLevel(uAttackUnit, 'A00P') > 0 ) then
            call AbilityAction_A00P()
        endif
    endif
    
    call EnableTrigger(GetTriggeringTrigger())
    set uAttackUnit=null
    set uGetDamageUnit=null
endfunction
function InitTrig_DamageTrigger takes nothing returns nothing
    set gg_trg_DamageTrigger=CreateTrigger()
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_DamageTrigger)
    call TriggerAddAction(gg_trg_DamageTrigger, function Trig_DamageTriggerActions)
endfunction
//===========================================================================
// Trigger: Demo1/*建筑加金币*/
//
// 建筑每秒加金币
//===========================================================================
function Trig_Demo1___________________uConditions takes nothing returns boolean
    return ( ( ( GetUnitTypeId(GetTriggerUnit()) == 'h003' ) or ( GetUnitTypeId(GetTriggerUnit()) == 'h004' ) or ( GetUnitTypeId(GetTriggerUnit()) == 'h002' ) ) )
endfunction
function Trig_Demo1___________________uFunc003T takes nothing returns nothing
    if ( ( GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA), UNIT_STATE_LIFE) > 0.00 ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x9DA51395, GetUnitPointValue(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA)))
        call AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x9DA51395), LoadPlayerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6), PLAYER_STATE_RESOURCE_GOLD)
        call CreateTextTagUnitBJ(( "+" + I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x9DA51395)) ), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA), 50.00, 10, 100, 100, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 40.00, 90.00)
        call YDWETimerDestroyTextTag(2.50 , GetLastCreatedTextTag())
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
endfunction
function Trig_Demo1___________________uActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetTriggerUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x9DA51395, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9DA51395))
    call TimerStart(ydl_timer, 1.00, true, function Trig_Demo1___________________uFunc003T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_Demo1___________________u takes nothing returns nothing
    set gg_trg_Demo1___________________u=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Demo1___________________u, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    call TriggerAddCondition(gg_trg_Demo1___________________u, Condition(function Trig_Demo1___________________uConditions))
    call TriggerAddAction(gg_trg_Demo1___________________u, function Trig_Demo1___________________uActions)
endfunction
//===========================================================================
// Trigger: Demo2/*多重背包*/
//===========================================================================
function Trig_Demo2________________uConditions takes nothing returns boolean
    return ( ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( ( GetSpellAbilityId() == 'A000' ) or ( GetSpellAbilityId() == 'A006' ) or ( GetSpellAbilityId() == 'A00E' ) ) ) )
endfunction
function Trig_Demo2________________uActions takes nothing returns nothing
    local integer ydul_a
    local integer ydul_b
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DisplayTextToPlayer(Player(0), 0, 0, "0")
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075, GetTriggerUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x64766007, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0xA3C6AA5E))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F0BA775, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0xBAB27F10))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8B8BE8C0, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0x25408C5B))
    if ( ( GetSpellAbilityId() == 'A000' ) ) then
        call DisplayTextToPlayer(Player(0), 0, 0, "1")
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC6E0F9FD, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x64766007))
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5FEE019A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F0BA775))
        call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), GetSpellAbilityId())
        call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 'A006')
    else
        if ( ( GetSpellAbilityId() == 'A006' ) ) then
            call DisplayTextToPlayer(Player(0), 0, 0, "2")
            call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC6E0F9FD, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F0BA775))
            call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5FEE019A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8B8BE8C0))
            call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), GetSpellAbilityId())
            call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 'A00E')
        else
            if ( ( GetSpellAbilityId() == 'A00E' ) ) then
                call DisplayTextToPlayer(Player(0), 0, 0, "3")
                call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC6E0F9FD, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8B8BE8C0))
                call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5FEE019A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x64766007))
                call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), GetSpellAbilityId())
                call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 'A000')
            else
            endif
        endif
    endif
    set ydul_a=0
    loop
        exitwhen ydul_a > 5
        call SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332, UnitItemInSlot(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), ydul_a))
        if ( ( LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) != null ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x47579557, GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332)))
            call UnitAddItemToSlotById(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC6E0F9FD), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x47579557), ydul_a)
            call RemoveItem(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332))
        else
        endif
        set ydul_a=ydul_a + 1
    endloop
    set ydul_b=0
    loop
        exitwhen ydul_b > 5
        call SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332, UnitItemInSlot(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5FEE019A), ydul_b))
        if ( ( LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) != null ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x47579557, GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332)))
            call UnitAddItemToSlotById(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x47579557), ydul_b)
            call RemoveItem(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332))
        else
        endif
        set ydul_b=ydul_b + 1
    endloop
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Demo2________________u takes nothing returns nothing
    set gg_trg_Demo2________________u=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Demo2________________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Demo2________________u, Condition(function Trig_Demo2________________uConditions))
    call TriggerAddAction(gg_trg_Demo2________________u, function Trig_Demo2________________uActions)
endfunction
//===========================================================================
// Trigger: HeroRevive
//===========================================================================
function Trig_HeroReviveConditions takes nothing returns boolean
    return ( ( ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) and ( GetOwningPlayer(GetDyingUnit()) != Player(11) ) ) )
endfunction
function Trig_HeroReviveFunc006T takes nothing returns nothing
    call ReviveHeroLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), GetUnitLoc(gg_unit_hgtw_0001), true)
endfunction
function Trig_HeroReviveActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075, GetDyingUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)))
    call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, "英雄阵亡，10秒后复活")
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
    call TimerStart(ydl_timer, 10.00, false, function Trig_HeroReviveFunc006T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_HeroRevive takes nothing returns nothing
    set gg_trg_HeroRevive=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HeroRevive, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_HeroRevive, Condition(function Trig_HeroReviveConditions))
    call TriggerAddAction(gg_trg_HeroRevive, function Trig_HeroReviveActions)
endfunction
//===========================================================================
// Trigger: HeroBagUnit/*背包单位*/
//===========================================================================
function Trig_HeroBagUnit________________uActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, CreateUnit(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h006', 0, 0, 0))
    call SaveUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0xA3C6AA5E, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, CreateUnit(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h006', 0, 0, 0))
    call SaveUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0xBAB27F10, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, CreateUnit(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h006', 0, 0, 0))
    call SaveUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0x25408C5B, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_HeroBagUnit________________u takes nothing returns nothing
    set gg_trg_HeroBagUnit________________u=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_HeroBagUnit________________u, function Trig_HeroBagUnit________________uActions)
endfunction
//===========================================================================
// Trigger: Move/Attack/Defence/Type
//===========================================================================
function Trig_Move_Attack_Defence_TypeConditions takes nothing returns boolean
    return ( ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( GetSpellAbilityId() == 'A00L' ) ) )
endfunction
function Trig_Move_Attack_Defence_TypeFunc005T takes nothing returns nothing
    call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD0E51966), LoadPlayerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Move_Attack_Defence_TypeFunc006T takes nothing returns nothing
    if ( ( IsUnitType(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA), UNIT_TYPE_DEAD) == false ) ) then
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA))
    else
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Move_Attack_Defence_TypeActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075, GetTriggerUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)))
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9, GetUnitLoc(gg_unit_hgtw_0001))
    if ( ( GetSpellAbilityId() == 'A00L' ) ) then
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966, CreateUnitAtLoc(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h00A', LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9), 0))
    else
    endif
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xD0E51966, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call TimerStart(ydl_timer, 0.00, false, function Trig_Move_Attack_Defence_TypeFunc005T)
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call TimerStart(ydl_timer, 10.00, false, function Trig_Move_Attack_Defence_TypeFunc006T)
    call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_Move_Attack_Defence_Type takes nothing returns nothing
    set gg_trg_Move_Attack_Defence_Type=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Move_Attack_Defence_Type, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Move_Attack_Defence_Type, Condition(function Trig_Move_Attack_Defence_TypeConditions))
    call TriggerAddAction(gg_trg_Move_Attack_Defence_Type, function Trig_Move_Attack_Defence_TypeActions)
endfunction
//===========================================================================
// Trigger: ChangeProperty_Technology
//===========================================================================
function Trig_ChangeProperty_TechnologyFunc006Func002Func002T takes nothing returns nothing
    call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD0E51966), LoadPlayerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_ChangeProperty_TechnologyFunc006Func002Func003T takes nothing returns nothing
    if ( ( IsUnitType(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA), UNIT_TYPE_DEAD) == false ) ) then
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA))
    else
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_ChangeProperty_TechnologyActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetTriggerUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075, LoadUnitHandle(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6)), 0xB06AB615))
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9, GetUnitLoc(gg_unit_hgtw_0001))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 0)
    if ( ( GetResearched() == 'R00J' ) ) then
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966, CreateUnitAtLoc(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h009', LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9), 0))
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 2)
    else
        if ( ( GetResearched() == 'R00K' ) ) then
            call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966, CreateUnitAtLoc(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h008', LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9), 0))
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 2)
        else
            if ( ( GetResearched() == 'R00I' ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966, CreateUnitAtLoc(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'h007', LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9), 0))
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 2)
            else
            endif
        endif
    endif
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545) == 2 ) ) then
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xD0E51966, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966))
        call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
        call TimerStart(ydl_timer, 0.00, false, function Trig_ChangeProperty_TechnologyFunc006Func002Func002T)
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0E51966))
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
        call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
        call TimerStart(ydl_timer, 10.00, false, function Trig_ChangeProperty_TechnologyFunc006Func002Func003T)
    else
    endif
    if ( ( GetResearched() == 'R001' ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 0x02)
    else
        if ( ( GetResearched() == 'R003' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
            call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 0x04)
        else
            if ( ( GetResearched() == 'R000' ) ) then
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 0x80)
            else
                if ( ( GetResearched() == 'R004' ) ) then
                    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                    call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), 0x40)
                else
                endif
            endif
        endif
    endif
    if ( ( GetResearched() == 'R006' ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
        call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_CHAOS)
    else
        if ( ( GetResearched() == 'R00A' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
            call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_HERO)
        else
            if ( ( GetResearched() == 'R002' ) ) then
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_MAGIC)
            else
                if ( ( GetResearched() == 'R009' ) ) then
                    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                    call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_MELEE)
                else
                    if ( ( GetResearched() == 'R008' ) ) then
                        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                        call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_PIERCE)
                    else
                        if ( ( GetResearched() == 'R005' ) ) then
                            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                            call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_SIEGE)
                        else
                            if ( ( GetResearched() == 'R00B' ) ) then
                                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                                call DzSetUnitAttackType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , 1 , ATTACK_TYPE_NORMAL)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if ( ( GetResearched() == 'R00H' ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
        call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_MEDIUM)
    else
        if ( ( GetResearched() == 'R00C' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
            call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_LARGE)
        else
            if ( ( GetResearched() == 'R00G' ) ) then
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_FORT)
            else
                if ( ( GetResearched() == 'R00F' ) ) then
                    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                    call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_NORMAL)
                else
                    if ( ( GetResearched() == 'R00E' ) ) then
                        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                        call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_HERO)
                    else
                        if ( ( GetResearched() == 'R007' ) ) then
                            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                            call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_DIVINE)
                        else
                            if ( ( GetResearched() == 'R00D' ) ) then
                                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545, 1)
                                call DzSetUnitDefenseType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075) , DEFENSE_TYPE_NONE)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDE2AF545) == 1 ) ) then
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    else
    endif
    call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4AD150D9))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_ChangeProperty_Technology takes nothing returns nothing
    set gg_trg_ChangeProperty_Technology=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChangeProperty_Technology, EVENT_PLAYER_UNIT_RESEARCH_START)
    call TriggerAddAction(gg_trg_ChangeProperty_Technology, function Trig_ChangeProperty_TechnologyActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Init()
    call InitTrig_Init1()
    call InitTrig_TX()
    call InitTrig_TX_Cycle()
    call InitTrig_reset()
    call InitTrig_50Level()
    call InitTrig_TXtest()
    call InitTrig_1()
    call InitTrig_Damage()
    call InitTrig_UnitDeath()
    call InitTrig_Init2()
    //Function not found: call InitTrig_View()
    //Function not found: call InitTrig_Math()
    //Function not found: call InitTrig_RB()
    //Function not found: call InitTrig_Commom()
    //Function not found: call InitTrig_UnitState()
    //Function not found: call InitTrig_HashTable()
    //Function not found: call InitTrig_FollowSystem()
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
    //Function not found: call InitTrig_3C______u()
    call InitTrig_2_A00B_1()
    //Function not found: call InitTrig_2_A00B_____________u()
    //Function not found: call InitTrig_1_A00H________________u()
    //Function not found: call InitTrig_3_A001__________u()
    //Function not found: call InitTrig_4_A00F________________u()
    //Function not found: call InitTrig_5_A00C___________________u()
    //Function not found: call InitTrig_6_A00J________________u()
    //Function not found: call InitTrig_7_A00N________________u()
    call InitTrig_9_A00P()
    //Function not found: call InitTrig_10_A00Q_____________u()
    //Function not found: call InitTrig_11_A00R_________________________u()
    call InitTrig_20_A005()
    //Function not found: call InitTrig_28_A01N________________u()
    call InitTrig_29_A01O()
    //Function not found: call InitTrig_24_A01J________________u()
    //Function not found: call InitTrig_19_A01D________________u()
    //Function not found: call InitTrig_8_A00O________________u()
    //Function not found: call InitTrig_12_A00U________________u()
    //Function not found: call InitTrig_13_A00Z________________u()
    //Function not found: call InitTrig_14_A010________________u()
    //Function not found: call InitTrig_15_A011________________u()
    //Function not found: call InitTrig_16_A012________________u()
    //Function not found: call InitTrig_17_A016__________u()
    //Function not found: call InitTrig_18_A019________________u()
    //Function not found: call InitTrig_22_A01G________________u()
    //Function not found: call InitTrig_23_A01H________________u()
    //Function not found: call InitTrig_30_A01Q___________________u()
    //Function not found: call InitTrig_21_A01F__________u()
    //Function not found: call InitTrig_25_A01K________________u()
    //Function not found: call InitTrig_26_A01L________________u()
    //Function not found: call InitTrig_27_A01M__________u()
    call InitTrig_31_A01S()
    //Function not found: call InitTrig_33_A01U________________u()
    //Function not found: call InitTrig_32_A01T__________u()
    //Function not found: call InitTrig_34_A01W________________u()
    call InitTrig_AbilityTrigger()
    call InitTrig_DamageTrigger()
    call InitTrig_Demo1___________________u()
    call InitTrig_Demo2________________u()
    call InitTrig_HeroRevive()
    call InitTrig_HeroBagUnit________________u()
    call InitTrig_Move_Attack_Defence_Type()
    call InitTrig_ChangeProperty_Technology()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Init)
    call ConditionalTriggerExecute(gg_trg_TXtest)
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
    call SetPlayerRacePreference(Player(0), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 5)
    call ForcePlayerStartLocation(Player(8), 5)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(8), true)
    call SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
    // Player 9
    call SetPlayerStartLocation(Player(9), 6)
    call ForcePlayerStartLocation(Player(9), 6)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(9), true)
    call SetPlayerController(Player(9), MAP_CONTROL_COMPUTER)
    // Player 10
    call SetPlayerStartLocation(Player(10), 7)
    call ForcePlayerStartLocation(Player(10), 7)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(10), true)
    call SetPlayerController(Player(10), MAP_CONTROL_COMPUTER)
    // Player 11
    call SetPlayerStartLocation(Player(11), 8)
    call ForcePlayerStartLocation(Player(11), 8)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_023
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
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    // Force: TRIGSTR_024
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerTeam(Player(9), 1)
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerTeam(Player(11), 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 3)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 2)
    call SetStartLocPrio(1, 0, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 2)
    call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 2)
    call SetStartLocPrio(3, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 2, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateRegions()
    call CreateCameras()
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs29212984")
call ExecuteFunc("HashTable___HashTableInit")
call ExecuteFunc("SetDamageWay___SetDamageWayInit")
call ExecuteFunc("SetHeightAcceleration___SetHeight_AcceInit")
call ExecuteFunc("SetHeightWay___SetHeightWayInit")
call ExecuteFunc("View___ViewInit")
call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("BarrageSystem___BarrageSystemInit")
call ExecuteFunc("YDWETimerSystem__Init")
call ExecuteFunc("ChargeArrowSystem___ChargeArrowSystemInit")
call ExecuteFunc("ChargeParabolaSystem___ChargeParabolaSystemInit")
call ExecuteFunc("ChargeSystem___ChargeSystemInit")
call ExecuteFunc("ChargeTraceSystem___ChargeTraceSystemInit")
call ExecuteFunc("FollowSystem___FollowSystemInit")
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
    call SetMapName("111")
    call SetMapDescription("没有说明")
    call SetPlayers(9)
    call SetTeams(9)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 1472.0, 3712.0)
    call DefineStartLocation(1, 4288.0, 4160.0)
    call DefineStartLocation(2, 4288.0, 4160.0)
    call DefineStartLocation(3, 4288.0, 4160.0)
    call DefineStartLocation(4, 4288.0, 4160.0)
    call DefineStartLocation(5, 4224.0, 3264.0)
    call DefineStartLocation(6, 4224.0, 3264.0)
    call DefineStartLocation(7, 4224.0, 3264.0)
    call DefineStartLocation(8, 4224.0, 3264.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction
// [DzSetUnitMoveType]  
// title = "设置单位移动类型[NEW]"  
// description = "设置 ${单位} 的移动类型：${movetype} "  
// comment = ""  
// category = TC_KKPRE  
// [[.args]]  
// type = unit  
// [[.args]]  
// type = MoveTypeName  
// default = MoveTypeName01  
//===========================================================================
//系统-TimerSystem
//===========================================================================
//===========================================================================  
//===========================================================================  
//自定义事件 
//===========================================================================
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
            local string sString_Effect= LoadStr(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("sString_Effect"))
            local string sString_AttachPoint= LoadStr(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("sString_AttachPoint"))
            local real rEffectSize= LoadReal(htUnitHT, GetHandleId(s__DamageData_uUnit[st]), StringHash("rEffectSize"))
            local effect eEffect
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
                        if ( sString_Effect != null ) then
                            set eEffect=AddSpecialEffectTarget(sString_Effect, uGroupUnit, sString_AttachPoint)
                            call EXSetEffectSize(eEffect, rEffectSize)
                            call DestroyEffect(eEffect)
                        endif
                    elseif ( s__DamageData_iDamageWay[st] == 1 ) then //1次伤害
if ( IsUnitInGroup(uGroupUnit, s__DamageData_gGroup[st]) == false ) then
                            call UnitDamageTarget(s__DamageData_uUnit[st], uGroupUnit, s__DamageData_rDamage[st], false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
                            call GroupAddUnit(s__DamageData_gGroup[st], uGroupUnit)
                            if ( sString_Effect != null ) then
                                set eEffect=AddSpecialEffectTarget(sString_Effect, uGroupUnit, sString_AttachPoint)
                                call EXSetEffectSize(eEffect, rEffectSize)
                                call DestroyEffect(eEffect)
                            endif
                        endif
                    endif
                endif
            endloop
            call DestroyGroup(gGroup)
            set pPlayer=null
            set uGroupUnit=null
            set gGroup=null
            set eEffect=null
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
function sa__FollowData_TimerAction_Follow takes nothing returns boolean

            local integer i= 1
            local integer Num= FollowSystem___iNum_Follow
            local integer st
            if Num == 0 then
                call PauseTimer(FollowSystem___tTimer_Follow)
                set FollowSystem___bTimerState_Follow=false
return true
            endif
            loop
                exitwhen i > Num
                set st=(FollowSystem___iData_Follow[i])
                if ( FollowSystem___iData_Follow[i] != 0 ) and ( s__FollowData_uUnit[st] != null ) and ( GetUnitState(s__FollowData_uUnit[st], UNIT_STATE_LIFE) > 0 ) and ( s__FollowData_rMoveTime[st] <= s__FollowData_rTotalTime[st] ) then
                    call SetUnitFacing(s__FollowData_uUnit[st], GetUnitFacing(s__FollowData_uTargetUnit[st]))
                    call SetUnitX(s__FollowData_uUnit[st], GetUnitX(s__FollowData_uTargetUnit[st]))
                    call SetUnitY(s__FollowData_uUnit[st], GetUnitY(s__FollowData_uTargetUnit[st]))
                    set s__FollowData_rMoveTime[st]=s__FollowData_rMoveTime[st] + rTimerInterval_Follow
                else
                    set FollowSystem___iData_Follow[i]=0
                    set FollowSystem___iNum_Follow=FollowSystem___iNum_Follow - 1
                    call sc__FollowData_deallocate(st)
                    if ( i != Num ) then //冲锋完毕的结构体不是排在最后，才需要改成排序，当前的清掉，最后的放在当前
set FollowSystem___iData_Follow[i]=FollowSystem___iData_Follow[Num]
                    endif
                    set FollowSystem___iData_Follow[Num]=0
                    set Num=Num - 1
                    set i=i - 1
                endif
                set i=i + 1
            endloop
   return true
endfunction
function sa__FollowData_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            set s__FollowData_uUnit[this]=null //单位
set s__FollowData_uTargetUnit[this]=null //目标单位
set s__FollowData_rTotalTime[this]=0.
            set s__FollowData_rMoveTime[this]=0. //已经运行的时间
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
            set s__BarrageData_iBarrageMode[this]=0 //1:坐标,2:单位
set s__BarrageData_rTargetx[this]=0.
            set s__BarrageData_rTargety[this]=0.
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
                        if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st]
                        elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] - 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        endif
                        set s__SetHeight_AcceData_rCurrentHeight[st]=s__SetHeight_AcceData_rInitHeight[st] + rMoveHeight
                    elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //下降
                        if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st]
                        elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set rMoveHeight=s__SetHeight_AcceData_rInitSpeed[st] * s__SetHeight_AcceData_rMoveTime_Switch[st] + 0.5 * s__SetHeight_AcceData_rAcceleration[st] * Pow(s__SetHeight_AcceData_rMoveTime_Switch[st], 2)
                        endif
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
                            if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set s__SetHeight_AcceData_rInitSpeed[st]=RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / s__SetHeight_AcceData_rSwitchTime[st]
                            elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=0
                            endif
                        elseif ( s__SetHeight_AcceData_iUpDownFlag[st] == 2 ) then //最低点
set s__SetHeight_AcceData_iUpDownFlag[st]=1
                            set s__SetHeight_AcceData_rInitHeight[st]=s__SetHeight_AcceData_rMinHeight[st]
                            set s__SetHeight_AcceData_rTargetHeight[st]=s__SetHeight_AcceData_rMaxHeight[st]
                            call SetUnitFlyHeight(s__SetHeight_AcceData_uUnit[st], s__SetHeight_AcceData_rMinHeight[st], 0.)
                            if ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_ConstantSpeed ) then //匀速
set s__SetHeight_AcceData_rInitSpeed[st]=RAbs(s__SetHeight_AcceData_rInitHeight[st] - s__SetHeight_AcceData_rTargetHeight[st]) / s__SetHeight_AcceData_rSwitchTime[st]
                            elseif ( s__SetHeight_AcceData_iSpeedMode[st] == SetHeight_Acce_AcceleratedSpeed ) then //加速度
set s__SetHeight_AcceData_rInitSpeed[st]=s__SetHeight_AcceData_rAcceleration[st] * s__SetHeight_AcceData_rSwitchTime[st]
                            endif
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
set s__SetHeight_AcceData_iSpeedMode[this]=0
            set s__SetHeight_AcceData_rInitHeight[this]=0. //初始高度
set s__SetHeight_AcceData_rTargetHeight[this]=0. //目标高度
set s__SetHeight_AcceData_rMaxHeight[this]=0. //最高高度
set s__SetHeight_AcceData_rMinHeight[this]=0. //最低高度
set s__SetHeight_AcceData_rCurrentHeight[this]=0. //当前高度
set s__SetHeight_AcceData_rInitSpeed[this]=0. //初始速度
set s__SetHeight_AcceData_rAcceleration[this]=0. //加速度
   return true
endfunction

function jasshelper__initstructs29212984 takes nothing returns nothing
    set st__DamageData_TimerAction_Damage=CreateTrigger()
    call TriggerAddCondition(st__DamageData_TimerAction_Damage,Condition( function sa__DamageData_TimerAction_Damage))
    set st__DamageData_Damage_Single=CreateTrigger()
    call TriggerAddCondition(st__DamageData_Damage_Single,Condition( function sa__DamageData_Damage_Single))
    set st__DamageData_Damage_Group=CreateTrigger()
    call TriggerAddCondition(st__DamageData_Damage_Group,Condition( function sa__DamageData_Damage_Group))
    set st__DamageData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__DamageData_onDestroy,Condition( function sa__DamageData_onDestroy))
    set st__VerticalSurroundData_TimerAction_VerticalSurround=CreateTrigger()
    call TriggerAddCondition(st__VerticalSurroundData_TimerAction_VerticalSurround,Condition( function sa__VerticalSurroundData_TimerAction_VerticalSurround))
    set st__VerticalSurroundData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__VerticalSurroundData_onDestroy,Condition( function sa__VerticalSurroundData_onDestroy))
    set st__SurroundData_TimerAction_Surround=CreateTrigger()
    call TriggerAddCondition(st__SurroundData_TimerAction_Surround,Condition( function sa__SurroundData_TimerAction_Surround))
    set st__SurroundData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__SurroundData_onDestroy,Condition( function sa__SurroundData_onDestroy))
    set st__FollowData_TimerAction_Follow=CreateTrigger()
    call TriggerAddCondition(st__FollowData_TimerAction_Follow,Condition( function sa__FollowData_TimerAction_Follow))
    set st__FollowData_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__FollowData_onDestroy,Condition( function sa__FollowData_onDestroy))
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

