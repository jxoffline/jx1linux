nITEM_EXPIRED_TIME = 20130501
EVENT_LOG_TITLE = "EventThang4_2013"
MIN_LEVEL = 150
MAX_ITEM_1_DAILY = 50

ITEM_1 = {szName="Hµnh Qu©n LÖnh", tbProp={6,1,30395,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME, nBindState = -2}
ITEM_2 = {szName="Huy HiÖu 1 Sao", tbProp={6,1,30396,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_3 = {szName="Huy HiÖu 2 Sao", tbProp={6,1,30397,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_4 = {szName="Huy HiÖu 3 Sao", tbProp={6,1,30398,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_5 = {szName="Hép Huy HiÖu", tbProp={6,1,30399,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_6 = {szName="Huy HiÖu 4 Sao", tbProp={6,1,30400,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_7 = {szName="Huy HiÖu Sao Vµng", tbProp={6,1,30401,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_8 = {szName="Huy HiÖu Sao §á", tbProp={6,1,30402,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_9 = {szName="Huy HiÖu §¹i So¸i", tbProp={6,1,30403,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_10 = {szName="Huy HiÖu ChiÕn C«ng", tbProp={6,1,30404,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_11 = {szName="Tói ChiÕn Th¾ng", tbProp={6,1,30405,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_12 = {szName="Hép Quµ Vui VÎ", tbProp={6,1,30348,1,0,0}, nExpiredTime= 86400}
MONEY = {szName="Ng©n l­îng",nJxb=1}

TSK_DAILY_1 = 2985 --Giíi h¹n nhËn Hµnh Qu©n LÖnh
TSK_DAILY_2 = 2989 --Giíi h¹n nép Hµnh Qu©n LÖnh
TSK_USE_AWARD1	= {nTaskID = 2986,nStartBit = 1,nBitCount = 12,nMaxValue = 2000} --sö dông Huy HiÖu 4 sao
TSK_USE_AWARD2	= {nTaskID = 2986,nStartBit = 13,nBitCount = 11,nMaxValue = 1000} --sö dông Huy HiÖu sao vµng
TSK_USE_AWARD3 = {nTaskID = 2987,nStartBit = 1,nBitCount = 12,nMaxValue = 2000} --sö dông Huy HiÖu sao ®á
TSK_USE_AWARD4	= {nTaskID = 2987,nStartBit = 13,nBitCount = 15,nMaxValue = 25000} --sö dông Huy HiÖu ®¹i so¸i
TSK_USE_AWARD5	= {nTaskID = 2988,nStartBit = 1,nBitCount = 14,nMaxValue = 15000} --sè lÇn sö dông Huy HiÖu ®¹i so¸i
TSK_USE_AWARD6	= {nTaskID = 2986,nStartBit = 24,nBitCount = 1,nMaxValue = 1} --giíi h¹n sö dông hép quµ vui vÎ
TSK_USE_AWARD7	= {nTaskID = 2986,nStartBit = 25,nBitCount = 1,nMaxValue = 1} --giíi h¹n nhËn hµo quang
TSK_USE_AWARD8	= {nTaskID = 2986,nStartBit = 26,nBitCount = 1,nMaxValue = 1} --giíi h¹n nhËn top 10
TSK_USE_AWARD9	= {nTaskID = 2986,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --giíi h¹n nhËn top 10 ngµy ®Çu
TSK_USE_AWARD10	= {nTaskID = 2986,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --phÇn th­ëng sö dông huy hÞªu ®¹i so¸i 3000 lÇn
TSK_GIVE_ITEM_COUNT = 2990

EXP_AWARD_1 = 1e6 -- Nép hµnh qu©n lÖnh

COMPOSE_AWARD_1 = {
	{szName="Huy HiÖu Sao Vµng",tbProp={6,1,30401,1,0,0},nCount=1,nRate=60, nExpiredTime=nITEM_EXPIRED_TIME},
	{szName="Huy HiÖu Sao §á",tbProp={6,1,30402,1,0,0},nCount=1,nRate=40, nExpiredTime=nITEM_EXPIRED_TIME},
}