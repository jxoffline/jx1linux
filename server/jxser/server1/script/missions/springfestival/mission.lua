Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\mission.lua]]);
STRGLOBALNEWS = "C¸c vŞ anh hïng ®uæi ¤ng ba m­¬i ®· quay vÒ råi.";

function initmission_add()

end;

function EndMission_add()
	local i;
	for i = 1, CO_SMALLMAPCOUNT do
		if (GetMSPlayerCount(CO_MISSIONID, i + CO_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(CO_MISSIONID, i) > 0) then
			groupsort(i);
			groupsort(i + CO_SMALLMAPCOUNT);
		end;
	end;
	festival_gameover(CO_MAPID[2], CO_MISSIONID);	--½«ËùÓĞÍæ¼ÒÇå³ı³öµØÍ¼
	AddGlobalNews(STRGLOBALNEWS);
	
	ClearMapObj(CO_MAPID[2]);
end;

function OnLeave()
end

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
		    tabMsg[i + nMsgCount] = "<color=orange>thø "..i.." "..GetName()..", t×m ®­îc"..CO_MOUSENAME..tabPlayer[i][2].."lÇn";
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --ÅÅĞòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_CO_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
   	    	Msg2Player("Ng­¬i t×m thÊy"..CO_MOUSENAME.."lÇn thø <color=yellow>"..i.."<color> lÇn, cã thÓ ®Õn <color=yellow>Sai dŞch Nha m«n<color> nhËn phÇn th­ëng!");
   	    else
   	    	Msg2Player("®uæi ¤ng ba m­¬i lÇn thø <color=yellow>"..i.."<color> lÇn, cã thÓ ®Õn <color=yellow>Sai dŞch Nha m«n<color> nhËn phÇn th­ëng!");
   	    end;
	end;
end;