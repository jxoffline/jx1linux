-- Event NhËn tiªn th¶o lé ®Æc biÖt Vinagame
--Th¸ng 8 n¨m 2008
-- Created by TuanNA5

TTL_DATE_START = 0808150000
TTL_DATE_END = 0809152400

TTL_GOT_TIME = 1980

MAX_TTL = 8

function get_thaolo()
	local nUsedTime = 0;
	local nTimes = 0;
	
	if check_thaolo_date() == 0 then
		Say("Ho¹t ®éng lÇn nµy ®· kÕt thóc.",0)
		return 0
	end	
	
	nUsedTime = GetTask(TTL_GOT_TIME)
	nTimes = MAX_TTL - nUsedTime
	
	if nTimes < 0 then
		nTimes = 0
	end
	
	strTalk = "Trong thêi gian 10/08/2008 - 10/09/2008 b»ng h÷u sÏ ®­îc tÆng 8 Tiªn Th¶o Lé ®Æc biÖt. Tiªn Th¶o Lé sÏ ph¸t huy t¸c dông trong vßng 2 giê ngay sau khi b»ng h÷u nhËn ®­îc. B»ng h÷u cßn "..nTimes.." lÇn. NÕu hÕt thêi h¹n kh«ng nhËn hÕt Tiªn Th¶o Lé b»ng h÷u sÏ kh«ng nhËn ®­îc n÷a."
	
	Say(strTalk,2,"Ta muèn nhËn/say_yes","Ch­a cÇn/say_no")
	
end

function say_yes()
	if check_thaolo_date() == 1 then
		local nUsedTime = GetTask(TTL_GOT_TIME)
		if nUsedTime >= 0 and nUsedTime < 8 then
			AddSkillState(440, 1, 1, 64800 * 2);
			SetTask(TTL_GOT_TIME, GetTask(TTL_GOT_TIME) +1)
			Say("Tiªn Th¶o Lé b¾t ®Çu ph¸t huy t¸c dông",0)
			Msg2Player("B¹n nhËn ®­îc t¸c dông Tiªn Th¶o Lé trong 2 giê.")
			WriteLog("[Ho¹t ®éng Tiªn Th¶o Lé]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." NhËn ®­îc Tiªn Th¶o Lé")
		else
			Say("Ng­¬i ®· nhËn ®ñ Tiªn Th¶o Lé!",0)
			Msg2Player("B¹n nhËn ®· nhËn ®ñ 8 Tiªn Th¶o Lé.")
			return 0
		end	
	end
end

function check_thaolo_date()
	local nDate = tonumber(GetLocalDate("%y%m%d%H%M"));
	if nDate >=  TTL_DATE_START and nDate <= TTL_DATE_END then
		return 1
	end
	return 0
end

function say_no()
end