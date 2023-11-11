-- 120¼¶¼¼ÄÜÈÎÎñ£¬120¼¶¼¼ÄÜÊé

Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\item\\skillbook.lua")

function main(idxItem)
	
	if GetLastFactionNumber()==-1 then	
		Msg2Player("<color=yellow>Ch­a gia nhËp m«n ph¸i, kh«ng thÓ häc kü n¨ng nµy!<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>§¼ng cÊp ch­a ®ñ 120, kh«ng thÓ häc kü n¨ng nµy!<color>");
		return 1;
	end;
	
	if GetTask(LV120_SKILL_ID)>0 then
		Msg2Player("<color=yellow>§· lÜnh héi ®­îc kü n¨ng 120 råi, cßn muèn häc thªm n÷a sao?<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetLastFactionNumber(), LV120SKILL_LIST) == 0) then
		SetTask(LV120_SKILL_ID, LV120SKILL_LIST[GetLastFactionNumber()][1])
		WriteLog("[Ghi l¹i viÖc häc kü n¨ng cÊp 120]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."] Sö dông s¸ch kü n¨ng cÊp 120, häc ®­îc kü n¨ng:"..GetLastFactionNumber());
		return 0
	end
	return 1
end
