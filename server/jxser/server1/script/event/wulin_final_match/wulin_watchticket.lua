TV_LASTTIME_BUY = 1600
TV_TICKET1 = 1601
TV_TICKET2 = 1602
IncludeLib("FILESYS")
IncludeLib("ITEM")



function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end

--ÎïÆ·	¸ÅÂÊ	magicscriptID
TAB_LOTTERY_BONUS = 
{
{"Vâ l©m quan chóng lÖnh", 0, 443,1},
{"Phóc Duyªn (®¹i) ",0.05,124,1},
{"Phóc Duyªn (trung) ",0.05,123,1},
{"Phóc Duyªn (tiÓu) ",0.05,122,1},
{"Tiªn Th¶o Lé ",0.1,71,1},
{"Thiªn s¬n  B¶o Lé ",0.1,72,1},
{"B¸ch Qu¶ Lé ",0.1,73,1},
{"Ph¸o Hoa",0.15,11,0},
{"Mai Kh«i Hoa Vò ",0.2,20,0},
{"T©m T©m T­¬ng ¸nh phï ",0.2,18,1},
};

TAB_TICKETBUY =
{
	{0712,20, 20},
	{0713,20,20},
 	{0714,30,30},
 	{0715,30, 30},
 	{0716,25,25},
 	
 	
 	{0717,35,35},
 	{0718,7,8},
 	{0719,7,8},
 	{0720,7,8},
 	{0721,7,8},
	{0722,5,5},
 	{0723,5,5},
};

