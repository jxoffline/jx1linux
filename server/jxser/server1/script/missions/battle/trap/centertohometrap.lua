Include("\\script\\missions\\battle\\rule.lua")
Include("\\script\\missions\\battle\\rule.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
function main(nAreaId)
	
	local nMapId = GetWorldPos()
	local szName = GetName()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if pDungeon then
		local nCamp = pDungeon.pBattle:GetPlayerCamp(szName)
		if nCamp and CAMP2AREA[nCamp] == nAreaId then
			local nX, nY = pDungeon:GetRandomAPos(nAreaId, "centertohomepos")
			pDungeon.pBattle.Data:RefreshStayTime(szName)
			SetPos(floor(nX/32), floor(nY/32))
			SetFightState(0)
		end
	end
end