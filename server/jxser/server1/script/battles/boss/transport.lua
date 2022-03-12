IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\modified_transport.lua")

--´«ËÍÔ±
function main()
	Say("Trinh s¸t tiÒn tuyÕn: Ta lµ trinh s¸t tiÒn tuyÕn, ng­êi cÇn g× cø nãi?",2, "§­a ta ra tiÒn tuyÕn!/transport", "Kh«ng cã g×./cancel");
end

--´«ËÍ
function transport()
	
	if GetMissionV(MS_TIMER1) < RUNGAME_TIME then 
		Say("Trinh s¸t tiÒn tuyÕn: ChiÕn sù vÉn ch­a më, xin c¸c h¹ ®õng n«n nãng!",1, "Ta ®ang s«i sôc nhiÖt huyÕt ®Ó ra søc nhá män nµy ®Òn ®¸p ®¹i quèc!/cancel");
		return
	end
	
	local RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
	if ( RestTime < TIME_PLAYER_REV) then
		Say((TIME_PLAYER_REV - RestTime) .. " gi©y sau b¹n míi cã thÓ rêi khái hËu doanh! Xin ®îi chót n÷a!", 0)
		return
	end
	
	local nArea = nil;
	local nCamp = BT_GetData(PL_BATTLECAMP);	 
	if nCamp == 1 then
		nArea = BT_GetGameData(GAME_CAMP1AREA);
	else
		nArea = BT_GetGameData(GAME_CAMP2AREA);	
	end	
	tbVNG_Transport:Dialog(nArea)
	 
end

--È¡Ïû
function cancel()
	return
end