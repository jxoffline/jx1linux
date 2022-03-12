EVENT_LOG_TITLE		= "LOGEVENT_CTC_Event_MungSN"

DATE_END = 20150606
ITEM_DUONG		= {szName="§­êng", tbProp={6,1,30260,1,0,0}, nExpiredTime=DATE_END}
ITEM_TRUNG		= {szName="Trøng", tbProp={6,1,30261,1,0,0}, nExpiredTime=DATE_END}
ITEM_BOT		= {szName="Bét", tbProp={6,1,30262,1,0,0}, nExpiredTime=DATE_END}
ITEM_SUA		= {szName="S÷a", tbProp={6,1,30263,1,0,0}, nExpiredTime=DATE_END}

ITEM_BANH_SN		= {szName="B¸nh Sinh NhËt", tbProp={6,1,30264,1,0,0},nBindState=-2, nExpiredTime=DATE_END}
ITEM_QUA_MUNG_SN		= {szName="Quµ Mõng Sinh NhËt", tbProp={6,1,30265,1,0,0},nBindState=-2, nExpiredTime=DATE_END}
ITEM_TUI_NGUYEN_LIEU		= {szName="Tói Nguyªn LiÖu", tbProp={6,1,30266,1,0,0}, nExpiredTime=DATE_END}

--gioi han
MOC_100 = 100
MOC_800 = 800
MAX_USE_1000 = 1000
-- Task Limit
tbBITTSK_LIMIT_USE_BANH_SN = {nTaskID = 2693,nStartBit = 1,nBitCount = 12,nMaxValue = MAX_USE_1000} -- Giíi h¹n dïng 1000 Banh SN
tbBITTSK_LIMIT_USE_TUI_SN = {nTaskID = 2693,nStartBit = 13,nBitCount = 12,nMaxValue = MAX_USE_1000} -- Giíi h¹n dïng 1000 Tui Qua SN

--Task nhan thuong moc
tbBITTSK_NhanMoc_100 = {nTaskID = 2693,nStartBit = 29,nBitCount = 1,nMaxValue = 1}
tbBITTSK_NhanMoc_800 = {nTaskID = 2693,nStartBit = 30,nBitCount = 1,nMaxValue = 1}

