EVENT_LOG_TITLE		= "EVENT_Cuoi_T5"
ITEM_EXPIRED_TIME = 20130608
--Nguyªn liÖu dïng ®Ó ghÐp vËt phÈm
ITEM_MATERIAL_1 = {szName="Ch×a Khãa §ång", tbProp={6,1,30389,1}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_MATERIAL_2 = {szName="Ch×a Khãa B¹c", tbProp={6,1,30390,1}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_MATERIAL_3 = {szName="Ch×a Khãa Ngò S¾c", tbProp={6,1,30391,1}, nExpiredTime=ITEM_EXPIRED_TIME}

--PhÇn th­ëng ghÐp
ITEM_AWARD_1		= {szName="R­¬ng Ngò S¾c", tbProp={6,1,30392,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_AWARD_2		= {szName="R­¬ng §ång", tbProp={6,1,30393,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_AWARD_3		= {szName="R­¬ng B¹c", tbProp={6,1,30394,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}

--Sö dông r­¬ng ngò s¾c nhËn hé m¹ch ®¬n
ITEM_AWARD_4       = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=3}
 
 
TSK_LIMIT_USE_BRONZE_CHEST = 1500   --r­¬ng ®ång
TSK_LIMIT_USE_SILVER_CHEST = 2000 --r­¬ng b¹c
LIMIT_USE_BOX_SHINING = 2000 --r­¬ng ngò s¾c
FLIPCARD_MAX_DAILY = 200

TSK_USE_AWARD1		= {nTaskID = 2983,nStartBit = 1,nBitCount = 12,nMaxValue = 1500} --sö dông Item r­¬ng ®ång
TSK_USE_AWARD2		= {nTaskID = 2983,nStartBit = 13,nBitCount = 12,nMaxValue = 2000}	--Sö dông r­¬ng b¹c
TSK_USE_AWARD3		= {nTaskID = 2984,nStartBit = 1,nBitCount = 12,nMaxValue = 2000}	--Sö dông r­¬ng ngò s¾c
TSK_RESET_OLD_TASK = {nTaskID = 2984,nStartBit = 13,nBitCount = 1,nMaxValue = 1}
TSK_FLIPCARD_DAILY_LIMIT = 2981

MONEY		= {szName="Ng©n l­îng",nJxb=1}

EXP_AWARD_1		= {szName = "1000000 ®iÓm kinh nghiÖm", nExp=1e6}
EXP_AWARD_2		= {szName = "6000000 ®iÓm kinh nghiÖm", nExp=6e6}
tbExpRate = {
		{szName = "5000000 ®iÓm kinh nghiÖm", nExp=1e6,nRate=50},
		{szName = "6000000 ®iÓm kinh nghiÖm", nExp=2e6,nRate=30},
		{szName = "7000000 ®iÓm kinh nghiÖm", nExp=3e6,nRate=20},
}

FLIPCARD_CASH_REQUIRE = 20000
FLIPCARD_FREE_BAG_REQUIRE = 1
FLIPCARD_EXP_AWARD = 100000