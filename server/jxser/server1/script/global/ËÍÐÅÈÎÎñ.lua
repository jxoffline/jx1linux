-- ËÍĞÅÈÎÎñ.lua (ËÍĞÅÈÎÎñÖ÷ÎÄ¼ş)
-- By: Dan_Deng(2003-12-08)

-- ¸÷¸ö¼¶±ğµÄÍ¬°é¾çÇéÈÎÎñÊµÌå´¦ÀíÎÄ¼ş
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua")


Define_City = {"<#> L©m An","<#> Ph­îng T­êng","<#> Thµnh §«","<#> §¹i Lı ","<#> BiÖn Kinh","<#> T­¬ng D­¬ng","<#> D­¬ng Ch©u"}

function default_talk(letter_laststation)

local nParTaskState = GetMasterTaskState(PARID_TASK_MASTER_002);
local aryTalk = {"<dec><npc>§· l©u ta kh«ng mµng ®Õn chuyÖn trªn giang hå, thêi cuéc lóc nµy qu¸ hçn lo¹n, ¾t h¼n triÒu ®×nh sÏ cã nhiÒu viÖc ph¶i lµm."};

	if nParTaskState==nil then nParTaskState = 0; end;

	tinsert(aryTalk, "Ta muèn v× triÒu ®×nh gãp chót søc lùc./especiallymessenger");
	tinsert(aryTalk, "Ta chØ lµ tiÖn ®­êng ghĞ qua!/no");
	
	CreateTaskSay(aryTalk);

end

function lastdefault_talk(letter_station)
	Uworld12 = GetTask(12)
	if (Uworld12 == 0) then				-- ËæÊ±¿ÉÒÔ¿ªÊ¼ÈÎÎñ£¨ÒÔÇ°Î´×ö¹ı£©
		W12_get(letter_station)
	elseif (Uworld12 < 256) then		-- ÈÎÎñÖĞ
		check_letter(letter_station)
	elseif (GetGameTime() >= Uworld12) then		-- ÒÑ³¬¹ıÖØ¸´Ê±¼äÏŞÖÆ£¬ÔÊĞíÔÙ´Î½øĞĞÈÎÎñ£¨ÔİÊ±Ê¹ÓÃÔÚÏßÊ±¼ä£©
		W12_get(letter_station)
	else													-- µÈ´ıÖØ¸´½øĞĞÈÎÎñÖĞ
		Talk(1,"","HiÖn thêi ch­a cã c«ng v¨n nµo nhê ng­¬i gióp! H·y quay l¹i sau nhĞ! ")
	end
end

function W12_get(start_city)
	dest_city = random(1,7)				-- ÏÖÔÚÊÇ7¸ö³ÇÊĞ
	if (dest_city == start_city) then		-- ²»ÔÊĞíËÍĞÅµÄÔ´³ÇÊĞÓëÄ¿±ê³ÇÊĞÖØ¸´
		Talk(1,"","HiÖn thêi ch­a cã c«ng v¨n nµo nhê ng­¬i gióp! H·y quay l¹i sau nhĞ! ")
	else
		SetTaskTemp(3,start_city*10+dest_city)		-- Ê®Î»ÊıÎªÆğÊ¼µØ£¬¸öÎ»ÊıÎªÄ¿±êµØ
		Say("Ngµy nay chiÕn sù tÇng tÇng, c«ng v¨n nhiÒu, ng­êi ®­a th­ trong kh«ng ®ñ, ng­¬i muèn gióp ®­a th­ kh«ng? Mçi lÇn ®Òu cã thï lao! ",2,"§ång ı!/W12_get_yes","Kh«ng b»ng lßng/no")
	end
end

