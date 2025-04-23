globals
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
//globals from YDWEJapiUnit:
constant boolean LIBRARY_YDWEJapiUnit=true
//endglobals from YDWEJapiUnit
//globals from YDWEMultiboardSetItemIconBJNull:
constant boolean LIBRARY_YDWEMultiboardSetItemIconBJNull=true
//endglobals from YDWEMultiboardSetItemIconBJNull
//globals from YDWEMultiboardSetItemValueBJNull:
constant boolean LIBRARY_YDWEMultiboardSetItemValueBJNull=true
//endglobals from YDWEMultiboardSetItemValueBJNull
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
//globals from MemoryLeakHelper:
constant boolean LIBRARY_MemoryLeakHelper=true
constant real MemoryLeakHelper__HASH_DECAY_TIME= 500.
constant integer MemoryLeakHelper__CLEAR_HASH_COUNT= 8190
integer MemoryLeakHelper__HashNumber= 0
integer array MemoryLeakHelper__HashData
integer array MemoryLeakHelper__HashHash
integer array MemoryLeakHelper__HashPlace
real array MemoryLeakHelper__CreationTime
        
integer MemoryLeakHelper__TempHashNumber= 0
integer array MemoryLeakHelper__TempHashHash
integer array MemoryLeakHelper__TempHashPlace
integer array MemoryLeakHelper__TempHashData
real array MemoryLeakHelper__TempCreationTime
        
integer MemoryLeakHelper__LastHashedValue= 0
integer MemoryLeakHelper__LastIndex= 0
real MemoryLeakHelper__GameTime= 0.
timer MemoryLeakHelper__GameTimeTimer= CreateTimer()
constant real MemoryLeakHelper__GAMETIME_TIMER_INTERVAL= 30.
constant integer MemoryLeakHelper__key= 0
        
constant integer MemoryLeakHelper__MAX_INSTANCES=8100

        // The system fires when you do something that creates a leak.
        // The data that cause leak are saved in a variable then.
        // And every CLEAN_UP_INTERVAL seconds those data are destroyed.
        // This shouldn't be too high, or too low.
constant real MemoryLeakHelper__CLEAN_UP_INTERVAL= 10
        // If this is set to true, the system will work more slowly (but you wont notice)
        // and count, how much memory this system was able to save.
        // This value is display by the function DisplayLeaks() then.
        // WARNING: This sucks a lot of performance. I would ONLY use it when you want
        // to test, if this is useful for your map. Later set it to false.
constant boolean MemoryLeakHelper__DISPLAY_SAVED_MEMORY= true
        // The Data are only cleaned up, when that many handles were caught
constant integer MemoryLeakHelper__MIN_LEAK_NUMBER= 1750
        // How often are data passed to the destroyer?
        // Leaks stay for a random time between CLEAN_UP_INTERVAL and CLEAN_UP_INTERVAL+PASS_INTERVAL
        // in the game
constant real MemoryLeakHelper__PASS_INTERVAL= 2.5
        // Memory leaks occur pretty frequently. When a leak is caught it is saved in
        // an array. But the array can't have more than MAX_LEAK_INSTANCES instances, so
        // if more than MAX_LEAK_INSTANCES memory leaks occur during a destroy interval,
        // the system fails.
constant integer MemoryLeakHelper__MAX_LEAK_INSTANCES= 60000
integer MemoryLeakHelper__IndexData
integer MemoryLeakHelper__IsSaved
        
integer MemoryLeakHelper__CaughtLocationLeaks= 0
// processed:         location array MemoryLeakHelper__LocationLeakData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
integer MemoryLeakHelper__LocationDestroyCount= 0
// processed:         location array MemoryLeakHelper__LocationDestroyData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
		
integer MemoryLeakHelper__CaughtEffectLeaks= 0
// processed:         effect array MemoryLeakHelper__EffectLeakData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
integer MemoryLeakHelper__EffectDestroyCount= 0
// processed:         effect array MemoryLeakHelper__EffectDestroyData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
		
integer MemoryLeakHelper__CaughtGroupLeaks= 0
// processed:         group array MemoryLeakHelper__GroupLeakData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
integer MemoryLeakHelper__GroupDestroyCount= 0
// processed:         group array MemoryLeakHelper__GroupDestroyData[MemoryLeakHelper__MAX_LEAK_INSTANCES]
        
        
integer MemoryLeakHelper__DestroyedLeaks= 0
integer MemoryLeakHelper__CaughtLeaks= 0
integer MemoryLeakHelper__DestroyedLeaksUser= 0
handle MemoryLeakHelper__LastCaught
timer MemoryLeakHelper__PassTimer= CreateTimer()
timer MemoryLeakHelper__CleanTimer= CreateTimer()
timer MemoryLeakHelper__DelayTimer= CreateTimer()
boolean MemoryLeakHelper__IsDestroying= false
real MemoryLeakHelper__SavedMemory= 0.
real MemoryLeakHelper__LastCheckedGroupMemoryUsage= 0.
boolean MemoryLeakHelper__DestroyThreadRunning= false
boolean MemoryLeakHelper__Disabled= false
        
        // These values were found out in a big leak test by gekko.
constant real MemoryLeakHelper__LOCATION_MEMORY_USAGE= 0.361
constant real MemoryLeakHelper__GROUP_MEMORY_USAGE= 0.62
constant real MemoryLeakHelper__GROUP_UNIT_MEMORY_USAGE= 0.040
constant real MemoryLeakHelper__EFFECT_MEMORY_USAGE= 11.631
constant real MemoryLeakHelper__REMOVED_EFFECT_MEMORY_USAGE= 0.066
        // 用于判断是否开启内存排泄帮助
boolean MemoryLeakHelper__IsOpenMemoryLeakHelper= false
boolean MemoryLeakHelper__IsDisplayMemoryLeakHelper= false
//endglobals from MemoryLeakHelper
    // User-defined
integer udg_Row_Data= 0
integer udg_List_Data= 0
integer udg_LIST= 0
integer udg_ROW= 0
boolean udg_BoardFlag= false
button array udg_Button
    // Generated
trigger gg_trg_test= null
trigger gg_trg_Init= null
trigger gg_trg_Init1= null
trigger gg_trg_revive= null
trigger gg_trg_EXP= null
trigger gg_trg_reset= null
trigger gg_trg_Excretion= null
trigger gg_trg_Excretion_AutoUseItem= null
trigger gg_trg_MultiBoard= null
trigger gg_trg_Harm= null
trigger gg_trg_LearnSkill= null
trigger gg_trg_ForgetSkill= null
trigger gg_trg_HeroDegree_1= null
trigger gg_trg_DeathFinger= null
trigger gg_trg_1HP= null
trigger gg_trg_10HP= null
trigger gg_trg_CheckHeroProperty= null
trigger gg_trg_Change_MoveType= null
unit gg_unit_n003_0006= null
unit gg_unit_n00W_0023= null
unit gg_unit_n002_0234= null
unit gg_unit_h002_0096= null
unit gg_unit_n00T_0110= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__MemoryLeakHelper__Index=1
integer si__MemoryLeakHelper__Index_F=0
integer si__MemoryLeakHelper__Index_I=0
integer array si__MemoryLeakHelper__Index_V
constant integer si__MemoryLeakHelper__GTable=2
integer si__MemoryLeakHelper__GTable_F=0
integer si__MemoryLeakHelper__GTable_I=0
integer array si__MemoryLeakHelper__GTable_V
constant integer si__MemoryLeakHelper__HandleTable=3
location array s__MemoryLeakHelper__LocationLeakData
location array s__2MemoryLeakHelper__LocationLeakData
location array s__3MemoryLeakHelper__LocationLeakData
location array s__4MemoryLeakHelper__LocationLeakData
location array s__5MemoryLeakHelper__LocationLeakData
location array s__6MemoryLeakHelper__LocationLeakData
location array s__7MemoryLeakHelper__LocationLeakData
location array s__8MemoryLeakHelper__LocationLeakData
location array s__MemoryLeakHelper__LocationDestroyData
location array s__2MemoryLeakHelper__LocationDestroyData
location array s__3MemoryLeakHelper__LocationDestroyData
location array s__4MemoryLeakHelper__LocationDestroyData
location array s__5MemoryLeakHelper__LocationDestroyData
location array s__6MemoryLeakHelper__LocationDestroyData
location array s__7MemoryLeakHelper__LocationDestroyData
location array s__8MemoryLeakHelper__LocationDestroyData
effect array s__MemoryLeakHelper__EffectLeakData
effect array s__2MemoryLeakHelper__EffectLeakData
effect array s__3MemoryLeakHelper__EffectLeakData
effect array s__4MemoryLeakHelper__EffectLeakData
effect array s__5MemoryLeakHelper__EffectLeakData
effect array s__6MemoryLeakHelper__EffectLeakData
effect array s__7MemoryLeakHelper__EffectLeakData
effect array s__8MemoryLeakHelper__EffectLeakData
effect array s__MemoryLeakHelper__EffectDestroyData
effect array s__2MemoryLeakHelper__EffectDestroyData
effect array s__3MemoryLeakHelper__EffectDestroyData
effect array s__4MemoryLeakHelper__EffectDestroyData
effect array s__5MemoryLeakHelper__EffectDestroyData
effect array s__6MemoryLeakHelper__EffectDestroyData
effect array s__7MemoryLeakHelper__EffectDestroyData
effect array s__8MemoryLeakHelper__EffectDestroyData
group array s__MemoryLeakHelper__GroupLeakData
group array s__2MemoryLeakHelper__GroupLeakData
group array s__3MemoryLeakHelper__GroupLeakData
group array s__4MemoryLeakHelper__GroupLeakData
group array s__5MemoryLeakHelper__GroupLeakData
group array s__6MemoryLeakHelper__GroupLeakData
group array s__7MemoryLeakHelper__GroupLeakData
group array s__8MemoryLeakHelper__GroupLeakData
group array s__MemoryLeakHelper__GroupDestroyData
group array s__2MemoryLeakHelper__GroupDestroyData
group array s__3MemoryLeakHelper__GroupDestroyData
group array s__4MemoryLeakHelper__GroupDestroyData
group array s__5MemoryLeakHelper__GroupDestroyData
group array s__6MemoryLeakHelper__GroupDestroyData
group array s__7MemoryLeakHelper__GroupDestroyData
group array s__8MemoryLeakHelper__GroupDestroyData
integer array si__MemoryLeakHelper__GTable_type
trigger array st__MemoryLeakHelper__GTable_onDestroy
trigger array st___prototype160
real f__result_real
trigger array st___prototype164
trigger array st___prototype165
trigger array st___prototype166
trigger array st___prototype167
trigger array st___prototype168
trigger array st___prototype169
trigger array st___prototype170
trigger array st___prototype171
trigger array st___prototype172
trigger array st___prototype173
trigger array st___prototype174
trigger array st___prototype175
trigger array st___prototype176
location f__arg_location1
location f__arg_location2
group f__arg_group1
effect f__arg_effect1
real f__arg_real1
real f__arg_real2
integer f__arg_integer1
integer f__arg_integer2
player f__arg_player1
unit f__arg_unit1
string f__arg_string1
string f__arg_string2
boolexpr f__arg_boolexpr1
code f__arg_code1
widget f__arg_widget1
integer f__arg_this

endglobals
	native EXSetUnitFacing takes unit u, real angle returns nothing
	native EXPauseUnit takes unit u, boolean flag returns nothing
	native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
	native EXSetUnitMoveType takes unit u, integer t returns nothing
	native EXExecuteScript takes string script returns string


function sg__MemoryLeakHelper__LocationLeakData_get takes integer i returns location
    if(i<8191) then
        return s__MemoryLeakHelper__LocationLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__LocationLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__LocationLeakData[i-16382]
        else
            return s__4MemoryLeakHelper__LocationLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__LocationLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__LocationLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__LocationLeakData[i-49146]
    else
        return s__8MemoryLeakHelper__LocationLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__LocationLeakData_set takes integer i,location v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__LocationLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__LocationLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__LocationLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper__LocationLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__LocationLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__LocationLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__LocationLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper__LocationLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper__LocationDestroyData_get takes integer i returns location
    if(i<8191) then
        return s__MemoryLeakHelper__LocationDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__LocationDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__LocationDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper__LocationDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__LocationDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__LocationDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__LocationDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper__LocationDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__LocationDestroyData_set takes integer i,location v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__LocationDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__LocationDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__LocationDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper__LocationDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__LocationDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__LocationDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__LocationDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper__LocationDestroyData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper__EffectLeakData_get takes integer i returns effect
    if(i<8191) then
        return s__MemoryLeakHelper__EffectLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__EffectLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__EffectLeakData[i-16382]
        else
            return s__4MemoryLeakHelper__EffectLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__EffectLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__EffectLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__EffectLeakData[i-49146]
    else
        return s__8MemoryLeakHelper__EffectLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__EffectLeakData_set takes integer i,effect v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__EffectLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__EffectLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__EffectLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper__EffectLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__EffectLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__EffectLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__EffectLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper__EffectLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper__EffectDestroyData_get takes integer i returns effect
    if(i<8191) then
        return s__MemoryLeakHelper__EffectDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__EffectDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__EffectDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper__EffectDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__EffectDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__EffectDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__EffectDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper__EffectDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__EffectDestroyData_set takes integer i,effect v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__EffectDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__EffectDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__EffectDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper__EffectDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__EffectDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__EffectDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__EffectDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper__EffectDestroyData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper__GroupLeakData_get takes integer i returns group
    if(i<8191) then
        return s__MemoryLeakHelper__GroupLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__GroupLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__GroupLeakData[i-16382]
        else
            return s__4MemoryLeakHelper__GroupLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__GroupLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__GroupLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__GroupLeakData[i-49146]
    else
        return s__8MemoryLeakHelper__GroupLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__GroupLeakData_set takes integer i,group v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__GroupLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__GroupLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__GroupLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper__GroupLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__GroupLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__GroupLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__GroupLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper__GroupLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper__GroupDestroyData_get takes integer i returns group
    if(i<8191) then
        return s__MemoryLeakHelper__GroupDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper__GroupDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper__GroupDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper__GroupDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper__GroupDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper__GroupDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper__GroupDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper__GroupDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper__GroupDestroyData_set takes integer i,group v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper__GroupDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper__GroupDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper__GroupDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper__GroupDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper__GroupDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper__GroupDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper__GroupDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper__GroupDestroyData[i-57337]=v
    endif
