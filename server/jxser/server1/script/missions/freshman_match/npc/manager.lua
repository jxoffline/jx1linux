Include("\\script\\missions\\freshman_match\\head.lua")

--ÎäÁÖĞÂĞãÈü¹ÙÔ±
function main()
	Say("Sø gi¶ kiÖt xuÊt: Tõ 1 th¸ng 6 n¨m 2005 ®Õn 10 th¸ng 6 n¨m 2005, mçi ngµy 20:00 ®Õn 23:00 sÏ tæ chøc <color=yellow>liªn ®Êu Vâ l©m kiÖt xuÊt<color>. Cuéc thi nµy nh»m môc ®İch t¹o c¬ héi cho c¸c T©n Thñ giang hå (cÊp 50 ®Õn cÊp 89) giao l­u víi c¸c ®ång m«n, n©ng cao kü n¨ng vâ c«ng cña T©n Thñ, mau ®Õn tham gia ®i!", 1, "§ång ı!/want_bid_option")
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if ( validateDate( CP_UPTO_TRYOUT, CP_END_TRYOUT ) ) then	--ÔÚĞÂĞãÈüµÄÊ±¼äÊ±
		talkstr = "Sø gi¶ kiÖt xuÊt: Muèn b¸o danh thi ®Êu kiÖt xuÊt ­?"	--ÒÑ¾­¾ö³ö×ÜÁì¶Ó
		optiontab = {
						"B¸o danh tham gia liªn ®Êu 'kiÖt xuÊt'/regist_freshman",
						"Ta muèn vµo khu vùc thi ®Êu 'kiÖt xuÊt'/transtoplace",
						"Hç trî thi ®Êu Vâ l©m kiÖt xuÊt/help_freshmanmatch",
						"Ta sÏ quay l¹i sau!/OnCancel"
			}
	elseif(tonumber( date( "%y%m%d%H" ) ) >= CP_END_TRYOUT ) then
		talkstr = "Sø gi¶ kiÖt xuÊt: Vâ l©m kiÖt xuÊt liªn ®Êu ®· kÕt thóc, ng­¬i cã thÓ kiÓm tra 5 h¹ng ®Çu cña c¸c m«n ph¸i."	--ÒÑ¾­¾ö³ö×ÜÁì¶Ó
		optiontab = {
						"KiÓm tra kiÖt xuÊt c¸c m«n ph¸i/look_freshman",
						"L·nh th­ëng danh hiÖu thi ®Êu kiÖt xuÊt/catch_title",
						"Hç trî thi ®Êu Vâ l©m kiÖt xuÊt/help_freshmanmatch",
						"Ta sÏ quay l¹i sau!/OnCancel"
			}
	else
		Say("Sø gi¶ kiÖt xuÊt: Thi ®Êu kiÖt xuÊt ch­a b¾t ®Çu, xin h·y ®îi thªm!", 0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end




function catch_title()	--10´óÃÅÅÉÇ°ÎåÁìÈ¡³ÆºÅ
	local factionnumber = GetLastFactionNumber()
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("Sø gi¶ kiÖt xuÊt: Ng­¬i kh«ng ph¶i lµ ng­êi cña ThËp ®¹i m«n ph¸i sao?", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("Sø gi¶ kiÖt xuÊt: Thi ®Êu kiÖt xuÊt ch­a kÕt thóc, ch­a chän ra ®­îc 5 m«n ph¸i ®øng ®Çu, kh«ng thÓ ban danh hiÖu.", 0)
		return
	end
	biwu_loadfile( FactionData[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(FactionData[factionnumber+1][1], FactionData[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 20, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 20);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]®¹t ®­îc"..FactionTitle[factionnumber+1].."danh hiÖu");
			Msg2Player("B¹n ®¹t ®­îc"..FactionTitle[factionnumber+1].."danh hiÖu");
			return 1
		end
	end
	Say("Sø gi¶ kiÖt xuÊt: Ban kh«ng ®ñ t­ c¸ch nhËn danh hiÖu Vâ l©m kiÖt xuÊt.",0);
	return
end


function look_freshman()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say("Sø gi¶ kiÖt xuÊt: Vâ l©m kiÖt xuÊt vÉn ch­a kÕt thóc, ch­a cã danh s¸ch c¸c m«n ph¸i tham gia thi ®Êu chung kÕt.", 0)
		return
	end
local factab = {"ThiÕu L©m/#look_list_fac(1)", "Thiªn V­¬ng/#look_list_fac(2)", "§­êng M«n/#look_list_fac(3)", "Ngò §éc/#look_list_fac(4)", "Nga Mi/#look_list_fac(5)", "Thóy Yªn/#look_list_fac(6)", "C¸i Bang/#look_list_fac(7)", "Thiªn NhÉn/#look_list_fac(8)", "Vâ §ang/#look_list_fac(9)", "C«n L«n/#look_list_fac(10)" , "Kh«ng xem n÷a!/OnCancel"}
	Say("Sø gi¶ kiÖt xuÊt: Muèn xem danh s¸ch kiÖt xuÊt cña m«n ph¸i µ?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( FactionData[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(FactionData[nfact][1], FactionData[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("Sø gi¶ kiÖt xuÊt:"..FactionData[nfact][3].."Danh s¸ch m«n ph¸i tróng tuyÓn:", getn(topfac_mem), topfac_mem);
	else
		Say("Sø gi¶ kiÖt xuÊt:"..FactionData[nfact][3].."Danh s¸ch tróng tuyÓn thi ®Êu dù tuyÓn m«n ph¸i vÉn ch­a cã.", 0)
	end
end


function regist_freshman()

	if (GetLevel() >= 90  ) then
		Say("Sø gi¶ kiÖt xuÊt: CÊp 90 hoÆc cao h¬n kh«ng ®­îc phĞp tham gia thi ®Êu Vâ l©m m«n ph¸i kiÖt xuÊt. B¹n cã thÓ vµo xem thi ®Êu mµ th«i!", 0)
		return
	end
	
	if ( GetLevel() < 50 ) then
		Say( "Sø gi¶ kiÖt xuÊt: §¼ng cÊp cña b¹n ch­a ®¹t yªu cÇu (cÊp50) , kh«ng ®­îc phĞp b¸o danh thi ®Êu nh­ng b¹n cã thÓ vµo xem.", 0 )
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("Sø gi¶ kiÖt xuÊt: ChØ cã ng­êi cña ThËp ®¹i ph¸i ®­îc tham gia §¹i héi vâ l©m, ng­¬i kh«ng cã m«n ph¸i kh«ng thÓ tham gia. Sau khi gia nhËp ThËp ®¹i ph¸i míi ®­îc tham gia thi ®Êu!", 0)
		return
	end
	
	if ( nt_gettask( CP_TASKID_REGIST ) == CP_UPTO_TRYOUT ) then
		Msg2Player( "B¹n ®· b¸o danh råi, trùc tiÕp ®Õn gÆp Sø gi¶ kiÖt xuÊt lµ cã thÓ vµo." )
		transtoplace()
	else
		local talkstr = "Sø gi¶ kiÖt xuÊt: Ng­¬i míi lÇn ®Çu tham gia Vâ l©m kiÖt xuÊt? Cã muèn tham gia kh«ng?"
		Say( talkstr, 2, "Ta muèn b¸o danh/sure_regist", "§Ó ta xem l¹i/OnCancel" )
		return
	end
end

function sure_regist()

		nt_settask( CP_TASKID_REGIST, CP_UPTO_TRYOUT )
		for i = 1096 , 1105 do
			nt_settask( i, 0 )
		end
		nt_settask( CP_TASKID_LOGOUT, 0 )
		
		transtoplace()

end



function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

