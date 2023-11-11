Include("\\script\\lib\\objbuffer_head.lua")
if (BigBoss == nil) then
	BigBoss = {}
	BigBoss.gold_boss_count = 0;
	BigBoss.isBigBossDead = 0;
end

BigBoss.BIG_BOSS_POS = {
					{80, {{1833, 3367},{1511, 3239}, {1582, 2902}, {1987, 2975}}, "D­¬ng Ch©u"},
					{11, {{2909, 5236},{2883, 4835}, {3317, 5280}, {3306, 4860}}, "Thµnh §«"},
					{162, {{1336, 3205},{1426, 3401}, {1723, 3489}, {1668, 2981}}, "§¹i Lý"},
					{1, {{1424, 3044},{1783, 3183}, {1724, 3406}, {1497, 3383}}, "Ph­îng T­êng"},
					{78, {{1753, 3121},{1670, 3462}, {1369, 3411}, {1379, 3141}}, "T­¬ng D­¬ng"},
					{37, {{1770, 3403},{1520, 3281}, {1535, 2902}, {2017, 2679}}, "BiÖn Kinh"},
					{176, {{1162, 2781},{1832, 3342}, {1247, 3354}, {1754, 2805}}, "L©m An"},
}

BigBoss.BIG_BOSS_SER = {
	[0] = 1505,
	[1] = 1506,
	[2] = 1507,
	[3] = 1508,
	[4] = 1509,
}
function AddGoldBossCount(ParamHandle, ResultHandle)
	BigBoss.gold_boss_count = BigBoss.gold_boss_count + 1;
	OutputMsg( format("GOLD BOSS COUNT :  %d",BigBoss.gold_boss_count) );
end

function ReduceGoldBossCount(ParamHandle, ResultHandle)
	BigBoss.gold_boss_count = BigBoss.gold_boss_count - 1;
	OutputMsg( format("GOLD BOSS COUNT :  %d",BigBoss.gold_boss_count) );
end

function SetBigBossDead(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 0) then
		BigBoss.isBigBossDead = ObjBuffer:PopObject(ParamHandle);
	end
end

function IsBigBossDead(ParamHandle, ResultHandle)
	ObjBuffer:PushObject(ResultHandle, BigBoss.isBigBossDead);
end

function MakeAllPlayerCanGetReward(ParamHandle, ResultHandle)
	GlobalExecute("dwf \\script\\missions\\boss\\bigboss.lua BigBoss:MakeAllPlayerCanGetReward()");
end
