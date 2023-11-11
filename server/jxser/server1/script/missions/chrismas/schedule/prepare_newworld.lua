Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CH_PHASE) ~= 1) then	-- ±º‰“—π˝
		Say("<color=yellow>§ng giµ Noel<color>: Xin lÁi! Bπn Æ’n tr‘ rÂi. Hoπt ÆÈng vıa bæt Æ«u. ß” ta ti‘n ng≠¨i v“ nh–!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CH_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CH_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>§ng giµ Noel<color>: SË ng≠Íi tham gia hoπt ÆÈng Æ∑ qu∏ nhi“u, vui lﬂng ÆÓi l«n sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--…Ë÷√ÕÊº“Ω¯»Î”Œœ∑µƒ◊¥Ã¨
	
	AddMSPlayer(CH_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
