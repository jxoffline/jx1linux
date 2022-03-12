-- Ñ°»¨´ò»¢ Í·ÎÄ¼ş
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")

function OnTime()
	return tbBeatTiger:OnTime();
end

tbBeatTiger = 
{
	nStartDate = 20100426,				-- ¿ªÊ¼ÈÕÆÚ£¨Ç°°ü£©
	nCloseDate = 20100531, 				-- ½áÊøÈÕÆÚ£¨ºó±Õ£©
	nFlowerDisappearDate = 20100607,	-- Á«»¨ÏûÊ§ÈÕÆÚ£¨²»º¬£©
	
	nTaskGroupId = 9,					-- ÈÎÎñ±äÁ¿×é
	nCurrentVersion = 1,				-- °æ±¾ºÅ
	nTaskID_UseCount = 1,				-- ÈÎÎñ±äÁ¿:Ê¹ÓÃ»Æ½ğÁ«´ÎÊı
	
	nLimit_Level = 50,					-- µÈ¼¶ÏŞÖÆ
	nLimit_UseCount = 70,				-- »Æ½ğÁ«Ê¹ÓÃ´ÎÊıÏŞÖÆ
	nLimit_ExpAward = 20000000,			-- ¾­Ñé½±Àø
	nLimit_AwardTime = 300,				-- Áì½±Ê±¼äÏŞÖÆ
	
	nNpc_Talk_ID = 309,					-- ÁôÏãÄ£°æID
	nNpc_Talk_Pos = {37, 1576, 3255},	-- ÁôÏãÎ»ÖÃ
	nNpc_Tiger_ID = 1549,				-- ÀÏ»¢ID
	nNpc_Tiger_Level = 90,				-- ÀÏ»¢µÈ¼¶
	nNpc_Tiger_Pos = {37, 1570, 3269},	-- ÀÏ»¢Î»ÖÃ
	
	nValue_NpcIndex_Talk = nil,			-- ÁôÏãµÄNpcIndex
	nValue_NpcIndex_Tiger = nil,		-- ÀÏ»¢µÄNpcIndex
	
	nValue_tbPlayerInfo = 				-- Íæ¼Ò´ò»¢Çé¿ö
	{
		-- µÚÒ»³¡
		[1] = 
		{
			nStartTime =  801,
			nCloseTime = 1502,
			tbPlayer = {},
		},
		
		-- µÚ¶ş³¡
		[2] = 
		{
			nStartTime = 1600,
			nCloseTime = 2400,
			tbPlayer = {},
		},
	},
}

tbBeatTiger.tbTaskGroup = TaskManager:Create(tbBeatTiger.nTaskGroupId, tbBeatTiger.nCurrentVersion);

-- »î¶¯ÊÇ·ñ¾ÙĞĞ
function tbBeatTiger:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- »ñµÃ»î¶¯³¡´Î
function tbBeatTiger:GetFieldId()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return 0;
	end
	
	local nTime = tonumber(GetLocalDate("%H%M"));
	for i = 1, getn(self.nValue_tbPlayerInfo) do
		if self.nValue_tbPlayerInfo[i].nStartTime < nTime and nTime < self.nValue_tbPlayerInfo[i].nCloseTime then
			return i;
		end
	end
	
	return 0;
end

-- ¼ÓÔØNpc
function tbBeatTiger:AddNpc()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	self.nValue_NpcIndex_Talk = AddNpc(self.nNpc_Talk_ID, 1, SubWorldID2Idx(self.nNpc_Talk_Pos[1]), self.nNpc_Talk_Pos[2]*32, self.nNpc_Talk_Pos[3]*32, 0, "L­u H­¬ng");
	SetNpcScript(self.nValue_NpcIndex_Talk, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_talk.lua");
	
	self.nValue_NpcIndex_Tiger = AddNpc(self.nNpc_Tiger_ID, self.nNpc_Tiger_Level, SubWorldID2Idx(self.nNpc_Tiger_Pos[1]), self.nNpc_Tiger_Pos[2]*32, self.nNpc_Tiger_Pos[3]*32, 0, "S¸t HuyÕt L·o Hæ", 1);
	SetNpcDeathScript(self.nValue_NpcIndex_Tiger, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_tiger.lua");
	
	-- ¶¨Ê±Æ÷ÉèÖÃÎªÏÂ¸öÕûµã
	local nMin = tonumber(GetLocalDate("%M"));
	local nSec = tonumber(GetLocalDate("%S"));
	local nLastHour =  (60 - nMin - 1) * 60 + (60 - nSec) + 5*60;	-- ÑÓºó5·ÖÖÓ
	AddTimer(nLastHour * 18, "OnTime", 0);
end

-- ¶¨Ê±Æ÷
function tbBeatTiger:OnTime()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		
		if self.nValue_NpcIndex_Talk ~= nil then
			DelNpc(self.nValue_NpcIndex_Talk);
			self.nValue_NpcIndex_Talk = nil;
		end
		
		if self.nValue_NpcIndex_Tiger ~= nil then
			DelNpc(self.nValue_NpcIndex_Tiger);
			self.nValue_NpcIndex_Tiger = nil;
		end		

		return 0, 0;
	end
	
	return 60*60*18, 0;
end

