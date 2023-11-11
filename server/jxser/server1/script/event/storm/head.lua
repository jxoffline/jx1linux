--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskIDÆðÊ¼Öµ

STORM_TASKID_DAY			= STORM_TASKID_BASE+1	--ÉÏÒ»´Î´¥·¢±¾ÏµÍ³µÄÌìÊý£¨2005Äê1ÔÂ1ÈÕÆðµÄµÚ¼¸Ìì£©
STORM_TASKID_DAY_POINT		= STORM_TASKID_BASE+2	--µ±ÈÕ×Ü»ý·Ö
STORM_TASKID_DAY_LASTPOINT	= STORM_TASKID_BASE+3	--×òÈÕ×Ü»ý·Ö
STORM_TASKID_DAY_AWARD		= STORM_TASKID_BASE+4	--ÊÇ·ñÒÑÁìÈ¡Ã¿ÈÕ½±Àø£¨1¡¢ÊÇ£¬0¡¢·ñ£©
STORM_TASKID_DAY_LASTAWARD	= STORM_TASKID_BASE+5	--ÊÇ·ñÒÑÁìÈ¡×òÈÕ½±Àø£¨1¡¢ÊÇ£¬0¡¢·ñ£©

STORM_TASKID_WEEK			= STORM_TASKID_BASE+6	--ÉÏÒ»´Î´¥·¢±¾ÏµÍ³µÄÖÜÊý£¨2005Äê1ÔÂ1ÈÕÆðµÄµÚ¼¸ÖÜ£©
STORM_TASKID_WEEK_POINT		= STORM_TASKID_BASE+7	--±¾ÖÜ×Ü»ý·Ö
STORM_TASKID_WEEK_LASTPOINT	= STORM_TASKID_BASE+8	--ÉÏÖÜ×Ü»ý·Ö
STORM_TASKID_WEEK_AWARD		= STORM_TASKID_BASE+9	--ÊÇ·ñÒÑÁìÈ¡Ã¿ÖÜ½±Àø£¨1¡¢ÊÇ£¬0¡¢·ñ£©

STORM_TASKID_MONTH			= STORM_TASKID_BASE+11	--ÉÏÒ»´Î´¥·¢±¾ÏµÍ³µÄÔÂÊý£¨2005Äê1ÔÂ1ÈÕÆðµÄµÚ¼¸ÔÂ£©
STORM_TASKID_MONTH_POINT	= STORM_TASKID_BASE+12	--±¾ÔÂ×Ü»ý·Ö
STORM_TASKID_MONTH_LASTPOINT= STORM_TASKID_BASE+13	--ÉÏÔÂ×Ü»ý·Ö
STORM_TASKID_MONTH_AWARD	= STORM_TASKID_BASE+14	--ÊÇ·ñÒÑÁìÈ¡Ã¿ÔÂ½±Àø£¨1¡¢ÊÇ£¬0¡¢·ñ£©

STORM_TASKID_GAMEID_SS		= STORM_TASKID_BASE+16	--µ±Ç°É±ÊÖÊÔÁ¶µÄGameID£¬ÓÃÓÚÅÐ¶ÏÊÇ²»ÊÇÍ¬Ò»³¡±ÈÈü
STORM_TASKID_GAMES			= STORM_TASKID_BASE+17	--½ñÌì²Î¼Ó¹ýµÄ»î¶¯×ÜÊý£¬Í¬Ò»¸ö»î¶¯¶à´Î²Î¼ÓÖ»¼ÇÒ»´Î
STORM_TASKID_DATE			= STORM_TASKID_BASE+18	--×îºóÒ»´Î´¥·¢±¾ÏµÍ³µÄÈÕÆÚ£¬ÓÃÓÚÈÎÎñÃæ°åÏÔÊ¾
STORM_TASKID_LETTER			= STORM_TASKID_BASE+19	--ÊÇ·ñÁìÈ¡¹ýÐÅ
STORM_TASKID_TIPS			= STORM_TASKID_BASE+20	--LogInÊ±ÌáÊ¾¹ýµÄ´ÎÊý

