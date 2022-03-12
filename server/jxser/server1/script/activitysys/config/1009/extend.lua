Include("\\script\\activitysys\\config\\1009\\head.lua")
Include("\\script\\activitysys\\config\\1009\\variables.lua")
Include("\\script\\activitysys\\config\\1009\\award_ext.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\log.lua")

local tbItemOtherAward = {
	["mutaibeo"] = {
			[100] 	= "SuDung100MuTaiBeo",
			[200] 	= "SuDung200MuTaiBeo",
			[300] 	= "SuDung300MuTaiBeo",
			[400] 	= "SuDung400MuTaiBeo",
			[500] 	= "SuDung500MuTaiBeo",
			[600] 	= "SuDung600MuTaiBeo",
			[700] 	= "SuDung700MuTaiBeo",
			[800] 	= "SuDung800MuTaiBeo",
			[900] 	= "SuDung900MuTaiBeo",
			[1000] 	= "SuDung1000MuTaiBeo",
			[1100] 	= "SuDung1100MuTaiBeo",
			[1200] 	= "SuDung1200MuTaiBeo",
			[1300] 	= "SuDung1300MuTaiBeo",
			[1400] 	= "SuDung1400MuTaiBeo",
			[1500] 	= "SuDung1500MuTaiBeo",
			[1600] 	= "SuDung1600MuTaiBeo",
			[1700] 	= "SuDung1700MuTaiBeo",
			[1800] 	= "SuDung1800MuTaiBeo",
			[1900] 	= "SuDung1900MuTaiBeo",
			[2000] 	= "SuDung2000MuTaiBeo",
	},		
	["mutudo"] = {
			[100] 	= "SuDung100MuTuDo",
			[200] 	= "SuDung200MuTuDo",
			[300] 	= "SuDung300MuTuDo",
			[400] 	= "SuDung400MuTuDo",
			[500] 	= "SuDung500MuTuDo",
			[600] 	= "SuDung600MuTuDo",
			[700] 	= "SuDung700MuTuDo",
			[800] 	= "SuDung800MuTuDo",
			[900] 	= "SuDung900MuTuDo",
			[1000] 	= "SuDung1000MuTuDo",
			[1100] 	= "SuDung1100MuTuDo",
			[1200] 	= "SuDung1200MuTuDo",
			[1300] 	= "SuDung1300MuTuDo",
			[1400] 	= "SuDung1400MuTuDo",
			[1500] 	= "SuDung1500MuTuDo",
			[1600] 	= "SuDung1600MuTuDo",
			[1700] 	= "SuDung1700MuTuDo",
			[1800] 	= "SuDung1800MuTuDo",
			[1900] 	= "SuDung1900MuTuDo",
			[2000] 	= "SuDung2000MuTuDo",
	},		
}

function pActivity:DropItemRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %ITEM_SKILL_PIECE, "Drop Material Bag", 1)
end

function pActivity:UseHatDirt()
	local tbAward2000 = %tbAward_Ext["award2000"];
	local tbAward = %tbAward_Ext["awardnomal"];
	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_USING)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_USING) == 1 then
		Msg2Player("Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm");
		return
	end
	local tbItemLog = %tbItemOtherAward["mutaibeo"]
	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_USING, 1)	
	if tbItemLog[nCount + 1] then
		local tbAward = %tbAward_Ext["awardspecial"];
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		if  (nCount + 1) == 2000 then
			tbAwardTemplet:Give(tbAward2000, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		end
	else
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "SuDungMuTaiBeo"})
	end
end

function pActivity:UseHatFreedom()
	local tbAward2000 = %tbAward_Ext["award2000"]
	local tbAward = %tbAward_Ext["awardspecial"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_USING)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_USING) == 1 then
		Msg2Player("Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm");
		return
	end
	local tbItemLog = %tbItemOtherAward["mutudo"]
	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_USING, 1)	
	if tbItemLog[nCount + 1] then
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		if  (nCount + 1) == 2000 then
			tbAwardTemplet:Give(tbAward2000, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		end
	end
end
--function pActivity:UseHatPeace()
--	local tbAward = %tbAward_Ext["awardnomal"];
--	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_PEACE_USING)
--	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_PEACE_USING) == 1 then
--		Msg2Player("Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm");
--		return
--	end
--	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_PEACE_USING, 1)	
--	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "SuDungMuHoaBinh"})
--end

