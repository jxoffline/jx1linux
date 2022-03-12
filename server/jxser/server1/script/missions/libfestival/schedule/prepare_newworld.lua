Include([[\script\missions\libfestival\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CO_PHASE) ~= 1) then	--Ê±¼äÒÑ¹ý
		Say(CO_SIGNNPCNAME.."Xin lçi! B¹n ®· ®Õn trÔ. Ho¹t ®éng võa míi b¾t ®Çu. ", 0)
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CO_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CO_ALL_MAXPLAYERCOUNT) then
		Say(CO_SIGNNPCNAME.."Sè ng­êi tham gia ho¹t ®éng nµy ®· ®ñ, b¹n h·y tham gia ®ît sau!", 0);
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end;
	
	newworld_in_add();
	playergetinprepare();	--ÉèÖÃÍæ¼Ò½øÈëÓÎÏ·µÄ×´Ì¬
	AddMSPlayer(CO_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	newworld_out_add();
	playerleave();
	OnLeaveWorldDefault(szParam)
end
