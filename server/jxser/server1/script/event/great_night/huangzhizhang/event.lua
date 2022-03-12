if not GREATNIGHT_HUANGZHIZHANG  then
GREATNIGHT_HUANGZHIZHANG = 1

Include("\\script\\lib\\gb_taskfuncs.lua")
GN_EVENTNAME = "Ho¹t ®éng Hoµng chi ch­¬ng"
TB_HUANGZHIZHANG_EVENT = {
		"ChiÕn tr­êng Tèng Kim",
		"NhiÖm vô TÝn Sø ",
		"Th¸ch thøc thêi gian",
		"Chuçi nhiÖm vô D· TÈu",
		--"Í¬°é¾çÇéÈÎÎñÐÞÁ¶Æª£¬Í¬°éÐÞÁ¶ÈÎÎñ",
	}
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3
function greatnight_huang_event(event)
	--»î¶¯»¹Ã»¿ªÊ¼
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		return 1
	end
	local award_times = gn_getaward_times()	--µ±Ìì»î¶¯½±Àø·­±¶±¶Êý
	--Àñ¹Ù²éÑ¯µ±Íí»î¶¯
	if (event == nil) then
		--·Ç1±íÊ¾·µ»Ø3¸ö²ÎÊý£º 0£¬»î¶¯ID£¬½±Àø·­±¶±¶Êý
		return 0, gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID), award_times
	end
--	--»¹²»ÊÇ»î¶¯Ê±¼ä
--	if (tonumber(GetLocalDate("%H%M")) < 2055 or tonumber(GetLocalDate("%H%M")) > 2255) then
--		return 1
--	end
	--»î¶¯»¹Î´¿ªÊ¼
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) == 0) then
		return 1
	end
	
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == event) then
		return award_times
	end
	
	return 1
end

function gn_getaward_times()
--	local nWeek = tonumber(GetLocalDate("%w"))
--	if (nWeek == 6 or nWeek == 0) then
--		return 3	--ÖÜÄ©3±¶
--	else
		return 2	--Æ½Ê±2±¶
--	end
end

function huang_event_hint()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return format("%s%s%s%s%s",
				"Ho¹t ®éng Hoµng chi ch­¬ng diÔn ra vµo <color=yellow>21h00 ®Õn 23h00<color> mçi tèi. Trong kho¶ng thêi gian nµy, ®¹i hiÖp sÏ ®­îc nh©n ®«i phÇn th­ëng khi tham gia mét ho¹t ®éng yªu cÇu. <enter>Ho¹t ®éng yªu cÇu ngµy h«m nay lµ: <enter>",
				"Tèng Kim ®¹i chiÕn <enter>",
				"Th¸ch thøc thêi gian <enter>",
				"Chuçi nhiÖm vô D· TÈu <enter>",
				"Mçi<color=yellow>8 giê tèi <color>, ng­êi ch¬i cã thÓ ®Õn LÔ quan ®Ó t×m hiÓu chi tiÕt ho¹t ®éng.§õng bá lì c¬ héi nhËn quµ cña §éc C« Minh Chñ.")
		
	else
		return format("Thêi gian ho¹t ®éng 'Hoµng chi ch­¬ng' lµ <color=yellow>21h00 ®Õn 23h00<color> hµng ®ªm. Ho¹t ®éng ®ªm nay lµ:  <enter><color=yellow>%s<color><enter><enter>C¸c vÞ ®¹i hiÖp h·y nhanh ch©n b¸o danh tham gia.",
					TB_HUANGZHIZHANG_EVENT[eventid])
	end
end

function huang_event_name()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return "Ch­a biÕt"
	else
		return TB_HUANGZHIZHANG_EVENT[eventid]
	end
end

function huang_event_msg()
	local name = huang_event_name()
	return format("Ho¹t ®éng Hoµng chi ch­¬ng sÏ diÔn ra lóc 21h00 ®ªm nay, ho¹t ®éng nh©n ®«i phÇn th­ëng liªn quan lµ: <color=yellow>%s<color>",name)
end

function seed_birth_city()
	local MapStr = "§«ng m«n D­¬ng Ch©u";
	if (1 == gb_GetTask("h¹t Huy Hoµng", 1)) then
		MapStr = "B¾c m«n §¹i Lý ";
	end;
	return format("12h00 tr­a nay sÏ b¾t ®Çu ho¹t ®éng Huy chi ch­¬ng, qu¶ Hoµng Kim sÏ xuÊt hiÖn t¹i <color=yellow>%s<color>",MapStr)
end

if EVENTS_TB then 
EVENTS_TB[getn(EVENTS_TB)+1] = {	--»ÔÖ®ÕÂ
			name = "Huy Hoµng",
			describe = seed_birth_city
		}
EVENTS_TB[getn(EVENTS_TB)+1] = {	--»ÍÖ®ÕÂ
			name = "Hoµng chi ch­¬ng",
			describe = huang_event_msg
		}
end
end