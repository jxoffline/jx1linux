Include("\\script\\lib\\common.lua")

TONGWAR_LGTYPE = 10		-- Õ½¶ÓÀàÐÍ

--Õ½¶Ó¹«ÓÃTask
TONGWAR_LGTASK_TONGCNT	= 1	-- ¹²ÁªÃËÊý(ÎÞÐ§)
TONGWAR_LGTASK_WIN		= 2	-- Ê¤Àû´ÎÊý
TONGWAR_LGTASK_LOSE		= 3	-- Ê§°Ü´ÎÊý
TONGWAR_LGTASK_TIE		= 4	-- Æ½¾Ö´ÎÊý
TONGWAR_LGTASK_RESULT	= 5	-- ±ÈÈü»ý·Ö
TONGWAR_LGTASK_POINT	= 6	-- ÀÛ¼Ó¾»»ý·Ö
TONGWAR_SCORELOG = "relay_log\\tongwar"

-- ÁªÃËÃû³Æ±í
TONGWAR_LGNAME = {"Ph­îng T­êng", "Thµnh §«", "§¹i Lý", "BiÖn Kinh", "T­¬ng D­¬ng", "D­¬ng Ch©u", "L©m An"}

RESULT_WIN	= 1		-- Ê¤Àû
RESULT_LOSE	= 2		-- Ê§°Ü
RESULT_TIE	= 3		-- Æ½¾Ö

function tongwar_score(szParam)		-- szParam[1]: Õ½¶Ó¼×; szParam[2]: Õ½¶ÓÒÒ; szParam[3]: Ê¤¸ºÇé¿ö; szParam[4]: ¾»Ê¤·Ö.
	local szlogfile = TONGWAR_SCORELOG..date("%y%m").."\\score.log"
	local params = split(szParam, " ")
	local team1 = tonumber(params[1])
	local team2 = tonumber(params[2])
	local result = tonumber(params[3])
	local net_score = tonumber(params[4])
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	OutputMsg("Recieve "..team1.." VS "..team2.." result: "..result.." net_score: "..net_score);
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	local win_side, lose_side
	if (result == RESULT_WIN) then		-- ¼×·½Ê¤
		win_side = team1
		lose_side = team2

	elseif (result == RESULT_LOSE) then
		win_side = team2				-- ÒÒ·½Ê¤
		lose_side = team1
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOST !\n")
	elseif (result == RESULT_TIE) then		-- Ë«·½Õ½Æ½
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_TIE, 1)			-- ¼×·½Æ½¾Ö³¡´Î¼Ó1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_TIE, 1)			-- ÒÒ·½Æ½¾Ö³¡´Î¼Ó1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT, 1)		-- ¼×·½±ÈÈü»ý·Ö¼Ó1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT, 1)		-- ÒÒ·½±ÈÈü»ý·Ö¼Ó1
	end
	if (win_side and lose_side) then
		OutputMsg(win_side)
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_WIN, 1)		-- Ê¤·½µÃÊ¤³¡´Î¼Ó1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_LOSE, 1)		-- ¸º·½µÃ¸º³¡´Î¼Ó1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_RESULT, 3)	-- Ê¤·½±ÈÈü»ý·Ö¼Ó3
--		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_RESULT, 0)	-- ¸º·½±ÈÈü»ý·Ö¼Ó0
	end
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT, net_score)	-- ÀÛ¼Ó¼×·½¾»»ý·Ö
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT, -net_score)	-- ÀÛ¼ÓÒÒ·½¾»»ý·Ö
	local result1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT)
	local result2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT)
	local point1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT)
	local point2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT)

	if (result == RESULT_WIN) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." WIN ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_LOSE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOSE ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_TIE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." TIE! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	else
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." ERROR?! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	end


	-- ×Ü»ý·ÖÅÅÐÐ
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team1], result1)
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team2], result2)
	-- ¾»»ý·ÖÅÅÐÐ
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team1], point1)
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team2], point2)
end
