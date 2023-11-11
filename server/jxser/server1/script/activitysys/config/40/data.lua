
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Chóc mõng <color=yellow>%s<color=green> ®· nhËn ®­îc vËt phÈm <color=yellow>%s<color=green> khi sö dông <color=yellow>Gio Hoa Hång VÜnh Cöu<color>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end	

tbActivityNpc = {	
	[1] = {
		szName = "Thî GhÐp Hoa", 
		nLevel = 95,
		nNpcId = 1888,
		nIsboss = 0,
		szScriptPath = "\\script\\activitysys\\npcdailog.lua",
		},
	[2] = {
		szName = "Cá Xanh", 
		nLevel = 95,
		nNpcId = 1889,
		nIsboss = 0,
		bNoRevive = 0,
		szScriptPath = "\\script\\activitysys\\config\\40\\npc_grass.lua",
		}
}

tbActivityNpcPos = {
	[1] = {
			[1] = {78,1588,3221,},
			[2] = {11,3141,5061,},
			[3] = {37,1707,3117,},
		},
	[2] = {
		{20, 3593, 6273,},
		{53, 1670, 3256,},
		{99, 1717, 3279,},
		{100, 1576, 3226,},
		{101, 1766, 3272,},
		{121, 1874, 4587,},
		{153, 1715, 3297,},
		{174, 1544, 3287,},
		},
	}
	
	
tbMonstorAward = {
	[321] = {	-- ³¤°×É½ÄÏ
		[1]={szName="Hoa Hång Tr¾ng",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa Hång Vµng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="Tói H­¬ng Hoa Hång",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},	
	[322] = {	-- ³¤°×É½±±
		[1]={szName="Hoa Hång Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa hång ®á",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="Tói H­¬ng Hoa Hång",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},
	[227] = {	-- É³Ä®É½¶´3
		[1]={szName="Hoa Hång Tr¾ng",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="Hoa Hång Vµng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="Hoa Hång Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	[340] = {	-- Äª¸ß¿ß
		[1]={szName="Hoa Hång Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="Hoa Hång Vµng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="Hoa hång ®á",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	}	
	
tbItemAward = {
	["3Color_Rose"] = {szName = "500000 ®iÓm exp", nExp=500000},
	["4Color_Rose"] = {szName = "1000000 ®iÓm exp", nExp=1000000},
	["MeiGuiXiangDai"] = {
		[1]={szName="Hoa Hång Xanh",tbProp={6,1,3118,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa Hång Vµng",tbProp={6,1,3119,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="Hoa hång ®á",tbProp={6,1,3120,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[4]={szName="Hoa Hång Tr¾ng",tbProp={6,1,3117,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		},		
	}	

tbItemOtherAward = {
	["3Color_Rose"] = {
		[500] = "SuDung500LanBoHongTamSac",
		[1000] = "SuDung1000LanBoHongTamSac",
		},
	["4Color_Rose"] = {
		[500] = "SuDung500LanBoHongTuSac",
		[1000] = "SuDung1000LanBoHongTuSac",
		[1500] = "SuDung1500LanBoHongTuSac",
		},
	["Corbeil"] = {
		[100] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu100Lan",
			},
		[200] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu200Lan",
			},
		[300] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu300Lan",
			},
		[400] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu400Lan",
			},
		[500] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu500Lan",
			},
		[600] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu600Lan",
			},
		[700] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu700Lan",
			},
		[800] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu800Lan",
			},
		[900] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu900Lan",
			},
		[1000] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1000Lan",
			},
		[1100] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1100Lan",
			},
		[1200] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1200Lan",
			},
		[1300] = {
			tbAward = {nExp_tl=40000000},
			szLog = "SuDungGioHoaHongVinhCuu1300Lan",
			},
		[1400] = {
			tbAward = {nExp_tl=50000000},
			szLog = "SuDungGioHoaHongVinhCuu1400Lan",
			},
		[1500] = {
			tbAward ={
					{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=14, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=10, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=2, CallBack = _Message},	
			},
			szLog = "SuDungGioHoaHongVinhCuu1500LanBaoRuongKimO",
			},	
		},
	}	
	
-- ÐÒÔË´øµÄ½±ÀøÒÔ¼°¸ÅÂÊ	
tbLuckBeltAward = {
	[1]={szName="Bã Hång Tam S¾c",tbProp={6,1,3121,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[2]={szName="Bã Hång Tø S¾c",tbProp={6,1,3122,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[3]={szName="Giá Hoa Hång VÜnh Cöu",tbProp={6,1,3127,1,0,0},nExpiredTime=20120401,nBindState = -2,},	
	}	
tbLuckBelt = {
	[1] = {nRate = 45, szActionLog = "SuDungTuiMayManNhanBoHongTamSac",},
	[2] = {nRate = 45, szActionLog = "SuDungTuiMayManNhanBoHongTuSac",},
	[3] = {nRate = 10, szActionLog = "SuDungTuiMayManNhanGioHoaHongVinhCuu",},
	}	
