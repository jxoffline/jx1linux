--zhongchaolong
--‘∆”Œ¿Ø÷Ú
--1∏ˆ–° ±÷Æƒ⁄¥Úπ÷ª·ªÒµ√æ≠—È∑≠±∂
--100%∏≈¬ »√4÷÷µ∆¡˝°æ ∫˚µ˚µ∆¡˝ °ø£¨°æ ŒÂΩ«–«µ∆¡˝ °ø£¨°æ ‘≤µ∆¡˝ °ø£¨°æ ≥§µ∆¡˝ °øÕ¨ ±≥ˆœ÷£¨¥Ê‘⁄ ±º‰Œ™5∑÷÷”°£
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "LÂng ÆÃn b≠¨m b≠Ìm", nLevel = 1, nNpcId = 1215, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "LÂng ÆÃn ng´i sao", nLevel = 1, nNpcId = 1216,nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "LÂng ÆÃn trﬂn", nLevel = 1, nNpcId = 1218, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "LÂng ÆÃn Ëng", nLevel = 1, nNpcId = 1217, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
}

function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("VÀt ph»m nµy Æ∑ qu∏ hπn.",0)
		return 0;
	end
--	if zhongqiu0808_PlayerLimit() ~= 1 then
--		
--		Say("±ÿ–Î «50º∂“‘…œµƒ≥‰÷µÕÊº“°£", 0)
--		return 1
--	end
	AddSkillState(892, 1, 1, 18*60*60);
	
	
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[random(1,getn(%tbNpcList))], nMapId, (nPosX + random(-5,5))*32, (nPosY + random(-5,5))*32 )
	
	
end