--Ã¿¸ö»î¶¯µÄTaskValue£¨TaskIDÊý×éµÄ½Ç±ê£©
STORM_TASKIDX_START		= 1	--»î¶¯¿ªÊ¼µÄÊ±¼ä£¨³¡´Î£©
STORM_TASKIDX_TRYCOUNT	= 2	--»î¶¯½øÐÐ¹ýµÄ´ÎÊý
STORM_TASKIDX_POINTCUR	= 3	--»î¶¯µÄµ±Ç°·ç±©»ý·Ö
STORM_TASKIDX_POINTEX	= 4	--»î¶¯µÄµ±Ç°·ç±©»ý·Ö½±Àø·Ö£¨Ê±¼ä½±Àø/²ÎÓë½±Àø£©
STORM_TASKIDX_POINTMAX	= 5	--»î¶¯µÄµ±ÈÕ×î¸ß·ç±©»ý·Ö¼ÍÂ¼
STORM_TASKIDX_EXTRA		= 6	--¼ÆËã»ý·ÖÓÃµ½µÄ¶îÍâ±äÁ¿£¨µ±Ç°Ô­Ê¼·Ö/»î¶¯³õÊ¼·Ö£©
STORM_TASKIDX_MODE		= 7	--Ëù²Î¼ÓµÄ»î¶¯µÄÏêÏ¸Ä£Ê½/¼¶±ð

--====Ê±¼äÏà¹Ø====--
--´Ó2005ÄêÆðµÄÃ¿ÄêÌìÊý¼ÆÊýÆðÊ¼Öµ
TB_STORM_DAYS = {}
TB_STORM_DAYS[2005]	= 0
TB_STORM_DAYS[2006]	= 365
TB_STORM_DAYS[2007]	= 730
TB_STORM_DAYS[2008]	= 1095
TB_STORM_DAYS[2009]	= 1461
TB_STORM_DAYS[2010]	= 1826

--´Ó2005ÄêÆðµÄÃ¿ÄêÖÜÊý¼ÆÊýÆðÊ¼Öµ£¨Ïàµ±ÓÚ¼ÆËãÃ¿ÄêÓÐ¶àÉÙ¸öÐÇÆÚÒ»£©
TB_STORM_WEEKS = {}
TB_STORM_WEEKS[2005]	= 0
TB_STORM_WEEKS[2006]	= 52
TB_STORM_WEEKS[2007]	= 104
TB_STORM_WEEKS[2008]	= 157
TB_STORM_WEEKS[2009]	= 209
TB_STORM_WEEKS[2010]	= 261

STORM_LADDER_WEEK		= 36	--´ÓµÚ¼¸ÖÜ¿ªÊ¼ËãÅÅÐÐ
STORM_LADDERID_WEEK1	= 10182	--µÚÒ»ÖÜÅÅÐÐ
STORM_LADDERID_WEEK2	= 10183	--µÚ¶þÖÜÅÅÐÐ
STORM_LADDERID_WEEK3	= 10184	--µÚÈýÖÜÅÅÐÐ
STORM_LADDERID_WEEK4	= 10185	--µÚËÄÖÜÅÅÐÐ
STORM_LADDERID_MONTH	= 10186	--±¾ÔÂÅÅÐÐ£¨ÔÝ¶¨È«²¿£¿£©

STORM_TIMERID_YS	= 44	--Ò°ÛÅÈÎÎñµ¹¼ÆÊ±
STORM_TIMER_YS		= 5		--Ò°ÛÅÈÎÎñµ¹¼ÆÊ±ÆµÂÊ£¬5·ÖÖÓ

STORM_END_DAY	= 275	--»ý·Ö·ç±©½áÊøÊ±¼ä

IL("RELAYLADDER");
IL("TIMER");

--µ÷ÊÔÊ±ÓÃµÄÊä³ö£¬ÁÙÊ±
function debug_out(str)
	--print(GetName()..":::"..str)
	--Msg2Player("<color=white>DEBUG:"..str.."<color>")
end

--´øÍ¬²½µÄSetTask
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

