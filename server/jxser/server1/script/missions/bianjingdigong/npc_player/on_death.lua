--======================================================================
--Author:   Tan Qingyu
--Date:     2012-3-31 10:45:04
--Describe: 汴京地宫 玩家死亡回调
--======================================================================

Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")

function pack(...)
	return arg
end

function OnDeath(nNpcIndex, nBelongerIndex)

	local szKey = BJDG_HEAD.tbPosName[random(getn(BJDG_HEAD.tbPosName))]
	
	local nMapId, nPosX, nPosY = unpack(BJDG_HEAD.tbPos[szKey])
	SetTempRevPos(nMapId, nPosX * 32, nPosY * 32)
end
