Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_FE_PHASE) ~= 1) then	--Ê±¼äÒÑ¹ý
		Say(FE_SIGNNPCNAME.."Xin lçi! B¹n ®· ®Õn trÔ. Ho¹t ®éng võa míi b¾t ®Çu. ", 0)
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(FE_PREPAREMISSIONID, 0);
	if (nPlayerCount >= FE_ALL_MAXPLAYERCOUNT) then
		Say(FE_SIGNNPCNAME.."Sè ng­êi tham gia ho¹t ®éng nµy ®· ®ñ, b¹n h·y tham gia ®ît sau!", 0);
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--ÉèÖÃÍæ¼Ò½øÈëÓÎÏ·µÄ×´Ì¬
	
	AddMSPlayer(FE_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
