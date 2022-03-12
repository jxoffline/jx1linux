Include("\\script\\lib\\common.lua")
Include("\\script\\gb_taskfuncs.lua")

TONGWAR_LGTYPE = 10

--Õ½¶Ó³ÉÔ±Task
TONGWAR_LGMTASK_JOB = 1		--¶Ó³¤Îª1£»¶ÓÔ±Îª0

--Õ½¶Ó¹«ÓÃTask
TONGWAR_LGTASK_TONGCNT = 1	--¹²ÁªÃËÊı
TONGWAR_LGTASK_WIN = 2			--Ê¤Àû´ÎÊı
TONGWAR_LGTASK_LOSE = 3			--Ê§°Ü´ÎÊı
TONGWAR_LGTASK_TIE = 4			--Æ½¾Ö´ÎÊı
TONGWAR_LGTASK_RESULT = 5		--±ÈÈü×Ü»ı·Ö
TONGWAR_LGTASK_POINT = 6		--Ã¿³¡¾»»ı·ÖÀÛ¼Ó
TONGWAR_LGTASK_CITYID = 7		--¸Ã³ÇÊĞid
TONGWAR_LGTASK_CAMP = 8			--¸Ã³¡±ÈÈüÕóÓª
TONGWAR_LGTASK_MAP = 9			--¸Ã³Ç±ÈÈü±ÈÈüµØÍ¼
TONGWAR_LGTASK_RANK = 10		--±ÈÈü×îÖÕÅÅÃû
TONGWAR_LGTASK_TITLE = 15		--°ï»áÁªÃËÊÇ·ñÁìÈ¡ÁË¹â»·
TONGWAR_LGTASK_TONGID = 16		--³ÇÖ÷°ï»áID
TONGWAR_LGTASK_SEASON = 17		--Èü¼¾

--½ÇÉ«Task
TONGWAR_RLTASK_POINT = 1323

TONGWAR_CITY = {"Ph­îng T­êng","Thµnh §«","§¹i Lı","BiÖn Kinh","T­¬ng D­¬ng","D­¬ng Ch©u","L©m An",}

LOGFILE = "relay_log\\tongwar"		--ÈÕÖ¾Â·¾¶

function tongwar_add(szParam)
	--²ğ·Ö´«Èë²ÎÊı
	local aryParam = split(szParam, " ")
	tongname = GetTongNameByID(tonumber(aryParam[1]))
	if (FALSE(tongname)) then
		_msg("tongname id "..aryParam[1].." error!!!!")
		return
	end
	local rolename = aryParam[2]
	local leaguename = TONGWAR_CITY[tonumber(aryParam[3])]
	local cpname = aryParam[4]
	local mytongid = tonumber(aryParam[5]);
	if (mytongid == 0) then
		OutputMsg("cityowner tongid error!!!!");
		return 0;
	end;
	
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		_msg("false leaguename"..leaguename)
		return 0
	end
	
	if (LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_TONGID) == 0) then
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, leaguename, TONGWAR_LGTASK_TONGID, mytongid);
	end;
	
	--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
	if (not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname))) then
		tongwar_say(rolename, "B¹n ®· gia nhËp liªn minh bang héi, kh«ng thÓ gia nhËp n÷a!")
		local strInfo = format("Bang <color=yellow>%s<color> cña <color=yellow>%s<color> ®· gia nhËp liªn minh, kh«ng thÓ gia nhËp n÷a!", rolename, tongname)
		tongwar_say(cpname, strInfo, 0)
		return 0
	end

	local szlogfile = LOGFILE..date("%y%m").."\\tongwar.log"
	--¼ÓÈëÕ½¶Ó
	if(tongwar_addmember(leaguename, tongname) == 1) then
		local strInfo = format("Chóc mõng b¹n ®· gia nhËp thµnh c«ng liªn minh bang héi [<color=yellow>%s<color>].", leaguename)
		tongwar_say(rolename, strInfo, nil, 1)
		
		strInfo = format("<color=yellow>%s<color> ®· gia nhËp thµnh c«ng liªn minh bang héi cña b¹n!", tongname)
		tongwar_say(cpname, strInfo, 0)
		
		strInfo = format("Bang chñ bang [%s] lµ [%s] ®· gia nhËp bang héi [%s] do [%s] lµm bang chñ.", tongname, rolename, cpname, leaguename)
		WriteStringToFile(szlogfile, strInfo.."\n")
		return 1
	end

	return 0
end

--¼ÓÈë¶ÓÔ±£¨×îÖÕ£©
function tongwar_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êı¾İ¶ÔÏó(·µ»Ø¶ÔÏóID)
	--ÉèÖÃÉçÍÅ³ÉÔ±µÄĞÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàĞÍ¡¢ÉçÍÅÃû³Æ)
	LGM_SetMemberInfo(nMemberID, rolename, 0, TONGWAR_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)

	return ret
end

--ÏòÖ¸¶¨½ÇÉ«ÃûµÄÍæ¼Ò·¢ĞÅÏ¢
function tongwar_say(rolename, msg, b_msg, b_sync)
	GlobalExecute("dw tongwar_gw_say([["..safestr(rolename).."]], [["..safestr(msg).."]], "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

function _msg(...)
	local str = "+++DEBUG["..date("%H:%M:%S").."]: "..join(arg)
	OutputMsg(str)
end



function tongwar_redo_start(szParam)
OutputMsg(szParam.."TrËn bæ sung - Vâ L©m §Ö NhÊt Bang")
	local aryParam = split(szParam, " ")
	if (aryParam == nil or getn(aryParam) ~= 9) then
		OutputMsg("error!! tongwar_redo_start the Param error!")
		return
	end
	for i = 1, getn(aryParam) do
		aryParam[i] = tonumber(aryParam[i])
	end
		OutputMsg(format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", aryParam[1], aryParam[2], aryParam[3], aryParam[4], aryParam[5], aryParam[6], aryParam[7], aryParam[8], aryParam[9]))
		GlobalExecute(format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", aryParam[1], aryParam[2], aryParam[3], aryParam[4], aryParam[5], aryParam[6], aryParam[7], aryParam[8], aryParam[9]))
end

--Èç¹ûÎªnil»ò0£¬·µ»Ø1£¬·ñÔò·µ»Ø0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

