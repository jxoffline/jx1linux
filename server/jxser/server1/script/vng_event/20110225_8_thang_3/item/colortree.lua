Include("\\script\\vng_event\\20110225_8_thang_3\\item\\colortree_head.lua")
Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _OnBreak = function()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

local _GetAward = function(nNpcIdx, dwNpcId)
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh«ng ®ñ") ~= 1 then
		return 0
	end
	
	local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
	SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
	Msg2Player("Thu thËp kÕt thóc!")
	if nTreePickStep == 1 then
		local tbAward =  {{szName="Hép Quµ 8 Th¸ng 3",tbProp={6,1,30103,1,0,0},nCount=1,nExpiredTime=20110321},}
		tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][Thu ho¹ch c©y mµu s¾c]")
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0)	-- ¹Ø±Õ¸ÐÌ¾ºÅ
	end
end 

function main()
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local nTreeType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeGrowStep == 4 then
		
		if CheckGetAwardBelong(nNpcIdx) ~= 1 then
				return
		end
			
		local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
		if nTreePickStep == 0 then -- »¹Ã»¿ªÊ¼
			Msg2Player("C©y Mµu S¾c sau khi tr­ëng thµnh 30 phót sau sÏ kh« hÐo, trong vßng 30 phót xin h·y thu ho¹ch LÔ Hép.")
			SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
			nTreePickStep = 1
		end
		
		if nTreePickStep == 1 then -- ¿ªÊ¼²ÉÕª
			Msg2Player("B¾t ®Çu thu ho¹ch")
			tbProgressBar:OpenByConfig(1, %_GetAward, {nNpcIdx, dwNpcId}, %_OnBreak)
			return 
		end
		
		if nTreePickStep == 2 then
			Msg2Player("§· thu ho¹ch råi")
			return
		end
		
		return
	end
	
	lib:ShowMessage("C©y Mµu S¾c ®ang sinh tr­ëng")
	
end

function CheckGetAwardBelong(nNpcIdx)
	if CheckPlayerCondition() ~= 1 then
		return 0
	end
	
	local szBelongPlayerIdx = COLOR_TREE_NPC_DATA[nNpcIdx]
	if szBelongPlayerIdx ~= GetName() then
		Msg2Player("§©y kh«ng ph¶i lµ c©y cña b¹n")
		return 0
	end
	return 1
end