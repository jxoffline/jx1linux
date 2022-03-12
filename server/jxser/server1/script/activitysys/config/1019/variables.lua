EVENT_LOG_TITLE		= "TTBV_2013"
nStartDate = 20120520
nEndDate  = 20130618
DateStart = 10005                    --WW--HH--MM
DateEnd =  12300                    --WW--HH--MM
CHU_VO							= {szName="Vâ", tbProp={6,1,30422,1,0,0},nExpiredTime=nEndDate}
CHU_LAM						= {szName="L©m", tbProp={6,1,30423,1,0,0},nExpiredTime=nEndDate}
CHU_TRUYEN				= {szName="TruyÒn", tbProp={6,1,30424,1,0,0},nExpiredTime=nEndDate}
CHU_KY							= {szName="Kú", tbProp={6,1,30425,1,0,0},nExpiredTime=nEndDate}
CHU_HUNG						= {szName="Hïng", tbProp={6,1,30426,1,0,0},nExpiredTime=nEndDate}
CHU_BINH					= {szName="Binh", tbProp={6,1,30427,1,0,0},nExpiredTime=nEndDate}
CHU_LUU						= {szName="L­u", tbProp={6,1,30428,1,0,0},nExpiredTime=nEndDate}
CHU_DANH						= {szName="Danh", tbProp={6,1,30429,1,0,0},nExpiredTime=nEndDate}
MANH_VO						= {szName="M¶nh ch÷ Vâ", tbProp={6,1,30430,1,0,0},nExpiredTime=nEndDate}
MANH_LAM					= {szName="M¶nh ch÷ L©m", tbProp={6,1,30431,1,0,0},nExpiredTime=nEndDate}
MANH_TRUYEN				= {szName="M¶nh ch÷ TruyÒn", tbProp={6,1,30432,1,0,0},nExpiredTime=nEndDate}
MANH_KY						= {szName="M¶nh ch÷ Kú", tbProp={6,1,30433,1,0,0},nExpiredTime=nEndDate}
MANH_HUNG						= {szName="M¶nh ch÷ Hïng", tbProp={6,1,30434,1,0,0},nExpiredTime=nEndDate}
MANH_BINH					= {szName="M¶nh ch÷ Binh", tbProp={6,1,30435,1,0,0},nExpiredTime=nEndDate}
MANH_LUU					= {szName="M¶nh ch÷ L­u", tbProp={6,1,30436,1,0,0},nExpiredTime=nEndDate}
MANH_DANH					= {szName="M¶nh ch÷ Danh", tbProp={6,1,30437,1,0,0},nExpiredTime=nEndDate}

ITEM_RUONG_BAOVAT					= {szName="R­¬ng B¶o VËt", tbProp={6,1,30419,1,0,0},nExpiredTime=nEndDate}
ITEM_RUONG_TRUYENKY					= {szName="TruyÒn Kú LÔ Bao", tbProp={6,1,30420,1,0,0},nExpiredTime=10080}
ITEM_RUONG_HUNGBINH					= {szName="Hïng Binh LÔ Bao", tbProp={6,1,30421,1,0,0},nExpiredTime=10080}

--Ghi lai ng­êi ch¬i nép 1 trong 2 bé ch÷
TASK_HBLD								= {nTaskID = 2993,	nStartBit = 1, nBitCount = 1, nMaxValue = 1}
TASK_VLTK								= {nTaskID = 2993,	nStartBit = 2, nBitCount =1, nMaxValue = 1}
TASK_VLTK_HBLD					= {nTaskID = 2993,	nStartBit = 3, nBitCount = 1, nMaxValue = 1}
TASK_DH_HBLD					= {nTaskID = 2993,	nStartBit = 9, nBitCount = 1, nMaxValue = 1}
--Reset TuÇn
TASK_AWARD_TUAN				= 2994
TASK_AWARD_PREV					= 2997 --NhËn th­ëng b¶o r­¬ng tuÇn tr­íc

tbRank = {
	[1] = 2,
	[2] = 1,
	[3] = 1,
}
--Task l­u l¹i sè l­îng nép
TASK_BAORUONG					= 2995
--Task Reset tuÇn
TASK_RESET_BAORUONG		= 2996
--PhÇn th­ëng r­¬ng
tbAwardRuong = {
		{szName="M¶nh ch÷ Vâ", tbProp={6,1,30430,1,0,0},nCount=1,nRate=20,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ L©m", tbProp={6,1,30431,1,0,0},nCount=1,nRate=10,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ TruyÒn", tbProp={6,1,30432,1,0,0},nCount=1,nRate=15,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ Kú", tbProp={6,1,30433,1,0,0},nCount=1,nRate=5,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ Hïng", tbProp={6,1,30434,1,0,0},nCount=1,nRate=5,nExpiredTime=nEndDate},	
		{szName="M¶nh ch÷ Binh", tbProp={6,1,30435,1,0,0},nCount=1,nRate=15,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ L­u", tbProp={6,1,30436,1,0,0},nCount=1,nRate=10,nExpiredTime=nEndDate},
		{szName="M¶nh ch÷ Danh", tbProp={6,1,30437,1,0,0},nCount=1,nRate=20,nExpiredTime=nEndDate},
}