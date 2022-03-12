Include("\\vng_script\\features\\quest_daily\\quest_daily_def.lua")

EVENT_LOG_TITLE = "LOG_FEATURE_CTC_DATAU"

ITEM_LB_NANGDONG								= {szName="LÖnh Bµi N¨ng §éng", tbProp={6,1,30558,1,0,0},}
ITEM_HOAN_THANH_NHIEM_VU				= {szName="Hoµn Thµnh NhiÖm Vô", tbProp={6,1,30559,1,0,0},}

MAX_USE_LB = 2

--bit task nµy khai b¸o bªn quest_daily_def:
--tbQuestDaily.TASK_MORE_QUEST = {nTaskID = 2777,nStartBit = 14,nBitCount = 2,nMaxValue = 2} -- su dung 2 item/ngay 
tbBITTSK_LIMIT_USE_LB_NANG_DONG = tbQuestDaily.TASK_MORE_QUEST -- su dung 2 item/ngay 

TASK_INFO_QUEST = tbQuestDaily.TASK_INFO_QUEST
