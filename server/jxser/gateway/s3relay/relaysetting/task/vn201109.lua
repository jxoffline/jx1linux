-- Ô½ÄÏÊÕ·Ñ2011Äê9ÔÂ»î¶¯(¹úÇì½ÚºÍÖÐÇï½Ú),ÔÚÆß´ó³ÇÊÐ·ÅÑÌ»¨
Include("\\script\\lib\\objbuffer_head.lua")


local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	local nNextHour = nStartHour;
	local nNextMinute = ceil(nStartMinute / nInterval) * nInterval + nInterval;
	
	if nStartMinute >= 50 then
		nNextMinute = 0;
		if nStartHour == 23 then
			nNextHour = 0;
		else
			nNextHour = nStartHour + 1;
		end		
	end			
	return nNextHour, nNextMinute;
end

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("vn201109");

	local  nInterval = 10;	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = % _GetNexStartTime(nStartHour, nStartMinute, nInterval);
	TaskTime(nNextHour, nNextMinute);

	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(nInterval);--nInterval·ÖÖÓÒ»´Î

	--ÉèÖÃ´¥·¢´ÎÊý£¬0±íÊ¾ÎÞÏÞ´ÎÊý²»
	TaskCountLimit(0);
	OutputMsg("Æô¶¯¹úÇì½ÚºÍÖÐÇï½Ú»î¶¯");
end

function TaskContent()
	
	local  nInterval = 10;
	local nTime = tonumber(date("%H"));
	local nDate	= tonumber(date("%Y%m"));
	
	OutputMsg(format("LÔ Quèc Kh¸nh vµ TÕt Trung Thu %d--%d", nDate, nTime));
	-- ´Ó2011Äê9ÔÂ1ÈÕµ½2011Äê9ÔÂ30ÈÕ24Ê±,Ã¿Ìì20µã--21µã,ÔÚÆß´ó³ÇÊÐÊÍ·Å¹úÇì»¨ÅÚ¶à10%µÄ¾­Ñé½±Àø.
	if nDate == 201109 and nTime == 20 then
		local tCity =	{{1, "Ph­îng T­êng"},{11, "Thµnh §«"},{162, "§¹i Lý"},{37, "BiÖn Kinh"},
									{78, "T­¬ng D­¬ng"},{80, "D­¬ng Ch©u"},{176, "L©m An"}};
		local nItem = random(1, 7);
		local nStartHour = tonumber(date("%H"));
		local nStartMinute = tonumber(ceil(tonumber(date("%M"))/nInterval)*nInterval);
		local nNextHour, nNextMinute = % _GetNexStartTime(nStartHour, nStartMinute, nInterval);
		local tCity =	{{1, "Ph­îng T­êng"},{11, "Thµnh §«"},{162, "§¹i Lý"},{37, "BiÖn Kinh"},
										{78, "T­¬ng D­¬ng"},{80, "D­¬ng Ch©u"},{176, "L©m An"}};
		local nItem = random(1, 7);
		local strMsg = format("Tõ %d: %02d ®Õn %d: %02d t¹i %s sö dông Ph¸o Hoa Quèc Kh¸nh sÏ nhËn ®­îc thªm 10%% kinh nghiÖm.", 
				nStartHour, nStartMinute, nNextHour, nNextMinute, tCity[nItem][2]);		
		OutputMsg(strMsg);
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", strMsg));

		local handle = OB_Create();
		ObjBuffer:PushObject(handle, tCity[nItem][1]);
	  RemoteExecute("\\script\\activitysys\\config\\33\\extend.lua", "SetSeptemperRewardsCityMapID", handle);
	  OB_Release(handle);
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end