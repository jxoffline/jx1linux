-- ËÎ½ðµÀ¾ßÊ¿±øÖ®ºÅ½Ç,ÕÙ»½³ö¼º·½NPCÊ¿±ø2¸ö
-- Liu Kuo
-- 2004.12.18
Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()	-- Í¨¹ýÅÐ¶ÏÕ½³¡µÄµÈ¼¶ºÍÍæ¼ÒµÄÕóÓªÀ´¼ÓNPC
	if (GetFightState() == 0) then
		Say("Kh«ng thÓ sö dông trong t×nh tr¹ng phi chiÕn ®Êu!", 0)
		return -1
	end;
	tbPK_MAP = {357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374} -- µ¥ÌôµØÍ¼½ûÖ¹Ê¹ÓÃºÅ½Ç
	for j = 1, getn(tbPK_MAP) do
		if ( nMapId == tbPK_MAP[j] ) then
			Msg2Player("Trong khu vùc ®¬n ®Êu kh«ng thÓ sö dông vËt phÈm nµy!");
			return -1
		end
	end

	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông ë ChiÕn tr­êng Tèng Kim");
			return -1
		end
	end
	if (GetCurCamp() == 1) then
		if (GetMissionV(MS_CALLNPCCOUNT_S) >= MAX_CALLNPCCOUNT) then
			Msg2Player("HiÖn t¹i sè l­îng hiÖu gi¸c ChiÕn tr­êng sö dông ®· v­ît møc, kh«ng thÓ sö dông tiÕp n÷a. ")
			return -1
		else
			SetMissionV(MS_CALLNPCCOUNT_S, GetMissionV(MS_CALLNPCCOUNT_S) + 1)
		end
	elseif (GetCurCamp() == 2) then
		if (GetMissionV(MS_CALLNPCCOUNT_J) >= MAX_CALLNPCCOUNT) then
			Msg2Player("HiÖn t¹i sè l­îng hiÖu gi¸c ChiÕn tr­êng sö dông ®· v­ît møc, kh«ng thÓ sö dông tiÕp n÷a. ")
			return -1
		else
			SetMissionV(MS_CALLNPCCOUNT_J, GetMissionV(MS_CALLNPCCOUNT_J) + 1)		
		end
	end

	if ( GetLevel() >= 40 and GetLevel() <= 79) then	-- ³õ¼¶Õ½³¡
		if( GetCurCamp() == 1) then		-- ÕÙ»½ºÍÍæ¼ÒÍ¬Ò»ÕóÓªµÄNPC
			CallSjNpc( 682, 50, W, X, Y, " Tèng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 50, W, X, Y, "Kim binh");
		end
	elseif ( GetLevel() >= 80 and GetLevel() <= 119) then	-- ÖÐ¼¶Õ½³¡
		if( GetCurCamp() == 1) then
			CallSjNpc( 682, 70, W, X, Y, " Tèng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 70, W, X, Y, "Kim binh");
		end
	else	-- ¸ß¼¶Õ½³¡
		if( GetCurCamp() == 1) then
			CallSjNpc( 682, 90, W, X, Y, " Tèng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 90, W, X, Y, "Kim binh");
		end
	end
end	

function CallSjNpc(NpcId, NpcLevel, W, X, Y, Name)
	local playername = GetName();
	--for i = 1, 2 do
		AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X -  3 ) * 32, Y * 32, 1, playername..Name, 0);
		AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X +  3 ) * 32, Y * 32, 1, playername..Name, 0);
	--end
	--for j = 1, 2 do
		--AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X - j * 3 ) * 32, Y * 32, 1, playername.."µÄËÎ¾üÊ¿±ø", 0);
	--end
	--AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), X * 32, ( Y + 3 ) * 32, 1, playername.."µÄËÎ¾üÊ¿±ø", 0);
end