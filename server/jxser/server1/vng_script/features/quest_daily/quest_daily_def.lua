Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")

tbQuestDaily = tbQuestDaily or {};
tbQuestDaily.EVENT_LOG_TITLE = "LOG_FEATURE_CTC_DATAU"

tbQuestDaily.szPathFile = "\\vng_settings\\features\\quest_daily\\listquestdaily.txt"

tbQuestDaily.NOT_RECIEVED_Q = 0		 --0: Ch≠a nhÀn nhi÷m vÙ
tbQuestDaily.RECIEVED_Q = 1				 --1: Æ∑ nhÀn nhi÷m vÙ
tbQuestDaily.NOT_RECV_AWARD = 2	 --2: Æ∑ hoµn thµnh nhi÷m vÙ nh≠ng ch≠a nhÀn th≠Îng 
tbQuestDaily.RECIEVED_AWARD = 3	 --3: Æ∑ nhÀn th≠Îng nhi÷m vÙ 

tbQuestDaily.MINLEVEL	 = 100
tbQuestDaily.MAXLEVEL	 = 200
tbQuestDaily.MAXCOUNT = 20
tbQuestDaily.MOREQUEST = 10
--Type quest ID
tbQuestDaily.TOTAL_ID_QUEST = 55
tbQuestDaily.TB_TYPE_ID_KILL_NPC = {1,18}
tbQuestDaily.TB_TYPE_FIND_ITEM = {19,55}


--Task 2777
tbQuestDaily.TASK_INFO_QUEST = {nTaskID = 2777,nStartBit = 0,nBitCount = 2,nMaxValue = 3}
tbQuestDaily.TASK_CUR_ID_QUEST = {nTaskID = 2777,nStartBit = 2,nBitCount = 6,nMaxValue = 55}
tbQuestDaily.TASK_COUNT_DAILY_QUEST = {nTaskID = 2777,nStartBit = 8,nBitCount = 6,nMaxValue = 40}
tbQuestDaily.TASK_MORE_QUEST = {nTaskID = 2777,nStartBit = 14,nBitCount = 2,nMaxValue = 2} -- su dung 2 item/ngay 
tbQuestDaily.TASK_ID_TOTAL_QUEST = {nTaskID = 2777,nStartBit = 16,nBitCount = 13,nMaxValue = 5000}
--Task 2775
--bit 0-10
tbQuestDaily.TASK_ID_MAP_KILL_NPC = {nTaskID = 2775,nStartBit = 0,nBitCount = 10,nMaxValue = 300}
--bit10-14
tbQuestDaily.TASK_ID_GET_AWARD_POINT = {nTaskID = 2775,nStartBit = 10,nBitCount = 4,nMaxValue = 11}



tbQuestDaily.TB_GET_POINT = {100,500,1000,1500,2000,2500,3000,3500,4000,4500,5000}

--phan thuong ngau nhien khi hoan thanh nhiem vu
tbQuestDaily.tbAwardQuest_Item = {
	{szName="Ti™n Th∂o LÈ ",tbProp={6,1,71,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="Thi’t La H∏n",tbProp={6,1,23,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="Ti™n Th∂o LÈ Æ∆c bi÷t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.5,nExpiredTime=10080},
	{szName="Thi™n C¨ L÷nh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=1,nExpiredTime=10080,},
	{szName="Dao Quang L÷nh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=2,nExpiredTime=10080,},
	{szName="Lam ThÒy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=1,},
	{szName="Tˆ ThÒy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=1,},
	{szName="LÙc ThÒy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=1,},
	{szName="Tinh HÂng B∂o Thπch",tbProp={4,353,1,1,0,0},nCount=1,nRate=0.2,},
	{szName="Ng‰c LÙc B∂o",tbProp={6,1,30566,1,0,0},nCount=1,nRate=0.5,},
	{szName="Ng‰c LÙc B∂o",tbProp={6,1,30566,1,0,0},nCount=2,nRate=0.3,},
	{szName="Ng‰c LÙc B∂o",tbProp={6,1,30566,1,0,0},nCount=4,nRate=0.2,},
	{szName="Ng‰c LÙc B∂o",tbProp={6,1,30566,1,0,0},nCount=6,nRate=0.1,},
	{szName = "ßi”m Kinh Nghi÷m", nExp=10000,nRate=32},
	{szName = "ßi”m Kinh Nghi÷m", nExp=20000,nRate=27},
	{szName = "ßi”m Kinh Nghi÷m", nExp=50000,nRate=20},
	{szName = "ßi”m Kinh Nghi÷m", nExp=100000,nRate=6},
	{szName = "ßi”m Kinh Nghi÷m", nExp=150000,nRate=5.2},
}
--phan thuong moc
local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("ThÀt Æ∏ng ng≠Ïng mÈ! Æπi hi÷p <color=pink>%s<color> Æ∑ hoµn thµnh 5000 nhi÷m vÙ Giang HÂ, nhÀn Æ≠Óc  <color=red>%s<color>.", GetName(), GetItemName(nItemIndex)))
end

tbQuestDaily.tbAwardQuestLimitPoint = {
	[1] = {szName = "ßi”m Kinh Nghi÷m", nExp=100000000,},
	[2] = {szName = "ßi”m Kinh Nghi÷m", nExp=200000000,},
	[3] = {szName = "ßi”m Kinh Nghi÷m", nExp=300000000,},
	[4] = {szName = "ßi”m Kinh Nghi÷m", nExp=500000000,},
	[5] = {szName = "ßi”m Kinh Nghi÷m", nExp=600000000,},
	[6] = {szName = "Phi V©n Th«n M∑", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=30*24*60},
	[7] = {szName = "ßi”m Kinh Nghi÷m", nExp=800000000,},
	[8] = {szName = "ßi”m Kinh Nghi÷m", nExp=1000e6,},	
	[9] = {szName="Phi V©n Th«n M∑",tbProp={0,10,8,1,0,0},nCount=1,}, 							
	[10] = {szName = "ßi”m Kinh Nghi÷m", nExp=2000e6,},
	[11] = {
				{szName="Hoµng Kim Trang Bﬁ B∂o R≠¨ng", tbProp={6,1,4557,1,0,0},nCount=1,CallBack=pAnnounce},				
			},
}