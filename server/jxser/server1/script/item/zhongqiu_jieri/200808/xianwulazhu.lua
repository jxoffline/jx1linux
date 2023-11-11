--zhongchaolong
--œ…ŒË¿Ø÷Ú
--8∏ˆ–° ±÷Æƒ⁄¥Úπ÷ª·ªÒµ√æ≠—È∑≠±∂
--100%∏≈¬ »√1∏ˆ°æ◊ﬂ¬Ìµ∆°øÕ¨ ±≥ˆœ÷°£◊ﬂ¬Ìµ∆µƒ¥Ê‘⁄ ±º‰Œ™5∑÷÷”.
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "ßÃn k–o qu©n", nLevel = 1, nNpcId = 1220, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
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
	AddSkillState(892, 1, 1, 18*60*60*8);
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[1], nMapId, (nPosX + random(-2,2))*32, (nPosY + random(-2,2))*32 )
end