--¼ì²âÈÕÆÚ£¬Èç¹û¹ýÁËÒ»Ìì·µ»Ø1£¬·ñÔò·µ»Ønil
--±¾º¯ÊýÍ¬Ê±´¦Àí¿çÈÕ¡¢¿çÖÜ¡¢¿çÔÂºóµÄ×Ü»ý·Ö¼ÆËã¡¢ÈÎÎñÇ¿ÐÐ½áÊøµÈ
function storm_anotherday()
	local ndate = tonumber(GetLocalDate("%j%Y"))
	local nowyear = mod(ndate,10000)
	local nowday = floor(ndate/10000) + TB_STORM_DAYS[nowyear]

	--====¿çÈÕ´¦Àí====--
	local lastday = GetTask(STORM_TASKID_DAY)
	if (nowday <= lastday) then	--Ã»ÓÐ¿çÈÕ£¨²»ÔÊÐíÊ±¼äµ¹ÍË£©£¬Ö±½Ó·µ»Ø
		return nil
	else
		if (lastday>0) then	--×ö¼ÇÂ¼
			local loghead = "[STORM]"..lastday.."\t"..GetName().."\t"
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local gamemode = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_MODE])
					local extra = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_EXTRA])
					local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
					WriteLog(loghead..TB_STORM_DESCRIBE[i].."["..gamemode.."]\t"..extra.."\t"..point)
				end
			end
		end
		--Çå³ý»î¶¯±ê¼Ç
		for i = 1, STORM_GAMEID_MAX do
			if (TB_STORM_TASKID[i] ~= nil) then
				for j = 1, getn(TB_STORM_TASKID[i]) do
					SetTask(TB_STORM_TASKID[i][j],0)
				end
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			end
		end
		SetTask(STORM_TASKID_GAMES, 0)
		
		if (lastday + 1 == nowday) then	--Ö»²îÒ»Ìì£¬¼ÇÂ¼×òÈÕ»ý·Ö
			nt_settask(STORM_TASKID_DAY_LASTPOINT, GetTask(STORM_TASKID_DAY_POINT))
			SetTask(STORM_TASKID_DAY_LASTAWARD, GetTask(STORM_TASKID_DAY_AWARD))
			debug_out("TÝch lòy h«m qua cña b¹n lµ:"..GetTask(STORM_TASKID_DAY_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_DAY_LASTPOINT, 0)
			SetTask(STORM_TASKID_DAY_LASTAWARD, 1)	--×òÌìÃ»ÓÐ²ÎÓë·ç±©»î¶¯£¬Ã»»ý·Ö£¬¾Íµ±ËûÁì¹ý½±ÁË£¿
		end
		nt_settask(STORM_TASKID_DAY, nowday)
		nt_settask(STORM_TASKID_DAY_POINT, 0)
		SetTask(STORM_TASKID_DAY_AWARD, 0)
		SetTask(STORM_TASKID_GAMES, 0)
		SetTask(STORM_TASKID_TIPS, 0)
		nt_settask(STORM_TASKID_DATE, tonumber(GetLocalDate("%Y%m%d")))	--¼ÇÂ¼ÈÕÆÚ£¬ÓÃÓÚÈÎÎñÃæ°åÏÔÊ¾
	end
	
	--====¿çÖÜ¡¢¿çÔÂ´¦Àí====--
	ndate = tonumber(GetLocalDate("%W%m"))
	local nowweek = floor(ndate/100) + TB_STORM_WEEKS[nowyear]
	local nowmonth = mod(ndate,100) + (nowyear-2005)*12
	if (tonumber(GetLocalDate("%d")) <= 2) then	--ÔÝÊ±ÒÔ2ºÅÎª·Ö½çÏß
		nowmonth = nowmonth - 1
	end
	--ÊÇ·ñ¿çÖÜ
	local lastweek = GetTask(STORM_TASKID_WEEK)
	if (nowweek ~= lastweek) then	--ÓÐ¿çÖÜ
		if (lastweek + 1 == nowweek) then	--Ö»²îÒ»ÖÜ£¬¼ÇÂ¼ÉÏÖÜ»ý·Ö
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, GetTask(STORM_TASKID_WEEK_POINT))
			debug_out("TÝch lòy tuÇn tr­íc cña b¹n lµ:"..GetTask(STORM_TASKID_WEEK_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_WEEK, nowweek)
		nt_settask(STORM_TASKID_WEEK_POINT, 0)
		SetTask(STORM_TASKID_WEEK_AWARD, 0)
	end
	--ÊÇ·ñ¿çÔÂ
	local lastmonth = GetTask(STORM_TASKID_MONTH)
	if (nowmonth ~= lastmonth) then	--ÓÐ¿çÔÂ
		if (lastmonth + 1 == nowmonth) then	--Ö»²îÒ»ÔÂ£¬¼ÇÂ¼ÉÏÔÂ»ý·Ö
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, GetTask(STORM_TASKID_MONTH_POINT))
			debug_out("TÝch lòy th¸ng tr­íc cña b¹n lµ:"..GetTask(STORM_TASKID_MONTH_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_MONTH, nowmonth)
		nt_settask(STORM_TASKID_MONTH_POINT, 0)
		SetTask(STORM_TASKID_MONTH_AWARD, 0)
	end
	
	return 1
end

--¼ì²éÖ¸¶¨µÄ»î¶¯¼Æ·ÖÊÇ·ñÈÔÈ»ÓÐÐ§
--·µ»Ø1ÓÐÐ§£»nilÎÞÐ§£¨³¬Ê±»ò¿çÈÕ£©
function storm_valid_game(gameid)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local starttime = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START])
	if (starttime == 0) then	--¸Ã»î¶¯µÄ¼Æ·ÖÉÐÎ´¿ªÊ¼£¬»òÕßÒÑ¾­½áÊøÁË
		return nil
	end

	if (storm_anotherday()) then	--¸ôÁËÒ»Ìì£¬»î¶¯ÎÞÐ§
		return nil
	end
	
	if (not storm_gametime(gameid, starttime, storm_gettime(gameid))) then	--»î¶¯³¬Ê±
		--storm_end(gameid, 1)
		return nil
	end
	
	return 1	