endfunction

//Generated allocator of MemoryLeakHelper__Index
function s__MemoryLeakHelper__Index__allocate takes nothing returns integer
 local integer this=si__MemoryLeakHelper__Index_F
    if (this!=0) then
        set si__MemoryLeakHelper__Index_F=si__MemoryLeakHelper__Index_V[this]
    else
        set si__MemoryLeakHelper__Index_I=si__MemoryLeakHelper__Index_I+1
        set this=si__MemoryLeakHelper__Index_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: MemoryLeakHelper__Index")
        return 0
    endif

    set si__MemoryLeakHelper__Index_V[this]=-1
 return this
endfunction

//Generated destructor of MemoryLeakHelper__Index
function s__MemoryLeakHelper__Index_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: MemoryLeakHelper__Index")
        return
    elseif (si__MemoryLeakHelper__Index_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: MemoryLeakHelper__Index")
        return
    endif
    set si__MemoryLeakHelper__Index_V[this]=si__MemoryLeakHelper__Index_F
    set si__MemoryLeakHelper__Index_F=this
endfunction

//Generated method caller for MemoryLeakHelper__GTable.onDestroy
function sc__MemoryLeakHelper__GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__MemoryLeakHelper__GTable_onDestroy[2])
endfunction

//Generated allocator of MemoryLeakHelper__GTable
function s__MemoryLeakHelper__GTable__allocate takes nothing returns integer
 local integer this=si__MemoryLeakHelper__GTable_F
    if (this!=0) then
        set si__MemoryLeakHelper__GTable_F=si__MemoryLeakHelper__GTable_V[this]
    else
        set si__MemoryLeakHelper__GTable_I=si__MemoryLeakHelper__GTable_I+1
        set this=si__MemoryLeakHelper__GTable_I
    endif
    if (this>8100) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: MemoryLeakHelper__GTable")
        return 0
    endif

    set si__MemoryLeakHelper__GTable_type[this]=2
    set si__MemoryLeakHelper__GTable_V[this]=-1
 return this
endfunction

