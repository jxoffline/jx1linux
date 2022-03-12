Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\missions\\qianchonglou\\rule.lua")
MAX_LIMIT = 8
function main()
	if tbPlayerHandle:GetDailyLimit() >= MAX_LIMIT then
		Talk(1, "", format("Mçi ngµy nhiÒu nhÊt chØ cã thÓ sö dông %d c¸i", MAX_LIMIT))
		return 1
	end
	local _,_,nMapIndex = GetPos()
	
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon or pDungeon.szDungeonType ~= "endless tower" then
		Talk(1, "","§¹o cô nµy chØ sö dông trong Thiªn Trïng L©u.")
		return 1
	end
	tbPlayerHandle:AddBasePoint(100)
	tbPlayerHandle:AddDailyLimit(1)
end