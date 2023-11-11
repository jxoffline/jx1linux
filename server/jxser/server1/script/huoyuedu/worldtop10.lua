-- 文件名　：worldtop10.lua
-- 创建者　：wangjingjun
-- 内容　　：判断是否杀死世界十大boss
--			boss表：古柏 566	道青真人 562 	端木睿 565 	蓝依依 582 	钟灵秀 567
--			玄觉大师 740	唐不染 741	清绝师太 743	何人我 745	璇玑子	747
-- 创建时间：2011-10-19 12:03:30Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\huoyuedu\\huoyuedu.lua")

function checkworldtop10(nNpcIndex, nPlayerIndex)
	local szScript = GetNpcScript(nNpcIndex)
	if szScript and (szScript == "\\script\\missions\\boss\\bossdeath.lua")then
		if NpcFunLib:CheckId("566,740,1366,582,568,744,583,563,562,747,739,1365,741,742,743,567,745,565,1367,1368", nNpcIndex) then
			vn_addhuoyuedu(nNpcIndex, nPlayerIndex)
		end
	end
end

function addhuoyuedu(nPlayerIndex)
do return end
	local nOldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIndex
	
	local tbPlayer = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize > 0 then
		for i=1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			DynamicExecuteByPlayer(nPlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
		end
	else
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
	end
	
	PlayerIndex = nOldPlayerIndex
end

function vn_addhuoyuedu(nNpcIndex, nPlayerIndex)
	local nOldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIndex
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do
		DynamicExecuteByPlayer(tbRoundPlayer[i], "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
	end
	PlayerIndex = nOldPlayerIndex
end