//Generated destructor of MemoryLeakHelper__GTable
function sc__MemoryLeakHelper__GTable_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: MemoryLeakHelper__GTable")
        return
    elseif (si__MemoryLeakHelper__GTable_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: MemoryLeakHelper__GTable")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__MemoryLeakHelper__GTable_onDestroy[si__MemoryLeakHelper__GTable_type[this]])
    set si__MemoryLeakHelper__GTable_V[this]=si__MemoryLeakHelper__GTable_F
    set si__MemoryLeakHelper__GTable_F=this
endfunction

//Generated allocator of MemoryLeakHelper__HandleTable
function s__MemoryLeakHelper__HandleTable__allocate takes nothing returns integer
 local integer this=s__MemoryLeakHelper__GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__MemoryLeakHelper__GTable_type[this]=3
    set kthis=this

 return this
endfunction

function sc___prototype160_execute takes integer i returns nothing

    call TriggerExecute(st___prototype160[i])
endfunction
function sc___prototype160_evaluate takes integer i returns real

    call TriggerEvaluate(st___prototype160[i])
 return f__result_real
endfunction
function sc___prototype164_execute takes integer i,location a1 returns nothing
    set f__arg_location1=a1

    call TriggerExecute(st___prototype164[i])
endfunction
function sc___prototype164_evaluate takes integer i,location a1 returns nothing
    set f__arg_location1=a1

    call TriggerEvaluate(st___prototype164[i])

endfunction
function sc___prototype165_execute takes integer i,group a1 returns nothing
    set f__arg_group1=a1

    call TriggerExecute(st___prototype165[i])
endfunction
function sc___prototype165_evaluate takes integer i,group a1 returns nothing
    set f__arg_group1=a1

    call TriggerEvaluate(st___prototype165[i])

endfunction
function sc___prototype166_execute takes integer i,effect a1 returns nothing
    set f__arg_effect1=a1

    call TriggerExecute(st___prototype166[i])
endfunction
function sc___prototype166_evaluate takes integer i,effect a1 returns nothing
    set f__arg_effect1=a1

    call TriggerEvaluate(st___prototype166[i])

endfunction
function sc___prototype167_execute takes integer i,location a1,real a2,real a3 returns nothing
    set f__arg_location1=a1
    set f__arg_real1=a2
    set f__arg_real2=a3

    call TriggerExecute(st___prototype167[i])
endfunction
function sc___prototype167_evaluate takes integer i,location a1,real a2,real a3 returns nothing
    set f__arg_location1=a1
    set f__arg_real1=a2
    set f__arg_real2=a3

    call TriggerEvaluate(st___prototype167[i])

endfunction
function sc___prototype168_execute takes integer i,integer a1,integer a2,player a3,location a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_real1=a5

    call TriggerExecute(st___prototype168[i])
endfunction
function sc___prototype168_evaluate takes integer i,integer a1,integer a2,player a3,location a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_real1=a5

    call TriggerEvaluate(st___prototype168[i])

endfunction
function sc___prototype169_execute takes integer i,unit a1,string a2,location a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_string1=a2
    set f__arg_location1=a3

    call TriggerExecute(st___prototype169[i])
endfunction
function sc___prototype169_evaluate takes integer i,unit a1,string a2,location a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_string1=a2
    set f__arg_location1=a3

    call TriggerEvaluate(st___prototype169[i])

endfunction
function sc___prototype170_execute takes integer i,unit a1,location a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2

    call TriggerExecute(st___prototype170[i])
endfunction
function sc___prototype170_evaluate takes integer i,unit a1,location a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2

    call TriggerEvaluate(st___prototype170[i])

endfunction
function sc___prototype171_execute takes integer i,unit a1,location a2,real a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2
    set f__arg_real1=a3

    call TriggerExecute(st___prototype171[i])
endfunction
function sc___prototype171_evaluate takes integer i,unit a1,location a2,real a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2
    set f__arg_real1=a3

    call TriggerEvaluate(st___prototype171[i])

endfunction
function sc___prototype172_execute takes integer i,real a1,location a2,boolexpr a3 returns nothing
    set f__arg_real1=a1
    set f__arg_location1=a2
    set f__arg_boolexpr1=a3

    call TriggerExecute(st___prototype172[i])
endfunction
function sc___prototype172_evaluate takes integer i,real a1,location a2,boolexpr a3 returns nothing
    set f__arg_real1=a1
    set f__arg_location1=a2
    set f__arg_boolexpr1=a3

    call TriggerEvaluate(st___prototype172[i])

endfunction
function sc___prototype173_execute takes integer i,integer a1,integer a2,player a3,location a4,location a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_location2=a5

    call TriggerExecute(st___prototype173[i])
endfunction
function sc___prototype173_evaluate takes integer i,integer a1,integer a2,player a3,location a4,location a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_location2=a5

    call TriggerEvaluate(st___prototype173[i])

endfunction
function sc___prototype174_execute takes integer i,group a1,code a2 returns nothing
    set f__arg_group1=a1
    set f__arg_code1=a2

    call TriggerExecute(st___prototype174[i])
endfunction
function sc___prototype174_evaluate takes integer i,group a1,code a2 returns nothing
    set f__arg_group1=a1
    set f__arg_code1=a2

    call TriggerEvaluate(st___prototype174[i])

endfunction
function sc___prototype175_execute takes integer i,string a1,widget a2,string a3 returns nothing
    set f__arg_string1=a1
    set f__arg_widget1=a2
    set f__arg_string2=a3

    call TriggerExecute(st___prototype175[i])
endfunction
function sc___prototype175_evaluate takes integer i,string a1,widget a2,string a3 returns nothing
    set f__arg_string1=a1
    set f__arg_widget1=a2
    set f__arg_string2=a3

    call TriggerEvaluate(st___prototype175[i])

endfunction
function sc___prototype176_execute takes integer i,location a1,string a2 returns nothing
    set f__arg_location1=a1
    set f__arg_string1=a2

    call TriggerExecute(st___prototype176[i])
endfunction
function sc___prototype176_evaluate takes integer i,location a1,string a2 returns nothing
    set f__arg_location1=a1
    set f__arg_string1=a2

    call TriggerEvaluate(st___prototype176[i])

endfunction
function h__PolarProjectionBJ takes location a0, real a1, real a2 returns location
    //hook: MemoryLeakHelper__PP
    call sc___prototype167_evaluate(1,a0,a1,a2)
return PolarProjectionBJ(a0,a1,a2)
endfunction
function h__CreateNUnitsAtLoc takes integer a0, integer a1, player a2, location a3, real a4 returns group
    //hook: MemoryLeakHelper__CU
    call sc___prototype168_evaluate(1,a0,a1,a2,a3,a4)
return CreateNUnitsAtLoc(a0,a1,a2,a3,a4)
endfunction
function h__CreateNUnitsAtLocFacingLocBJ takes integer a0, integer a1, player a2, location a3, location a4 returns group
    //hook: MemoryLeakHelper__CUF
    call sc___prototype173_evaluate(1,a0,a1,a2,a3,a4)
return CreateNUnitsAtLocFacingLocBJ(a0,a1,a2,a3,a4)
endfunction
function h__IssuePointOrderLocBJ takes unit a0, string a1, location a2 returns boolean
    //hook: MemoryLeakHelper__IPO
    call sc___prototype169_evaluate(1,a0,a1,a2)
return IssuePointOrderLocBJ(a0,a1,a2)
endfunction
function h__SetUnitPositionLoc takes unit a0, location a1 returns nothing
    //hook: MemoryLeakHelper__SUP
    call sc___prototype170_evaluate(1,a0,a1)
call SetUnitPositionLoc(a0,a1)
endfunction
function h__SetUnitFacingToFaceLocTimed takes unit a0, location a1, real a2 returns nothing
    //hook: MemoryLeakHelper__SUF
    call sc___prototype171_evaluate(1,a0,a1,a2)
call SetUnitFacingToFaceLocTimed(a0,a1,a2)
endfunction
function h__GetUnitsInRangeOfLocMatching takes real a0, location a1, boolexpr a2 returns group
    //hook: MemoryLeakHelper__GUR
    call sc___prototype172_evaluate(1,a0,a1,a2)
return GetUnitsInRangeOfLocMatching(a0,a1,a2)
endfunction
function h__RemoveLocation takes location a0 returns nothing
    //hook: MemoryLeakHelper__ReleaseLocation
    call sc___prototype164_evaluate(1,a0)
call RemoveLocation(a0)
endfunction
function h__ForGroupBJ takes group a0, code a1 returns nothing
    //hook: MemoryLeakHelper__FG
    call sc___prototype174_evaluate(1,a0,a1)
call ForGroupBJ(a0,a1)
endfunction
function h__GroupPickRandomUnit takes group a0 returns unit
    //hook: MemoryLeakHelper__CatchGroup
    call sc___prototype165_evaluate(1,a0)
return GroupPickRandomUnit(a0)
endfunction
function h__CountUnitsInGroup takes group a0 returns integer
    //hook: MemoryLeakHelper__CatchGroup
    call sc___prototype165_evaluate(1,a0)
return CountUnitsInGroup(a0)
endfunction
function h__DestroyGroup takes group a0 returns nothing
    //hook: MemoryLeakHelper__ReleaseGroup
    call sc___prototype165_evaluate(2,a0)
call DestroyGroup(a0)
endfunction
function h__AddSpecialEffectLocBJ takes location a0, string a1 returns effect
    //hook: MemoryLeakHelper__ASE
    call sc___prototype176_evaluate(1,a0,a1)
return AddSpecialEffectLocBJ(a0,a1)
endfunction
function h__AddSpecialEffectTargetUnitBJ takes string a0, widget a1, string a2 returns effect
    //hook: MemoryLeakHelper__ASETU
    call sc___prototype175_evaluate(1,a0,a1,a2)
return AddSpecialEffectTargetUnitBJ(a0,a1,a2)
endfunction
function h__DestroyEffect takes effect a0 returns nothing
    //hook: MemoryLeakHelper__ReleaseEffect
    call sc___prototype166_evaluate(1,a0)
call DestroyEffect(a0)
endfunction
function h__DestroyEffectBJ takes effect a0 returns nothing
    //hook: MemoryLeakHelper__ReleaseEffect
    call sc___prototype166_evaluate(1,a0)
call DestroyEffectBJ(a0)
endfunction

//library YDTriggerSaveLoadSystem:
//#  define YDTRIGGER_handle(SG)                          YDTRIGGER_HT##SG##(HashtableHandle)
    function YDTriggerSaveLoadSystem__Init takes nothing returns nothing
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
//library YDWEJapiUnit:




 function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
 function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction

//library YDWEJapiUnit ends
//library YDWEMultiboardSetItemIconBJNull:
function YDWEMultiboardSetItemIconBJNull takes multiboard mb,integer col,integer row,string iconFileName returns nothing
    local integer curRow= 0
    local integer curCol= 0
    local integer numRows= MultiboardGetRowCount(mb)
    local integer numCols= MultiboardGetColumnCount(mb)
    local multiboarditem mbitem= null
    // Loop over rows, using 1-based index
    loop
        set curRow=curRow + 1
        exitwhen curRow > numRows
        // Apply setting to the requested row, or all rows (if row is 0)
        if ( row == 0 or row == curRow ) then
            // Loop over columns, using 1-based index
            set curCol=0
            loop
                set curCol=curCol + 1
                exitwhen curCol > numCols
                // Apply setting to the requested column, or all columns (if col is 0)
                if ( col == 0 or col == curCol ) then
                    set mbitem=MultiboardGetItem(mb, curRow - 1, curCol - 1)
                    call MultiboardSetItemIcon(mbitem, iconFileName)
                    call MultiboardReleaseItem(mbitem)
                endif
            endloop
        endif
    endloop
    set mbitem=null
endfunction

//library YDWEMultiboardSetItemIconBJNull ends
//library YDWEMultiboardSetItemValueBJNull:
function YDWEMultiboardSetItemValueBJNull takes multiboard mb,integer col,integer row,string val returns nothing
    local integer curRow= 0
    local integer curCol= 0
    local integer numRows= MultiboardGetRowCount(mb)
    local integer numCols= MultiboardGetColumnCount(mb)
    local multiboarditem mbitem= null
    // Loop over rows, using 1-based index
    loop
        set curRow=curRow + 1
        exitwhen curRow > numRows
        // Apply setting to the requested row, or all rows (if row is 0)
        if ( row == 0 or row == curRow ) then
            // Loop over columns, using 1-based index
            set curCol=0
            loop
                set curCol=curCol + 1
                exitwhen curCol > numCols
                // Apply setting to the requested column, or all columns (if col is 0)
                if ( col == 0 or col == curCol ) then
                    set mbitem=MultiboardGetItem(mb, curRow - 1, curCol - 1)
                    call MultiboardSetItemValue(mbitem, val)
                    call MultiboardReleaseItem(mbitem)
                endif
            endloop
        endif
    endloop
    set mbitem=null
endfunction

//library YDWEMultiboardSetItemValueBJNull ends
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
    call h__DestroyGroup(g)
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
//library MemoryLeakHelper:
    
    function MemoryLeakHelper__GetElapsedGameTime takes nothing returns real
        return MemoryLeakHelper__GameTime + TimerGetElapsed(MemoryLeakHelper__GameTimeTimer)
    endfunction
    
    function MemoryLeakHelper__UpdateGameTime takes nothing returns nothing
        set MemoryLeakHelper__GameTime=MemoryLeakHelper__GameTime + MemoryLeakHelper__GAMETIME_TIMER_INTERVAL
    endfunction
  function s__MemoryLeakHelper__Index_DestroyHashes takes nothing returns nothing
   local real gt= (1)
   local integer ind
			
			// Well, due to the nature of this system, the looking of the code sucks.
			loop
				exitwhen MemoryLeakHelper__HashNumber == 0
				if gt - MemoryLeakHelper__CreationTime[MemoryLeakHelper__HashNumber] > MemoryLeakHelper__HASH_DECAY_TIME then
					set ind=MemoryLeakHelper__HashHash[MemoryLeakHelper__HashNumber]
					call s__MemoryLeakHelper__Index_deallocate(ind)
					call YDWEFlushStoredIntegerByInteger(MemoryLeakHelper__key , MemoryLeakHelper__HashData[MemoryLeakHelper__HashNumber])
				else
					set MemoryLeakHelper__TempHashNumber=MemoryLeakHelper__TempHashNumber + 1
					set MemoryLeakHelper__TempHashData[MemoryLeakHelper__TempHashNumber]=MemoryLeakHelper__HashData[MemoryLeakHelper__HashNumber]
					set MemoryLeakHelper__TempHashHash[MemoryLeakHelper__TempHashNumber]=MemoryLeakHelper__HashHash[MemoryLeakHelper__HashNumber]
					set MemoryLeakHelper__TempHashPlace[MemoryLeakHelper__TempHashNumber]=MemoryLeakHelper__HashPlace[MemoryLeakHelper__HashNumber]
					set MemoryLeakHelper__TempCreationTime[MemoryLeakHelper__TempHashNumber]=MemoryLeakHelper__CreationTime[MemoryLeakHelper__HashNumber]
				endif
				set MemoryLeakHelper__HashData[MemoryLeakHelper__HashNumber]=0
				set MemoryLeakHelper__HashHash[MemoryLeakHelper__HashNumber]=0
				set MemoryLeakHelper__HashPlace[MemoryLeakHelper__HashNumber]=0
				set MemoryLeakHelper__CreationTime[MemoryLeakHelper__HashNumber]=0.
				set MemoryLeakHelper__HashNumber=MemoryLeakHelper__HashNumber - 1
			endloop
			
			loop
				exitwhen MemoryLeakHelper__TempHashNumber == 0
				set MemoryLeakHelper__HashNumber=MemoryLeakHelper__HashNumber + 1
				set MemoryLeakHelper__HashData[MemoryLeakHelper__HashNumber]=MemoryLeakHelper__TempHashData[MemoryLeakHelper__TempHashNumber]
				set MemoryLeakHelper__HashHash[MemoryLeakHelper__HashNumber]=MemoryLeakHelper__TempHashHash[MemoryLeakHelper__TempHashNumber]
				set MemoryLeakHelper__HashPlace[MemoryLeakHelper__HashNumber]=MemoryLeakHelper__TempHashPlace[MemoryLeakHelper__TempHashNumber]
				set MemoryLeakHelper__TempHashData[MemoryLeakHelper__TempHashNumber]=0
				set MemoryLeakHelper__TempHashNumber=MemoryLeakHelper__TempHashNumber - 1
			endloop
			
  endfunction
	
        function s__MemoryLeakHelper__Index_GetHash takes integer value returns integer
            local integer int= YDWEGetIntegerByInteger(MemoryLeakHelper__key , value)
            
            if int == 0 then
                set int=s__MemoryLeakHelper__Index__allocate()
                call YDWESaveIntegerByInteger(MemoryLeakHelper__key , value , int)
                
                set MemoryLeakHelper__HashNumber=MemoryLeakHelper__HashNumber + 1
                set MemoryLeakHelper__HashPlace[int]=MemoryLeakHelper__HashNumber
                set MemoryLeakHelper__HashData[MemoryLeakHelper__HashNumber]=value
                set MemoryLeakHelper__HashHash[MemoryLeakHelper__HashNumber]=int
                set MemoryLeakHelper__CreationTime[MemoryLeakHelper__HashNumber]=MemoryLeakHelper__GetElapsedGameTime()
                
                if MemoryLeakHelper__HashNumber >= MemoryLeakHelper__CLEAR_HASH_COUNT then
                    call s__MemoryLeakHelper__Index_DestroyHashes()
                endif
            endif
            
            set MemoryLeakHelper__LastHashedValue=value
            set MemoryLeakHelper__LastIndex=int
            
            return int
        endfunction
        function s__MemoryLeakHelper__GTable_reset takes integer this returns nothing
			call YDWEFlushMissionByInteger(0)
            call YDWEFlushMissionByInteger((this))
        endfunction
        function s__MemoryLeakHelper__GTable_onDestroy takes integer this returns nothing
            call s__MemoryLeakHelper__GTable_reset(this)
        endfunction
	
function s__MemoryLeakHelper__HandleTable__getindex takes integer this,handle l__MemoryLeakHelper__key returns integer
            return YDWEGetIntegerByInteger((this) , YDWEH2I(l__MemoryLeakHelper__key))
        endfunction
function s__MemoryLeakHelper__HandleTable__setindex takes integer this,handle l__MemoryLeakHelper__key,integer value returns nothing
            call YDWESaveIntegerByInteger((this) , YDWEH2I(l__MemoryLeakHelper__key) , value)
        endfunction
function s__MemoryLeakHelper__HandleTable_flush takes integer this,handle l__MemoryLeakHelper__key returns nothing
            call YDWEFlushStoredIntegerByInteger((this) , YDWEH2I(l__MemoryLeakHelper__key))
        endfunction
function s__MemoryLeakHelper__HandleTable_exists takes integer this,handle l__MemoryLeakHelper__key returns boolean
            return YDWEHaveSavedIntegerByInteger((this) , YDWEH2I(l__MemoryLeakHelper__key))
        endfunction
        function s__MemoryLeakHelper__HandleTable_flush2D takes string firstkey returns nothing
            call s__MemoryLeakHelper__GTable_reset((- YDWES2I(firstkey)))
        endfunction
        function s__MemoryLeakHelper__HandleTable__staticgetindex takes string firstkey returns integer
            return (- YDWES2I(firstkey))
        endfunction
//===========================================================================
// Trigger: MemoryLeakHelper
//
//     //hook GetLocationX CatchLocation
//     //hook GetLocationY CatchLocation  
//      //hook ForGroup FG
// 129k
// 3,02 + 43,32 + 697,86
// 744
//===========================================================================
    
    
    
    function YDWEMemoryLeakHelperGetLastCaughtHandle takes nothing returns handle
        return MemoryLeakHelper__LastCaught
    endfunction
    
    function YDWEMemoryLeakHelperProtectHandle takes handle h returns nothing
        call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IsSaved,h, 1)
    endfunction
    
    function YDWEMemoryLeakHelperProtectVariable takes handle h returns nothing
        call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IsSaved,h, 1)
    endfunction
    function MemoryLeakHelper__EnableMMH takes nothing returns nothing
        set MemoryLeakHelper__Disabled=false
    endfunction
    function YDWEMemoryLeakHelperDelayMMH takes nothing returns nothing
        set MemoryLeakHelper__Disabled=true
        call TimerStart(MemoryLeakHelper__DelayTimer, 0.00, false, function MemoryLeakHelper__EnableMMH)
    endfunction
    
    function YDWEMemoryLeakHelperDisplayLeaks takes nothing returns nothing
        local location loc=null
        if MemoryLeakHelper__IsDisplayMemoryLeakHelper == false then
            call h__CreateNUnitsAtLoc(1, 'hfoo', Player(15), GetRectCenter(GetPlayableMapRect()), bj_UNIT_FACING)
            call RemoveUnit(bj_lastCreatedUnit)
            set loc=GetRectCenter(GetPlayableMapRect())
            call h__CreateNUnitsAtLoc(1, 'hfoo', Player(15), loc, bj_UNIT_FACING)
            call RemoveUnit(bj_lastCreatedUnit)
            call h__RemoveLocation(loc)
            set loc=null
            set MemoryLeakHelper__IsDisplayMemoryLeakHelper=true
        endif
        call ClearTextMessages()
        call BJDebugMsg("======= 自动排泄系统 =======")
        call BJDebugMsg("排除的泄漏" + I2S(MemoryLeakHelper__DestroyedLeaks))
        call BJDebugMsg("用户手动排除的泄漏" + I2S(MemoryLeakHelper__DestroyedLeaksUser))
        call BJDebugMsg("系统排泄比例: " + R2S(I2R(MemoryLeakHelper__DestroyedLeaks) / I2R(MemoryLeakHelper__DestroyedLeaks + MemoryLeakHelper__DestroyedLeaksUser) * 100.) + "%")
        call BJDebugMsg("作者排泄比例" + R2S(I2R(MemoryLeakHelper__DestroyedLeaksUser) / I2R(MemoryLeakHelper__DestroyedLeaks + MemoryLeakHelper__DestroyedLeaksUser) * 100.) + "%")
        call BJDebugMsg("下次排除的泄漏" + I2S(MemoryLeakHelper__MIN_LEAK_NUMBER - MemoryLeakHelper__CaughtLeaks))
        call BJDebugMsg(" === 待排除的泄漏 === ")
        call BJDebugMsg("   单位组泄漏" + I2S(MemoryLeakHelper__GroupDestroyCount))
        call BJDebugMsg("   点泄漏" + I2S(MemoryLeakHelper__LocationDestroyCount))
        call BJDebugMsg("   特效泄漏: " + I2S(MemoryLeakHelper__EffectDestroyCount))
        call BJDebugMsg(" === 还未排除的泄漏=== ")
        call BJDebugMsg("   单位组泄漏" + I2S(MemoryLeakHelper__CaughtGroupLeaks))
        call BJDebugMsg("   点泄漏" + I2S(MemoryLeakHelper__CaughtLocationLeaks))
        call BJDebugMsg("   特效泄漏: " + I2S(MemoryLeakHelper__CaughtEffectLeaks))
        call BJDebugMsg("下次排泄时间: " + I2S(R2I(TimerGetRemaining(MemoryLeakHelper__PassTimer) + 0.5)) + " seconds.")
        call BJDebugMsg("======= 自动排泄系统 =======")
        call BJDebugMsg("排除泄漏" + I2S(MemoryLeakHelper__DestroyedLeaks))
        //if DISPLAY_SAVED_MEMORY then
            call BJDebugMsg("自动排泄系统释放的总内存为 " + R2S(MemoryLeakHelper__SavedMemory) + " kb.")
        //endif
        call BJDebugMsg("================================")
    endfunction
    
    function MemoryLeakHelper__GroupGetMemoryUsageEnum takes nothing returns nothing
        set MemoryLeakHelper__LastCheckedGroupMemoryUsage=MemoryLeakHelper__LastCheckedGroupMemoryUsage + MemoryLeakHelper__GROUP_UNIT_MEMORY_USAGE
    endfunction
    
    function MemoryLeakHelper__GroupGetMemoryUsage takes group g returns real
        set MemoryLeakHelper__LastCheckedGroupMemoryUsage=0.
        call ForGroup(g, function MemoryLeakHelper__GroupGetMemoryUsageEnum)
        return MemoryLeakHelper__LastCheckedGroupMemoryUsage + MemoryLeakHelper__GROUP_MEMORY_USAGE
    endfunction
    	
 function MemoryLeakHelper__CatchLocation takes location l returns nothing
        set MemoryLeakHelper__LastCaught=l
        
        if MemoryLeakHelper__Disabled then
            return
        elseif MemoryLeakHelper__CaughtLocationLeaks == MemoryLeakHelper__MAX_LEAK_INSTANCES then
             call BJDebugMsg("MemoryLeakHelper: Failed to store leak because of size limitations")
            return
        endif
        
        if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) == false then
            //call BJDebugMsg("Caught Location")
            set MemoryLeakHelper__CaughtLocationLeaks=MemoryLeakHelper__CaughtLocationLeaks + 1
            call sg__MemoryLeakHelper__LocationLeakData_set(MemoryLeakHelper__CaughtLocationLeaks,l)
            call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__CaughtLocationLeaks)
        endif
    endfunction
    
    function MemoryLeakHelper__AddToLocationDestroyQueue takes location l returns nothing
        set MemoryLeakHelper__LocationDestroyCount=MemoryLeakHelper__LocationDestroyCount + 1
        call sg__MemoryLeakHelper__LocationDestroyData_set(MemoryLeakHelper__LocationDestroyCount,l)
        call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__LocationDestroyCount * - 1) // Put his to negative, so we know that this is used in the DestroyQueue now.
