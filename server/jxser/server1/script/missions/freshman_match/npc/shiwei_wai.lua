--ÎäÁÖ´ó»áÊÌÎÀ

Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	Say( "ThŞ vÖ héi tr­êng: Tõ 1 th¸ng 6 n¨m 2005 ®Õn 10 th¸ng 6 n¨m 2005, mçi ngµy 20:00 ®Õn 23:00 sÏ tæ chøc <color=yellow>liªn ®Êu Vâ l©m kiÖt xuÊt<color>. Cuéc thi nµy nh»m môc ®İch t¹o c¬ héi cho c¸c T©n Thñ giang hå (cÊp 50 ®Õn cÊp 89) giao l­u häc hái kinh nghiÖm víi c¸c ®ång m«n, n©ng cao kü n¨ng cña T©n Thñ, mau ®Õn tham gia ®i!", 1, "§ång ı!/want_enrol_option")
end

function want_enrol_option()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"Tham gia thi ®Êu m«n ph¸i kiÖt xuÊt Vâ l©m/want_enrol",
				"KiÓm tra thµnh tİch thi ®Êu kiÖt xuÊt!/look_sort",
				"Hç trî thi ®Êu Vâ l©m kiÖt xuÊt/help_freshmanmatch",
				"Ta sÏ quay l¹i sau!/OnCancel"
				}
		Say("Muèn tham gia thi ®Êu Vâ l©m kiÖt xuÊt m«n ph¸i ­?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		Say("Thi ®Êu Vâ l©m kiÖt xuÊt m«n ph¸i ®· kÕt thóc, 5 ng­êi ®øng ®Çu cña c¸c m«n ph¸i cã thÓ ®Õn L©m An gÆp Sø gi¶ kiÖt xuÊt (203, 202) nhËn danh hiÖu.", 0)
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say( "Vâ l©m m«n ph¸i kiÖt xuÊt sÏ b¾t ®Çu tõ "..date( "%Y" ).."n¨m"..nMonth.."nguyÖt "..nDay.."nhËt "..nHour.."chİnh thøc b¾t ®Çu xin tiÕp tôc chó ı theo dâi!", 0 )
	end
end

function want_enrol()
	if ( nt_gettask( CP_TASKID_REGIST ) ~= CP_UPTO_TRYOUT ) then
	
		if (GetLevel() >= 90  ) then
			Say("§¼ng cÊp tõ 90 trë lªn kh«ng ®­îc tham gia thi ®Êu.", 0)
			return
		end
		
		if ( GetLevel() < 50 ) then
			Say( "§¼ng cÊp cña b¹n ch­a ®¹t yªu cÇu (cÊp 50) kh«ng ®­îc b¸o danh tham gia!", 0 )
			return
		end
		
	end
	local nHour = mod( CP_UPTO_TRYOUT, 100 )
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV( MS_STATE ) == 0) then
		local talkstr = "Thi ®Êu kiÖn xuÊt mçi ngµy tõ "..nHour..":00 giê "..opentime..", b©y giê lµ "..date( "%H:%M" )..", h·y quay l¹i sau!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "Vßng thi ®Êu kiÖt xuÊt ®ang ®­îc tiÕn hµnh, xin chê hiÖp sau!"
		Say(talkstr, 0)
		return
	end
		
	Say("Thi ®Êu kiÖn xuÊt mçi ngµy tõ "..nHour..":00 giê "..opentime..", thêi gian b¸o danh lµ 5 phót, thêi gian thi ®Êu lµ 15 phót, mäi ng­êi ®Òu cã thÓ tham gia."..CP_MAXROUND.."vßng thi ®Êu. Sau khi b¸o danh vµo khu vùc chuÈn bŞ thi ®Êu, b¹n cã thÓ rêi khái hoÆc chê ®Õn lóc thi ®Êu.", 2, "Ta muèn tham gia thi ®Êu kiÖt xuÊt!/sure_enrol_1", "§Ó ta xem l¹i/OnCancel")
end

