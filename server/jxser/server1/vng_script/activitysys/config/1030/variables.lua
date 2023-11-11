EVENT_LOG_TITLE = "LOGEVENT_EVENT_Cuoi_T3_2016"

DATE_END = 20160401
DATE_END_USE_ITEM = 201604312400

ITEM_BINH_RUOU		= {szName="B×nh R­îu", tbProp={6,1,30411,1,0,0},nExpiredTime=DATE_END}
ITEM_MEN_RUOU		= {szName="Men R­îu", tbProp={6,1,30412,1,0,0},nExpiredTime=DATE_END}
ITEM_BACHNIEN_TL		= {szName="B¸ch Niªn Tr©n Lé", tbProp={6,1,30413,1,0,0},nExpiredTime=DATE_END}
ITEM_THIENNIEN_TL		= {szName="Thiªn Niªn Tr©n Lé", tbProp={6,1,30414,1,0,0},nExpiredTime=DATE_END}
ITEM_VANNIEN_TL		= {szName="V¹n Niªn Tr©n Lé", tbProp={6,1,30415,1,0,0},nExpiredTime=DATE_END}
ITEM_HOP_VANNIEN_TL		= {szName="Hép V¹n Niªn Tr©n Lé", tbProp={6,1,30416,1,0,0},nExpiredTime=DATE_END}

ITEM_TIENDON		= {szName="Tiªn §¬n", tbProp={6,1,30409,1,0,0},nExpiredTime=DATE_END}

MONEY = {szName="Ng©n l­îng",nJxb=1}

MONEY_5Van = 50000 --5 Van luong

--Moc su dung
MOC_500   = 500
MOC_1000 = 1000
MOC_1500 = 1500
MOC_2000 = 2000
MOC_3000 = 3000

--Task 2737
tbBITTSK_LIMIT_USE_BACHNIEN_TL = {nTaskID = 2737,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_2000} -- su dung 2000 
tbBITTSK_LIMIT_USE_THIENNIEN_TL = {nTaskID = 2737,nStartBit = 12,nBitCount = 12,nMaxValue = MOC_1500} --Su dung 1500

tbBITTSK_RECV_MOC_1000_THIENNIEN_TL = {nTaskID = 2737,nStartBit = 25,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000
tbBITTSK_RECV_MOC_1500_THIENNIEN_TL = {nTaskID = 2737,nStartBit = 26,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1500

tbBITTSK_RECV_MOC_500_VANNIEN_TL = {nTaskID = 2737,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --Nhan Moc 500
tbBITTSK_RECV_MOC_1000_VANNIEN_TL = {nTaskID = 2737,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000 
tbBITTSK_RECV_MOC_2000_VANNIEN_TL = {nTaskID = 2737,nStartBit = 29,nBitCount = 1,nMaxValue = 1} --Nhan Moc 2000 
tbBITTSK_RECV_MOC_3000_VANNIEN_TL = {nTaskID = 2737,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --Nhan Moc 3000 

--Task 2738
tbBITTSK_LIMIT_USE_VANNIEN_TL = {nTaskID = 2738,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_3000} --Su dung 3000

tbBITTSK_LIMIT_USE_TIENDON = {nTaskID = 2738,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --Su dung 1 TienDon