function wulin_watchticketmain()
	local nowdate = tonumber(date ("%m%d%H") )
	local today = tonumber(date("%m%d"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local matchday = 0
	
	local nowhour = tonumber(date("%H")) 
	--Èç¹ûÏÖÔÚ»¹Ã»ÓÐµ½µ±ÈÕµÄÂòÆ±Ê±¼ä£¬ÔòÄ¿Ç°¶ÒµÄ½±Îª×òÌìµÄ½±
	print("sadbeginf")
	if ( nowhour < 20) then
		local yesterday = today - 1
		local idx = wulin_day2buytabidx(yesterday)

		--Èç¹û×òÌìÃ»ÓÐÂô¹ýÆ±£¬Ôò²»¶Ò½±ÁË£¬Ä¿Ç°µÄÆ±Ò²×ÔÈ»ÊÇ¹ýÆÚµÄ¡£
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--ÉÏ´ÎÂòµÄÆ±ÒÑ¾­¹ýÆÚÔòÇå³ý£¬
			print("now match1")
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--Èç¹ûÏÖÔÚµ½ÁËµ±ÈÕµÄÂò½±»ò¿ª½±Ê±¼ä£¬ÔòÈç¹ûÏÖÔÚÊÇ21£º00 > and  < 23£¬ÔòÄ¿Ç°¶ÒµÄ½±ÊÇ±¾ÈÕµÚÒ»ÆÚ£¬Èç¹û> 23Ôò¶ÒµÄÊÇ±¾ÈÕµÚÒ»¡¢µÚ¶þÆÚµÄ
		
		--Èç¹ûÉÏ´ÎÂòµÄÆ±²»ÊÇ½ñÌìµÄÆ±£¬Ôò¹ýÆÚÁË£¬Çå³ý
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	
	if (bCheckTicket1 == 1 or bCheckTicket2 == 1) then
		local checktab = {};
		if (bCheckTicket1 == 1) then
			checktab[getn(checktab) + 1] = "21:00 Më th­ëng vâ l©m quan chóng lÖnh/#wulin_checkticket(1)";
		end
		if (bCheckTicket2 == 1) then
			checktab[getn(checktab) + 1] = "23:00 Më th­ëng vâ l©m quan chóng lÖnh/#wulin_checkticket(2)";
		end
		checktab[getn(checktab) + 1] = "Kh«ng cÇn!/OnCancel"
		Say("B¹n hiÖn t¹i ch­a nhËn phÇn th­ëng vâ l©m quan chóng lÖnh, b¹n cã muèn nhËn kh«ng?", getn(checktab), checktab)
		return
	end
	
	--Èç¹ûÏÖÔÚÊÇÂòÆ±Ê±¼ä
	if (nowhour == 20 or nowhour == 22) then
		
		if (IsCharged() == 0) then
			Say("Xin lçi! Muèn tham gia ho¹t ®éng nµy cÇn ph¶i n¹p thÎ! B¹n vÉn ch­a n¹p thÎ! Nhanh lªn ®i! §õng bá lì c¬ héi!", 0)
			return 
		end
		
		local buyidx = wulin_day2buytabidx(today)
		if (buyidx == 0) then
			Say("Xin lçi! HiÖn ch­a b¸n vÐ sè Vâ L©m quan chóng lÖnh! H·y quay l¹i sau nhÐ!",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			Say("B¹n ®· mua mét tê vÐ sè cho ho¹t ®éng Vâ l©m quan chóng lÖnh! H·y ®îi më th­ëng nhÐ!", 0)
			return 0
		end
		
		--Èç¹ûÍæ¼Òµ±Ç°µÄÆ±ÒÑ¾­ÊÇ¹ýÆÚµÄÁË£¬ÄÇÃ´Çå³ýÕâÐ©Æ±
		if (wulin_TicketIsTimeout() == 1) then
			SetTask(TV_TICKET1, 0)
			SetTask(TV_TICKET2, 0)
			SetTask(TV_LASTTIME_BUY,0)
		end
		
		local phase = 0
		if (nowhour == 20 ) then
			phase = 1
		else
			phase = 2
		end

		Say("ChØ cÇn dïng 10 l­îng mua 1 tê vÐ sè (mçi giai ®o¹n chØ ®­îc mua 1 tê) . Mçi ngµy tõ 20:00-21:00 mét lÇn vµ 22:00-23:00 mét lÇn",2, "§­îc!/#wulin_payfor_ticket("..phase..")", "Kh«ng cÇn/OnCancel")
		return
	else
		Say("Xin lçi! VÐ sèm tõ 20:00-21:00 vµ 22:00-23:00 míi b¸n! B©y giê kh¸ch quan cã viÖc g× cÇn gióp ®ì kh«ng?",2,"Ta muèn t×m hiÓu ho¹t ®éng Vâ l©m quan chóng lÖnh/wulin_OnHelp", "Kh«ng cÇn/OnCancel")
		return
	end

end
function wulin_OnHelp()
	Say("Mçi ngµy tõ 20:00-21:00 vµ 22:00-23:00, tÊt c¶ mäi ng­êi ch¬i ®· n¹p thÓ ®Õu cã thÓ ®Õn L©m An gÆp Vâ l©m Quan viªn: n¹p 10 v¹n l­îng la cã thÓ tham gia tuyÓn chän",2,"Trang kÕ /wulin_OnHelp1","§ãng/OnCancel")
end

function wulin_OnHelp1()
	Say("Mçi ngµy vµo lóc 21:00 vµ 23:00, hÖ thèng sÏ tÆng cho ng­êi ch¬i tróng th­ëng mét trong: Tiªn Th¶o lé, Thiªn S¬n B¶o Lé, B¸ch Qu¶ Lé, Phóc Duyªn Lé, Ph¸o hoa, Mai Kh«i Hoa Vò, T©m T©m T­¬ng ¸nh Phï…",2,"Trang kÕ /wulin_OnHelp2","§ãng/OnCancel")
end

function wulin_OnHelp2()
	Say("Ng­êi ch¬i tróng th­ëng, tr­íc 20:00 ngµy h«m sau ph¶i ®Õn L©m An gÆp Vâ l©m Quan viªn nhËn Vâ L©m quan chóng lÖnh, qu¸ thêi gian sÏ kh«ng thÓ nhËn. Tr­íc 24h:00 cña ngµy thø 2 cÇn ph¶i x¸c nhËn t­ c¸ch 'Quan chóng lÖnh' míi cã thÓ ®¨ng nhËp Servre thi ®Êu!",2,"Trang kÕ /wulin_OnHelp3","§ãng/OnCancel")
end



function wulin_OnHelp3()
	Say("Sau khi ®¨ng nhËp Servre thi ®Êu, cã thÓ ®Õn gÆp Vâ l©m Quan viªn t¹i 7 thµnh thÞ ®Ó x¸c nhËn t­ c¸ch. Sau ®ã vµo ®Êu tr­êng xem thi ®Êu!",0)
end;

function OnCancel()
end

function wulin_getnowstate()
	local today = tonumber(date("%m%d"))
	local nowhour = tonumber(date("%H"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local ticketday = today
	
	if ( nowhour < 20) then
		local yesterday = today - 1
		ticketday = yesterday
		local idx = wulin_day2buytabidx(yesterday)
		
		--Èç¹û×òÌìÃ»ÓÐÂô¹ýÆ±£¬Ôò²»¶Ò½±ÁË£¬Ä¿Ç°µÄÆ±Ò²×ÔÈ»ÊÇ¹ýÆÚµÄ¡£
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--ÉÏ´ÎÂòµÄÆ±ÒÑ¾­¹ýÆÚÔòÇå³ý£¬
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--Èç¹ûÏÖÔÚµ½ÁËµ±ÈÕµÄÂò½±»ò¿ª½±Ê±¼ä£¬ÔòÈç¹ûÏÖÔÚÊÇ21£º00 > and  < 23£¬ÔòÄ¿Ç°¶ÒµÄ½±ÊÇ±¾ÈÕµÚÒ»ÆÚ£¬Èç¹û> 23Ôò¶ÒµÄÊÇ±¾ÈÕµÚÒ»¡¢µÚ¶þÆÚµÄ
		
		--Èç¹ûÉÏ´ÎÂòµÄÆ±²»ÊÇ½ñÌìµÄÆ±£¬Ôò¹ýÆÚÁË£¬Çå³ý
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	print(ticketday..","..bCheckTicket1..","..bCheckTicket2)
	return ticketday, bCheckTicket1, bCheckTicket2

end	
	
	
	
function wulin_checkticket(phase)	
	local ticketday , bCheckTicket1, bCheckTicket2 = wulin_getnowstate()
	if (phase == 1 ) then
		if (bCheckTicket1 == 0) then
			return
		end
	end
	
	if (phase == 2 ) then
		if (bCheckTicket2 == 0) then
			return
		end
	end
	
	local file = wulin_getcurticketfile(ticketday, phase)
	if (file == "") then
		return
	end
	
	wulin_loadfile(file)
	local bticketstart = tonumber(wulin_getdata(file, "TICKET", "IsBonusCreate"))
	if (bticketstart == 0) then
		Say("Xin lçi! VÉn ch­a ®Õn giê më th­ëng! H·y quay l¹i sau nhÐ!", 0) 
		wulin_start_lottery(phase)
		return 
	end
	local ticketid = 0
	if (phase == 1) then
		ticketid = GetTask(TV_TICKET1)
		SetTask(TV_TICKET1,0)
	elseif (phase == 2) then
		ticketid = GetTask(TV_TICKET2)
		SetTask(TV_TICKET2,0)
	end
	
	if (ticketid == 0) then
		return
	end
	
	if (GetName() ~= wulin_getdata(file, "TICKET", "Ticket"..ticketid)) then
		return
	end
	
	local bonusid = tonumber(wulin_getdata(file, "TICKET", "Bonus"..ticketid))
	if ( bonusid == 1) then
		local itemidx = AddItem(6,1,TAB_LOTTERY_BONUS[1][3],1,0,0,0)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..TAB_LOTTERY_BONUS[1][1].." ");
		Say("Chóc mõng b¹n nhËn ®­îc 1 "..TAB_LOTTERY_BONUS[1][1].." ",0)
		local ticket_mon = floor(tonumber(ticketday) / 100)
		local ticket_day = mod(tonumber(ticketday), 100)

		SetSpecItemParam(itemidx, 1, ticket_mon)
		SetSpecItemParam(itemidx, 2, ticket_day+1)
		
		local str = "Chóc mõng ng­êi ch¬i nhËn ®­îc "..GetName().." nhËn ®­îc"..TAB_LOTTERY_BONUS[1][1].." "
		AddGlobalNews(str)
		wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
		wulin_save(file)
		WriteLog(str)
	elseif (bonusid == 0) then
			local randbonus = random(1,100) 
			local curbonus = 0
			local bonus_data = 0
			for i = 2, getn(TAB_LOTTERY_BONUS) do 
				bonus_data = bonus_data + TAB_LOTTERY_BONUS[i][2]*100
				if (bonus_data >= randbonus) then
					curbonus = i
					break;
				end
			end
			if (curbonus == 0) then
				local msgstr = "Xin lçi! B¹n kh«ng nhËn ®­îc phÇn th­ëng ®ît nµy! Nh­ng vÉn cßn nhiÒu c¬ héi! TiÕp tôc tham gia nhÐ!"
				Say(msgstr,0)
				Msg2Player(msgstr)
				return
			end
			
			AddItem(6,TAB_LOTTERY_BONUS[curbonus][4],TAB_LOTTERY_BONUS[curbonus][3],1,0,0,0)
			local msgmsg = "Chóc mõng b¹n nhËn ®­îc 1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Msg2Player(msgmsg);
			local str = "Chóc mõng"..GetName().."nhËn ®­îc 1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Say(msgmsg, 0)
			wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
			wulin_setdata(file, "TICKET", "Bonus"..ticketid, curbonus)
			wulin_save(file)
			WriteLog(str)
	end
end

function wulin_payfor_ticket(phase)
	if (phase ~= 1 and phase ~= 2) then
		print("Error!!!pay for errror phase ticket ,wulin")
		return
	end
	if (GetCash() < 100000) then
		Say("Ng©n l­îng cña ng­¬i kh«ng ®ñ! H·y quay l¹i sau nhÐ! Nh­ng ph¶i tranh thñ thêi gian ®Êy!", 0) 
		return
	end
	Pay(100000);
	wulin_sure_buyticket(phase)
end
 
function wulin_day2buytabidx(day)
	for i = 1, getn(TAB_TICKETBUY) do
		if (tonumber(day) == TAB_TICKETBUY[i][1]) then
			return i
		end
	end
	return 0
end

function wulin_canbuyticket()
	local nowdate = date("%m%d%H")
	local nowhour = date("%H")
	if (nowhour == 20 or nowhour == 22) then
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			return 0
		end
	else
		return 1
	end
end

--»ñµÃµ±Ç°²Ù×÷µÄÆ±£¬ÏàÓ¦µÄÊý¾ÝÎÄ¼þ
function wulin_getcurticketfile(nowdate, no)
	if (no ~= 1 and no ~= 2) then
		return ""
	end
	
	local idx = wulin_day2buytabidx(nowdate)
	local filename = ""
	
	if (idx >  0 ) then
	 	filename = "\\data\\WULIN_TICKET_"..nowdate.."_"..no..".dat"
	else
		filename = ""
	end
	return filename, nowdate
end

function wulin_GetTicketPhase()
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20) then
		return 1
	elseif (nowhour == 22) then
		return 2
	else 
		return 0
	end
end

function wulin_BuyTicket()
	local nowday = date("%m%d") 
	local buyidx = wulin_day2buytabidx(nowday)
	if (buyidx == 0) then
		Say("Xin lçi! B¹n ®· xin phÐp 1 lÇn råi! B©y giê kh«ng thÓ xin phÐp n÷a!", 0)
		return 
	end
	
	local nowdate = date("%m%d%H")
	if (wulin_canbuyticket() == 1) then
			Say("Xin lçi! B¹n ®· xin phÐp 1 lÇn råi! B©y giê kh«ng thÓ xin phÐp n÷a!", 0)
			return
	end
end

function wulin_TicketIsTimeout()
	local lastdate = tonumber(date("%m%d20"))
	if (GetTask(TV_LASTTIME_BUY) < lastdate) then
		return 1 --¹ýÆÚÁË
	else
		return 0 --ÉÐÎ´¹ýÆÚ
	end
end

function wulin_sure_buyticket(no)
	print("sure")
	local today = tonumber(date("%m%d"))
	local nowdate  = tonumber(date("%m%d%H"))
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20 or nowhour == 22) then
		local buyidx = wulin_day2buytabidx(today)
		
		if (buyidx == 0) then
			Say("Xin lçi! HiÖn ch­a b¸n vÐ sè Vâ L©m quan chóng lÖnh! H·y quay l¹i sau nhÐ!",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= nowdate) then
			Say("Xin lçi! B¹n ®· xin phÐp 1 lÇn råi! B©y giê kh«ng thÓ xin phÐp n÷a!", 0)
			return 0
		end
		
		local phase = 0
		if (nowhour == 20) then
			phase = 1
		else
			phase = 2
		end
		
		if (phase ~= no) then
			print("ddd")
			return
		end
	else
		Say("Xin lçi! Ho¹t ®éng mçi ngµy chØ tõ 20:00-21:00 vµ 22:00-23:00. Giê ®ã h·y ®Õn nhÐ!",0)
		return
	end
	
	local filename = wulin_getcurticketfile(today,no)
	if (filename == "") then
		print("asd3f")
		return 
	end
	wulin_loadfile(filename)
	local ticketcount = wulin_getdata(filename, "TICKET", "Count")
	if (ticketcount == nil or ticketcount == "") then
		ticketcount = 0
	else
		ticketcount = tonumber(ticketcount)
	end
	if (ticketcount == 0) then
			wulin_setdata(filename, "TICKET", "IsBonusCreate", 0)
	end
	ticketcount = ticketcount + 1 
	
	wulin_setdata(filename, "TICKET", "Count", tostring(ticketcount))
	wulin_setdata(filename, "TICKET", "Ticket"..ticketcount, GetName())
	wulin_setdata(filename, "TICKET", "Bonus"..ticketcount, "0")
	wulin_save(filename)
	local msgstr = "";
	if (no == 1) then
		SetTask(TV_TICKET1, ticketcount)
		msgstr = "Ng­¬i ®· ®ñ t­ c¸ch Vâ L©m quan chóng lÖnh. Sau 21h:00 vµ tr­íc 20h:00 ngµy h«m sau cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng! Ngoµi thêi gian ®ã v« hiÖu!";	
	else
		SetTask(TV_TICKET2, ticketcount)			
		msgstr = "Ng­¬i ®· ®ñ t­ c¸ch Vâ L©m quan chóng lÖnh. Sau 23h:00 vµ tr­íc 20h:00 ngµy h«m sau cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng! Ngoµi thêi gian ®ã v« hiÖu!"
	end
	SetTask(TV_LASTTIME_BUY, nowdate)
	Msg2Player(msgstr)
	Say(msgstr, 0)
end

--¿ª²ÊÆ±
function wulin_start_lottery(no)
	local nowday = 		 wulin_getnowstate()
	local filename, lotterydate = wulin_getcurticketfile(nowday, no)
	wulin_loadfile(filename)
	local ticketcount = tonumber(wulin_getdata(filename, "TICKET", "Count"))
	local idx = wulin_day2buytabidx(lotterydate)
	if (idx == 0) then
		print("asdfsdf"..lotterydate)
		return
	end
	local no1count = TAB_TICKETBUY[idx][no + 1];
	local tab_lottery = {};
	local restticket = ticketcount
	
	local nbonuscount = 0;
	nbonuscount =  TAB_TICKETBUY[idx][no+1];
	
	if (restticket < nbonuscount) then
		nbonuscount = restticket
	end
	
	wulin_lottery_create(filename, 1, nbonuscount, ticketcount)
	restticket = restticket - nbonuscount
	wulin_setdata(filename, "TICKET", "IsBonusCreate", 1)
	wulin_save(filename)
end

function wulin_lottery_create(lotteryfile, lotteryno, count, maxticket)
	if (count == 0) then
		return
	end
	wulin_loadfile(lotteryfile)
	local m = 0
	for i = 1, count do 
		local bfind = 0
		while(bfind == 0) do
			m =  random(1, maxticket)
			local bonus = tonumber(wulin_getdata(lotteryfile, "TICKET", "Bonus"..m))
			if (bonus == 0) then
				wulin_setdata(lotteryfile, "TICKET", "Bonus"..m, lotteryno)
				wulin_save(lotteryfile)
				local Name = wulin_getdata(lotteryfile, "TICKET", "Ticket"..m)
				WriteLog(date("%m%d%H%M").."§· cã kÕt qu¶ tróng th­ëng:"..lotteryno..", ng­êi tróng th­ëng:"..Name)
				if (lotteryno == 1) then
					local msgstr = " "..Name.." nhËn ®­îc"..TAB_LOTTERY_BONUS[1][1].."Xin h·y ®Õn Vâ l©m Quan viªn nhËn th­ëng"
					AddGlobalNews(msgstr);
				end
				bfind = 1
			end
		end
	end
end

------------------------------------------------------------------------------------
-- ´ò¿ªÒ»¸öÎÄ¼þ
function wulin_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
		IniFile_Load(filename, filename)
	end

end

--»ñµÃÎÄ¼þÖÐµÄszSectionµÄkeyµÄÖµ
function wulin_getdata(filename, szsect, szkey)
	--if ( TAB_TEST[szsect])  then
		----print( TAB_TEST[szsect][szkey])
		--return TAB_TEST[szsect][szkey]
	--else
		--return nil
	--end
	return IniFile_GetData(filename, szsect, szkey)
end

--ÉèÖÃÎÄ¼þÖÐµÄszSectionµÄkeyÖµÎªszValue
function wulin_setdata(filename, szsect, szkey, szvalue)
	--if (TAB_TEST[szsect]) then
		--TAB_TEST[szsect][szkey] = szvalue
	--else
		--TAB_TEST[szsect] = {}
		--TAB_TEST[szsect][szkey] = szvalue
	--end
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function wulin_save(filename)
	IniFile_Save(filename, filename)
end

function wulin_clearticket()
		SetTask(TV_TICKET1, 0)
		SetTask(TV_TICKET2, 0)
		SetTask(TV_LASTTIME_BUY,0)
end

--TAB_TEST = {};
--for i = 1, 2000 do 
	--wulin_sure_buyticket(1)
--end
--wulin_start_lottery(1)