function sure_enrol_1()
	Say("Theo hiÖu lÖnh cña Vâ l©m Minh chñ, trong thi ®Êu Vâ l©m kiÖt xuÊt nghiªm cÊm sö dông thuèc PK, b¹n ph¶i xem trªn ng­êi cã thø thuèc Êy tr­íc khi tham gia, nÕu kh«ng sÏ bŞ ®×nh chØ thi ®Êu. Ta sÏ xãa ®i tr¹ng th¸i dŞ th­êng PK cña ng­¬i. <color=red>Lóc vµo tr­êng ®Êu, ng­¬i ph¶i xem ®é hao mßn cña trang bŞ. Sau khi vµo tr­êng ®Êu, nghiªm cÊm di chuyÓn vËt phÈm. Ng­¬i h·y kiÓm tra l¹i vËt phÈm trong hµnh trang ®· ®Çy ch­a?",2, "Ta ®· s½n sµng!/sure_enrol_2", "Ta sÏ quay l¹i sau!/OnCancel")
end

function sure_enrol_2()
	Say("Quan viªn héi tr­êng:<color=red>Vµo khu vùc chuÈn bŞ vµ khu vùc thi ®Êu, ng­êi ch¬i kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang nh­ng vÉn cã thÓ sö dông vËt phÈm trong thanh c«ng cô vµ hµnh trang. Ng­¬i h·y kiÓm tra l¹i vËt phÈm trong thanh c«ng cô ®· ®Çy hay ch­a?",2,"X¸c nhËn/sure_enrol", "Ta ch­a s½n sµng!/OnCancel")
end

function sure_enrol()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(CP_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( CP_FORBID_ITEM[i][2][1], CP_FORBID_ITEM[i][2][2], CP_FORBID_ITEM[i][2][3], CP_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == CP_FORBID_ITEM[i][2][1] and keyitem_d[j] == CP_FORBID_ITEM[i][2][2] and keyitem_p[j] == CP_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("Ng­¬i thËt to gan! D¸m kh«ng tu©n lÖnh cña Vâ L©m Minh Chñ, tù ı ®em d­îc phÈm cÊm vµo, mau rêi khái ®©y!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("B¶ng c«ng cô cña b¹n hiÖn giê kh«ng cã ®Ó d­îc phÈm vµo, b¹n h·y chän d­îc phÈm ®Æt vµo ®óng vŞ trİ m×nh dïng ®i!<color=red> Sau khi ®· vµo tr­êng ®Êu cÊm di chuyÓn vËt phÈm, xin h·y x¸c nhËn vËt phÈm trong b¶ng c«ng cô ®· ®­îc s¾p xÕp xong!", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "Ng­¬i míi lÇn ®Çu tham gia Vâ l©m kiÖt xuÊt? Cã muèn tham gia kh«ng?"
		Say(talkstr, 2, "Ta muèn tham gia!/pay_enrol_money", "§Ó ta xem l¹i/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("Sau khi vµo khu vùc thi ®Êu, kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang nh­ng vÉn cã thÓ sö dông vËt phÈm trong hµnh trang vµ thanh c«ng cô.");
end

function pay_enrol_money()

		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
		join_tryout()
end

function look_sort()
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		for i = 1096 , 1105 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
	end
	
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("HiÖn B¹n vÉn ch­a thi ®Êu trËn nµo!", 0)
	else
		Say("Thi ®Êu Vâ l©m kiÖt xuÊt cho phĞp mçi ng­êi tham gia nhiÒu nhÊt"..CP_MAXROUND.."lÇn. HiÖn t¹i b¹n ®· tham gia <color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> lÇn thi ®Êu, ®iÓm th­ëng lµ:"..nt_gettask(CP_TASKID_POINT)..", th¾ng"..nt_gettask(CP_TASKID_WIN).."trËn, thua"..nt_gettask(CP_TASKID_LOSE).."trËn, hßa"..nt_gettask(CP_TASKID_TIE).."trËn.", 0)
	end
end