endfunction
    
    function MemoryLeakHelper__ReleaseLocation takes location l returns nothing
        local integer index
        if MemoryLeakHelper__IsDestroying == false and s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) then
            set index=s__MemoryLeakHelper__HandleTable__getindex(MemoryLeakHelper__IndexData,l)
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper__LocationLeakData_set(index,sg__MemoryLeakHelper__LocationLeakData_get(MemoryLeakHelper__CaughtLocationLeaks))
                set MemoryLeakHelper__CaughtLocationLeaks=MemoryLeakHelper__CaughtLocationLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper__LocationDestroyData_set(index,sg__MemoryLeakHelper__LocationDestroyData_get(MemoryLeakHelper__LocationDestroyCount))
                set MemoryLeakHelper__LocationDestroyCount=MemoryLeakHelper__LocationDestroyCount - 1
            endif
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,l)
            set MemoryLeakHelper__DestroyedLeaksUser=MemoryLeakHelper__DestroyedLeaksUser + 1
        endif
    endfunction
	
 function MemoryLeakHelper__CatchGroup takes group l returns nothing
        set MemoryLeakHelper__LastCaught=l
        
        if MemoryLeakHelper__Disabled then
            return
        elseif MemoryLeakHelper__CaughtGroupLeaks == MemoryLeakHelper__MAX_LEAK_INSTANCES then
             call BJDebugMsg("MemoryLeakHelper: Failed to store leak because of size limitations")
            return
        endif
        
        if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) == false then
            //call BJDebugMsg("Caught Group")
            set MemoryLeakHelper__CaughtGroupLeaks=MemoryLeakHelper__CaughtGroupLeaks + 1
            call sg__MemoryLeakHelper__GroupLeakData_set(MemoryLeakHelper__CaughtGroupLeaks,l)
            call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__CaughtGroupLeaks)
        endif
    endfunction
    
    function MemoryLeakHelper__AddToGroupDestroyQueue takes group l returns nothing
        set MemoryLeakHelper__GroupDestroyCount=MemoryLeakHelper__GroupDestroyCount + 1
        call sg__MemoryLeakHelper__GroupDestroyData_set(MemoryLeakHelper__GroupDestroyCount,l)
        call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__GroupDestroyCount * - 1) // Put his to negative, so we know that this is used in the DestroyQueue now.
endfunction
    
    function MemoryLeakHelper__ReleaseGroup takes group l returns nothing
        local integer index
        if MemoryLeakHelper__IsDestroying == false and s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) then
            set index=s__MemoryLeakHelper__HandleTable__getindex(MemoryLeakHelper__IndexData,l)
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper__GroupLeakData_set(index,sg__MemoryLeakHelper__GroupLeakData_get(MemoryLeakHelper__CaughtGroupLeaks))
                set MemoryLeakHelper__CaughtGroupLeaks=MemoryLeakHelper__CaughtGroupLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper__GroupDestroyData_set(index,sg__MemoryLeakHelper__GroupDestroyData_get(MemoryLeakHelper__GroupDestroyCount))
                set MemoryLeakHelper__GroupDestroyCount=MemoryLeakHelper__GroupDestroyCount - 1
            endif
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,l)
            set MemoryLeakHelper__DestroyedLeaksUser=MemoryLeakHelper__DestroyedLeaksUser + 1
        endif
    endfunction
	
 function MemoryLeakHelper__CatchEffect takes effect l returns nothing
        set MemoryLeakHelper__LastCaught=l
        
        if MemoryLeakHelper__Disabled then
            return
        elseif MemoryLeakHelper__CaughtEffectLeaks == MemoryLeakHelper__MAX_LEAK_INSTANCES then
             call BJDebugMsg("MemoryLeakHelper: Failed to store leak because of size limitations")
            return
        endif
        
        if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) == false then
            //call BJDebugMsg("Caught Effect")
            set MemoryLeakHelper__CaughtEffectLeaks=MemoryLeakHelper__CaughtEffectLeaks + 1
            call sg__MemoryLeakHelper__EffectLeakData_set(MemoryLeakHelper__CaughtEffectLeaks,l)
            call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__CaughtEffectLeaks)
        endif
    endfunction
    
    function MemoryLeakHelper__AddToEffectDestroyQueue takes effect l returns nothing
        set MemoryLeakHelper__EffectDestroyCount=MemoryLeakHelper__EffectDestroyCount + 1
        call sg__MemoryLeakHelper__EffectDestroyData_set(MemoryLeakHelper__EffectDestroyCount,l)
        call s__MemoryLeakHelper__HandleTable__setindex(MemoryLeakHelper__IndexData,l, MemoryLeakHelper__EffectDestroyCount * - 1) // Put his to negative, so we know that this is used in the DestroyQueue now.
endfunction
    
    function MemoryLeakHelper__ReleaseEffect takes effect l returns nothing
        local integer index
        if MemoryLeakHelper__IsDestroying == false and s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IndexData,l) then
            set index=s__MemoryLeakHelper__HandleTable__getindex(MemoryLeakHelper__IndexData,l)
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper__EffectLeakData_set(index,sg__MemoryLeakHelper__EffectLeakData_get(MemoryLeakHelper__CaughtEffectLeaks))
                set MemoryLeakHelper__CaughtEffectLeaks=MemoryLeakHelper__CaughtEffectLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper__EffectDestroyData_set(index,sg__MemoryLeakHelper__EffectDestroyData_get(MemoryLeakHelper__EffectDestroyCount))
                set MemoryLeakHelper__EffectDestroyCount=MemoryLeakHelper__EffectDestroyCount - 1
            endif
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,l)
            set MemoryLeakHelper__DestroyedLeaksUser=MemoryLeakHelper__DestroyedLeaksUser + 1
        endif
    endfunction
	
    function MemoryLeakHelper__DestroyMemoryLeaks takes nothing returns nothing
        set MemoryLeakHelper__IsDestroying=true
        
		set MemoryLeakHelper__DestroyedLeaks=MemoryLeakHelper__DestroyedLeaks + MemoryLeakHelper__GroupDestroyCount
        loop
            exitwhen MemoryLeakHelper__GroupDestroyCount == 0
            
            if MemoryLeakHelper__DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper__SavedMemory=MemoryLeakHelper__SavedMemory + MemoryLeakHelper__GroupGetMemoryUsage(sg__MemoryLeakHelper__GroupDestroyData_get(MemoryLeakHelper__GroupDestroyCount))
            endif
            
            call h__DestroyGroup(sg__MemoryLeakHelper__GroupDestroyData_get(MemoryLeakHelper__GroupDestroyCount))
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,sg__MemoryLeakHelper__GroupDestroyData_get(MemoryLeakHelper__GroupDestroyCount))
            set MemoryLeakHelper__GroupDestroyCount=MemoryLeakHelper__GroupDestroyCount - 1
        endloop
		
		set MemoryLeakHelper__DestroyedLeaks=MemoryLeakHelper__DestroyedLeaks + MemoryLeakHelper__LocationDestroyCount
        loop
            exitwhen MemoryLeakHelper__LocationDestroyCount == 0
            
            if MemoryLeakHelper__DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper__SavedMemory=MemoryLeakHelper__SavedMemory + MemoryLeakHelper__LOCATION_MEMORY_USAGE
            endif
            
            call h__RemoveLocation(sg__MemoryLeakHelper__LocationDestroyData_get(MemoryLeakHelper__LocationDestroyCount))
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,sg__MemoryLeakHelper__LocationDestroyData_get(MemoryLeakHelper__LocationDestroyCount))
            set MemoryLeakHelper__LocationDestroyCount=MemoryLeakHelper__LocationDestroyCount - 1
        endloop
		
		set MemoryLeakHelper__DestroyedLeaks=MemoryLeakHelper__DestroyedLeaks + MemoryLeakHelper__EffectDestroyCount
        loop
            exitwhen MemoryLeakHelper__EffectDestroyCount == 0
            
            if MemoryLeakHelper__DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper__SavedMemory=MemoryLeakHelper__SavedMemory + MemoryLeakHelper__EFFECT_MEMORY_USAGE
            endif
            
            call h__DestroyEffect(sg__MemoryLeakHelper__EffectDestroyData_get(MemoryLeakHelper__EffectDestroyCount))
            call s__MemoryLeakHelper__HandleTable_flush(MemoryLeakHelper__IndexData,sg__MemoryLeakHelper__EffectDestroyData_get(MemoryLeakHelper__EffectDestroyCount))
            set MemoryLeakHelper__EffectDestroyCount=MemoryLeakHelper__EffectDestroyCount - 1
        endloop
		
        set MemoryLeakHelper__IsDestroying=false
        set MemoryLeakHelper__DestroyThreadRunning=false
        //call StartPassTimer.execute() // Strange. This causes bugs sometimes and the function isn't called
        // This is slower, but safe.
        call ExecuteFunc("YDWEMemoryLeakStartPassTimer")
    endfunction
    
    function MemoryLeakHelper__StartDestroyThread takes nothing returns nothing
        if MemoryLeakHelper__DestroyThreadRunning == false then
            set MemoryLeakHelper__DestroyThreadRunning=true
            call TimerStart(MemoryLeakHelper__CleanTimer, MemoryLeakHelper__CLEAN_UP_INTERVAL, false, function MemoryLeakHelper__DestroyMemoryLeaks)
            call PauseTimer(MemoryLeakHelper__PassTimer)
        endif
    endfunction
    
   // hook DoNothing StartDestroyThread
    
    // We want that the user doesn't have to protect too many variables, but all the variables that are filled longer
    // than CLEAN_UP_INTERVAL seconds. But what, when the handle thing is put into the destroy stack and the next destroy is
    // in 5 seconds, because the last one was 15 seconds ago? We can simply avoid something like that by using a 2-step-system
    // that goes sure, the handle is only destroyed when it passed the CLEAN_UP_INTERVAL twice.
    // Having two kinds of variables is simply easier and more efficient than having another variable that refers to
    // how many times the handle passed the timer; If it isn't passed/cleared in the Interval then, we can't loop
    // that easily through the data and we'd have to fix gaps later; That would suck a lot of performacne.
    function MemoryLeakHelper__PassMemoryLeaks takes nothing returns nothing
		set MemoryLeakHelper__CaughtLeaks=MemoryLeakHelper__CaughtLeaks + MemoryLeakHelper__CaughtGroupLeaks
        loop
            exitwhen MemoryLeakHelper__CaughtGroupLeaks < 1
            if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IsSaved,sg__MemoryLeakHelper__GroupLeakData_get(MemoryLeakHelper__CaughtGroupLeaks)) == false and sg__MemoryLeakHelper__GroupLeakData_get(MemoryLeakHelper__CaughtGroupLeaks) != null then
                call MemoryLeakHelper__AddToGroupDestroyQueue(sg__MemoryLeakHelper__GroupLeakData_get(MemoryLeakHelper__CaughtGroupLeaks))
            endif
            call sg__MemoryLeakHelper__GroupLeakData_set(MemoryLeakHelper__CaughtGroupLeaks,null)
            set MemoryLeakHelper__CaughtGroupLeaks=MemoryLeakHelper__CaughtGroupLeaks - 1
        endloop
		
		set MemoryLeakHelper__CaughtLeaks=MemoryLeakHelper__CaughtLeaks + MemoryLeakHelper__CaughtLocationLeaks
        loop
            exitwhen MemoryLeakHelper__CaughtLocationLeaks < 1
            if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IsSaved,sg__MemoryLeakHelper__LocationLeakData_get(MemoryLeakHelper__CaughtLocationLeaks)) == false and sg__MemoryLeakHelper__LocationLeakData_get(MemoryLeakHelper__CaughtLocationLeaks) != null then
                call MemoryLeakHelper__AddToLocationDestroyQueue(sg__MemoryLeakHelper__LocationLeakData_get(MemoryLeakHelper__CaughtLocationLeaks))
            endif
            call sg__MemoryLeakHelper__LocationLeakData_set(MemoryLeakHelper__CaughtLocationLeaks,null)
            set MemoryLeakHelper__CaughtLocationLeaks=MemoryLeakHelper__CaughtLocationLeaks - 1
        endloop
		
		set MemoryLeakHelper__CaughtLeaks=MemoryLeakHelper__CaughtLeaks + MemoryLeakHelper__CaughtEffectLeaks
        loop
            exitwhen MemoryLeakHelper__CaughtEffectLeaks < 1
            if s__MemoryLeakHelper__HandleTable_exists(MemoryLeakHelper__IsSaved,sg__MemoryLeakHelper__EffectLeakData_get(MemoryLeakHelper__CaughtEffectLeaks)) == false and sg__MemoryLeakHelper__EffectLeakData_get(MemoryLeakHelper__CaughtEffectLeaks) != null then
                call MemoryLeakHelper__AddToEffectDestroyQueue(sg__MemoryLeakHelper__EffectLeakData_get(MemoryLeakHelper__CaughtEffectLeaks))
            endif
            call sg__MemoryLeakHelper__EffectLeakData_set(MemoryLeakHelper__CaughtEffectLeaks,null)
            set MemoryLeakHelper__CaughtEffectLeaks=MemoryLeakHelper__CaughtEffectLeaks - 1
        endloop
		
        if MemoryLeakHelper__CaughtLeaks > MemoryLeakHelper__MIN_LEAK_NUMBER then
            set MemoryLeakHelper__CaughtLeaks=0
            //call BJDebugMsg("Caught Leaks: "+I2S(MIN_LEAK_NUMBER))
            //call BJDebugMsg("Now start Destroy Timer")
            set MemoryLeakHelper__DestroyThreadRunning=true
            call TimerStart(MemoryLeakHelper__CleanTimer, MemoryLeakHelper__CLEAN_UP_INTERVAL, false, function MemoryLeakHelper__DestroyMemoryLeaks)
            // We have to pause this timer a bit; Otherwise it would break the CLEAN_UP_INTERVAL rule.
            call PauseTimer(MemoryLeakHelper__PassTimer)
        endif
        
    endfunction
    
    // =================================
    // ============= Usage =============
    // =================================
    
    function MemoryLeakHelper__PP takes location source,real dist,real angle returns nothing
        call MemoryLeakHelper__CatchLocation(source)
    endfunction
    
    function MemoryLeakHelper__CU takes integer count,integer unitId,player p,location l,real face returns nothing
        call MemoryLeakHelper__CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper__IPO takes unit k,string order,location l returns nothing
        call MemoryLeakHelper__CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper__SUP takes unit who,location l returns nothing
        call MemoryLeakHelper__CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper__SUF takes unit who,location l,real dur returns nothing
        call MemoryLeakHelper__CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper__GUR takes real radius,location l,boolexpr filter returns nothing
        call MemoryLeakHelper__CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper__CUF takes integer count,integer unitId,player whichPlayer,location loc,location lookAt returns nothing
        call MemoryLeakHelper__CatchLocation(loc)
        call MemoryLeakHelper__CatchLocation(lookAt)
    endfunction
    
