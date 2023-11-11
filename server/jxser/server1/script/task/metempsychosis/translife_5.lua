-----------------------------------------------------------------------------
-- Translife 5
--
-- Last modified        2012-8-16.
-- Written by           liujun4.
-- Email                dearliujun@gmail.com.
-- Copyright            Kingsoft. 
-----------------------------------------------------------------------------

Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\type\\harvestplant.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\missions\\yandibaozang\\head.lua")

local tbAwardItem = {szName="V« Cùc Tiªn §¬n", tbProp={6,1,3277,1,0,0},nBindState = -2,}
local nAwardCount = 5
local nFinishSongJin = 300
local nChuanguanLimit = 17
local nYDBZguoguanLimit = 6
local nTranslifeCount = 4
local nLevelLimit = TB_LEVEL_LIMIT[nTranslifeCount+1]

TRANSLIFE5_SKILL = 1262

-----------------------------------------------------------------------------
-- FinishSongJin. 
--
-- @param tbPlayerAll        All player who finished songjin.
-----------------------------------------------------------------------------

function TRANSLIFE5_onFinishSongJin(nBattleLevel, tbPlayerAll)
	for i=1, getn(tbPlayerAll) do
		CallPlayerFunction(tbPlayerAll[i].nIndex, TRANSLIFE5_onFinishSongJinAward)
	end
end


-----------------------------------------------------------------------------
-- Chuanguan. if nChuanguanCount >= 17, then give award.
--
-- @param nChuanguanCount   
-- @param tbAllPlayer     
-----------------------------------------------------------------------------

function TRANSLIFE5_onChuanguan(nChuanguanCount, tbAllPlayer, n_level)
	if nChuanguanCount == %nChuanguanLimit then
		for i = 1, getn(tbAllPlayer) do 
			CallPlayerFunction(tbAllPlayer[i], TRANSLIFE5_onChuanguanAward)
		end
	end
end


-----------------------------------------------------------------------------
-- YDBZguoguan. if nGuoGuanCount >= 6, then give award
--
-- @param nPlayerIndex       
-- @param nGuoGuanCount      
-----------------------------------------------------------------------------

function TRANSLIFE5_onYDBZguoguan(nGuoGuanCount)
	
	if nGuoGuanCount == %nYDBZguoguanLimit then
		--if GetByte(GetTask(YDBZ_ITEM_YANDILING), 1) == 1 then
			if CalcFreeItemCellCount() > 0 then
				TRANSLIFE5_award()
			end
		--end
	end
end


-----------------------------------------------------------------------------
-- Ontianlu_tree. 
--
-- @param nNpcIndex       
-- @param nPlayerIndex      
-----------------------------------------------------------------------------

function TRANSLIFE5_ontianlu_tree(nNpcIndex)
	local nCount = GetTask(TSK_TRANSLIFE_5)
	if nCount > 0 then
		SetTask(TSK_TRANSLIFE_5, nCount+1)
		Msg2Player(format("§¹i hiÖp ng­¬i ®· trång ®­îc %d c©y.", nCount))	end
end


-----------------------------------------------------------------------------
-- OnFinishSongJinAward. 
-- Giving award when player gain points above than 300.
-----------------------------------------------------------------------------

function TRANSLIFE5_onFinishSongJinAward()
	if GetTask(751) >= %nFinishSongJin then
		TRANSLIFE5_award()
	end
end


-----------------------------------------------------------------------------
-- OnChuanguanAward. 
-- Giving award when player used longxuewan.
-----------------------------------------------------------------------------

function TRANSLIFE5_onChuanguanAward()
	if GetTask(%TSK_Longxuewan_avail) >= 0 then
		TRANSLIFE5_award()
	end
end


-----------------------------------------------------------------------------
-- Giving award when player take the task of translife_5
-----------------------------------------------------------------------------

function TRANSLIFE5_award()
	if GetTask(TSK_TRANSLIFE_5) > 0 then
		tbAwardTemplet:Give(%tbAwardItem, %nAwardCount,{%tbAwardItem.szName})
	end
end


-----------------------------------------------------------------------------
-- Dialog option.      
-----------------------------------------------------------------------------

function TRANSLIFE5_wantGetTranslifeTask()
CreateTaskSay({format("<dec><npc>ChØ cã sè lÇn trïng sinh lµ %d lÇn, h¬n n÷a ®¼ng cÊp ®¹t ®Õn %d míi cã thÓ nhËn nhiÖm vô nµy, ng­¬i cã quyÕt ®Þnh nhËn nhiÖm vô nµy kh«ng? ", %nTranslifeCount, %nLevelLimit),
		" Sö dông/TRANSLIFE5_sureGetTranslifeTask",
		"§Ó ta suy nghÜ l¹i/OnCancel"})
end


-----------------------------------------------------------------------------
-- Get translife task.      
-----------------------------------------------------------------------------

