

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Häat ®éng ®Ìn kĞo qu©n")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(30) --30·ÖÖÓÒ»´Î
	
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	OutputMsg("Häat ®éng ®Ìn kĞo qu©n");
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	if nDate < 080905 or nDate > 081005 then --2008Äê09ÔÂ05ÈÕÖÁ2008Äê10ÔÂ5ÈÕ24µã
		return
	end
	
	local flag = 0
	if (nTime >= 1900 and nTime <= 1902) or (nTime >= 2130 and nTime <= 2132) then
		flag = 1
	elseif (nWeek == 5 or nWeek == 6 or nWeek == 0) and (nTime >= 1100 and nTime <= 1102) then
		flag = 1
	elseif (nTime >= 2000 and nTime <= 2002) or (nTime >= 2230 and nTime <= 2232) then
		flag = 2
	elseif (nWeek == 5 or nWeek == 6 or nWeek == 0) and (nTime >= 1200 and nTime <= 1202) then
		flag = 2
	end
	
	
	
	if flag == 1 then
		local tbMap = 
		{
			{nId = 121, szName = "Long M«n trÊn", tbPos = { {226,275}, {276,282} } },
			{nId = 100, szName = "Chu Tiªn trÊn", tbPos = { {183,203}, {229,190} } },
			{nId = 101, szName = "§¹o H­¬ng th«n", tbPos = { {171,198}, {232,205} } },
			{nId = 174, szName = "Long TuyÒn th«n", tbPos = { {218,192}, {183,211} } },
			{nId = 53, szName = "Ba L¨ng huyÖn", tbPos = { {220,200}, {207,182} } },
			{nId = 20, szName = "Giang T©n Th«n", tbPos = { {432,359}, {438,396} } },
			{nId = 153, szName = "Th¹ch Cæ trÊn", tbPos = { {232,180}, {189,223} } },
			{nId = 99, szName = "VÜnh L¹c trÊn", tbPos = { {189, 223}, {224,206} } },
		}
		local nMapCount = getn(tbMap)
		for i=1, 4 do
			local nIdx = random(1,nMapCount+1-i);
			
			
			local tbFnagxiang = 
			{
				[1] = "§Ìn kĞo qu©n §«ng",
				[2] = "§Ìn kĞo qu©n T©y",
				[3] = "§Ìn kĞo qu©n Nam",
				[4] = "§Ìn kĞo qu©n B¾c",
			}
			local nPosIdx = random(1, getn(tbMap[nIdx].tbPos))
			local nX = tbMap[nIdx].tbPos[nPosIdx][1] * 8
			local nY = tbMap[nIdx].tbPos[nPosIdx][2] * 16
			
			local szExec = format("dwf \\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\callnpc.lua zhongqiu0808_CallBoss(%d, %d, %d, %d, %d)", tbMap[nIdx].nId, nX, nY, i ,tonumber(nTaskState..i))
			OutputMsg(szExec);
			GlobalExecute(szExec)
			tbMap[nMapCount+1-i], tbMap[nIdx] = tbMap[nIdx], tbMap[nMapCount+1-i] --°ÑÑ¡ÖĞµÄ·Åµ½ºóÃæ
		end		
		local szMsg = "Lång ®Ìn kĞo qu©n §«ng, T©y, Nam, B¾c ®· xuÊt hiÖn, mêi c¸c vŞ ®¹i hiÖp tham gia ®èt ®Ìn."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	elseif flag == 2 then
		local szMsg = "§ît ®èt ®Ìn kĞo qu©n lÇn nµy ®· kÕt thóc, chóc c¸c vŞ ®¹i hiÖp may m¾n h¬n ë lÇn kÕ tiÕp."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg(szMsg);
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


