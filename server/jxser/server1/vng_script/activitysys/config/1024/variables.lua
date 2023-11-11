EVENT_LOG_TITLE = "LOGTINHANG_CTC_LB_HUYNH_DE"

ITEM_HDTP_LB 		= {szName="LÖnh Bµi Huynh §Ö T­¬ng Phïng", tbProp={6,1,30592,1,0,0},nBindState=-2}
ITEM_HOANTHANH_TK_LB	= {szName="Tèng Kim Hoµn Thµnh LÖnh", tbProp={6,1,30577,1,0,0},nBindState=-2}
ITEM_HOANTHANH_KILL_NPC_LB		= {szName="§¸nh Qu¸i Hoµn Thµnh LÖnh", tbProp={6,1,30578,1,0,0},nBindState=-2}

ITEM_BK90_THAP_DAI_PHAI		= {szName="BÝ KÝp ThËp §¹i Ph¸i 90", tbProp={6,1,30576,1,0,0},nBindState=-2}

NUM_ADD_KILL = 500
ID_NV_TK = 6
TASK_DAILY_RESET = 2785 --Reset toµn côc nhËn th­ëng vµ sö dông item theo ngµy
TSK_DAILY_LIMIT = 2786
TSK_DAILY_LIMIT_TK = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 1,nBitCount = 4,nMaxValue = 4} --Giíi h¹n sö dông Tèng Kim Hoµn Thµnh LÖnh
TSK_DAILY_LIMIT_KILL_NPC = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 5,nBitCount = 4,nMaxValue = 4} --Giíi h¹n sö dông §¸nh Qu¸i Hoµn Thµnh LÖnh

TSK_NHAN_LB_HDTP = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --§¸nh dÊu nhËn th­ëng HDLB

EXT_POINT_ID_LBHD =  {nID = 3, nBit = 15, nVer = 1} --KÝch ho¹t m· code t¹i web