//processed hook:     hook PolarProjectionBJ MemoryLeakHelper__PP
//processed hook:     hook CreateNUnitsAtLoc MemoryLeakHelper__CU
//processed hook:     hook CreateNUnitsAtLocFacingLocBJ MemoryLeakHelper__CUF
//processed hook:     hook IssuePointOrderLocBJ MemoryLeakHelper__IPO
//processed hook:     hook SetUnitPositionLoc MemoryLeakHelper__SUP
//processed hook:     hook SetUnitFacingToFaceLocTimed MemoryLeakHelper__SUF
//processed hook:     hook GetUnitsInRangeOfLocMatching MemoryLeakHelper__GUR
//processed hook:     hook RemoveLocation MemoryLeakHelper__ReleaseLocation
    function MemoryLeakHelper__FG takes group g,code callback returns nothing
        call MemoryLeakHelper__CatchGroup(g)
    endfunction
    
//processed hook:     hook ForGroupBJ MemoryLeakHelper__FG // :D This should catch all GUI usages for groups.
//processed hook: hook GroupPickRandomUnit MemoryLeakHelper__CatchGroup
//processed hook:     hook CountUnitsInGroup MemoryLeakHelper__CatchGroup
    
//processed hook:     hook DestroyGroup MemoryLeakHelper__ReleaseGroup
    
    function MemoryLeakHelper__ASETU takes string bla,widget d,string blu returns nothing
        // We can not catch THIS effect, but the effect that was created before.
        // So we can destroy all SpecialEffects excpet one.
        call MemoryLeakHelper__CatchEffect(GetLastCreatedEffectBJ())
    endfunction
    
    function MemoryLeakHelper__ASE takes location where,string modelName returns nothing
        call MemoryLeakHelper__CatchLocation(where)
        call MemoryLeakHelper__CatchEffect(GetLastCreatedEffectBJ())
    endfunction
//processed hook:     hook AddSpecialEffectLocBJ MemoryLeakHelper__ASE
//processed hook:     hook AddSpecialEffectTargetUnitBJ MemoryLeakHelper__ASETU
//processed hook:     hook DestroyEffect MemoryLeakHelper__ReleaseEffect
//processed hook:     hook DestroyEffectBJ MemoryLeakHelper__ReleaseEffect
    
    // When I want to make the timer run the PassMemoryLeaks things, I have to use an .execute command which requires an extra func.
    function YDWEMemoryLeakStartPassTimer takes nothing returns nothing
        //call BJDebugMsg("Restarting PassTimer")
        call TimerStart(MemoryLeakHelper__PassTimer, MemoryLeakHelper__PASS_INTERVAL, true, function MemoryLeakHelper__PassMemoryLeaks)
    endfunction
    
	// 开启接口函数
    function YDWEMemoryLeakHelperMapIsOpenMemoryLeakHelper takes boolean IsOpenMemoryLeak returns nothing
        set MemoryLeakHelper__IsOpenMemoryLeakHelper=IsOpenMemoryLeak
        call PauseTimer(MemoryLeakHelper__PassTimer)
        if ( IsOpenMemoryLeak ) then
            call YDWEMemoryLeakStartPassTimer()
        endif
    endfunction
    
    function YDWEMemoryLeakHelperProtectLastCaughtHandle takes nothing returns nothing
        call YDWEMemoryLeakHelperProtectHandle(YDWEMemoryLeakHelperGetLastCaughtHandle())
    endfunction
    
    function YDWEMemoryLeakHelperProtectLocation takes location loc returns nothing
        call YDWEMemoryLeakHelperProtectHandle(loc)
    endfunction
    function YDWEMemoryLeakHelperProtectGroup takes group g returns nothing
        call YDWEMemoryLeakHelperProtectHandle(g)
    endfunction
    
    function YDWEMemoryLeakHelperProtectEffect takes effect e returns nothing
        call YDWEMemoryLeakHelperProtectHandle(e)
    endfunction
        
    function MemoryLeakHelper__Init takes nothing returns nothing
        set MemoryLeakHelper__IndexData=s__MemoryLeakHelper__HandleTable__allocate()
        set MemoryLeakHelper__IsSaved=s__MemoryLeakHelper__HandleTable__allocate()
        
        //call YDWEMemoryLeakStartPassTimer()
        call TimerStart(MemoryLeakHelper__GameTimeTimer, MemoryLeakHelper__GAMETIME_TIMER_INTERVAL, true, function MemoryLeakHelper__UpdateGameTime)
    endfunction
    

//library MemoryLeakHelper ends
//===========================================================================
// 
// SkillTest
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Fri Nov 29 16:06:39 2024
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_Row_Data=2
    set udg_List_Data=1
    set udg_LIST=14
    set udg_ROW=16
    set udg_BoardFlag=true
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('I01Q', - 1958.3, - 1979.9)
    call CreateItem('I01R', - 2067.9, - 2001.1)
    call CreateItem('I01S', - 1858.9, - 1634.0)
    call CreateItem('I01T', - 1800.3, - 1968.3)
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
    set u=CreateUnit(p, 'H007', 652.6, - 762.1, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'U000', 1751.3, - 757.5, 244.783)
    call SetUnitState(u, UNIT_STATE_MANA, 300)
    set u=CreateUnit(p, 'h001', 1349.7, - 135.8, 190.440)
    set u=CreateUnit(p, 'nzep', 1670.0, - 411.7, 293.210)
    set u=CreateUnit(p, 'u001', 1521.2, - 310.2, 220.283)
    set u=CreateUnit(p, 'H009', 663.4, - 904.6, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'h001', 247.4, - 153.4, 190.440)
    set u=CreateUnit(p, 'h001', 2567.0, - 156.9, 190.440)
    set u=CreateUnit(p, 'H005', 875.5, - 412.3, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'H004', 884.9, - 611.1, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'H003', 896.6, - 825.1, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'H000', 904.2, - 995.9, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'H008', 1149.3, - 757.1, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'H006', 1162.9, - 933.9, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'O000', 1708.7, - 979.5, 29.500)
    set u=CreateUnit(p, 'h001', - 868.4, - 1652.4, 122.040)
    set u=CreateUnit(p, 'O001', 1512.8, - 778.1, 194.080)
    set u=CreateUnit(p, 'H00A', 1508.2, - 968.4, 320.310)
