Include("\\script\\activitysys\\config\\38\\head.lua")
Include("\\script\\activitysys\\config\\38\\variables.lua")
Include("\\script\\activitysys\\config\\38\\gift_pos.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\config\\38\\award.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

pActivity.nPak = curpack()

EVENT_LOG_TITLE = "SPRING FESTIVIAL"
function pActivity:InitAddNpc()
	self:AddPlutus()
	self:AddGiftNpc()
	self:AddAmbienceNpc()
end

function pActivity:UseNewYearGift()
	local AWARD_TABLE = tbAwardList["Gift_Item"]
	tbAwardTemplet:Give(AWARD_TABLE, 1, {EVENT_LOG_TITLE, "get gift award by item"})
	--mini game - Modified By DinhHQ - 20120103
	local nStartTime = 20120113
	local nEndTime = 20220303
	local nCurrTime = tonumber(GetLocalDate("%Y%m%d"))
	if nCurrTime >= nStartTime and nCurrTime < nEndTime then
		local tbMiniGameAward = {
			{szName="MÆt n¹ - Long Ch©u",tbProp={0,11,75,1,0,0},nCount=1,nRate=20,nExpiredTime=10080},
			{szName="MÆt n¹ - §Çu Rång",tbProp={0,11,76,1,0,0},nCount=1,nRate=20,nExpiredTime=10080},
			{szName="MÆt n¹ - Th©n Rång",tbProp={0,11,77,1,0,0},nCount=1,nRate=20,nExpiredTime=10080},
			{szName="MÆt n¹ - §u«i Rång",tbProp={0,11,78,1,0,0},nCount=1,nRate=20,nExpiredTime=10080},
		}
		tbAwardTemplet:Give(tbMiniGameAward, 1, {EVENT_LOG_TITLE, "SuDungLeVatNamMoiNhanMatNa"})
	end
	
end

function pActivity:UseNewYearFireworks()
	local AWARD_TABLE = tbAwardList["Fireworks"]
	tbAwardTemplet:Give(AWARD_TABLE, 1, {EVENT_LOG_TITLE, "get gift award by item"})
	tbVngTransLog:Write("201201_event_tet/", 22, "SuDungPhaoHoaNamMoi", "N/A", 1)
	local nSkillId = 1175
	local _,nX32,nY32 = GetWorldPos()
	CastSkill(nSkillId, 1, nX32*32, nY32*32) -- ÐÂÄê¿ìÀÖÑÌ»¨¼¼ÄÜ
end

function pActivity:CheckFireworksUseTime()
	local nStartTime = 20120123
	local nEndTime = 20220303
	local nCurrTime = tonumber(GetLocalDate("%Y%m%d"))
	
	if nCurrTime >= nStartTime and nCurrTime < nEndTime then
		return 1
	else
		Msg2Player(format("Thêi gian hiÖn t¹i kh«ng ®óng, xin h·y ®îi ®Õn %3$d-%2$d-%1$d ®Õn %5$d-%4$d-%1$d h·y sö dông nhÐ!",2012,1,23,1,31))
	end
end

function pActivity:AddPlutus()
	local szNpcName = "§¹i ThÇn Tµi"
	local nNpcId = 1528
	local tbNpcPos = {
		{176,1585,2953},
		{1,1584,3192},
		{37,1709,3118},
		{162,1621,3183},
		{78,1586,3223},
		{11,3139,5063}}
	NpcFunLib:AddObjNpc(szNpcName, nNpcId, tbNpcPos, "\\script\\event\\springfestival07\\worker.lua")		
	--NpcFunLib:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
end

function pActivity:AddGiftNpc()
	local nMapIndex = SubWorldID2Idx(%GIFT_MAPID)
	if nMapIndex < 0 then
		return
	end
	local szNpcName = "LÔ VËt N¨m Míi"
	local nNpcId = 1288
	for i=1, getn(%GIFT_POS) do
		local nX, nY = %GIFT_POS[i][1], %GIFT_POS[i][2]
		local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, nX*32, nY*32, 0, szNpcName);
		SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\38\\npc_gift.lua")
	end
end

function pActivity:AddAmbienceNpc()
	Include("\\script\\activitysys\\config\\38\\ambience_npc.lua")
	DynamicExecute("\\script\\activitysys\\ambience.lua", "tbAmbience:CreateNpc",tbAmbienceNpc)
end


function pActivity:ExpiredTime()
	return self:IsExpired() 
end

function pActivity:CheckGifeGetDaily()
	if self:CheckTaskDaily(%TSK_GET_NEWYEAR_GIFT_DAILY, %MAX_GET_NEWYEAR_GIFT_DAILY, "H«m nay ng­¬i ®· thu thËp ®ñ, ngµy mai h·y quay l¹i nhÐ!", "<") == 1 then
		return 1
	else
		return 0
	end
end

function pActivity:GetNewYearGift()
	self:AddTaskDaily(%TSK_GET_NEWYEAR_GIFT_DAILY, 1)
end

function pActivity:KillMonsterAward(nNpcIndex)
	local _,_, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local tbAward = %tbMonsterSpring2022[nMapId]
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Event spring 2022", 1)
end 