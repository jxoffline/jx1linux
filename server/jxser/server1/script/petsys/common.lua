PET_PROTOCOL = "emSCRIPT_PROTOCOL_PET"
PET_OPERATION_DELETE = 1
PET_OPERATION_SUMMON = 2
PET_OPERATION_UNSUMMON = 3
PET_OPERATION_LEVEL_UP = 4
PET_OPERATION_CHANGE_NAME = 5
PET_OPERATION_CHANGE_FEATURE = 6
PET_OPERATION_TAME = 7

INDEX_STR = 1
INDEX_DEX = 2
INDEX_VIT = 3
INDEX_ENG = 4
INDEX_HP = 5
INDEX_MP = 6
ATTRIB_COUNT = 6
SKILL_COUNT = 4

SONGJIN = 1
CHANGE_OF_TIME = 2
YAN_DI = 3
TIAN_LU_TREE = 4
XIN_SHI_TASK = 5
HUO_YUE_DU = 6
YE_SOU = 7
JIAN_ZHONG_MI_GONG = 8

EVENT_LIST = {
	[SONGJIN]					= {nBit=1, szName="Tèng Kim", szCondition="Tèng Kim ®¹t ®Õn 3000 ®iÓm tÝch lòy "},
	[CHANGE_OF_TIME]	= {nBit=2, szName="V­ît ¶i", szCondition="V­ît qua ¶i thø 10"},
	[YAN_DI]					= {nBit=3, szName="Viªm ®Õ", szCondition="V­ît qua ¶i thø 6"},
	[TIAN_LU_TREE]		= {nBit=4, szName="Trång c©y", szCondition="Sö dông 5 h¹t gièng c©y Thiªn Léc ®Ó trång c©y"},
	[XIN_SHI_TASK]		= {nBit=5, szName="TÝn Sø", szCondition="Hoµn thµnh 1 nhiÖm vô TÝn Sø"},
	[HUO_YUE_DU]			= {nBit=6, szName="§é n¨ng ®éng", szCondition="§é n¨ng ®éng ®¹t ®Õn 40 ®iÓm"},
	[YE_SOU]					= {nBit=7, szName="D· TÈu", szCondition="Hoµn thµnh 10 nhiÖm vô D· TÈu (kh«ng cÇn liªn tôc)"},
	[JIAN_ZHONG_MI_GONG] = {nBit=8, szName="KiÕm Gia Mª Cung.", szCondition="V­ît qua ¶i thø 2"},
}

TSK_EVENT_FINISHED = 3007
TSK_EVENT_DATE = 3008
TSK_COUNT_TRANSFER_EXP = 1

TSK_APPLE_DAILY = 3001
TSK_MAIZE_DAILY = 3009
TSK_SUGARCANE_DAILY = 3010
TSK_SWEET_POTATO_DAILY = 3002

MAX_FRUIT_COUNT_DAILY = 4

CHANGE_FEATURE_COIN = 5
CHANGE_NAME_COIN = 5
MAX_LEVEL = 20
PET_LEVEL_STEP = 10
MIN_LEVEL = 150

function IsEventFinished(nEventIndex)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	local tbEventData = EVENT_LIST[nEventIndex]
	if not tbEventData then
		return 0
	end
	
	local nToday
	if MODEL_GAMECLIENT == 1 then
		nToday = tonumber(GetServerDate("%Y%m%d"))
	else
		nToday = tonumber(GetLocalDate("%Y%m%d"))
	end
	
	local nRecordDate = GetTask(TSK_EVENT_DATE)
	if nToday ~= nRecordDate then
		SetTask(TSK_EVENT_DATE, nToday)
		SetTask(TSK_EVENT_FINISHED, 0)
	end
	
	local nFinish = GetTask(TSK_EVENT_FINISHED)
	return GetBit(nFinish, tbEventData.nBit)
end

function FinishEvent(nEventIndex)
	local tbEventData = EVENT_LIST[nEventIndex]
	if not tbEventData then
		return 0
	end

	local nToday
	if MODEL_GAMECLIENT == 1 then
		nToday = tonumber(GetServerDate("%Y%m%d"))
	else
		nToday = tonumber(GetLocalDate("%Y%m%d"))
	end
	
	local nRecordDate = GetTask(TSK_EVENT_DATE)
	if nToday ~= nRecordDate then
		SetTask(TSK_EVENT_DATE, nToday)
		SetTask(TSK_EVENT_FINISHED, 0)
	end
	
	local nFinish = GetTask(TSK_EVENT_FINISHED)
	nFinish = SetBit(nFinish, tbEventData.nBit, 1)
	SetTask(TSK_EVENT_FINISHED, nFinish)
end

