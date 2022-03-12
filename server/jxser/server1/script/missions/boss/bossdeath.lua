IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--Œ‰¡÷»Ÿ”˛¡Ó µÙ¬‰
--honour
DROPRATE_BOSS_HONOURRATE = {
		["V≠¨ng T∏ "] = {350, 136},--739
		["Huy“n Gi∏c ßπi S≠ "] = {350, 134},--740
		["ß≠Íng B t Nhi‘m"] = {350, 149},--741
		["Bπch Doanh Doanh"] = {350, 138},--742
		["Thanh Tuy÷t S≠ Th∏i"] = {350, 137},--743
		["Y™n Hi”u Tr∏i"] = {350, 168},--744
		["Hµ Nh©n Ng∑ "] = {350, 171},--
		["ß¨n T≠ Nam"] = {350, 171},--746745
		["Tuy“n C¨ Tˆ "] = {350, 144},--747
		--["∫´√…"] = {},--748
		["%ÃÏÕı%"] = {350, 250},--1193
		["¬“ ¿”¢∫¿§≤èù"] = {350, 250},--1194
		["◊∑√¸æ” ø"] = {350, 250},--1195
		["…Òœ…“≤≤ªπ˝»Á¥À"] = {350, 250},--1196
		["∂Ï’Ω—™"] = {350, 250},--1197
		["∫˚µ˚±¥±¥"] = {350, 250},--1198
		["”Ò∫£¬•§ŒŒÕ¸Œ“"] = {350, 250},--1199
		["°·«Âœ„°©°∫ÃÏ»Ã°ª"] = {350, 250},--1200
		["π≈µ¿∑Á"] = {350, 250},--1201
		["»«ªµƒ≈Æ»À"] = {350, 250},--1202
		["ßπi M∑ HÊ "] = {0, 250},
		["Gia LuÀt Tﬁ Ly"] = {350, 130},--563
		["Hoµn Nhan Tuy’t Y"] = {400, 130},--564
		["ßoan MÈc Du÷ "] = {400, 127},--565
		["CÊ B∏ch"] = {350, 141},--566
		["ßπo Thanh Ch©n Nh©n"] = {300, 130},--562
		["Chung Linh TÛ "] = {400, 130},--567
		["Hµ Linh Phi™u"] = {400, 130},--568
		["Lam Y Y"] = {250, 176},--582
		["Mπnh Th≠¨ng L≠¨ng"] = {300, 180},--583
		--[] = {},
}
HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- ÕÊº“ª˜…±BOSS ˝¡øÕ≥º∆
--DC kinh nghi÷m boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- ª˜…±bossΩ±¿¯
--KILLBOSSNEAREXPAWARD = 12000000	-- ª˜…±boss∏ΩΩ¸Ω±¿¯
KILLBOSSEXPAWARD = 3000000
KILLBOSSNEAREXPAWARD = 1000000
--Renew boss award - Modified by ThanhLD - 20130422
local tbVnNewItemDropAward = {
--------------------------------test--------------------------------------------------------------------
	--[1]={{szName="L‘ VÀt Trung Thu",tbProp={6,1,897,1,0,0},nCount=1,nRate=100},},
------------------------boss Æπi------HK---------------------------
	{{szName="V‚ L©m MÀt Tﬁch",tbProp={6,1,26,1,0,0},nCount=1,nRate=1},},
	{{szName="T»y TÒy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=1},},
 	{{szName="Thi’t La H∏n",tbProp={6,1,23,1,0,0},nCount=1,nRate=0.5},},	
	{{szName="Tˆ ThÒy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="Lam ThÒy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="LÙc ThÒy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="Tinh HÂng B∂o Thπch",tbProp={4,353,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="B∏ch Qu∂ LÈ",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	{{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	{{szName="PhÛc Duy™n (ti”u)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	{{szName="PhÛc Duy™n (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	{{szName="PhÛc Duy™n (Æπi)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	{{szName="ßπi l˘c hoµn",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	{{szName="ßπi l˘c hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},
	-----------------------mÀt tﬁch m´n ph∏i----------------------------
	{{szName="MÀt Tﬁch",tbProp={6,1,33,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="MÀt Tﬁch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="MÀt Tﬁch",tbProp={6,1,35,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="MÀt Tﬁch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,35,1,0,0},nCount=1,nRate=0},},
	{{szName="MÀt Tﬁch",tbProp={6,1,36,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,37,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,38,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,39,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,40,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,41,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,42,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,43,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,44,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,45,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,46,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,47,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,48,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,49,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,50,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,51,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,52,1,0,0},nCount=1,nRate=0},},
	{{szName="MÀt Tﬁch",tbProp={6,1,53,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,54,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,55,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,56,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,57,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,58,1,0,0},nCount=1,nRate=0.5},},
	{{szName="MÀt Tﬁch",tbProp={6,1,59,1,0,0},nCount=1,nRate=0.5},},

	
}

function OnDeath( nNpcIndex )

	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	if (nTongID > 0) then
		if (IsDoubledMoneyBox(nTongID)) then
			maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
		end;
	end;
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	--B· ph«n th≠Îng vÀt ph»m khi ti™u di÷t boss - Modified by DinhHQ - 20111012
--	for i = 1, maxcount do
--		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
--		SetSpecItemParam(nItemIdx, 1, nCurtime);
--		SetSpecItemParam(nItemIdx, 2, nYear)
--		SetSpecItemParam(nItemIdx, 3, nMonth)
--		SetSpecItemParam(nItemIdx, 4, nDay)
--		SyncItem(nItemIdx);
--	end;
	--Renew boss award - Modified by ThanhLD - 10130417
	--admin off
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	-- Œ‰¡÷»Ÿ”˛¡Ó≈∆µÙ¬‰
	if (GetProductRegion() == "cn" or GetProductRegion() == "cn_ib") then
		local szNpcName = GetNpcName(nNpcIndex);
		if (DROPRATE_BOSS_HONOURRATE[szNpcName]) then
			for i = 1, getn(DROPRATE_BOSS_HONOURRATE[szNpcName]) do
				local nrate = random(1, 10000);
				if (nrate < DROPRATE_BOSS_HONOURRATE[szNpcName][i]) then
				DropItem(world, x, y, PlayerIndex, 6, 1, HONOURID[i], 1, 0, 0, 0, 0, 0, 0, 0, 0);
				end;
			end;
		end;
	end;
	
	-- ∏¯…±µÙBOSSµƒ»ÀªÚ∂”ŒÈΩ±¿¯
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ∂ bπi BOSS hoµng kim"));
			Msg2Player("ßπi hi÷p nhÀn Æ≠Óc kinh nghi÷m gi’t team gi’t boss: "..KILLBOSSEXPAWARD)
		end
	else -- “ª∏ˆ»À
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ∂ bπi BOSS hoµng kim"));
		Msg2Player("ßπi hi÷p nhÀn Æ≠Óc kinh nghi÷m gi’t boss: "..KILLBOSSEXPAWARD)
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ¯ng g«n lÛc BOSS hoµng kim bﬁ ti™u di÷t"));
		Msg2Player("ßπi hi÷p nhÀn Æ≠Óc kinh nghi÷m Æ¯ng g«n boss: "..KILLBOSSNEAREXPAWARD)
	end
	
	local szNews = format("ßπi hi÷p <color=yellow>%s<color> tπi <color=yellow>%s<color> Æ∑ ti™u di÷t thµnh c´ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSSª˜…±Õ≥º∆
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30µƒª∆ΩBOSS
		-- ª∆ΩBOSSº∆ ˝
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

