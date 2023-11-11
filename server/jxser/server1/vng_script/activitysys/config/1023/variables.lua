
EVENT_LOG_TITLE		= "LOGEVENT_CTC_Event_Thang5_2015"

DATE_END = 20150515

MSG_LIMITED_USE		= "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm"
MAX_1000 = 1000
MAX_2000 = 2000

--Nguyªn liÖu dïng ®Ó ghÐp vËt phÈm
ITEM_RUONGTHANBI		= {szName="R­¬ng ThÇn BÝ", tbProp={6,1,30257,1,0,0}, nExpiredTime=DATE_END}
ITEM_HC_HOANGKIM	= {szName="Hu©n Ch­¬ng Hoµng Kim", tbProp={6,1,30259,1,0,0}, nExpiredTime=DATE_END}
ITEM_CK_THANBI	= {szName="Ch×a Khãa ThÇn BÝ", tbProp={6,1,30258,1,0,0}, nExpiredTime=DATE_END}

tbBITTSK_LIMIT_USE_1000 = {nTaskID = 2692,nStartBit = 0,nBitCount = 10,nMaxValue = MAX_1000}
tbBITTSK_LIMIT_USE_2000 = {nTaskID = 2692,nStartBit = 11,nBitCount = 12,nMaxValue = MAX_2000}

--toa do xuat hien Tra
MapID_Ruong = 37
NpcID_Ruong = 1876
tbNpc_Monter = {
						{641,"B¹ch Ma Hé B¶o"},
						{641,"TÝch La Hé B¶o"},
						{641,"PhØ TÞch Hé B¶o"},
						{641,"§ång ¦u Hé B¶o"},
					}
tbNpc_Monter_Chat ={
	"L·ng v·ng ë ®©y lµm g×...",
	"Ng­¬i t×m kiÕm g× trong kho b¸u nµy µ?",
	"BiÕn khái ®©y mau.. kh«ng ®õng tr¸ch",
	"Ta kh«ng n­¬ng tay...",
}	
				

MAX_USE_6888 = 6888
MAX_USE_4888 = 4888
MAX_USE_688 = 688

--Task 2755
TASKID_1 = 2755
tbBITTSK_LIMIT_USE_TDLB = {nTaskID = TASKID_1,nStartBit = 0,nBitCount = 16,nMaxValue = MAX_USE_6888 }
tbBITTSK_LIMIT_USE_BNLB = {nTaskID = TASKID_1,nStartBit = 17,nBitCount = 13,nMaxValue = MAX_USE_4888 }
--Task 2756
TASKID_2 = 2756
tbBITTSK_LIMIT_USE_BKLB = {nTaskID = TASKID_2,nStartBit = 0,nBitCount = 12,nMaxValue = MAX_USE_688 }

tbBITTSK_688_BKLB 	= {nTaskID = TASKID_2,nStartBit = 30,nBitCount = 1,nMaxValue = 1 } -- Nhan thuong moc 688

NPC_BOX_INFO		= "\\vng_script\\activitysys\\config\\1023\\listnpc.txt"

