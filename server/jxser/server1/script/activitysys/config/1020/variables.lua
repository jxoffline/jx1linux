EVENT_LOG_TITLE		= "EVENT_T6_2013"
DATE_END		= 20130701
--Nguyªn liÖu dïng ®Ó ghÐp vËt phÈm
ITEM_MATERIAL_1 = {szName = "Bét M×", tbProp = {6,1,30204,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_2 =  {szName = "S÷a", tbProp = {6,1,30206,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_3 = {szName = "B¬", tbProp = {6,1,30205,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_4 = {szName = "§­êng", tbProp = {6,1,30209,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_5 = {szName = "Chocolate", tbProp = {6,1,30207,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_6 = {szName = "Tr¸i c©y", tbProp = {6,1,30208,1,0,0},nExpiredTime=DATE_END}

--Tien van
MONEY		= {szName="Ng©n l­îng",nJxb=1}

--PhÇn th­ëng ghÐp
ITEM_AWARD_1		= {szName = "B¸nh kem th­êng", tbProp = {6,1,30210,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_2		= {szName = "B¸nh kem Chocolate", tbProp = {6,1,30211,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_3		= {szName = "B¸nh kem tr¸i c©y", tbProp = {6,1,30212,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_4		=  {szName = "B¸nh sinh nhËt", tbProp = {6,1,30213,1,0,0},nExpiredTime=DATE_END}

-- Task giíi h¹n
tbBITTSK_GET_EXP = {nTaskID = 2998,nStartBit = 24,nBitCount = 1,nMaxValue = 1} -- Giíi h¹n NhËn ®iÓm EXP trong suèt event
tbBITTSK_LIMIT_USE_OFTEN_CAKE = {nTaskID = 2998,nStartBit = 1,nBitCount = 11,nMaxValue = 1000} -- Giíi h¹n dïng 1000 c¸i  b¸nh kem th­êng trong suèt event
tbBITTSK_LIMIT_USE_CHOCOLATE = {nTaskID = 2998,nStartBit = 12,nBitCount = 11,nMaxValue = 800} -- Giíi h¹n dïng 800 c¸i b¸nh kem chocolate trong suèt event
tbBITTSK_LIMIT_USE_FRUIT = {nTaskID = 2999,nStartBit = 1,nBitCount = 16,nMaxValue = 10000} -- Giíi h¹n exp dïng b¸nh kem tr¸i c©y trong suèt event
tbBITTSK_LIMIT_USE_FRUIT_COUNT = {nTaskID =3000,nStartBit = 1,nBitCount = 16,nMaxValue = 10000} -- §Õm sè lÇn  dïng b¸nh kem tr¸i c©y trong suèt event
tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE = {nTaskID = 2999,nStartBit = 17,nBitCount = 14,nMaxValue = 500} -- Giíi h¹n dïng b¸nh kem sinh nhËt ®Æc biÖt  trong suèt event

--§¹t mèc
tbTSK_INFO_1 = {nTaskID = 2998,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--Mèc 500 b¸nh kem tr¸i c©y
tbTSK_INFO_2 = {nTaskID = 2998,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--Mèc 1000 b¸nh kem tr¸i c©y
tbTSK_INFO_3 = {nTaskID = 2998,nStartBit = 27,nBitCount = 1,nMaxValue = 1}--Mèc 250 b¸nh kem ®Æc biÖt
tbTSK_INFO_4 = {nTaskID = 2998,nStartBit = 28,nBitCount = 1,nMaxValue = 1}--Mèc 500 b¸nh kem ®Æc biÖt

