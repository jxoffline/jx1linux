Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_DIS_PHASE) ~= 1) then	--Ê±¼äÒÑ¹ý
		Say("<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: ThËt ®¸ng tiÕc, ng­¬i ®Õn muén mÊt råi, ®îi ®ît ho¹t ®éng sau vËy!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(DIS_PREPAREMISSIONID, 0);
	if (nPlayerCount >= DIS_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: §· ®ñ nh©n sè tham gia ho¹t ®éng, ng­¬i h·y ®îi ®ît sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--ÉèÖÃÍæ¼Ò½øÈëÓÎÏ·µÄ×´Ì¬
	
	AddMSPlayer(DIS_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
