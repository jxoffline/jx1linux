Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_SF_PHASE) ~= 1) then	--Ê±¼äÒÑ¹ý
		Say("Tæng qu¶n Ho¹t ®éng ph­êng".."ThËt ®¸ng tiÕc, ng­¬i ®Õn muén mÊt råi, ®îi ®ît ho¹t ®éng sau vËy!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(SF_PREPAREMISSIONID, 0);
	if (nPlayerCount >= SF_ALL_MAXPLAYERCOUNT) then
		Say("Tæng qu¶n Ho¹t ®éng ph­êng".."Sè ng­êi tham gia ho¹t ®éng nµy ®· ®ñ, b¹n h·y tham gia ®ît sau!", 0);
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--ÉèÖÃÍæ¼Ò½øÈëÓÎÏ·µÄ×´Ì¬
	
	AddMSPlayer(SF_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
