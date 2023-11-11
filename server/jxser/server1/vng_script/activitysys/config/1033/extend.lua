Include("\\vng_script\\activitysys\\config\\1033\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1033\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1033\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\droptemplet.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\progressbar.lua")


pActivity.nPak = curpack()

--function pActivity:OnServerStart()	
--	
--end

function pActivity:DoiRuongHKMP_UI(nType)
	local szMaterial = MATERIAL[nType].szName	
	local strDesc = format("1 viªn %s t¨ng thªm 1%% x¸c xuÊt thµnh c«ng khi ®æi r­¬ng.<enter>Tèi ®a lµ 100%%",szMaterial)		
	g_GiveItemUI("§ång ý", strDesc, {self.DoiRuongHKMP, {self,nType}})
	
end


function pActivity:DoiRuongHKMP(nType, nCount)	
	local nSuccessRate = 0
	local tbMaterial = MATERIAL[nType].tbProp
	for i=1, nCount do
		local nItemIdx = GetGiveItemUnit(i)		
		local nG, nD, nP = GetItemProp(nItemIdx)		
		if (nG ~= tbMaterial[1] or nD ~= tbMaterial[2] or nP  ~= tbMaterial[3]) then							
			return Talk(1,"",format("ChØ bá ®­îc bá: <color=yellow>%s<color> vµo th«i.",MATERIAL[nType].szName))
		elseif (nG == tbMaterial[1] and nD == tbMaterial[2] and nP  == tbMaterial[3]) then	
			local nStackCount = GetItemStackCount(nItemIdx)				
			nSuccessRate = nSuccessRate + nStackCount
		end
	end	
	if PlayerFunLib:CheckFreeBagCell(1,"CÇn tèi thiÓu 1 « trèng hµnh trang") ~= 1 then
		return
	end	
	if not nSuccessRate or nSuccessRate <= 0 then
		Talk(1,"",format("H·y bá ®óng lo¹i nguyªn liÖu cÇn ghÐp: <color=yellow>%s<color>",MATERIAL[nType].szName))
		return
	end
	if nSuccessRate > 100 then
		Talk(1,"","TØ lÖ thµnh c«ng v­ît qu¸ 100% sÏ l·ng phÝ nguyªn liÖu cña ®¹i hiÖp, h·y ®Æt l¹i.")
		return
	end	
	local szMsg = format("<npc>§Æt nguyªn liÖu vµo nhËn ®­îc tØ lÖ thµnh c«ng lµ:<color=yellow>%d%%<color>, ®¹i hiÖp cã muèn tiÕp tôc ®æi kh«ng?", nSuccessRate)	
	local tbOpt = 
	{
		{"§ång ý ®æi", self.OK_ProcessBar, {self,nSuccessRate,nType}},
		{"§Ó ta ®Æt l¹i nguyªn liÖu", self.DoiRuongHKMP_UI, {self,nType}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)		
end

local _SuccessExchange = function(nSuccessRate,nType)	
	local tbMaterial = MATERIAL[nType].tbProp
	local nIdRoom = 3 --Room hanh trang
	if (ConsumeItem(nIdRoom, nSuccessRate, tbMaterial[1], tbMaterial[2], tbMaterial[3], -1)) ~= 1 then
		Talk(1,"","Sao ta kh«ng thÊy nguyªn liÖu ng­¬i trong hµnh trang???.")
		return
	end
	local nRand = random(1, 100)
	if nRand > nSuccessRate then
		Msg2Player(format("<color=yellow>§æi r­¬ng thÊt b¹i...<color>"))
		if nSuccessRate >= 50 then
			Talk(1,"",format("<color=red>ThËt kh«ng thÓ tin næi! <color>\n<color=yellow>Tû lÖ %d%% vËy mµ còng rít ®­îc...<color>",nSuccessRate))		
		else
			Talk(1,"",format("<color=red>ThËt ®¸ng tiÕc! <color>\n<color=yellow>Tû lÖ thÊp vËy thËt khã ®Ó ®æi thµnh c«ng...<color>"))		
		end
		return
	end		
	
	tbAwardTemplet:Give(tbRuongHKMP[nType], 1, {EVENT_LOG_TITLE.."- [Doi]: RuongHKMP_Loai_"..nType})	
end

local _OnBreak = function()
end

function pActivity:OK_ProcessBar(nSuccessRate,nType)
	tbProgressBar:OpenByConfig(19, %_SuccessExchange, {nSuccessRate, nType}, %_OnBreak)
end

--Phan goi goi boss
function pActivity:CheckUseInMap()
	local nCheck = PlayerFunLib:CheckInMap("53,20,99,100,101,121,153,174,11,78,1,162,37,80,176", "")
	if nCheck == 1 and GetFightState() == 0 then		
		Talk(1,"","ChØ sö dông ®­îc ngoµi c¸c b¶n ®å luyÖn c«ng.")
		return nil
	end
	local nCheck1 = PlayerFunLib:CheckInMap("927,930,929,926,931,928,932,65575,65605", "")
	if nCheck1 == 1 then		
		Talk(1,"","Kh«ng ®­îc sö dông ë b¶n ®å nµy.")
		return nil
	end
	return 1
end

function pActivity:Call_Gold_Boss()
	local nRand = 1
	local nIdBoss = TB_BOSS_HK_ID[nRand].nBossID
	local szBossname = TB_BOSS_HK_ID[nRand].szBossName	
	local szDeathScript = TB_BOSS_HK_ID[nRand].szScript
	if not nIdBoss then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_CallBossFail_NotID")
	end
	local nMapId, nX, nY = GetWorldPos()
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local nNpcIdx = AddNpcEx(nIdBoss,1,random(0,4),nMapIndex, nX*32, nY*32,1,szBossname,1)
		--add script cho boss ®¹i		
		SetNpcDeathScript(nNpcIdx,szDeathScript)	
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Use_ITEM_KIMQUANG_LENH_Call_boss_Thanhcong")	
	else
		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_CallBossFail_NotMapIdx")
	end
end

--Randoom boss
-- function pActivity:Random_Boss_HK()
-- 	local nRanVar =random(1,100)
--	local num = 0
--	local row = 0
--	for row=1,getn(%TB_BOSS_HK_ID) do
--		num = num + %TB_BOSS_HK_ID[row].nRate
--		if nRanVar <= num then
--			return row
--		end
--	end
-- end
 --boss Death
 function OnDeath(nNpcIdx)
 	local nIdBoss = GetNpcSettingIdx(nNpcIdx) 
 	local szBossName = GetNpcName(nNpcIdx)
 	local nPlayerName = GetName()
 	local nPlayerIdx = SearchPlayer(nPlayerName)
 	if not tbAward_KillBoss_KimQuang_Random then
 		tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Error_KhongCoPhanThuong")
 		return
 	end
 	--phan thuon rot co dinh
 	tbAwardTemplet:Give(tbAward_KillBoss,1,{EVENT_LOG_TITLE,"KillBossID: "..nIdBoss})
 	%tbDropTemplet:GiveAwardByList(nNpcIdx, nPlayerIdx, tbAward_KillBoss_KimQuang_Fix, EVENT_LOG_TITLE.." - KillBoss_Roi_PhanThuognCoDinh - BossName: "..szBossName)
 	tbLog:PlayerActionLog(EVENT_LOG_TITLE, "Kill_Nomarl_Award")
 	--phan thuong ngau nhien
 	%tbDropTemplet:GiveAwardByList(nNpcIdx, nPlayerIdx, tbAward_KillBoss_KimQuang_Random, EVENT_LOG_TITLE.." - KillBoss_Roi_Trangbi_KimQuang: "..nIdBoss)
	tbLog:PlayerActionLog(EVENT_LOG_TITLE, "TenNguoi_KillBoss_KimQuang: "..nPlayerName)
	
 end
