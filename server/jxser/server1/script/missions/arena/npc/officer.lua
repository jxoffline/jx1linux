Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("TITLE")

local tbTitle2Id = 
{
	["§éc C« CÇu B¹i"] = 237,
	["Vâ L©m Chİ T«n"] = 238,
	["NhÊt §¹i T«ng s­ "] = 239,
	["TuyÖt ThÕ Cao Thñ"] = 240,
	["Vang Danh Giang Hå"] = 241,
	["HiÖp Danh ViÔn B¸"] = 242,
	["Vâ L©m T©n Tó"] = 243,
	["Míi nhËp giang hå "] = 244,
	["NhËp M«n §Ö Tö"] = 245,
}

function want_get_title()
	local szTitle = "Nh÷ng ®¹i hiÖp mçi tuÇn tham gia ®Çy ®ñ 20 trËn C¶nh Kü Tr­êng cã thÓ nhËn th­ëng kinh nghiÖm cña C¶nh Kü Tr­êng"	
	local tbOpt = 
	{
		{"Ta muèn nhËn th­ëng", get_title, {}},

		{"Ta chØ xem qua"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function get_title()
	if tbPlayer:GetTitleFlag() ~= 0 then
		return Talk(1, "", "Mçi tuÇn chØ nhËn mét lÇn")
	end
	
	if tbPlayer:GetCurCount() < tbPlayer.PER_WEEK_COUNT then
		return Talk(1, "", format("CÇn ph¶i tham gia ®ñ %d trËn míi nhËn ®­îc", tbPlayer.PER_WEEK_COUNT))
	end
	tbPlayer:SetTitleFlag()
	local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 100000000}
	tbAwardTemplet:Give(tbExpAward, 1, {"HiepKhachCanhKyTruong", "PhanThuong20tran"})
	
--	local szTitle = tbPlayer:GetTitle()
--	local nTitleId = %tbTitle2Id[szTitle]
--	if not nTitleId then
--		return
--	end
--	
--	tbPlayer:SetTitleFlag()
--	local nTime = GetCurServerTime() + 60*60*24*7
--	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
--	SetTask(TASK_ACTIVE_TITLE, nTitleId);
--	Title_AddTitle(nTitleId, 2, nTime)
--	Title_ActiveTitle(nTitleId)
end

function show_introduction()
	local szTitle = "Chµo ®¹i hiÖp! C¶nh Kü Tr­êng ®· ®­îc c«ng bè réng r·i ®Õn c¸c hiÖp kh¸ch trong giang hå. <enter> b¸o danh: nhÊn chuét ph¶i vµo b¶n ®å C¶nh Kü Tr­êng trªn gãc  ph¶i cña giao diÖn chİnh më ra b¶ng giao diÖn b¸o danh; <enter> Huy Ch­¬ng Vinh Dù C¶nh Kü Tr­êng: mçi tuÇn cø 20 trËn ®Çu sÏ nhËn ®­îc Huy Ch­¬ng Vinh Dù , nh÷ng ®¹i hiÖp tham gia ®¸nh ®ñ 20 trËn cßn cã thÓ nhËn ®­îc Huy Ch­¬ng kh¸c; <enter> ®¼ng cÊp chiÕn ®éi: c¨n cø theo biÓu hiÖn cña ng­¬i trong chiÕn ®éi chiÕn ®Êu, cã thÓ n©ng cao hoÆc lµ h¹ thÊp ®¼ng cÊp chiÕn ®éi cña ng­¬i; <enter> Cöa Hµng Huy Ch­¬ng Vinh Dù: sö dông Huy Ch­¬ng Vinh Dù ®Ó mua c¸c lo¹i ®¹o cô quı gi¸."
	local tbOpt = 
	{
		{"§­îc!", },
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function open_credits_shop()
	local nMapId = GetWorldPos()
	if (IsFreshmanMap(nMapId) == 1 or IsCityMap(nMapId) == 1) and GetFightState() == 0 then
		Sale(175, 16)
	else
		Msg2Player("ChØ cã thÓ më cöa hµng t¹i c¸c khu vùc an toµn nh­ thµnh thŞ vµ t©n thñ th«n.")
	end
end


function main()
	--Close dong nhan Vinh Du Canh Ky Truong, edit by ThanhLD - 20130516
	local szTitle = "Chµo ®¹i hiÖp, bæn tù lµ Quan Viªn C¶nh Kü Tr­êng."	
	local tbOpt = 
	{
		{"NhËn th­ëng chiÕn ®éi C¶nh Kü Tr­êng tuÇn nµy", want_get_title, {}},		
		{"Më cña hµng Vinh Dù C¶nh Kü Tr­êng", open_credits_shop, {}},
		{"Giíi thiÖu vÒ tİnh n¨ng C¶nh Kü Tr­êng", show_introduction, {}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szTitle, tbOpt)
end