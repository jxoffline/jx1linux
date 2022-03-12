Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("PET")
IncludeLib("SETTING");

tbHuynhdelenhbai = tbHuynhdelenhbai or {};
tbHuynhdelenhbai.szPathFile = "\\vng_script\\features\\huynhdelenhbai\\taskhuynhde.lua"
tbHuynhdelenhbai.MINLEVEL	 = 1
tbHuynhdelenhbai.MAXLEVEL	 = 200
tbHuynhdelenhbai.EVENT_LOG_TITLE = "LOG_LB_HUYNH_DE_TUONG_PHUNG"
tbHuynhdelenhbai.TASK_INFOR_HD_LB = {nTaskID = 2787,nStartBit = 1,nBitCount = 6,nMaxValue = 60}
tbHuynhdelenhbai.TASK_ID_RESET_01 = 2787
tbHuynhdelenhbai.TASK_ID_RESET_02 = 2788

tbHuynhdelenhbai.EXT_POINT_ID_1 = {nID = 3, nBit = 15, nVer = 1} --KÝch ho¹t m· code t¹i web

tbHuynhdelenhbai.TASK_ID_MAP = {	
		[6] = {--EventID
			[168] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 10,nMaxValue = 1000}, --NPCID: 168
		},	
		[7] = {--EventID
			[15] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 10,nMaxValue = 1000}, 
		},	
		[8] = {
			[588] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},	
		[9] = {
			[150] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},		
		[10] = {
			[169] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[11] = {
			[557] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},	
		[12] = {
			[155] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[13] = {
			[706] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[14] = {
			[703] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[15] = {
			[704] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[16] = {
			[146] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[17] = {
			[148] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[18] = {
			[561] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[19] = {
			[559] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[20] = {
			[561] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[21] = {
			[559] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},				
		},
		[22] = {
			[537] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[23] = {
			[538] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[24] = {
			[595] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[25] = {
			[594] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[26] = {
			[596] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},		
		},
		[27] = {
			[599] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[28] = {
			[598] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[29] = {
			[601] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},		
		},
	}

--PhÇn tÝnh n¨ng
tbHuynhdelenhbai.TASK_INFOR_ABOUNT = {
	[1] = {
		[1] = {nRequires = 10}, -- Ng©n l­îng		
	},
	[2] = {
		[1] = {nLevelRequires = 10 }, --PhÝm t¾t F1
	},
	[3] = {
		[1] = {szName = "Kim S¸ng D­îc tiÓu", tbProp={1,0,0,0,0,0}, nRequires = 2 }, -- 2Kim s¸ng d­îc tiÓu
	},
	[4] = {
		[1] = {szName = "Thæ §Þa Phï", tbProp={5,0,0,0,0,0},nRequires = 1}, -- Thæ §Þa Phï
	},
	[5] = {	
		[1] = {nFactionRequires = 1}, --Gia NhËp M«n Ph¸i	
	},
	[12] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[13] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[14] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[15] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[16] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[17] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[18] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- Tèng kim
	},
	[19] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[20] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[21] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[22] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[23] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount =4,nMaxValue = 4}, -- Tèng kim
	},
	[24] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[25] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[26] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[27] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[28] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
	[29] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- Tèng kim
	},
}
tbHuynhdelenhbai.TASK_NAME_TASK = {
	[1] = "Ng©n L­îng",
	[2] = "PhÝm T¾t F1",
	[3] = "Kim S¸ng D­îc (tiÓu)",
	[4] = "Thæ §Þa Phï",
	[5] = "Gia NhËp M«n Ph¸i",
	[6] = "Tèng Kim",
}
tbHuynhdelenhbai.TASK_NAME_NPC = {
	-- map 24
	[6] = {--mapID
		[168] =  "Lam C©n",	--Npc ID
	},	
	[7] = {
		[15] =  "T«n Hïng",
	},
	[8] = {
		[588] =  "B«n L«i",	
	},
	[9] = {
		[150] =  "Thanh Mi",		
	},
	[10] = {
		[169] =  "KÕ Chïy",	
	},
	[11] = {
		[557] =  "Kªn §Êt",	
	},
	[12] = {
		[155] =  "H¾c C©n",		
	},
	[13] = {
		[706] =  "M¹c TÆc",
	},
	[14] = {
		[703] =  "Phi Sa",
	},
	[15] = {
		[704] =  "TÈu Th¹ch",
	},
	[16] = {
		[146] =  "§o¹t MÖnh Liªm",	
	},
	[17] = {
		[148] =  "B¸o §èm",	
	},
	[18] = {
		[561] =  "L­u V©n",		
	},
	[19] = {
		[559] =  "L­u Phong",		
	},
	[20] = {
		[561] =  "L­u V©n",
	},
	[21] = {
		[559] =  "L­u Phong",
	},
	[22] = {
		[537] =  "TËt ViÖm",
	},
	[23] = {
		[538] =  "TËt §iÖm",
	},
	[24] = {
		[595] =  "L¹c Quang",
	},
	[25] = {
		[594] =  "§ao Tr¶m",
	},
	[26] = {
		[596] =  "Hµn Th­¬ng",
	},
	[27] = {
		[599] =  "L·nh Cung",
	},
	[28] = {
		[598] =  "S­¬ng §ao",
	},
	[29] = {
		[601] =  "S¶n Vò",
	},
}

--Tr¶ vÒ th«ng tin cña nhiÖm vô theo ID
function tbHuynhdelenhbai:GetAwardInfo(nEventId)
	if(not nEventId or not self.tbAllAwards[nEventId]) then
		return
	end
	return self.tbAllAwards[nEventId]
end

--Tr¶ vÒ th«ng tin gammer cã thÓ nhËn, ®ang trong qu¸ tr×nh xö lý hoÆc lµ ®· hoµn thµnh ®­îc nhiÖm vô theo ID
--1: ®· nhËn nhiÖm vô
--2: ®· hoµn thµnh nhiÖm vô nh­ng ch­a nhËn th­ëng
--3: ®· nhËn th­ëng nhiÖm vô
--4: Ch­a nhËn nhiÖm vô
function tbHuynhdelenhbai:GetEventIdInfo(nID)
	for i=1, self.nMaxEventId do
		local tbAward = self:GetAwardInfo(i)
		if(self:IsShowDlg(i,tbAward[1].nTaskIDStart,tbAward[1].nBitStart) == nID) then
			return i
		end
	end
end

function tbHuynhdelenhbai:IsShowDlg(nEventId,nTaskID,nBit)
	local tbAward = self:GetAwardInfo(nEventId)
	if(not tbAward) then
		return 0
	end
	local nPlayerLevel = GetLevel()
--		print("----- IsShowDlg - nPlayerLevel :"..nPlayerLevel)
--		print("----- IsShowDlg - tbAward[1].nMaxLevel :"..tbAward[1].nMinLevel)
--		print("----- IsShowDlg - tbAward[1].nMinLeve :"..tbAward[1].nMaxLevel)
	if(nPlayerLevel < tbAward[1].nMinLevel or nPlayerLevel > tbAward[1].nMaxLevel) then
		return 0
	end
	local tbBitTSK = {nTaskID = nTaskID,nStartBit = nBit,nBitCount = 2,nMaxValue = 3}
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbBitTSK)
	if(nCurTskVal ~= 0) then
		return nCurTskVal
	end
	return 4
end
--Function kiÓm tra ng­êi ch¬i míi
--Cã thËp niªn lÖnh bµi & KÝch ho¹t m· code
function tbHuynhdelenhbai:IsNewPlayer()
	if (tbExtPointLib:GetBitValueByVersion(self.EXT_POINT_ID_1) == 0)then
		return 0
	end
	if(CalcItemCount(-1, 6, 1, 30592, -1) < 1) then
		return 2
	end
	return 1
end


--Function t¨ng ®¼ng cÊp cña nh©n vËt
_AddLevel = function (nId,nLevel,szLog)
	local szMsg = "T¨ng lªn cÊp %d"
	if(nId ==  1) then	
		ST_LevelUp(nLevel - GetLevel())
	elseif nId == 2 then --id 2: add diem danh vong
		AddRepute(nLevel)
		szMsg = "NhËn ®­îc %d ®iÓm Danh väng"
	end
	if(not szLog) then szLog = "NhanLevel" end
	Msg2Player(format(szMsg,nLevel))
	tbLog:PlayerActionLog(tbHuynhdelenhbai.EVENT_LOG_TITLE,szLog,format(szMsg,nLevel))
end



tbHuynhdelenhbai.tbAward_List = {
	[1] = {		
		[1] = {szName = "T¨ng cÊp lªn 10", pFun = function()  _AddLevel(1,10,"NhiemVu_1") end },
		[2 ]= {szName="Kim Phong Thiªn Lý Th¶o Th­îng Phi",tbProp={0,184},nCount=1,nQuality = 1,nBindState=-2},
	},
	[2] = {	
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,20,"NhiemVu_10") end },
		[2] = {szName="Kim Phong Tr¹c Liªn Quang",tbProp={0,179},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong Kú L©n HuyÕt",tbProp={0,178},nCount=1,nQuality = 1,nBindState=-2},
		[4] = {szName="Ng©n l­îng",nJxb=10000,nCount=1,},
	},
	[3] = {	
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,30,"NhiemVu_20") end },
		[2] = {szName="Kim Phong Thanh D­¬ng Kh«i",tbProp={0,177},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong Lan §×nh Ngäc",tbProp={0,183},nCount=1,nQuality = 1,nBindState=-2},
	},
	[4] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,40,"NhiemVu_30") end },
		[2] = {szName="Kim Phong C«ng CÈn Tam Th¸n",tbProp={0,180},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong §o¹t Hån Ngäc ®¸i",tbProp={0,181},nCount=1,nQuality = 1,nBindState=-2},
	},
	[5] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,50,"NhiemVu_40") end },
		[2] = {szName="Kim Phong HËu NghÖ dÉn cung",tbProp={0,182},nCount=1,nQuality = 1,nBindState=-2},
	},
	[6] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,60,"NhiemVu_50") end },
		[2] = {szName="Kim Phong §ång T­íc Xu©n Th©m",tbProp={0,185},nCount=1,nQuality = 1,nBindState=-2},		
	},
	[7] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,70,"NhiemVu_60") end },
		[2] = {szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
		[3] = {szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
	},
	[8] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,75,"NhiemVu_70") end },
		[2] = {szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=6,nExpiredTime=43200,nBindState=-2},
	},
	[9] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,80,"NhiemVu_75") end },
		[2] = {
					{szName="BÝ KÝp ThËp §¹i Ph¸i 90",tbProp={6,1,30576,1,0,0},nCount=1,nBindState=-2,nExpiredTime=1440},				
			},
	},
	[10] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,85,"NhiemVu_80") end },
		[2] = {szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
		[3] = {szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
	},
	[11] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,90,"NhiemVu_85_level") end },
		[2] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(2,300,"NhiemVu_85_Danhvong") end },	
	},
	[12] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,92,"NhiemVu_90") end },
	},
	[13] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,94,"NhiemVu_92") end },
	},
	[14] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,96,"NhiemVu_94") end },
	},
	[15] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,97,"NhiemVu_96") end },
	},
	[16] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,98,"NhiemVu_97") end },
	},
	[17] = {
		[1] = {szName = " T¨ng cÊp", pFun = function()  _AddLevel(1,99,"NhiemVu_28") end },
	},
	[18] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[19] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[20] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[21] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[22] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[23] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[24] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[25] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[26] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[27] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[28] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
	},
	[29] = {
		[1] = {szName = "100.000.000 §iÓm Kinh NghiÖm", nExp=100e6},
		[2] = {
			{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
		}
	},
}