function TRANSLIFE5_sureGetTranslifeTask()
	local nCurTranslifecount = ST_GetTransLifeCount()
	if nCurTranslifecount ~= %nTranslifeCount then
		CreateTaskSay({format("<dec><npc>".."Sè lÇn trïng sinh hiÖn t¹i cña ng­¬i lµ %d lÇn, kh«ng thÓ nhËn nhiÖm vô nµy!", %nTranslifeCount), " BiÕt råi!/OnCancel"})
		return 
	end
	local nCurLevel = GetLevel()
	if nCurLevel < %nLevelLimit then
		CreateTaskSay({format("<dec><npc>".."§¼ng cÊp cña ng­¬i vÉn ch­a ®ñ %d cÊp!", %nLevelLimit), " BiÕt råi!/OnCancel"})
		return 
	end	
	if GetTask(TSK_TRANSLIFE_5) == 0 then
		SetTask(TSK_TRANSLIFE_5, 1)
	end
	Msg2Player("Ng­¬i ®· thµnh c«ng nhËn nhiÖm vô trïng sinh 5.")
end


-----------------------------------------------------------------------------
-- Check conditions of translife_5: 400¸öÎÞ¼«ÏÉµ¤£¬150¸öºÚÁúÏÉµ¤£¬400¿Ã×ªÉúÊ÷£¬
-- Ò»²¿¡¶±±¶·³¤ÉúÊé¡·
--
-- @return      0 for false, 1 for true       
-----------------------------------------------------------------------------

function TRANSLIFE5_canTranslife()
	for i=1,getn(TBITEMNEED_5) do
		local tbProb = TBITEMNEED_5[i].tbProb
		if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_5[i].nCount then
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[15 + i], "§­îc råi./OnCancel"})
			return 0
		end
	end
--	if GetTask(TSK_TRANSLIFE_5)-1 < N_TRANSLIFE_TREE_MIN then
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[19], "§­îc råi./OnCancel"})
--		return 0
--	end
	--Translife 5 need 5000000 jxb - modified by DinhHQ - 20130531
	--Translife 5 bá chuyÓn sinh thø 5 - modified by NgaVN - 20140620
--	if GetCash() < 10000000 then
--		CreateTaskSay({"LÇn chuyÓn sinh thø 5 yªu cÇu ph¶i cã 1000 v¹n lµm chi phÝ, xin h·y chuÈn bÞ ®ñ råi ®Õn t×m ta", "§­îc råi./OnCancel"})
--		return 0
--	end
	return 1
end


-----------------------------------------------------------------------------
-- Translife succeed, do some operation.      
-----------------------------------------------------------------------------

function TRANSLIFE5_translifeOperation()
	SetTask(TSK_TRANSLIFE_5, 0)   -- 5×ªÈÎÎñÉèÖÃÎªÎ´½ÓÊÕ
	for i=1,getn(TBITEMNEED_5) do -- ¿Û³ý5×ªµÀ¾ß
		local tbProb = TBITEMNEED_5[i].tbProb
		ConsumeItem(3,TBITEMNEED_5[i].nCount, tbProb[1], tbProb[2], tbProb[3], -1)
	end
	AddMagic(%TRANSLIFE5_SKILL, 1)   -- ½±ÀøÎå×ª¼¼ÄÜ
end


-----------------------------------------------------------------------------
-- Query the number of tree.      
-----------------------------------------------------------------------------

function TRANSLIFE5_queryTreeNumber()
	local ntranscount = ST_GetTransLifeCount()
	if GetTask(TSK_TRANSLIFE_5) == 0 then
		CreateTaskSay({"<dec><npc>Ng­¬i vÉn ch­a nhËn nhiÖm vô trïng sinh 5, kh«ng cã sè l­îng trång c©y ®Ó kiÓm tra!", " BiÕt råi!/OnCancel"})
		return 
	end
	local nTreeNumber = GetTask(TSK_TRANSLIFE_5) - 1
	CreateTaskSay({format("<dec><npc>HiÖn t¹i ng­¬i ®· trång ®­îc<color=red>%d<color>C©y Trïng Sinh.", nTreeNumber),
		 " BiÕt råi!/OnCancel"})
end


-----------------------------------------------------------------------------
-- Registe some messages to eventsys.
-----------------------------------------------------------------------------

function TRANSLIFE5_init()
	EventSys:GetType("SongJin"):Reg("OnFinish", TRANSLIFE5_onFinishSongJin)  -- ËÎ½ð
	EventSys:GetType("ChuanGuan"):Reg("OnPass", TRANSLIFE5_onChuanguan)  -- ´³¹Ø£¨Ê¹ÓÃÁúÑªÍè£©
	EventSys:GetType("YanDiBaoZang"):Reg("OnPass", TRANSLIFE5_onYDBZguoguan)  -- Ñ×µÛ´³¹Ø
	EventSys:GetType("HarvestPlants"):Reg("tianlu_tree", TRANSLIFE5_ontianlu_tree)  -- ÖÖÊ÷
end

--Make change translife for free - Modified by DinhHQ - 20130531
--TRANSLIFE5_init()