endfunction
//===========================================================================
function CreateBuildingsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'u002', 2336.0, 416.0, 270.000)
    set u=CreateUnit(p, 'etoe', - 2624.0, - 2688.0, 270.000)
    set u=CreateUnit(p, 'o002', - 1696.0, - 1440.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nglm', 1278.0, 1935.6, 70.150)
    set gg_unit_n003_0006=CreateUnit(p, 'n003', 177.9, 355.6, 270.000)
    set u=CreateUnit(p, 'nzep', 119.2, 954.3, 270.000)
    set u=CreateUnit(p, 'n00U', 1407.6, 704.4, 270.000)
    set u=CreateUnit(p, 'n00V', 1186.4, 722.0, 270.000)
    set u=CreateUnit(p, 'n00R', 1586.1, 520.7, 270.000)
    set u=CreateUnit(p, 'n00T', 1330.7, 180.6, 270.000)
    set u=CreateUnit(p, 'n00S', 1140.7, 326.9, 270.000)
    set u=CreateUnit(p, 'n00P', 1342.1, 351.9, 270.000)
    set u=CreateUnit(p, 'n001', 183.6, 523.9, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'n004', 1156.0, 183.8, 270.000)
    set u=CreateUnit(p, 'n00Q', 1513.5, 355.0, 270.000)
    set gg_unit_n00W_0023=CreateUnit(p, 'n00W', - 82.6, 182.0, 341.564)
    set u=CreateUnit(p, 'N00B', - 1948.0, - 1857.2, 270.000)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'h002', - 746.1, 471.6, 270.000)
    set u=CreateUnit(p, 'h002', - 827.0, 458.5, 270.000)
    set u=CreateUnit(p, 'h002', - 903.8, 471.6, 270.000)
    set u=CreateUnit(p, 'h002', - 992.5, 448.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1070.9, 448.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1173.1, 445.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1286.4, 445.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1358.3, 445.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1449.8, 445.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1540.9, 430.0, 270.000)
    set u=CreateUnit(p, 'h002', - 1660.3, 430.0, 270.000)
    set u=CreateUnit(p, 'h002', - 1747.2, 430.0, 270.000)
    set u=CreateUnit(p, 'h002', - 1847.0, 430.0, 270.000)
    set u=CreateUnit(p, 'h002', - 1946.9, 430.0, 270.000)
    set u=CreateUnit(p, 'h002', - 733.3, 378.0, 270.000)
    set u=CreateUnit(p, 'h002', - 814.1, 364.9, 270.000)
    set u=CreateUnit(p, 'h002', - 891.0, 378.0, 270.000)
    set u=CreateUnit(p, 'h002', - 979.6, 354.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1058.1, 354.5, 270.000)
    set u=CreateUnit(p, 'h002', - 1160.3, 351.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1273.6, 351.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1345.4, 351.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1436.9, 351.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1528.0, 336.4, 270.000)
    set u=CreateUnit(p, 'h002', - 1647.5, 336.4, 270.000)
    set u=CreateUnit(p, 'h002', - 1734.3, 336.4, 270.000)
    set u=CreateUnit(p, 'h002', - 1834.2, 336.4, 270.000)
    set u=CreateUnit(p, 'h002', - 1934.1, 336.4, 270.000)
    set u=CreateUnit(p, 'h002', - 723.0, 292.3, 270.000)
    set u=CreateUnit(p, 'h002', - 803.8, 279.2, 270.000)
    set u=CreateUnit(p, 'h002', - 880.7, 292.3, 270.000)
    set u=CreateUnit(p, 'h002', - 969.3, 268.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1047.8, 268.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1150.0, 266.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1263.3, 266.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1335.2, 266.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1426.7, 266.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1517.8, 250.7, 270.000)
    set u=CreateUnit(p, 'h002', - 1637.2, 250.7, 270.000)
    set u=CreateUnit(p, 'h002', - 1724.0, 250.7, 270.000)
    set u=CreateUnit(p, 'h002', - 1823.9, 250.7, 270.000)
    set u=CreateUnit(p, 'h002', - 1923.8, 250.7, 270.000)
    set u=CreateUnit(p, 'h002', - 720.5, 202.7, 270.000)
    set u=CreateUnit(p, 'h002', - 801.3, 189.6, 270.000)
    set u=CreateUnit(p, 'h002', - 878.2, 202.7, 270.000)
    set u=CreateUnit(p, 'h002', - 966.8, 179.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1045.3, 179.2, 270.000)
    set u=CreateUnit(p, 'h002', - 1147.5, 176.6, 270.000)
    set u=CreateUnit(p, 'h002', - 1260.8, 176.6, 270.000)
    set u=CreateUnit(p, 'h002', - 1332.7, 176.6, 270.000)
    set u=CreateUnit(p, 'h002', - 1424.2, 176.6, 270.000)
    set u=CreateUnit(p, 'h002', - 1515.3, 161.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1634.7, 161.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1721.5, 161.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1821.4, 161.1, 270.000)
    set u=CreateUnit(p, 'h002', - 1921.3, 161.1, 270.000)
    set gg_unit_h002_0096=CreateUnit(p, 'h002', - 703.3, 94.4, 270.000)
    set u=CreateUnit(p, 'h002', - 784.2, 81.3, 270.000)
    set u=CreateUnit(p, 'h002', - 861.0, 94.4, 270.000)
    set u=CreateUnit(p, 'h002', - 949.6, 70.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1028.1, 70.9, 270.000)
    set u=CreateUnit(p, 'h002', - 1130.3, 68.3, 270.000)
    set u=CreateUnit(p, 'h002', - 1243.6, 68.3, 270.000)
    set u=CreateUnit(p, 'h002', - 1315.5, 68.3, 270.000)
    set u=CreateUnit(p, 'h002', - 1407.0, 68.3, 270.000)
    set u=CreateUnit(p, 'h002', - 1498.1, 52.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1617.5, 52.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1704.4, 52.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1804.2, 52.8, 270.000)
    set u=CreateUnit(p, 'h002', - 1904.1, 52.8, 270.000)
    set gg_unit_n00T_0110=CreateUnit(p, 'n00T', - 620.5, 147.5, 270.000)
    set u=CreateUnit(p, 'n019', - 1859.3, - 1446.1, 113.932)
    set u=CreateUnit(p, 'o003', - 1796.4, - 1624.0, 331.336)
    set u=CreateUnit(p, 'opeo', - 1759.5, - 1296.1, 148.111)
    set u=CreateUnit(p, 'opeo', - 1696.0, - 1296.1, 2.406)
    set u=CreateUnit(p, 'opeo', - 1622.9, - 1300.0, 210.746)
    set u=CreateUnit(p, 'opeo', - 1602.1, - 1239.4, 165.360)
    set u=CreateUnit(p, 'opeo', - 1684.7, - 1239.4, 121.128)
    set u=CreateUnit(p, 'opeo', - 1754.4, - 1227.4, 350.947)
    set gg_unit_n002_0234=CreateUnit(p, 'n002', 441.0, 217.3, 270.000)
    set u=CreateUnit(p, 'n009', 1389.0, 508.8, 270.000)
    set u=CreateUnit(p, 'n00A', 1168.9, 525.0, 270.000)
    set u=CreateUnit(p, 'n005', - 90.4, 385.4, 270.000)
    set u=CreateUnit(p, 'n007', 463.1, 429.5, 270.000)
    set u=CreateUnit(p, 'n00M', 2621.1, 692.6, 180.000)
    set u=CreateUnit(p, 'n00N', 2641.8, 518.5, 180.000)
    set u=CreateUnit(p, 'n00L', 2632.9, 337.4, 180.000)
    set u=CreateUnit(p, 'n00J', 2651.2, 132.4, 180.000)
    set u=CreateUnit(p, 'n00K', 2865.0, 683.2, 180.000)
    set u=CreateUnit(p, 'n00F', 2860.2, 487.1, 180.000)
    set u=CreateUnit(p, 'n00O', 2825.3, 298.6, 180.000)
    set u=CreateUnit(p, 'n00H', 2832.2, 130.8, 180.000)
    set u=CreateUnit(p, 'n00G', 2339.6, 703.5, 180.000)
    set u=CreateUnit(p, 'e000', 418.7, 649.6, 270.000)
    set u=CreateUnit(p, 'n006', - 68.0, 571.1, 270.000)
    set u=CreateUnit(p, 'n000', 200.1, 194.5, 270.000)
endfunction
//===========================================================================
function CreateNeutralHostileBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n01A', - 2176.0, - 1536.0, 270.000)
    call SetResourceAmount(u, 12500)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n00I', - 128.0, - 896.0, 270.000)
    set u=CreateUnit(p, 'n00X', - 128.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n00E', 256.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n00Y', 640.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n00Z', 1024.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n00C', 1792.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n00D', 2176.0, - 1280.0, 270.000)
    set u=CreateUnit(p, 'n010', 1408.0, - 1280.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'e002', - 2972.8, - 156.6, 87.408)
    set u=CreateUnit(p, 'e002', - 3000.2, 124.4, 115.861)
    set u=CreateUnit(p, 'e002', - 2943.5, - 392.8, 54.341)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer11()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer11()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralHostileBuildings()
    call CreateNeutralPassiveBuildings()
    call CreatePlayerBuildings()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: test
//===========================================================================
function Trig_testActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, CreateUnitAtLoc(Player(0), 'e004', GetUnitLoc(gg_unit_n00T_0110), 0))
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), 'A007')
    call IssueNeutralTargetOrderById(Player(0), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), 852222, gg_unit_h002_0096)
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA1614B4D, OrderId2StringBJ(0))
    call DisplayTextToPlayer(Player(0), 0, 0, OrderId2StringBJ(String2OrderIdBJ("fingerofdeath")))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_test takes nothing returns nothing
    set gg_trg_test=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_test, 5.00)
    call TriggerAddAction(gg_trg_test, function Trig_testActions)
endfunction
//===========================================================================
// Trigger: Init
//===========================================================================
function Trig_InitActions takes nothing returns nothing
    call FogEnableOff()
    call FogMaskEnableOff()
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
    call AdjustPlayerStateBJ(10000, Player(0), PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(10000, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
    call AdjustPlayerStateBJ(10000, Player(11), PLAYER_STATE_RESOURCE_GOLD)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n002_0234, 852589)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n003_0006, 852055)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n00W_0023, 852106)
    call SetPlayerAlliance(Player(11), Player(0), ALLIANCE_SHARED_CONTROL, true)
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, - 1300.00, 100.00, 5000.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        call SetUnitLifePercentBJ(ydl_unit, 100)
        call SetUnitManaPercentBJ(ydl_unit, 100)
    endloop
    call h__DestroyGroup(ydl_group)
    call DestroyTrigger(GetTriggeringTrigger())
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
// Trigger: revive
//===========================================================================
function Trig_reviveConditions takes nothing returns boolean
    return ( ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) )
endfunction
function Trig_reviveFunc004T takes nothing returns nothing
    call ReviveHeroLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xDD96168E), true)
    call DisplayTextToPlayer(Player(0), 0, 0, "复活")
    call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xDD96168E))
endfunction
function Trig_reviveActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetDyingUnit())
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDD96168E, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call DisplayTextToPlayer(Player(0), 0, 0, "英雄死亡")
    set ydl_timer=CreateTimer()
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xDD96168E, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDD96168E))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call TimerStart(ydl_timer, 2.00, false, function Trig_reviveFunc004T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_revive takes nothing returns nothing
    set gg_trg_revive=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_revive, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_revive, Condition(function Trig_reviveConditions))
    call TriggerAddAction(gg_trg_revive, function Trig_reviveActions)
endfunction
//===========================================================================
// Trigger: EXP
//===========================================================================
function Trig_EXPActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, - 1300.00, 100.00, 5000.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        if ( ( IsUnitType(ydl_unit, UNIT_TYPE_HERO) == true ) ) then
            call SetHeroLevelBJ(ydl_unit, 10, true)
        else
        endif
    endloop
    call h__DestroyGroup(ydl_group)
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_EXP takes nothing returns nothing
    set gg_trg_EXP=CreateTrigger()
    call DoNothing()
    call TriggerRegisterTimerEventSingle(gg_trg_EXP, 1.00)
    call TriggerAddAction(gg_trg_EXP, function Trig_EXPActions)
endfunction
//===========================================================================
// Trigger: reset
//
// 重置，恢复生命
//===========================================================================
function Trig_resetActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local integer ydul_r
    local integer ydul_l
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, - 1300.00, 100.00, 5000.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        call SetUnitLifePercentBJ(ydl_unit, 100)
        call SetUnitManaPercentBJ(ydl_unit, 100)
    endloop
    call h__DestroyGroup(ydl_group)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n002_0234, 852589)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n003_0006, 852055)
    call IssueNeutralImmediateOrderById(Player(0), gg_unit_n00W_0023, 852106)
    set udg_List_Data=1
    set udg_Row_Data=2
    set udg_BoardFlag=true
    call DestroyMultiboard(LoadMultiboardHandle(YDHT, StringHash("多面板"), 0x437E2A40))
    call SaveMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916, CreateMultiboard())
    call SaveMultiboardHandle(YDHT, StringHash("多面板"), 0x437E2A40, LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916))
    call MultiboardSetRowCount(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), udg_ROW)
    call MultiboardSetColumnCount(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), udg_LIST)
    call MultiboardSetItemsWidth(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), 0.05)
    call MultiboardSetTitleText(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), "伤害记录")
    call MultiboardSetTitleTextColor(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), 255, 255, 0, 255)
    call MultiboardDisplay(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916), true)
    set ydul_r=2
    loop
        exitwhen ydul_r > udg_ROW
        call YDWEMultiboardSetItemIconBJNull(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916) , 1 , ydul_r , "ReplaceableTextures\\CommandButtons\\BTNFelBoar.blp")
        set ydul_r=ydul_r + 1
    endloop
    set ydul_l=1
    loop
        exitwhen ydul_l > udg_LIST
        call YDWEMultiboardSetItemValueBJNull(LoadMultiboardHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAD644916) , ydul_l , 1 , ( ( "第" ) + ( I2S(ydul_l) ) + ( "组" ) ))
        set ydul_l=ydul_l + 1
    endloop
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_reset takes nothing returns nothing
    set gg_trg_reset=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_reset, Player(0), "reset", false)
    call TriggerAddAction(gg_trg_reset, function Trig_resetActions)
endfunction
//===========================================================================
// Trigger: Excretion
//===========================================================================
function Trig_ExcretionActions takes nothing returns nothing
    call YDWEMemoryLeakHelperDisplayLeaks()
endfunction
//===========================================================================
function InitTrig_Excretion takes nothing returns nothing
    set gg_trg_Excretion=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg_Excretion, Player(0), "1", true)
    call TriggerAddAction(gg_trg_Excretion, function Trig_ExcretionActions)
endfunction
//===========================================================================
// Trigger: Excretion_AutoUseItem
//
// 排泄
//===========================================================================
function Trig_Excretion_AutoUseItemConditions takes nothing returns boolean
    return ( ( CheckItemStatus(GetManipulatedItem(), bj_ITEM_STATUS_POWERUP) == true ) )
endfunction
function Trig_Excretion_AutoUseItemActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332, GetManipulatedItem())
    call RemoveItem(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Excretion_AutoUseItem takes nothing returns nothing
    set gg_trg_Excretion_AutoUseItem=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Excretion_AutoUseItem, EVENT_PLAYER_UNIT_USE_ITEM)
    call TriggerAddCondition(gg_trg_Excretion_AutoUseItem, Condition(function Trig_Excretion_AutoUseItemConditions))
    call TriggerAddAction(gg_trg_Excretion_AutoUseItem, function Trig_Excretion_AutoUseItemActions)
endfunction
//===========================================================================
// Trigger: Harm
//===========================================================================
function Trig_HarmActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetTriggerUnit())
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7C181E3A, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xEB69EE48, GetEventDamage())
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D1E4992, R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xEB69EE48)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x51990A95, GetEventDamageSource())
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x854C1BA5, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x51990A95)))
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xED96B976, ( ( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7C181E3A) ) + ( " |Cffffff00所受伤害：|R" ) + ( ( R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xEB69EE48)) + ( "  |Cffff0000伤害来源：|R" + LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x854C1BA5) ) ) ) ))
    call DisplayTextToPlayer(Player(0), 0, 0, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xED96B976))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Harm takes nothing returns nothing
    set gg_trg_Harm=CreateTrigger()
    call DoNothing()
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_Harm)
    call TriggerAddAction(gg_trg_Harm, function Trig_HarmActions)
endfunction
//===========================================================================
// Trigger: LearnSkill
//===========================================================================
function Trig_LearnSkillConditions takes nothing returns boolean
    return ( ( ( IsUnitAliveBJ(GetBuyingUnit()) == true ) and ( ( GetUnitTypeId(GetSellingUnit()) == 'n00X' ) or ( GetUnitTypeId(GetSellingUnit()) == 'n00E' ) or ( GetUnitTypeId(GetSellingUnit()) == 'n00Y' ) or ( GetUnitTypeId(GetSellingUnit()) == 'n00Z' ) or ( GetUnitTypeId(GetSellingUnit()) == 'n00C' ) or ( GetUnitTypeId(GetSellingUnit()) == 'n00D' ) ) ) )
