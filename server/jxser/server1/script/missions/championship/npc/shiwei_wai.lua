--ÎäÁÖ´ó»áÊÌÎÀ
Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	Say("Quan viªn ®Êu tr­êng: TrËn ®Êu lÇn nµy sÏ chän trong anh hïng thiªn h¹, c¸c vâ l©m hµo kiÖt chän ra 90 Vâ l©m cao thñ lµm ®¹i biÓu tham gia §¹i héi Vâ l©m toµn khu vùc! Mêi b¹n ®Õn tham gia ®¹i héi vâ l©m s«i næi, hµo høng!", 1, "§ång ı!/want_enrol_option")
end

function want_enrol_option()
	cp_syntaskround()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"Tham gia trËn dù tuyÓn m«n ph¸i/want_enrol",
				"Tra xem thµnh tİch dù tuyÓn hiÖn t¹i cña ta /look_sort",
				"Hç trî thi ®Êu dù tuyÓn M«n ph¸i/help_tryout",
				"Ta sÏ quay l¹i sau!/OnCancel"
				}
		Say("Muèn vµo §¹i héi Vâ l©m?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) > CP_END_TRYOUT) then
		Say("Thi ®Êu dù tuyÓn ®¹i héi vâ l©m ®· kÕt thóc, b¹n cã thÓ ®Õn L©m An gÆp Viªn quan ®¹i héi Vâ L©m xem danh s¸ch tróng tuyÓn.", 0)		
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say("Thi ®Êu dù tuyÓn §¹i héi Vâ l©m sÏ tæ chøc vµo"..date("%Y").."n¨m"..nMonth.."nguyÖt "..nDay.."nhËt "..nHour.."chİnh thøc b¾t ®Çu xin tiÕp tôc chó ı theo dâi!",0)
	end
end

function want_enrol()
	--if ±¾ÕËºÅµÄÆäËû½ÇÉ«ÒÑ±¨Ãû then
	--	Say("±¾ÕÊºÅÔÚ±¾·şÒÑÓĞ½ÇÉ«²Î¼ÓÃÅÅÉÔ¤Ñ¡Èü£¬ÔòÆäËû½ÇÉ«ÔÚ±¾·ş²»ÄÜ²ÎÈü¡£ÇëÔÚ·ÅÆú²ÎÈü½ÇÉ«×Ê¸ñºó£¬ÔÙÓÃ±¾½ÇÉ«±¨Ãû²ÎÈü£¡", 0)
	--	return 
	--end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then	--ÒÑ¾­È¡ÏûÁË±¨Ãû×Ê¸ñ
		Say("B¹n ®· bá t­ c¸ch tham gia thi ®Êu dù tuyÓn m«n ph¸i, kh«ng thÓ tiÕp tôc b¸o danh tham gi thi ®Êu.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--ÒÑ¾­È¡µÃ¾öÈüÈ¦×Ê¸ñ
		Say("B¹n ®· nhËn ®­îc t­ c¸ch tuyÓn thñ, ®õng ®Õn ®©y giµnh ng«i n÷a!", 0)
		return
	end
	local nHour = mod(CP_UPTO_TRYOUT, 100)
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV(MS_STATE) == 0) then
		local talkstr = "Thi ®Êu dù tuyÓn m«n ph¸i mçi ngµy tõ "..nHour..":00 giê "..opentime..", b©y giê lµ "..date("%H:%M")..", h·y quay l¹i sau!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "Vßng thi ®Êu nµy ®ang tiÕn hµnh thi ®Êu, xin ®îi trËn sau h·y vµo!"
		Say(talkstr, 0)
		return
	end
		
	Say("Thi ®Êu dù tuyÓn M«n ph¸i mçi ngµy vµo lóc"..nHour..":00 giê "..opentime.." giê, thêi gian b¸o danh lµ 5 phót, thêi gian thi ®Êu lµ 10 phót, mçi ng­êi chØ cã thÓ tham gia"..CP_MAXROUND.."vßng thi ®Êu. Sau khi b¸o danh vµo khu vùc chuÈn bŞ, b¹n cã thÓ chän rêi khái hoÆc chê ®Õn lóc thi ®Êu. C¨n cø vµo thµnh tİch thi ®Êu chän ra 5 ng­êi ®¹i diÖn M«n ph¸i tham gia thi ®Êu vßng chung kÕt khu vùc", 2, "Ta muèn tham gia dù tuyÓn!/sure_enrol_1", "§Ó ta xem l¹i/OnCancel")
end

function sure_enrol_1()
	Say("Theo hiÖu lÖnh cña Minh chñ, trong vâ l©m thi ®Êu kiÖt xuÊt nghiªm cÊm sö dông <color=red>d­îc phÈm PK<color>, b¹n ph¶i xem trªn ng­êi cã thø thuèc Êy tr­íc khi tham gia, nÕu kh«ng sÏ bŞ ®×nh chØ thi ®Êu. Ta sÏ xãa ®i tr¹ng th¸i dŞ th­êng PK cña ng­¬i. <color=red>Lóc vµo tr­êng ®Êu, ng­¬i ph¶i xem ®é hao mßn cña trang bŞ. Sau khi vµo tr­êng ®Êu, nghiªm cÊm di chuyÓn vËt phÈm. Ng­¬i h·y kiÓm tra l¹i vËt phÈm trong thanh c«ng cô ®· ®Çy hay ch­a?",2, "Ta ®· s½n sµng!/sure_enrol_2", "Ta sÏ quay l¹i sau!/OnCancel")
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
		Say("B¶ng c«ng cô cña b¹n kh«ng cã ®Ó d­îc phÈm, hay lµ b¹n h·y bá d­îc phÈm vµo b¶ng c«ng cô! <color=red> Sau khi vµo tr­êng ®Êu cÊm di chuyÓn vËt phÈm, xin x¸c nhËn vËt phÈm b¶ng c«ng cô ®· ®Çy hay ch­a?<color>", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "Ng­¬i lÇn ®Çu tham gia dù tuyÓn cÇn ph¶i nép 10 v¹n l­îng b¸o danh."
		Say(talkstr, 2, "§©y lµ 10 v¹n l­îng./pay_enrol_money", "§Ó ta xem l¹i/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("Sau khi vµo khu vùc thi ®Êu, kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang nh­ng vÉn cã thÓ sö dông vËt phÈm trong hµnh trang vµ thanh c«ng cô.");
end

function pay_enrol_money()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		join_tryout()
		return
	end
	Say("B¹n kh«ng cã ®ñ phİ b¸o danh, ®ñ 10 v¹n h·y quay l¹i!", 0)
end

function look_sort()
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("HiÖn B¹n vÉn ch­a thi ®Êu trËn nµo!", 0)
	else
		Say("Thi ®Êu dù tuyÓn §¹i héi Vâ l©m m«n ph¸i cho phĞp mçi ng­êi tham gia nhiÒu nhÊt"..CP_MAXROUND.."lÇn. HiÖn t¹i b¹n ®· tham gia <color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> vßng thi ®Êu, tæng ®iÓm th­ëng lµ:"..nt_gettask(CP_TASKID_POINT)..", th¾ng"..nt_gettask(CP_TASKID_WIN).."trËn, thua"..nt_gettask(CP_TASKID_LOSE).."trËn, hßa"..nt_gettask(CP_TASKID_TIE).."trËn.", 0)
	end
end

