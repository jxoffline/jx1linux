Include("\\script\\activitysys\\config\\1019\\variables.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbGlobalName_A = {
	["NopTruyenKy"] = {
		["LIMIT"] = 51,
		["AWARD"] = {
			--{szName="Truy“n K˙ L‘ Bao",tbProp={6,1,30420,1,0,0},nCount=1},
			ITEM_RUONG_TRUYENKY,
		}
	},
	["NopVoLam"] = {
		["LIMIT"] = 301,
		["AWARD"] = {
			{szName="Cµn Kh´n Song Tuy÷t BÈi",tbProp={6,1,2219,1,0,0},nCount=1,nBindState=-2,nExpiredTime=43200},
		}
	},
	["NopVoLamTruyenKy"] = {
		["LIMIT"] = 6,
		["TASKID"] = TASK_VLTK,
		["AWARD"] = {
			{szName="BÈ trang bﬁ X›ch L©n - T˘ ch‰n h÷ ph∏i",tbProp={6,1,30386,1,0,0},nCount=1,nBindState=-2,tbParam={11,1,43200,0,0,0},nExpiredTime=10080},
		}
	},
	["NopLuuDanh"] = {
		["LIMIT"] = 301,
		["AWARD"] = {
			{szName="Qu∂ Hoµng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1,nBindState=-2},
		}
	},
	["NopHungBinh"] = {
		["LIMIT"] = 51,
		["AWARD"] = {
			ITEM_RUONG_HUNGBINH,
		}
	},
	["NopHungBinhLuuDanh"] = {
		["LIMIT"] = 6,
		["TASKID"] = TASK_HBLD,
		["AWARD"] = {
			{szName="Vﬂng Hµo Quang Ti“m Long Nh t HÈi",nTittleID=3007,nExpiredTime=43200},
		}
	},
}
TB_A = {
		{szName="V‚", tbProp={6,1,30422,1,0,0},nCount=1,nExpiredTime=nEndDate},
		{szName="L©m", tbProp={6,1,30423,1,0,0},nCount=1,nExpiredTime=nEndDate},
		{szName="Truy“n", tbProp={6,1,30424,1,0,0},nCount=1,nExpiredTime=nEndDate},
		{szName="Binh", tbProp={6,1,30427,1,0,0},nCount=1,nExpiredTime=nEndDate},
		{szName="L≠u", tbProp={6,1,30428,1,0,0},nCount=1,nExpiredTime=nEndDate},
		{szName="Danh", tbProp={6,1,30429,1,0,0},nCount=1,nExpiredTime=nEndDate},
}