function check_letter(get_city)
	x = GetTask(12)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ó¦¸Ã¿Ï¶¨ÄÜÕû³ı
	if (dest_city == get_city) then			-- Ä¿±ê³ÇÊĞ
		if (HaveItem(231+x) == 1) then			-- ÓĞĞÅº¯ÄÜ¶ÔÓ¦ÉÏ£¬ÈÎÎñÍê³É
			Talk(1,"","<#> NhËn ®­îc"..Define_City[start_city].."<#> lµm tèt l¾m! §©y lµ 500 l­îng hËu t¹!")
			DelItem(231+x)
			SetTask(12,GetGameTime()+7200)				-- Á½Ğ¡Ê±£¨7200Ãë£©ºó¿ÉÖØ¸´×öÈÎÎñ
			i = random(1,10)		-- Ëæ»ú¸øÉùÍû½±Àø
			AddRepute(i)
			Msg2Player("<#> ChuyÓn hµm th­ thµnh c«ng ®Õn DŞch tr¹m môc tiªu, nhiÖm vô hoµn thµnh. Danh väng cña b¹n t¨ng thªm "..i.."<#> ®iÓm.")
			AddNote("ChuyÓn hµm th­ thµnh c«ng ®Õn DŞch tr¹m môc tiªu, nhiÖm vô hoµn thµnh.")
			Earn(500)
		else												-- ĞÅº¯¶ªÊ§£¬È¡ÏûÈÎÎñ
			Say("C«ng v¨n quan träng mµ l¹i lµm mÊt? LÇn nµy phiÒn l¾m ®©y!  §­a ta 2000 l­îng ta sÏ giÊu chuyÖn nµy ®i",2,"Nép tiÒn/W12_cancel","Ta ®i kiÕm thªm tiÒn/no")
		end
	elseif (start_city == get_city) then	-- ÆğÊ¼³ÇÊĞ
		if (HaveItem(231+x) == 0) then			-- ĞÅº¯¶ªÊ§£¬È¡ÏûÈÎÎñ
			Say("C«ng v¨n quan träng mµ l¹i lµm mÊt? LÇn nµy phiÒn l¾m ®©y!  §­a ta 2000 l­îng ta sÏ giÊu chuyÖn nµy ®i",2,"Nép tiÒn/W12_cancel","Ta ®i kiÕm thªm tiÒn/no")
		else
			Talk(1,"","§©y lµ c«ng v¨n rÊt gÊp!  PhiÒn ng­¬i ®­a nhanh mét tİ! ")
		end
	else 																					-- ÆäËüÇé¿ö£¨ÈÎÎñÎ´Íê³É£©
		Talk(1,"","<#> Hµm th­ nµy kh«ng ph¶i chuyÓn ®Õn ®©y! Ng­¬i ph¶i chuyÓn ®Õn "..Define_City[dest_city].."<#> ")
	end
end

function W12_cancel()
	if (GetCash() >= 2000) then
		Pay(2000)
		SetTask(12,0)
		Msg2Player("NhiÖm vô chuyÓn th­ cña b¹n ®· bŞ hñy.")
		AddNote("NhiÖm vô chuyÓn th­ cña b¹n ®· bŞ hñy.")
		Talk(1,"","LÇn nµy ta bá qua!  Sau nµy cÇn ph¶i cÈn thËn! ")
	else
		Talk(1,"","2000 l­îng còng kh«ng cã!  Ng­¬i nghÌo vËy sao? Cã tiÒn råi h·y ®Õn t×m ta! ")
	end
end

function W12_get_yes()
	x = GetTaskTemp(3)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ó¦¸Ã¿Ï¶¨ÄÜÕû³ı
	Talk(1,"","<#> H·y gióp ta chuyÓn bøc hµm th­ nµy ®Õn"..Define_City[dest_city].."<#>!")
	Msg2Player(Define_City[start_city].."<#> H·y gióp ta chuyÓn bøc hµm th­ nµy ®Õn"..Define_City[dest_city].."<#> ")
	AddNote("<#> NhiÖm vô chuyÓn th­ ®Õn"..Define_City[start_city].."<#> "..Define_City[dest_city]..".")
	SetTask(12,x)
	AddEventItem(231+x)		-- ĞÅº¯´Ó242¿ªÊ¼£¬³ÇÊĞ´Ó1¿ªÊ¼
end

function no()
end
