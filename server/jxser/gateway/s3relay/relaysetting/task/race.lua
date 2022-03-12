

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Ho¹t ®éng ngµy lÔ——Cuéc ®ua bèn mïa")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(15) --15Ò»´Î
	
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	OutputMsg("=================Ho¹t ®éng ngµy lÔ——Cuéc ®ua bèn mïa==================");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	
	if nDate < 080611 or nDate > 080713 then --´Ó2008Äê06ÔÂ11ºÅ ÖÁ¨C 2008Äê07ÔÂ13ºÅ24µã
		return
	end
	local bIsStart = 0
	if (nHour >= 10 and nHour < 11) or (nHour >= 22 and nHour < 23) then
		bIsStart = 1
	elseif nHour >= 14 and nHour < 15 and (nWeek == 6 or nWeek == 0 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	elseif nHour >= 2 and nHour < 3 and  (nWeek == 6 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		GlobalExecute("dwf \\script\\missions\\racegame\\missionctrl.lua startRaceMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "HiÖn t¹i cã thÓ ®Õn Minh NguyÖt TrÊn ®Ó b¸o danh tham gia, 1 phót sau cuéc ®ua sÏ b¾t ®Çu."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


