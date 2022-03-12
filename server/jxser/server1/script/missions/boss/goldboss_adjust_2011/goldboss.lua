-- ÎÄ¼þÃû¡¡£ºgoldboss.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º»Æ½ðbossµ÷Õû£¬ÐÂÔöboss24Ð¡Ê±ºó×Ô¶¯É¾³ý
-- PS	   : ÓÉÓÚÔÚ¸ÃÎÄ¼þ¼ÓÔØµÄÊ±ºòÐèÒª½øÐÐbossËÀÍö×¢²á£¬ÖØ¸´¼ÓÔØ£¬bossËÀÍö»á¶à¸ø½±Àø
-- ´´½¨Ê±¼ä£º2011-10-02 08:15:46

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
 -- Thay ®æi phÇn th­ëng Boss Tr­¬ng Tuyªn, Kim ThÝ L­îng, Mé Dung Toµn  -Modifiled by ThanhLD - 20130417	
local tbDropItem = {

	-- [1] = {{szName="XÝch L©n LÖnh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
	-- [2] = {{szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
	-- [3] = {{szName="XÝch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
	-- [4] = {{szName="XÝch L©n Tr¶o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
	-- [5] = {{szName="XÝch L©n Gi¸c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
	-- [6] = {{szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
	-- [7] = {{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0}},},
	-- [8] = {{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
	-- [9] = {{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0}},},
	-- [10] = {{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0}},},
	-- [11] = {{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0}},},
	-- [12] = {{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0}},},
	-- [13] = {{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0}},},
	-- [14] = {{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0}},},
	-- [15] = {{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0}},},
	-- [16] = {{szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
	-- [17] = {{szName="XÝch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
	-- [18] = {{szName="XÝch L©n Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
	-- [19] = {{szName="XÝch L©n Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
	-- [20] = {{szName="XÝch L©n H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
	-- [21] = {{szName="XÝch L©n Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
	-- [22] = {{szName="XÝch L©n Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
	-- [23] = {{szName="XÝch L©n Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
	-- [24] = {{szName="XÝch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
	-- [25] = {{szName="XÝch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
	-- [26] = {{szName="XÝch L©n KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
	-- [27] = {{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
	-- [28] = {{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [29] = {{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [30] = {{szName="ChiÕn BÞ LÔ Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [31] = {{szName="Bao D­îc hoµn ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
	-- [32] = {{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
	-- [33] = {{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
	-- [34] = {{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
	-- [35] = {{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
	-- [36] = {{szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	-- [37] = {{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [38] = {{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [39] = {{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
}

local tbNpcInfo = 
{
	[1] = {1873,"Tr­¬ng Tuyªn",},		
	[2] = {1874,"Kim ThÝ L­îng",},		
	[3] = {1875,"Mé Dung Toµn",},		
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
	local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss ËÀÍö " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--Thay ®æi phÇn th­ëng - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--Bá  phÇn th­ëng Thiªn Chi R­¬ng - Modified by DinhHQ - 20111009
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
	--Bá  phÇn th­ëng Thiªn Chi R­¬ng - Modified by DinhHQ - 20111009
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
	--PhÇn th­ëng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "§iÓm kinh nghiÖm"},
		["Around"] = {nExp = 10e6, szName = "§iÓm kinh nghiÖm"},
	}
	nOldPlayer = PlayerIndex	
	--PhÇn th­ëng nguyªn liÖu kinh m¹ch cho ng­êi giÕt boss
	if CalcFreeItemCellCount() >= 1 then
		local tbMeridanMaterial = {szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=6,nBindState=-2}
		tbAwardTemplet:Give(tbMeridanMaterial, 1, {"KinhMach", "TieuDietBossHKMoiNhanNguyenLieu"})
	end
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho tæ ®éi tiªu diÖt "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi tiªu diÖt "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi ®øng gÇn "..szNpcName})
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
		szName = "R­¬ng Thiªn Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- ´æÔÚÊ±¼ä 5 ·ÖÖÓ
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- µÃµ½´´½¨µÄÊ±¼ä
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- ÖÐ¼äÔ¤ÁôÒ»¸öÎ»ÖÃ·ÅÖÃÌìÁéµ¤£¬ËùÒÔÔÚ¼ÆËã¿ÉÏÔÊ¾ÐÐÊýÊ±£¬ÔÚ×ÜÊýÉÏÐèÒª+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- Ã¿ÐÐ6¸ö±¦Ïä£¬ÒÔbossËÀÍöµÄÎ»ÖÃÎªÖÐÐÄ³É¾ØÕóÅÅÁÐ
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- ÖÐÐÄÎ»ÖÃÏÔÊ¾ÌìÁéµ¤£¬²»·ÅÖÃ±¦Ïä
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