endfunction
function Trig_LearnSkillActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332, GetItemTypeId(GetSoldItem()))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetBuyingUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6856D322, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723, LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)), 0xE89D1E6D))
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723) <= 6 ) ) then
        // 已学技能数量≤6可以继续学习
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723, ( ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)), 0xE89D1E6D) ) + ( 1 ) ))
        call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)), 0xE89D1E6D, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723))
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I005' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00X')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00B' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00Y')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00A' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00I')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I006' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02L')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00G' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A013')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00F' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00D')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I008' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A006')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I009' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A011')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00R' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A01B')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00P' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00A')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00T' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A017')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00M' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'ANic')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01H' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A029')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01D' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00Q')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01G' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02R')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01B' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02G')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00W' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02C')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I007' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A016')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00E' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00E')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I018' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A01C')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00D' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A010')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00X' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A01M')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00U' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A01D')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00S' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A01E')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01I' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02D')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01A' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00N')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01E' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02H')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I019' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02O')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01N' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02I')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01C' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02A')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01F' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02Q')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01L' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02K')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01J' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02N')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01K' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A02M')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00J' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A00L')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00C' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'A014')
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I01P' ) ) then
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, 'Apxf')
        else
        endif
        call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9))
        call YDWESaveAbilityIDByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))) , I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723)) , LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9))
        call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76, GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9)))
        call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, ( ( "学习第" ) + ( I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723)) ) + ( ( "个技能：" + LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76) ) ) ))
    else
        call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, "英雄已经学习7个技能，不能继续学习")
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_LearnSkill takes nothing returns nothing
    set gg_trg_LearnSkill=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LearnSkill, EVENT_PLAYER_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_LearnSkill, Condition(function Trig_LearnSkillConditions))
    call TriggerAddAction(gg_trg_LearnSkill, function Trig_LearnSkillActions)
endfunction
//===========================================================================
// Trigger: ForgetSkill
//===========================================================================
function Trig_ForgetSkillConditions takes nothing returns boolean
    return ( ( ( IsUnitAliveBJ(GetManipulatingUnit()) == true ) and ( ( GetItemTypeId(GetManipulatedItem()) == 'I00L' ) or ( GetItemTypeId(GetManipulatedItem()) == 'I00K' ) ) ) )
endfunction
function Trig_ForgetSkillFunc008Func002Func002Func002Conditions takes nothing returns nothing
    local integer ydul_b
    local integer ydul_c
    local integer ydul_d
    call SaveButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDCB94F90, GetClickedButtonBJ())
    set ydul_b=1
    loop
        exitwhen ydul_b > ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x6CFAA723) ) + ( 1 ) )
        call SaveButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x939EFECB, YDWEGetButtonByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "遗忘技能按钮" ) ) , I2S(ydul_b)))
        if ( ( LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDCB94F90) == LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x939EFECB) ) ) then
            // 这里是为了找出删了哪个技能
            call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38, ydul_b)
        else
        endif
        set ydul_b=ydul_b + 1
    endloop
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38) <= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x6CFAA723) ) ) then
        // 点击按钮是技能
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9, YDWEGetAbilityIDByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))) , I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38))))
        call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9))
        call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3C856A76, GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9)))
        call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, ( ( ( "遗忘第" ) + ( I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38)) ) + ( "个技能" ) ) + LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3C856A76) ))
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3, ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x6CFAA723) ) - ( 1 ) ))
        call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA)), 0xE89D1E6D, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3))
        if ( ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3) >= 1 ) and ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38) < LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x6CFAA723) ) ) ) then
            // 至少2个技能才需要排序，删除技能不是最后的技能才需要排序
            call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, "|Cff0000ff遗忘技能，需要对剩下技能排序|R")
            call YDWEFlushMissionByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))))
            set ydul_c=LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5BC55A38)
            loop
                exitwhen ydul_c > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3)
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9, YDWEGetAbilityIDByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "技能排序" ) ) , I2S(( ( ydul_c ) + ( 1 ) ))))
                call YDWESaveAbilityIDByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "技能排序" ) ) , I2S(ydul_c) , LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9))
                set ydul_c=ydul_c + 1
            endloop
        else
            call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, "|Cff00ff00遗忘技能，不需要排序|R")
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3) == 0 ) ) then
            // 所有技能都遗忘了
            call YDWEFlushMissionByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))))
            call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, "遗忘了最后一个技能，英雄没有技能")
        else
            // 技能数量>1，显示当前技能排序
            set ydul_d=1
            loop
                exitwhen ydul_d > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x4EBCB0F3)
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9, YDWEGetAbilityIDByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "技能排序" ) ) , I2S(ydul_d)))
                call YDWESaveAbilityIDByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))) , I2S(ydul_d) , LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9))
                call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3C856A76, GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA9CA4AD9)))
                call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, ( ( "|Cffffff00" ) + ( ( ( "排序后第" ) + ( I2S(ydul_d) ) + ( ( "个技能：" + LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3C856A76) ) ) ) ) + ( "|R" ) ))
                set ydul_d=ydul_d + 1
            endloop
        endif
    else
        // 点击按钮是取消
        call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6), 0, 0, "取消遗忘技能")
    endif
    call YDWEFlushMissionByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "技能排序" ) ))
    call YDWEFlushMissionByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))) ) + ( "遗忘技能按钮" ) ))
    call DialogDestroy(LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC48E03BF))
    call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x09999BDA))
endfunction
function Trig_ForgetSkillActions takes nothing returns nothing
    local integer ydul_a
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetManipulatingUnit())
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332, GetItemTypeId(GetManipulatedItem()))
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6856D322, GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723, LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)), 0xE89D1E6D))
    call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, ( "技能数量：" + I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723)) ))
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723) == 0 ) ) then
        // 没有技能，不能遗忘
        call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, "英雄没有技能，不能遗忘技能")
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
        set ydl_trigger=null
        return
    else
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00K' ) ) then
            call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)), 0xE89D1E6D, 0)
            // 先获取单位有哪些技能
            set ydul_a=1
            loop
                exitwhen ydul_a > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723)
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, YDWEGetAbilityIDByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))) , I2S(ydul_a)))
                call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9))
                set ydul_a=ydul_a + 1
            endloop
            call YDWEFlushMissionByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))))
            call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, "已删除英雄所有技能")
        else
        endif
        if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1769D332) == 'I00L' ) ) then
            call SaveDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF, DialogCreate())
            call DialogSetMessage(LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF), "|Cffffff00删除技能：|R")
            set ydul_a=1
            loop
                exitwhen ydul_a > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723)
                call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9, YDWEGetAbilityIDByString(I2S(YDWEH2I(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))) , I2S(ydul_a)))
                call YDWESaveAbilityIDByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))) ) + ( "技能排序" ) ) , I2S(ydul_a) , LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9))
                call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76, GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9)))
                call DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 0, 0, ( ( I2S(ydul_a) ) + ( "技能：" ) + ( LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76) ) ))
                call SaveButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x939EFECB, DialogAddButton(LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76), 0))
                call YDWESaveButtonByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))) ) + ( "遗忘技能按钮" ) ) , I2S(ydul_a) , LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x939EFECB))
                set ydul_a=ydul_a + 1
            endloop
            call SaveButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x939EFECB, DialogAddButton(LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF), "取消", 0))
            call YDWESaveButtonByString(( ( "玩家" ) + ( I2S(GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))) ) + ( "遗忘技能按钮" ) ) , I2S(( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723) ) + ( 1 ) )) , LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x939EFECB))
            call DialogDisplay(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF), true)
            call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x09999BDA, CreateTrigger())
            set ydl_trigger=LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x09999BDA)
            call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
            call SaveStr(YDLOC, GetHandleId(ydl_trigger), 0x6856D322, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6856D322))
            call SavePlayerHandle(YDLOC, GetHandleId(ydl_trigger), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
            call SaveDialogHandle(YDLOC, GetHandleId(ydl_trigger), 0xC48E03BF, LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF))
            call SaveInteger(YDLOC, GetHandleId(ydl_trigger), 0x6CFAA723, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6CFAA723))
            call SaveInteger(YDLOC, GetHandleId(ydl_trigger), 0x5BC55A38, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x5BC55A38))
            call SaveButtonHandle(YDLOC, GetHandleId(ydl_trigger), 0x939EFECB, LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x939EFECB))
            call SaveButtonHandle(YDLOC, GetHandleId(ydl_trigger), 0xDCB94F90, LoadButtonHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDCB94F90))
            call SaveInteger(YDLOC, GetHandleId(ydl_trigger), 0xA9CA4AD9, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA9CA4AD9))
            call SaveStr(YDLOC, GetHandleId(ydl_trigger), 0x3C856A76, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3C856A76))
            call SaveInteger(YDLOC, GetHandleId(ydl_trigger), 0x4EBCB0F3, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4EBCB0F3))
            call SaveTriggerHandle(YDLOC, GetHandleId(ydl_trigger), 0x09999BDA, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x09999BDA))
            call TriggerRegisterDialogEvent(ydl_trigger, LoadDialogHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC48E03BF))
            call TriggerAddCondition(ydl_trigger, Condition(function Trig_ForgetSkillFunc008Func002Func002Func002Conditions))
        else
        endif
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_ForgetSkill takes nothing returns nothing
    set gg_trg_ForgetSkill=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ForgetSkill, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_ForgetSkill, Condition(function Trig_ForgetSkillConditions))
    call TriggerAddAction(gg_trg_ForgetSkill, function Trig_ForgetSkillActions)
endfunction
//===========================================================================
// Trigger: HeroDegree+1
//===========================================================================
function Trig_HeroDegree_1Conditions takes nothing returns boolean
    return ( ( GetItemTypeId(GetManipulatedItem()) == 'I001' ) and ( IsUnitType(GetManipulatingUnit(), UNIT_TYPE_HERO) == true ) )
endfunction
function Trig_HeroDegree_1Actions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DisplayTextToPlayer(Player(0), 0, 0, "等级+1")
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetManipulatingUnit())
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xADF36BCA, GetHeroLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA)))
    call SetHeroLevel(GetTriggerUnit(), ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xADF36BCA) + 1 ), true)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_HeroDegree_1 takes nothing returns nothing
    set gg_trg_HeroDegree_1=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HeroDegree_1, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_HeroDegree_1, Condition(function Trig_HeroDegree_1Conditions))
    call TriggerAddAction(gg_trg_HeroDegree_1, function Trig_HeroDegree_1Actions)
endfunction
//===========================================================================
// Trigger: DeathFinger
//
// 死亡一指设置为混乱攻击通用伤害
//===========================================================================
function Trig_DeathFingerConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A007' ) )
endfunction
function Trig_DeathFingerActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAEB9D2B4, GetSpellAbilityUnit())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3, GetSpellTargetUnit())
    call UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAEB9D2B4), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3), 1000.00, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_DeathFinger takes nothing returns nothing
    set gg_trg_DeathFinger=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DeathFinger, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_DeathFinger, Condition(function Trig_DeathFingerConditions))
    call TriggerAddAction(gg_trg_DeathFinger, function Trig_DeathFingerActions)
endfunction
//===========================================================================
// Trigger: 1HP
//
// 死亡一指设置为混乱攻击通用伤害
//===========================================================================
function Trig_1HPConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A00P' ) )
endfunction
function Trig_1HPActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAEB9D2B4, GetSpellAbilityUnit())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3, GetSpellTargetUnit())
    call SetUnitLifeBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3), 1.00)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_1HP takes nothing returns nothing
    set gg_trg_1HP=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_1HP, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_1HP, Condition(function Trig_1HPConditions))
    call TriggerAddAction(gg_trg_1HP, function Trig_1HPActions)
endfunction
//===========================================================================
// Trigger: 10HP
//
// 死亡一指设置为混乱攻击通用伤害
//===========================================================================
function Trig_10HPConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A00K' ) )
endfunction
function Trig_10HPActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xAEB9D2B4, GetSpellAbilityUnit())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3, GetSpellTargetUnit())
    call SetUnitLifeBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x4C69D1F3), 17.00)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_10HP takes nothing returns nothing
    set gg_trg_10HP=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_10HP, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_10HP, Condition(function Trig_10HPConditions))
    call TriggerAddAction(gg_trg_10HP, function Trig_10HPActions)
endfunction
//===========================================================================
// Trigger: CheckHeroProperty
//===========================================================================
function Trig_CheckHeroPropertyConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A003' ) and ( IsUnitType(GetSpellAbilityUnit(), UNIT_TYPE_HERO) == true ) )
endfunction
function Trig_CheckHeroPropertyActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, GetSpellAbilityUnit())
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF0A1F4CB, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), UNIT_STATE_MAX_LIFE))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x26DE6BC7, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), UNIT_STATE_MAX_MANA))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D9B99E2, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), ConvertUnitState(0x15)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7AE5C8FB, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), ConvertUnitState(0x20)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0541142D, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), ConvertUnitState(0x51)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x99D3BEEA, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), ConvertUnitState(0x25)))
    call SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x05FEC4C2, ( EXExecuteScript("(require'jass.slk').unit[" + I2S('n008') + "].movetp") ))
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTextToPlayer(Player(0), 0, 0, ( "最大生命值：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF0A1F4CB)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "最大魔法值：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x26DE6BC7)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "攻击力：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D9B99E2)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "防御：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7AE5C8FB)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "攻击速度：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0541142D)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "攻击间隔：" + R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x99D3BEEA)) ))
    call DisplayTextToPlayer(Player(0), 0, 0, ( "移动类型：" + LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x05FEC4C2) ))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_CheckHeroProperty takes nothing returns nothing
    set gg_trg_CheckHeroProperty=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CheckHeroProperty, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_CheckHeroProperty, Condition(function Trig_CheckHeroPropertyConditions))
    call TriggerAddAction(gg_trg_CheckHeroProperty, function Trig_CheckHeroPropertyActions)
