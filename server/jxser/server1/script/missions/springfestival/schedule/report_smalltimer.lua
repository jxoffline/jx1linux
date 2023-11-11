Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\schedule\report_smalltimer.lua]]);

function ontimer_add(nNewsValue)
	local i;
	for i = 1, CO_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			report(i + CO_SMALLMAPCOUNT, 1);
			report(i, 1);
		else
			report(i + CO_SMALLMAPCOUNT, 0);
			report(i, 0);
		end;
	end;
end;


function report_add(tabPlayer, nGroupId)
	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			if (nGroupId > CO_SMALLMAPCOUNT) then
		    	szMsg = szMsg.."<enter> <color=orange>"..i.." "..GetName()..", t×m ®­îc"..CO_MOUSENAME..tabPlayer[i][2].."lÇn";
		    else
		    	szMsg = szMsg.."<enter> <color=orange>"..i.." "..GetName()..", ®uæi ¤ng ba m­¬i"..tabPlayer[i][2].."lÇn";
		    end;
		end
	end
	--ÅÅÐòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	for i = 1, getn(tabPlayer) do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(TK_CO_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		if (nGroupId > CO_SMALLMAPCOUNT) then
		    Msg2Player("HiÖn b¹n t×m ®­îc <color=yellow>"..CO_MOUSENAME..GetTask(TK_CO_COUNT_ONETIME).."<color>lÇn"..", hiÖn ®ang xÕp thø <color=yellow>"..i.."<color>.");
		else
			Msg2Player("§· ®uæi <color=yellow>¤ng ba m­¬i"..GetTask(TK_CO_COUNT_ONETIME).."<color>lÇn"..", hiÖn ®ang xÕp thø <color=yellow>"..i.."<color>.");
		end;
	end;
end;