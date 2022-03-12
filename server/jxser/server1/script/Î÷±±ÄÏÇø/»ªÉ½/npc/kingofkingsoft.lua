-- »ªÉ½ ¾ø¶¥ ½¨°ïNPC
-- By£ºDan_Deng(2003-09-23)
--edit by Ğ¡ÀË¶à¶à(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include("\\script\\tong\\tong_check.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
--Include("\\script\\task\\metempsychosis\\translife_6.lua")
--Include("\\script\\task\\metempsychosis\\translife_7.lua")
--Include("\\script\\task\\metempsychosis\\translife_8.lua")

function about_tong()
	Talk(6,"","Ng­¬i hái lËp bang héi cÇn cã nh÷ng ®iÒu kiÖn g×? §Ó tõ tõ ta gi¶i thİch cho nghe!","Ph¶i lµ ng­êi ®· xuÊt s­, kh«ng ë trong bÊt cø bang héi nµo. Lùc thèng so¸i thÊp nhÊt 30 ®iÓm!","Sau khi héi ®ñ nh÷ng yªu cÇu trªn, ng­¬i cã thÓ tham gia chiÕn tr­êng Tèng Kim lÊy ®­îc c©y Vò V­¬ng kiÕm ®Ó lµm tİn vËt bang chñ, sau ®ã tiÕn hµnh lËp bang héi","Tr­íc tiªn ng­¬i ph¶i cã n¨ng lùc, trong 3 ngµy ph¶i t×m İt nhÊt 16 ng­êi cïng chİ h­íng gia nhËp, nÕu kh«ng còng ch¼ng cã c¸ch nµo. 3 ngµy ®ã cã thÓ gäi lµ 'Thêi kú kh¶o nghiÖm'.","Sau khi bang héi cña ng­¬i ®­îc İt nhÊt 16 ng­êi, trªn giang hå sÏ tiÕn hµnh kh¶o nghiÖm. NÕu sau 3 ngµy vÉn ch­a ®ñ 16 ng­êi th× giang hå vÉn ch­a thõa nhËn bang héi nµy","Cuèi cïng! §Ó lËp ®­îc bang ph¸i th× cÇn ph¶i cã sè vèn lín. H·y nç lùc ®¹t ®­îc môc tiªu nhĞ!")
end



function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("TiÕp tôc lËp bang héi cña ng­¬i, b¾t ®Çu sù nghiÖp giang hå ®i!",2,"B¾t ®Çu lËp bang/Direct_CreateTong","§îi thªm mét chót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay","Cho hái ta lµm sao cã thÓ gièng nh­ ngµi, lËp bang ph¸i vµ lµm bang chñ?","Tr­íc tiªn ng­¬i ph¶i cã n¨ng lùc, trong 3 ngµy ph¶i t×m İt nhÊt 16 ng­êi cïng chİ h­íng gia nhËp, nÕu kh«ng còng ch¼ng cã c¸ch nµo. 3 ngµy ®ã cã thÓ gäi lµ 'Thêi kú kh¶o nghiÖm'.","Sau khi bang héi cña ng­¬i ®­îc İt nhÊt 16 ng­êi, trªn giang hå sÏ tiÕn hµnh kh¶o nghiÖm. NÕu sau 3 ngµy vÉn ch­a ®ñ 16 ng­êi th× giang hå vÉn ch­a thõa nhËn bang héi nµy","Sau khi ng­¬i cã ®ñ n¨ng lùc l·nh ®¹o vµ uy tİn giang hå, th× t×m mét vËt phÈm ®Æc biÖt ®Ó lµm tİn vËt cña ch­ëng m«n. Vİ dô nh­ tham gia Tèng Kim lÊy ®­îc Nh¹c V­¬ng kiÕm","Nh¹c V­¬ng kiÕm? Ngµi nãi lµ c©y kiÕm nµy ph¶i kh«ng?","Ho¸ ra ng­¬i ®· cã nã! Kh«ng sai! Qu¶ lµ tuæi trÎ tµi cao!")
	else				-- ´Ë²¿·İÎªÈ±Ê¡¶Ô»°£¬´ıÀ©³ä¡£
		local tbOpt = {
			{"Hái vÒ viÖc thµnh lËp bang héi", about_tong},
			--{"Ta Hái xem lµm thÕ nµo ®Ó trïng sinh 6", TransLife6.ShowMainDlg, {TransLife6}},
			--{"Hái xem lµm thÕ nµo Trïng sinh 7", TransLife7.ShowMainDlg, {TransLife7}},
			--{"Muèn hái vÒ trïng sinh 8", TransLife8.ShowMainDlg, {TransLife8}},
			{"Kh«ng cã viÖc g×", nothing},
		}
		CreateNewSayEx("<npc> Ng­¬i cã chuyÖn g× kh«ng vËy?", tbOpt)
	end
end

function create_pay()
	Say("B©y giê chØ cÇn ng­¬i cã thªm sè vèn lín lµ ®­îc, cã thÓ lµ 100 v¹n l­îng",2,"Kh«ng thµnh vÊn ®Ò, ta ®· cã ®ñ 100 v¹n l­îng råi./create_pay_yes","Sao nhiÒu thÕ? İt l¹i mét chót ®­îc kh«ng?/create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		if not %tong_check_create()then
			return
		end
		Pay(1000000)				-- ÊÕ·Ñ
		DelItem(195)			-- É¾³ıÏà¹ØµÀ¾ß
		SetTask(99,1)				-- ²¢´òÉÏ±ê¼Ç£¨Í¬Ê±¶¨ÒåÎª°ïÅÉÖĞµÄµÚÒ»¸öÈË£¨¼´°ïÖ÷±¾ÈË£©£©
		Direct_CreateTong()		-- ¿ªÊ¼½¨°ï
	else
		Talk(1,"","D­êng nh­ ng­¬i kh«ng cã ®ñ tiÒn, nh­ thÕ kh«ng æn, ®îi khi ng­¬i cã ®ñ tiÒn th× ®Õn t×m ta.")
	end
end

function create_pay_no()
	Talk(1,"","§Ó duy tr× bang héi ho¹t ®éng b×nh th­êng th× mÊt rÊt nhiÒu tiÒn, nÕu ng­¬icßn ë ®©y tr¶ gi¸ th× ta e bang héi sÏ khã thµnh lË ")
end

function Direct_CreateTong()
	CreateTong(1)				-- µ¯³ö½¨°ï¶Ô»°¿ò£¬½áÊø½Å±¾¿ØÖÆ
end

function wait_a_moment()
end

--µÃµ½Ò»¸öÍæ¼ÒËùÔÚ°ï»áÕ¼ÁìµÄ³ÇÊĞ,·µ»ØË÷ÒıÖµ
function gettongownercity()
	--µÃµ½Íæ¼Ò°ï»áÃû³Æ
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--·Ö±ğµÃµ½Æß´ó³ÇÊĞµÄ°ï»áÃû³ÆÓëÍæ¼Ò°ï»áÃû³Æ¶Ô±È
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--±íÊ¾Íæ¼ÒËùÔÚµÄ°ï»áÃ»ÓĞÕ¼Áì³ÇÊĞ
	return 0
end

-- ¼ì²éÁì½±Ìõ¼ş
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ChØ cã bang ph¸i chiÕm ®­îc thµnh thŞ míi nhËn ®­îc phÇn th­ëng, h·y dÉn anh em cña m×nh ®i chiÕm mét thµnh nµo ®i!")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ChØ cã bang chñ míi míi l·nh ®­îc phÇn th­ëng cña bang ph¸i, gäi bang chñ cña c¸c ng­¬i tíi ®©y")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- ½ñÌìÊÇĞÇÆÚ¼¸£¿
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>9:00~20:00 thø hai h»ng tuÇn míi lµ thêi gian nhËn th­ëng, xin h·y nhÉn n¹i chê ®îi")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> PhÇn th­ëng tuÇn nµy ®· l·nh råi, hÑn tuÇn sau h·y tíi")
		end
		return 0
	end

	return 1
end

-- ÁìÈ¡³ÇÖ÷°ï»á½±Àø
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> NhËn phÇn th­ëng Thµnh chñ bang ph¸i",
			2,
			"<#> ta muèn l·nh 60 c¸i/#take_tong_award(60)",
			"<#> T¹m thêi ta kh«ng l·nh ®©u/nothing")
	end
end

-- ÁìÈ¡ºì°ü
function take_tong_award(count)
	-- Ò»¸öºì°üÕ¼Ò»¸ö¸ñ×Ó
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> Hµnh trang cña ng­¬i ®· ®Çy, chØnh lı l¹i xong míi ®Õn l·nh th­ëng.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- ¸øºì°ü
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#>§¹i hång bao from Kim S¬n Ch­ëng M«n Nh©n"
	WriteLog(msg);
	Talk(1, "", "<#> §©y lµ phÇn th­ëng cña c¸c ng­¬i nhËn lÊy ®i")
end
