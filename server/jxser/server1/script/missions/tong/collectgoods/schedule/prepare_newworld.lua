Include([[\script\missions\tong\collectgoods\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_COLLG_PHASE) ~= 1) then	--Ê±¼äÒÑ¹ý
		Say("<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: ThËt ng¹i qu¸, ng­êi dÉn ®­êng võa ®­a mét sè hiÖp kh¸ch ®i råi, mét lóc sau míi quay vÒ, h·y ®îi ®ît sau vËy.", 0)
		Msg2Player("Ho¹t ®éng ®ang diÔn ra, h·y chê ®îi ®ît ho¹t ®éng sau.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(COLLG_PREPAREMISSIONID, 0);
	if (nPlayerCount >= COLLG_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: §· ®ñ nh©n sè tham gia ho¹t ®éng, ng­¬i h·y ®îi ®ît sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	collg_setplayerreadystate();	--ÉèÖÃÍæ¼Ò½øÈëÓÎÏ·µÄ×´Ì¬
	AddMSPlayer(COLLG_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	collg_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
