Include("\\script\\event\\other\\caipiao\\head_gs.lua")
Include("\\script\\event\\poster\\head.lua")

function main()
	

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nDate >= 201006190000 and nDate <= 201007310000) then
		local tbOpt = {}
		local szTitle = "<#>".."Xin hái §¹i hiÖp cÇn g×?";
		tinsert(tbOpt, "Ta muèn nhËn phÇn th­ëng Poster/GetDialogPoster")
		tinsert(tbOpt, "Tho¸t/OnCancel")
		Say(szTitle, getn(tbOpt), tbOpt)
	end

	
	if 201002040000 > nDate or nDate > 201003220000 then
		--return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.")	
	else
	
		local szTitle = "<npc>".."Ph¸t tµi råi! ThËt lµ may m¾n, xem ra c¸c h¹ rÊt cã duyªn víi trß nµy!";
		
		
		
		local nWeekDay = tbCaiPiao:GetCurAwardWeekDay()
		
		local szKey = ""
		local szKey2 = ""
		if not nWeekDay or nWeekDay <=0 then
			
			szKey = nil
		elseif mod(nWeekDay, 10) == 0 then
			szKey = "PhÇn th­ëng mçi tuÇn"
			szKey2 = szKey
		else
			szKey = "®ît nµy"
			szKey2 = "PhÇn th­ëng ®ît nµy"
		end
		
		
		
		local tbOpt = {}
		if szKey then
			local szOpt1 = format("Xem sè tróng th­ëng %s", szKey)
			local szOpt2 = format("NhËn %s", szKey2)	
			tinsert(tbOpt, {szOpt1, tbCaiPiao.QueryResult,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {szOpt2, tbCaiPiao.ApplyGetAward,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {"Ta chØ tiÖn ®­êng ghÐ ch¬i"})
		else
			tinsert(tbOpt, {"HiÖn t¹i vÉn ch­a cã kÕt qu¶, ®îi cã kÕt qu¶ råi l¹i ®Õn nhÐ!"})
		end
			
		
		CreateNewSayEx(szTitle, tbOpt)
	end
end

