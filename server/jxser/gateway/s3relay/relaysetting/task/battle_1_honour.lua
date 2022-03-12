-- ------------------------------------------------------------------
-- FileName   : battle_1_honour.lua
-- Author     : panyuyang
-- Version    : 
-- Date       : 2010-10-26 16:00:02
-- Description: °ÑID10251¸Ä³ÉÁË10086£¨ËÎ½ð¸ßÊÖ£©
------------------------------------------------------------------
 LG_SONGJINHONOUR = 535;
 LG_TSK_HONOURPOINT = 1;
 LG_TSK_TOTALPOINT = 2;
 
function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "§iÓm vinh dù Tèng Kim" );
	--ÐÇÆÚÈÕ23Ê±¿ªÊ¼ÐÂµÄÒ»ÂÖ
	-- Ò»ÖÜÒ»¸öÑ­»·
	TaskInterval(1440);
	TaskTime(23, 0);
	TaskCountLimit(0);
end

function TaskContent()
	local nweek = tonumber(date("%w"));
	if (nweek ~= 0) then
		return 0;
	end;
	Ladder_ClearLadder(10251);
	OutputMsg("****************Clear Battle Honour Ladder********");
	for i = 1, 10 do
		local szname, nrank, nsect, ngender = Ladder_GetLadderInfo(10250, i);
		if (szname ~= nil and szname ~= "") then
			Ladder_NewLadder(10251, szname, nrank, 0, nsect, ngender);
		end;
	end;
	Ladder_ClearLadder(10250);
	local nlg_idx = LG_GetFirstLeague(LG_SONGJINHONOUR);
	while (nlg_idx ~= nil and nlg_idx ~= 0) do
		local nlg_remv = nlg_idx;
		nlg_idx = LG_GetNextLeague(LG_SONGJINHONOUR, nlg_idx);
		local szlg_name = LG_GetLeagueInfo(nlg_remv);
		LG_ApplyRemoveLeague(LG_SONGJINHONOUR, szlg_name);
	end;
	
	OutputMsg("****************Clear Battle Honour Ladder********");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end