endfunction
//===========================================================================
// Trigger: Change_MoveType
//===========================================================================
function Trig_Change_MoveTypeConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A00F' ) )
endfunction
function Trig_Change_MoveTypeFunc008T takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xB6A6EBAA))
    call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6))
    call DisplayTextToPlayer(Player(0), 0, 0, "改变移动类型超时")
    call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1F6848DF))
    call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x0CB71A07))
    call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1CA61CEC))
endfunction
function Trig_Change_MoveTypeFunc009Conditions takes nothing returns nothing
    if ( ( GetTriggerUnit() != LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA) ) ) then
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call DisplayTextToPlayer(Player(0), 0, 0, "选择了其它单位需要重来")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
    else
    endif
endfunction
function Trig_Change_MoveTypeFunc010Conditions takes nothing returns nothing
    if ( ( GetResearched() == 'R001' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x00)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：没有")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R002' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x01)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：无法移动")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R003' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x02)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：步行")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R004' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x04)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：飞行")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R005' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x08)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：地雷")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R006' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x10)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：疾风步")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R007' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x20)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：未知")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R000' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x40)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：漂浮（水）")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
    if ( ( GetResearched() == 'R008' ) ) then
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0CB71A07))
        call EXSetUnitMoveType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), 0x80)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6A6EBAA))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE6E64075), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xA59BB4C6))
        call DisplayTextToPlayer(Player(0), 0, 0, "移动类型：两栖")
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC))
        call DestroyTrigger(LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1F6848DF))
    else
    endif
endfunction
function Trig_Change_MoveTypeActions takes nothing returns nothing
    local timer ydl_timer
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F6848DF, CreateTrigger())
    call SaveTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0CB71A07, CreateTrigger())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075, GetSpellAbilityUnit())
    call SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA, CreateUnitAtLoc(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), 'n008', GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075)), 0))
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC, CreateTimer())
    call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    set ydl_timer=LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC)
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SaveTimerHandle(YDLOC, GetHandleId(ydl_timer), 0x1CA61CEC, LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_timer), 0x0CB71A07, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0CB71A07))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_timer), 0x1F6848DF, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F6848DF))
    call TimerStart(ydl_timer, 10.00, false, function Trig_Change_MoveTypeFunc008T)
    set ydl_trigger=LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0CB71A07)
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_trigger), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SaveTimerHandle(YDLOC, GetHandleId(ydl_trigger), 0x1CA61CEC, LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_trigger), 0x0CB71A07, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0CB71A07))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_trigger), 0x1F6848DF, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F6848DF))
    call TriggerRegisterPlayerSelectionEventBJ(ydl_trigger, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6), true)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Change_MoveTypeFunc009Conditions))
    set ydl_trigger=LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F6848DF)
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xE6E64075, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE6E64075))
    call SavePlayerHandle(YDLOC, GetHandleId(ydl_trigger), 0xA59BB4C6, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xB6A6EBAA, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA))
    call SaveTimerHandle(YDLOC, GetHandleId(ydl_trigger), 0x1CA61CEC, LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_trigger), 0x0CB71A07, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0CB71A07))
    call SaveTriggerHandle(YDLOC, GetHandleId(ydl_trigger), 0x1F6848DF, LoadTriggerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1F6848DF))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6A6EBAA), EVENT_UNIT_RESEARCH_START)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Change_MoveTypeFunc010Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Change_MoveType takes nothing returns nothing
    set gg_trg_Change_MoveType=CreateTrigger()
    call DoNothing()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Change_MoveType, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Change_MoveType, Condition(function Trig_Change_MoveTypeConditions))
    call TriggerAddAction(gg_trg_Change_MoveType, function Trig_Change_MoveTypeActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_test()
    call InitTrig_Init()
    call InitTrig_Init1()
    call InitTrig_revive()
    call InitTrig_EXP()
    call InitTrig_reset()
    call InitTrig_Excretion()
    call InitTrig_Excretion_AutoUseItem()
    call InitTrig_Harm()
    call InitTrig_LearnSkill()
    call InitTrig_ForgetSkill()
    call InitTrig_HeroDegree_1()
    call InitTrig_DeathFinger()
    call InitTrig_1HP()
    call InitTrig_10HP()
    call InitTrig_CheckHeroProperty()
    call InitTrig_Change_MoveType()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Init)
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
    // Player 11
    call SetPlayerStartLocation(Player(11), 2)
    call ForcePlayerStartLocation(Player(11), 2)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_RANDOM)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    // Force: TRIGSTR_043
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 1)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs27590562")
call ExecuteFunc("YDTriggerSaveLoadSystem__Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("MemoryLeakHelper__Init")

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
    call SetMapName("SkillTest")
    call SetMapDescription("没有说明")
    call SetPlayers(3)
    call SetTeams(3)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 1472.0, - 576.0)
    call DefineStartLocation(1, 2112.0, 2560.0)
    call DefineStartLocation(2, 2688.0, 2496.0)
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
//library ValueIndexing initializer Init requires YDWEBase




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa__MemoryLeakHelper__GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call s__MemoryLeakHelper__GTable_reset(this)
   return true
endfunction
function sa___prototype160_MemoryLeakHelper__GetElapsedGameTime takes nothing returns boolean

    set f__result_real= MemoryLeakHelper__GameTime + TimerGetElapsed(MemoryLeakHelper__GameTimeTimer)
    return true
endfunction
function sa___prototype164_MemoryLeakHelper__ReleaseLocation takes nothing returns boolean
    call MemoryLeakHelper__ReleaseLocation(f__arg_location1)
    return true
endfunction
function sa___prototype165_MemoryLeakHelper__CatchGroup takes nothing returns boolean
    call MemoryLeakHelper__CatchGroup(f__arg_group1)
    return true
endfunction
function sa___prototype165_MemoryLeakHelper__ReleaseGroup takes nothing returns boolean
    call MemoryLeakHelper__ReleaseGroup(f__arg_group1)
    return true
endfunction
function sa___prototype166_MemoryLeakHelper__ReleaseEffect takes nothing returns boolean
    call MemoryLeakHelper__ReleaseEffect(f__arg_effect1)
    return true
endfunction
function sa___prototype167_MemoryLeakHelper__PP takes nothing returns boolean
    call MemoryLeakHelper__PP(f__arg_location1,f__arg_real1,f__arg_real2)
    return true
endfunction
function sa___prototype168_MemoryLeakHelper__CU takes nothing returns boolean
    call MemoryLeakHelper__CU(f__arg_integer1,f__arg_integer2,f__arg_player1,f__arg_location1,f__arg_real1)
    return true
endfunction
function sa___prototype169_MemoryLeakHelper__IPO takes nothing returns boolean
    call MemoryLeakHelper__IPO(f__arg_unit1,f__arg_string1,f__arg_location1)
    return true
endfunction
function sa___prototype170_MemoryLeakHelper__SUP takes nothing returns boolean
    call MemoryLeakHelper__SUP(f__arg_unit1,f__arg_location1)
    return true
endfunction
function sa___prototype171_MemoryLeakHelper__SUF takes nothing returns boolean
    call MemoryLeakHelper__SUF(f__arg_unit1,f__arg_location1,f__arg_real1)
    return true
endfunction
function sa___prototype172_MemoryLeakHelper__GUR takes nothing returns boolean
    call MemoryLeakHelper__GUR(f__arg_real1,f__arg_location1,f__arg_boolexpr1)
    return true
endfunction
function sa___prototype173_MemoryLeakHelper__CUF takes nothing returns boolean
    call MemoryLeakHelper__CUF(f__arg_integer1,f__arg_integer2,f__arg_player1,f__arg_location1,f__arg_location2)
    return true
endfunction
function sa___prototype174_MemoryLeakHelper__FG takes nothing returns boolean
    call MemoryLeakHelper__FG(f__arg_group1,f__arg_code1)
    return true
endfunction
function sa___prototype175_MemoryLeakHelper__ASETU takes nothing returns boolean
    call MemoryLeakHelper__ASETU(f__arg_string1,f__arg_widget1,f__arg_string2)
    return true
endfunction
function sa___prototype176_MemoryLeakHelper__ASE takes nothing returns boolean
    call MemoryLeakHelper__ASE(f__arg_location1,f__arg_string1)
    return true
endfunction

function jasshelper__initstructs27590562 takes nothing returns nothing
    set st__MemoryLeakHelper__GTable_onDestroy[2]=CreateTrigger()
    set st__MemoryLeakHelper__GTable_onDestroy[3]=st__MemoryLeakHelper__GTable_onDestroy[2]
    call TriggerAddCondition(st__MemoryLeakHelper__GTable_onDestroy[2],Condition( function sa__MemoryLeakHelper__GTable_onDestroy))
    set st___prototype160[1]=CreateTrigger()
    call TriggerAddAction(st___prototype160[1],function sa___prototype160_MemoryLeakHelper__GetElapsedGameTime)
    call TriggerAddCondition(st___prototype160[1],Condition(function sa___prototype160_MemoryLeakHelper__GetElapsedGameTime))
    set st___prototype164[1]=CreateTrigger()
    call TriggerAddAction(st___prototype164[1],function sa___prototype164_MemoryLeakHelper__ReleaseLocation)
    call TriggerAddCondition(st___prototype164[1],Condition(function sa___prototype164_MemoryLeakHelper__ReleaseLocation))
    set st___prototype165[1]=CreateTrigger()
    call TriggerAddAction(st___prototype165[1],function sa___prototype165_MemoryLeakHelper__CatchGroup)
    call TriggerAddCondition(st___prototype165[1],Condition(function sa___prototype165_MemoryLeakHelper__CatchGroup))
    set st___prototype165[2]=CreateTrigger()
    call TriggerAddAction(st___prototype165[2],function sa___prototype165_MemoryLeakHelper__ReleaseGroup)
    call TriggerAddCondition(st___prototype165[2],Condition(function sa___prototype165_MemoryLeakHelper__ReleaseGroup))
    set st___prototype166[1]=CreateTrigger()
    call TriggerAddAction(st___prototype166[1],function sa___prototype166_MemoryLeakHelper__ReleaseEffect)
    call TriggerAddCondition(st___prototype166[1],Condition(function sa___prototype166_MemoryLeakHelper__ReleaseEffect))
    set st___prototype167[1]=CreateTrigger()
    call TriggerAddAction(st___prototype167[1],function sa___prototype167_MemoryLeakHelper__PP)
    call TriggerAddCondition(st___prototype167[1],Condition(function sa___prototype167_MemoryLeakHelper__PP))
    set st___prototype168[1]=CreateTrigger()
    call TriggerAddAction(st___prototype168[1],function sa___prototype168_MemoryLeakHelper__CU)
    call TriggerAddCondition(st___prototype168[1],Condition(function sa___prototype168_MemoryLeakHelper__CU))
    set st___prototype169[1]=CreateTrigger()
    call TriggerAddAction(st___prototype169[1],function sa___prototype169_MemoryLeakHelper__IPO)
    call TriggerAddCondition(st___prototype169[1],Condition(function sa___prototype169_MemoryLeakHelper__IPO))
    set st___prototype170[1]=CreateTrigger()
    call TriggerAddAction(st___prototype170[1],function sa___prototype170_MemoryLeakHelper__SUP)
    call TriggerAddCondition(st___prototype170[1],Condition(function sa___prototype170_MemoryLeakHelper__SUP))
    set st___prototype171[1]=CreateTrigger()
    call TriggerAddAction(st___prototype171[1],function sa___prototype171_MemoryLeakHelper__SUF)
    call TriggerAddCondition(st___prototype171[1],Condition(function sa___prototype171_MemoryLeakHelper__SUF))
    set st___prototype172[1]=CreateTrigger()
    call TriggerAddAction(st___prototype172[1],function sa___prototype172_MemoryLeakHelper__GUR)
    call TriggerAddCondition(st___prototype172[1],Condition(function sa___prototype172_MemoryLeakHelper__GUR))
    set st___prototype173[1]=CreateTrigger()
    call TriggerAddAction(st___prototype173[1],function sa___prototype173_MemoryLeakHelper__CUF)
    call TriggerAddCondition(st___prototype173[1],Condition(function sa___prototype173_MemoryLeakHelper__CUF))
    set st___prototype174[1]=CreateTrigger()
    call TriggerAddAction(st___prototype174[1],function sa___prototype174_MemoryLeakHelper__FG)
    call TriggerAddCondition(st___prototype174[1],Condition(function sa___prototype174_MemoryLeakHelper__FG))
    set st___prototype175[1]=CreateTrigger()
    call TriggerAddAction(st___prototype175[1],function sa___prototype175_MemoryLeakHelper__ASETU)
    call TriggerAddCondition(st___prototype175[1],Condition(function sa___prototype175_MemoryLeakHelper__ASETU))
    set st___prototype176[1]=CreateTrigger()
    call TriggerAddAction(st___prototype176[1],function sa___prototype176_MemoryLeakHelper__ASE)
    call TriggerAddCondition(st___prototype176[1],Condition(function sa___prototype176_MemoryLeakHelper__ASE))




endfunction

