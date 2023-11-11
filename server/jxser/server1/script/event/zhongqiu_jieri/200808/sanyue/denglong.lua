--zhongchaolong

--´æÔÚ5·ÖÖÓµÄµÆÁý


function main()	--¶Ô»°Èë¿Ú
	
	local tbSay = 
	{
		"Lång ®Ìn nµy ®Ñp qu¸.",
		"Lång ®Ìn nµy lÊp l¸nh ®Ñp qu¸",
		"Trung thu ng¾m lång ®Ìn thËt lµ vui.",
		"Trung thu thËt l·ng m¹n, lµm ta nhí nµng qu¸."
	}
	
	Say(tbSay[random(1,getn(tbSay))], 0)
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;