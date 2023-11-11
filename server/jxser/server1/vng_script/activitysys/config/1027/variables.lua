EVENT_LOG_TITLE = "LOGEVENT_CTC_Event_NOEL"

DATE_END = 20160101

ITEM_HOPQUA_GS	= {szName="HÈp quµ gi∏ng sinh", tbProp={6,1,30370,1,0,0},nExpiredTime=DATE_END}
ITEM_HOATUYET	= {szName="Hoa tuy’t", tbProp={6,1,30371,1,0,0},nExpiredTime=DATE_END}
ITEM_CANHTHONG	= {szName="Cµnh th´ng", tbProp={6,1,30372,1,0,0},nExpiredTime=DATE_END}

ITEM_CHUONG_GS	= {szName="Chu´ng gi∏ng sinh", tbProp={6,1,30373,1,0,0},nExpiredTime=DATE_END}
ITEM_SAO_GS	= {szName="Sao gi∏ng sinh", tbProp={6,1,30374,1,0,0},nExpiredTime=DATE_END}
ITEM_THIEP_GS	= {szName="Thi÷p gi∏ng sinh", tbProp={6,1,30375,1,0,0},nExpiredTime=DATE_END}

ITEM_NGUOITUYET_VANG	= {szName="Ng≠Íi Tuy’t Vµng", tbProp={6,1,30376,1,0,0},nExpiredTime=DATE_END}
ITEM_NGUOITUYET_DO	= {szName="Ng≠Íi Tuy’t ß·", tbProp={6,1,30377,1,0,0},nExpiredTime=DATE_END}
ITEM_NGUOI_TUYET	= {szName="Ng≠Íi Tuy’t", tbProp={6,1,30378,1,0,0},nExpiredTime=DATE_END}

ID_THIENSU_GS = 1135
ID_THONG_THANBI = 1322
ID_THONG_TT = 1329
ID_THONG_HK = 1234

TB_TREE_NAME = {
	[1329] = {szName="Ng≠Íi Tuy’t Vµng"},
	[1234] = {szName="Ng≠Íi Tuy’t ß·"},
	[1322] = {szName="C©y Th´ng Th«n B›"},
}
TIMER_TREE = 5*60*18

MONEY = {szName="Ng©n l≠Óng",nJxb=1}

MONEY_1Van = 10000 --1 Van luong
MONEY_2Van = 20000 --2 Van luong

--Moc su dung
MOC_200 = 200
MOC_500   = 500
MOC_1000 = 1000
MOC_2000 = 2000

--Task 2725
tbBITTSK_LIMIT_USE_NguoiTuyetVang = {nTaskID = 2725,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_2000} -- su dung 2000
tbBITTSK_LIMIT_USE_NguoiTuyetDo = {nTaskID = 2725,nStartBit = 12,nBitCount = 10,nMaxValue = MOC_1000} --Su dung 1000

tbBITTSK_RECV_TOP_5 = {nTaskID = 2725,nStartBit = 26,nBitCount = 1,nMaxValue = 1} --Nhan Thuogn Top 5

tbBITTSK_RECV_MOC_1000_NguoiTuyetVang= {nTaskID = 2725,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000
tbBITTSK_RECV_MOC_2000_NguoiTuyetVang = {nTaskID = 2725,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --Nhan Moc 2000

tbBITTSK_RECV_MOC_500_NguoiTuyetDo = {nTaskID = 2725,nStartBit = 29,nBitCount = 1,nMaxValue = 1} --Nhan Moc 500 
tbBITTSK_RECV_MOC_1000_NguoiTuyetDo = {nTaskID = 2725,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000


tbBITTSK_LIMIT_USE_NguoiTuyet = {nTaskID = 2726,nStartBit = 6,nBitCount = 10,nMaxValue = MOC_200} --Su dung 1000



