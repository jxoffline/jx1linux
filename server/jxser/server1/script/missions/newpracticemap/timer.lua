IncludeLib("TIMER")
Include("\\script\\missions\\newpracticemap\\head.lua")

function OnTimer()
	
	-- ¼ì²éµ±Ç°µÄ mapid
	local nMapType = tbNewPracticeMap:checkMapId();
	
	if nMapType ~= 1 and nMapType ~= 2 then
		if tbNewPracticeMap.bDeBug == 1 then
			print("Wrong Map");
		end
		return
	end
	
	-- ¼ì²é²¢Ô¤¿Û³ýÍæ¼ÒµÄÊ£ÓàµÄÊ±¼ä
	local nTimeLeft;
	
	if nMapType == 1 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_A) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_A, nTimeLeft);
	elseif nMapType == 2 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_B) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_B, nTimeLeft);
	end

	if tbNewPracticeMap.bDeBug == 1 then
		print("Name:"..GetName().." MapType:"..nMapType.." TimeLeft:"..nTimeLeft);
	end
	
	-- ¿ªÆôÏÂÒ»¸öTimer
	TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	
	if nTimeLeft < 0 then
		Msg2Player("Thêi gian tu luyÖn cña ®¹i hiÖp ®· kÕt thóc, sÏ bÞ c­ìng chÕ ®Èy khái b¶n ®å!");
		local nSubWorldId, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nSubWorldId, nX/32, nY/32);
		return
	end
		
	if nTimeLeft <= tbNewPracticeMap.WarningTime then
		Msg2Player("Thêi gian tu luyÖn cña ®¹i hiÖp ®· kÕt thóc, h·y chuÈn bÞ rêi khái b¶n ®å!");
	end
		
end

