--main function
nSTART_DATE = 201306110000
nEND_DATE = 201406302400
nSTART_DATE_GET_ITEM = 201306110000
nEND_DATE_GET_ITEM = 201402282400
nEXT_POINT_ID = 5
nEXT_POINT_BIT_NEW_ACCOUNT = 1 --account míi n¹p code trªn web
nEXT_POINT_BIT_OLD_ACCOUNT = 2 --account cò n¹p code trªn web
nEXT_POINT_BIT_USER_ACTIVE_IN_GAME = 3 --gamer active trong game - Bit míi cho server XÝch Long C©u

strLOG_HEAD = "CuuNienHoiNgoLenhBai"

--Item event
tbBITTSK_TU_LUC_NGUNG_THAN_TAN_LIMIT_USE = {nTaskID = 3098,nStartBit = 1,nBitCount = 1,nMaxValue = 1}
tbBITTSK_TU_LUC_NGUNG_THAN_HOAN_LIMIT_USE = {nTaskID = 3098,nStartBit = 2,nBitCount = 1,nMaxValue = 1}
tbBITTSK_HUYEN_VU_KIM_CUONG_TAN_LIMIT_USE = {nTaskID = 3098,nStartBit = 3,nBitCount = 1,nMaxValue = 1}
tbBITTSK_THONG_THIEN_MINH_NGOC_HOAN_LIMIT_USE = {nTaskID = 3098,nStartBit = 4,nBitCount = 1,nMaxValue = 1}
tbBITTSK_CHAN_PHONG_THUY = {nTaskID = 3085,nStartBit = 1,nBitCount = 1,nMaxValue = 1}
tbBITTSK_CHAN_GIAC = {nTaskID = 3085,nStartBit = 2,nBitCount = 1,nMaxValue = 1}

--Bang héi tiÕp nhËn t©n thñ
tbTS_TONG_TASK_ITEM_COUNT = {nGroupID = 1, nTaskIDX = 1, nVersion = 2}
nTS_MIN_TONG_JOIN_TIME = 1440
nTS_TASK_DAILY_AWARD_COUNT = 3097
nTS_TASK_EXP_AWARD = 3096
nTS_MAX_EXP_AWARD = 8e9
tbBITTSK_DONATE_ITEM_LIMIT = {nTaskID = 3098,nStartBit = 8,nBitCount = 1,nMaxValue = 1}

--C¸ nh©n t©n thñ
tbBITTASK_YESOU_QUEST_COUNT = {nTaskID = 3088,nStartBit = 1,nBitCount = 6,nMaxValue = 40}
tbBITTASK_KILLER_BOSS_QUEST_COUNT = {nTaskID = 3088,nStartBit = 7,nBitCount = 6,nMaxValue = 40}
tbBITTASK_VLMC_QUEST_COUNT= {nTaskID = 3088,nStartBit = 13,nBitCount = 6,nMaxValue = 40}
tbBITTASK_TREE_QUEST_COUNT  = {nTaskID = 3088,nStartBit = 19,nBitCount = 9,nMaxValue = 500}
tbBITTASK_SONGJIN_QUEST_COUNT = {nTaskID = 3089,nStartBit = 1,nBitCount = 6,nMaxValue = 40}
tbBITTASK_COT_QUEST_COUNT = {nTaskID = 3089,nStartBit = 7,nBitCount = 6,nMaxValue = 40}
tbBITTASK_FLD_QUEST_COUNT = {nTaskID = 3089,nStartBit = 13,nBitCount = 6,nMaxValue = 40}
tbBITTASK_YDBZ_QUEST_COUNT = {nTaskID = 3089,nStartBit = 19,nBitCount = 6,nMaxValue = 40}

tbBITTASK_AWARD_0_1 = {nTaskID = 3098,nStartBit = 9,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_0_2 = {nTaskID = 3098,nStartBit = 10,nBitCount = 1,nMaxValue = 1}
tbBITTASK_AWARD_1_1 = {nTaskID = 3098,nStartBit = 11,nBitCount = 1,nMaxValue = 1}
tbBITTASK_AWARD_2_1 = {nTaskID = 3098,nStartBit = 12,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_3_1 = {nTaskID = 3098,nStartBit = 13,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_3_2 = {nTaskID = 3098,nStartBit = 14,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_3_3 = {nTaskID = 3098,nStartBit = 15,nBitCount = 1,nMaxValue = 1}
tbBITTASK_AWARD_4_1 = {nTaskID = 3098,nStartBit = 16,nBitCount = 1,nMaxValue = 1}
tbBITTASK_AWARD_4_2 = {nTaskID = 3098,nStartBit = 17,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_4_3 = {nTaskID = 3098,nStartBit = 18,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_4_4 = {nTaskID = 3098,nStartBit = 19,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_AWARD_4_5 = {nTaskID = 3098,nStartBit = 20,nBitCount = 1,nMaxValue = 1}

tbBITTASK_QUEST_ON_PROCCESS = {nTaskID = 3085,nStartBit = 4,nBitCount = 8,nMaxValue = 74}

--tbBITTASK_RESET_TASK_NOT_IN_USE = {nTaskID = 3098,nStartBit = 5,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_RESET_TASK_NOT_IN_USE2 = {nTaskID = 3098,nStartBit = 6,nBitCount = 1,nMaxValue = 1}
--tbBITTASK_RESET_TASK_NOT_IN_USE3 = {nTaskID = 3098,nStartBit = 7,nBitCount = 1,nMaxValue = 1}
tbBITTASK_RESET_TASK_NOT_IN_USE = {nTaskID = 3089,nStartBit = 31,nBitCount = 1,nMaxValue = 1}

tbBITTASK_GET_EXT_ITEM_1_LIMIT = {nTaskID = 3085,nStartBit = 12,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_2_LIMIT = {nTaskID = 3085,nStartBit = 13,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_3_LIMIT = {nTaskID = 3085,nStartBit = 14,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_4_LIMIT = {nTaskID = 3085,nStartBit = 15,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_5_LIMIT = {nTaskID = 3085,nStartBit = 16,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_6_LIMIT = {nTaskID = 3085,nStartBit = 17,nBitCount = 1,nMaxValue = 1}
tbBITTASK_GET_EXT_ITEM_7_LIMIT = {nTaskID = 3085,nStartBit = 18,nBitCount = 1,nMaxValue = 1}

--Item hoµn thµnh nhiÖm vô, bit 1 - 17 l­u ngµy ®Ó tiÕn hµnh reset ngµy
tbBITTSK_AUTO_COMPLETE_QUEST_RECORD_DATE = {nTaskID = 3057,nStartBit = 1,nBitCount = 18,nMaxValue = 201231}
tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_1 = {nTaskID = 3057,nStartBit = 19,nBitCount = 3,nMaxValue = 2} -- V§
tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_2 = {nTaskID = 3057,nStartBit = 22,nBitCount = 3,nMaxValue = 2}--Thuû TÆc
tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_3 = {nTaskID = 3057,nStartBit = 25,nBitCount = 3,nMaxValue = 2}--V­ît ¶i
tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_4 = {nTaskID = 3057,nStartBit = 28,nBitCount = 3,nMaxValue = 2}--TK