end

--½áÊøÄ³Ò»»î¶¯µÄ¼Æ·Ö£¨²»ÊÇ±ØÐèµÄ£¬½áÊøºó¿ÉÒÔÊ¹µÃÒ»Ð©Ïà¹ØµÄº¯Êý·´Ó¦¸ü¿ì£©
--gameid£º	1~10	»î¶¯µÄID
function storm_end(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end

	if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START]) == 0) then
		return nil
	end

	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], 0)

	if (not silent) then
		Say(storm_gamename(gameid, "red").."Khiªu chiÕn Phong Ba ®· kÕt thóc. §iÓm tÝch lòy Phong Ba hiÖn cã lµ:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), 0)
	else
		debug_out(storm_gamename(gameid).."Khiªu chiÕn Phong Ba ®· kÕt thóc. §iÓm tÝch lòy Phong Ba hiÖn cã lµ:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)))
	end
	
	return 1
end

--½«Êý×Ö×ªÎªÖ¸¶¨³¤¶È¡¢´øÑÕÉ«µÄ×Ö·û´®
--len£º	Ö¸¶¨³¤¶È£¬nilÎª²»ÏÞ¶¨£¬0ÎªÄ¬ÈÏÖµ
function storm_point2str(point, len)
	local str = tostring(point)
	if (len ~= nil) then
		if (len == 0) then
			len = 5
		end
		
		while (strlen(str) < len) do
			str = " "..str
		end
	end
	
	return "<color=yellow>"..str.."<color>"
end

--·µ»ØÓÐÑÕÉ«µÄ»î¶¯Ãû³Æ
function storm_gamename(gameid,color)
	if (color == nil) then
		color = "white"
	end
	return "[<color="..color..">"..TB_STORM_DESCRIBE[gameid].."<color>]"
end

function OnCancel()
end

Include("\\script\\event\\storm\\custom.lua")

