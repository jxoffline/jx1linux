--Trao gi¶i vËt phÈm tuyÖt ®Ønh bang 2
Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")

if not tbGetAwardItemTDB then
	tbGetAwardItemTDB = {}
end

tbGetAwardItemTDB.nStartDate = 201601070000
tbGetAwardItemTDB.nEndDate = 201601152400

EVENT_LOG_TITLE = "LOGEVENT_NHAN_ITEM_TDB_2"

TYPE_MATNA = 1
TYPE_ANBANG = 2
TYPE_BONTIEU = 3
TYPE_PHIVAN = 4
TYPE_TLH = 5
TYPE_QUAHK = 6

tbBITTSK_LIMIT_GET_AWARD_TDB2 = {
	[1] =  {nTaskID = 2729,nStartBit = 0,nBitCount = 1,nMaxValue = 1},
	[2] =  {nTaskID = 2729,nStartBit = 1,nBitCount = 1,nMaxValue = 1},
	[3] =  {nTaskID = 2729,nStartBit = 2,nBitCount = 1,nMaxValue = 1},
	[4] =  {nTaskID = 2729,nStartBit = 3,nBitCount = 1,nMaxValue = 1},
	[5] =  {nTaskID = 2729,nStartBit = 4,nBitCount = 4,nMaxValue = 9}, --nhan TLH
	[6] =  {nTaskID = 2729,nStartBit = 8,nBitCount = 4,nMaxValue = 9}, --nhan QHK
}

EXT_POINT_AWARD_TDB_2 =  {nID = 3, nBit = 11, nVer = 1} --Nh©n vËt nµo ®­îc bËt bit míi nhËn ®­îc title, nhËn xong t¾t bit

tbAwardItemTDB2 = {
	["tyanh71717171"]={
		[1] = 4,
		[2] = 4,
		[3] = 4,
		[4] = 4,
		[5] = 90,
		[6] = 90,
	},
	["hieubeonlyb99"]={
		[1] = 3,
		[2] = 2,
		[3] = 3,
		[4] = 3,
		[5] = 80,
		[6] = 80,
	},
	["kevinokok"]={
		[1] = 2,
		[2] = 2,
		[3] = 2,
		[4] = 2,
		[5] = 70,
		[6] = 70,
	},
	["xitrum11o2b"]={
		[1] = 1,
		[2] = 2,
		[3] = 1,
		[4] = 2,
		[5] = 60,
		[6] = 60,
	},
	["zill_eternity"]={		
		[2] = 2,		
		[4] = 2,
		[5] = 50,
		[6] = 50,
	},
	["pbthanhvd1"]={
		[2] = 2,		
		[4] = 2,
		[5] = 50,
		[6] = 50,
	},
	["a35714"]={
		[2] = 2,		
		[4] = 2,
		[5] = 40,
		[6] = 40,
	},
	["drgame07425"]={
		[2] = 2,		
		[4] = 2,
		[5] = 40,
		[6] = 40,
	},
	["connhangheo100491"]={
		[2] = 1,		
		[4] = 2,
		[5] = 30,
		[6] = 30,
	},
	["loiin1125"]={
		[2] = 1,		
		[4] = 2,
		[5] = 30,
		[6] = 30,
	},
	["theboychanh0101"]={
		[2] = 1,		
		[4] = 1,
		[5] = 20,
		[6] = 20,
	},
	["laotientu94"] = {
		[2] = 1,		
		[4] = 1,
		[5] = 20,
		[6] = 20,
	},
}

tbPackAward = {
	[1] = {szName="MÆt n¹ V­¬ng Gi¶ ",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=20160801}, 	
	[2] = {
		{szName="[Hoµn Mü] Cùc PhÈm An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,424},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] Cùc PhÈm An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,425},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] Cùc PhÈm An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,426},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] Cùc PhÈm An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,427},nCount=1,nQuality = 1,},
	},
	[3] = {szName="Ngùa B«n tiªu",tbProp={0,10,6,1,0,0},nCount=1,},
	[4] = {szName = "Phi V©n ThÇn M·", tbProp = {0,10,8,1,0,0}, nCount = 1},
	[5] = {szName="ThiÕt la h¸n lÔ bao",tbProp={6,1,1665,1,0,0},nCount=1,nExpiredTime=20160501},
	[6] = {szName="Qu¶ ®¹i hoµng kim",tbProp={6,1,4630,1,0,0},nCount=1,nExpiredTime=20160501},
}