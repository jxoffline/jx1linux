-- 文件名　：goldboss.lua
-- 创建者　：wangjingjun
-- 内容　　：黄金boss调整，新增boss24小时后自动删除
-- PS	   : 由于在该文件加载的时候需要进行boss死亡注册，重复加载，boss死亡会多给奖励
-- 创建时间：2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}
 -- Thay i ph莕 thng Boss Trng Tuy猲, Kim Th� Lng, M� Dung To祅  -Modifiled by ThanhLD - 20130417	
local tbDropItem = {

	-- [1] = {{szName="X輈h L﹏ L謓h",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
	-- [2] = {{szName="M秐h X輈h L﹏",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
	-- [3] = {{szName="X輈h L﹏ Kim B礽",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
	-- [4] = {{szName="X輈h L﹏ Tr秓",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
	-- [5] = {{szName="X輈h L﹏ Gi竎",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
	-- [6] = {{szName="X輈h L﹏ T譶h",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
	-- [7] = {{szName="B筩h H� Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0}},},
	-- [8] = {{szName="B筩h H� Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
	-- [9] = {{szName="B筩h H� Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0}},},
	-- [10] = {{szName="B筩h H� H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0}},},
	-- [11] = {{szName="B筩h H� Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0}},},
	-- [12] = {{szName="B筩h H� H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0}},},
	-- [13] = {{szName="B筩h H� H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0}},},
	-- [14] = {{szName="B筩h H� Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0}},},
	-- [15] = {{szName="B筩h H� H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0}},},
	-- [16] = {{szName="B筩h H� Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
	-- [17] = {{szName="X輈h L﹏ Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
	-- [18] = {{szName="X輈h L﹏ Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
	-- [19] = {{szName="X輈h L﹏ Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
	-- [20] = {{szName="X輈h L﹏ H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
	-- [21] = {{szName="X輈h L﹏ Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
	-- [22] = {{szName="X輈h L﹏ H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
	-- [23] = {{szName="X輈h L﹏ H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
	-- [24] = {{szName="X輈h L﹏ Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
	-- [25] = {{szName="X輈h L﹏ H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
	-- [26] = {{szName="X輈h L﹏ Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
	-- [27] = {{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
	-- [28] = {{szName="C鑞g Hi課 L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [29] = {{szName="Ki課 Thi誸 L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [30] = {{szName="Chi課 B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [31] = {{szName="Bao Dc ho祅 ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
	-- [32] = {{szName="B筩h H� Tr飊g Luy謓 Ng鋍",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
	-- [33] = {{szName="M筩 B綾 Truy襫 T鑞g L謓h",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
	-- [34] = {{szName="V� L﹎ M藅 T辌h",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
	-- [35] = {{szName="T葃 T駓 Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
	-- [36] = {{szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	-- [37] = {{szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [38] = {{szName="Phi t鑓 ho祅 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [39] = {{szName="Qu� Ho祅g Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
}

local tbNpcInfo = 
{
	[1] = {1873,"Trng Tuy猲",},		
	[2] = {1874,"Kim Th� Lng",},		
	[3] = {1875,"M� Dung To祅",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("Чi hi謕 <color=yellow>%s<color> t筰 <color=yellow>%s<color>  ti猽 di謙 th祅h c玭g <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss 死亡 " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--Thay i ph莕 thng - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--B�  ph莕 thng Thi猲 Chi Rng - Modified by DinhHQ - 20111009
--	local tbOtherAward = 
--	{
--		[1873] = {90, 30},
--		[1874] = {94.825, 30},
--		[1875] = {94.825, 40},
--	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--B�  ph莕 thng Thi猲 Chi Rng - Modified by DinhHQ - 20111009
--	local nRate = random(1,10000) / 100
--	if nRate <= tbOtherAward[nKind][1] then
--		local tbTeam = getPlayerTeam()
--		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
--	else
--		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
--	end
	--Change boss award 2013- Modified by ThanhLD - 20130417
	--admin off	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--Ph莕 thng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "觤 kinh nghi謒"},
		["Around"] = {nExp = 10e6, szName = "觤 kinh nghi謒"},
	}
	nOldPlayer = PlayerIndex	
	--Ph莕 thng nguy猲 li謚 kinh m筩h cho ngi gi誸 boss
	if CalcFreeItemCellCount() >= 1 then
		local tbMeridanMaterial = {szName="Ch﹏ Nguy猲 Кn (trung)",tbProp={6,1,30228,1,0,0},nCount=6,nBindState=-2}
		tbAwardTemplet:Give(tbMeridanMaterial, 1, {"KinhMach", "TieuDietBossHKMoiNhanNguyenLieu"})
	end
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho t� i ti猽 di謙 "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho ngi ti猽 di謙 "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho ngi ng g莕 "..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "Rng Thi猲 Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- 存在时间 5 分钟
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- 得到创建的时间
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- 中间预留一个位置放置天灵丹，所以在计算可显示行数时，在总数上需要+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- 每行6个宝箱，以boss死亡的位置为中心成矩阵排列
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- 中心位置显示天灵丹，不放置宝箱
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()