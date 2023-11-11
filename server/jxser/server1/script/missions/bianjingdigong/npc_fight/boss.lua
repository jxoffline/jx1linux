--======================================================================
--Author:   Tan Qingyu
--Date:     ãê¾©µØ¹¬ µÆµûBOSS½Å±¾
--Describe: 2012-05-15
--======================================================================

Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	local tbAward = 
	{
		{szName = "§¹i Hång Bao", tbProp={6, 1, 13, 1, 0, 0}, nRate = 100,},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Boss §¨ng §iÖp tö vong r¬i ra t¹i §Þa Cung BiÖn Kinh", 1)
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end
