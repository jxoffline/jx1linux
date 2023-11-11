--ÉÍÉÆÊ¹
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("Chøc n¨ng vÉn ch­a Më ra", 0)
		return
	end
	--¶ÁÈ¡´æÅÌÎÄ¼ş£¬±£Ö¤Ö»¶ÁÈ¡Ò»´Î
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#> Th­ëng ThiÖn Sø: Ta lµ sø gi¶ phô tr¸ch Th­ëng ThiÖn LÖnh, cã thÓ gióp g× cho ng­¬i?",
		"<#> Giao Th­ëng ThiÖn LÖnh/onsubmit",
		"<#> NhËn phÇn th­ëng/ontakeprize",
		"<#> T×m hiÓu c«ng tr¹ng c¸c thµnh bang héi m×nh chiÕm lÜnh ®­îc/onchecknum",
		"<#> T×m hiÓu ho¹t ®éng lÇn nµy/onhelp",
		"<#> Nh©n tiÖn ghĞ qua th«i/oncancel",
	}
	
	Say(aryszContent[1], 5, aryszContent[2], aryszContent[3], aryszContent[4], aryszContent[5], aryszContent[6]);
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
		if (strCityTongName ~= "") then 
			if (strCityTongName == strTongName) then
				return nCityID
			end
		end
	end
	
	--±íÊ¾Íæ¼ÒËùÔÚµÄ°ï»áÃ»ÓĞÕ¼Áì³ÇÊĞ
	return 0
end

--Ä³Ò»³ÇÊĞµÄÉÍÉÆÁîÔö¼Óµ½¿ªÊ¼½±ÉÍµÄÊıÁ¿
function beginadward(nCityIndex)
	--Ê×ÏÈÇå¿ÕËùÓĞ³ÇÊĞÀÛ¼ÆµÄÉÍÉÆÁî
	for i=1, 7 do
		SetGlbValue(arraycitytoglobalvalue[i], 0)
	end
	
	--Çå¿ÕËùÓĞÀÛ¼ÆÊı¾İ
	for i=1, 7 do
		CityData[i] = 0
	end
	
	local strTongName = GetCityOwner(nCityIndex)
	--´æ´¢Òª½±ÀøµÄ³ÇÊĞË÷Òı
	SetGlbValue(AEXP_GLOBAL_ADWARD_CITY, nCityIndex)

	--ÉèÖÃ½±ÀøµÄ×îºóÆÚÏŞ
	--´æ´¢Ê±¼ä±äÁ¿(ÏµÍ³µÄÊ±¼ä)
	local nEnddate = GetCurrentTime() + AEXP_ADWARD_HOURNUM * 60 * 60
	SetGlbValue(AEXP_GLOBAL_ENDDATE, nEnddate)
	
	--½øĞĞ´æÅÌ
	savevalue()
		
	--Ôö¼ÓÊÀ½çÏÔÊ¾ÏûÏ¢
	AddGlobalCountNews("Bang héi"..strTongName.."§¹t ®­îc c«ng tr¹ng chiÕm lÜnh thµnh sÏ nhËn ®­îc phÇn th­ëng, mêi c¸c bang chóng trong bang ®Õn D­¬ng Ch©u gÆp Th­ëng ThiÖn Sø ®Ó nhËn phÇn th­ëng, kú h¹n l·nh th­ëng lµ "..AEXP_ADWARD_HOURNUM.."giê, qua giê th× kh«ng cßn c«ng hiÖu. TÊt c¶ c«ng tr¹ng c¸c thµnh thŞ ®Òu biÕn mÊt", 1)
end

function onsubmit()
	--ÅĞ¶ÏÕ¼Áì³ÇÊĞµÄ°ï»á
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1) then
		Say("<#> B¹n ch­a gia nhËp bang héi hoÆc bang héi cña b¹n ch­a chiÕm lÜnh ®­îc thµnh thŞ, kh«ng thÓ nhËn Th­ëng ThiÖn LÖnh.", 0)
		return
	end
	
	--´ò¿ª¸øÓë½çÃæ
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	GiveItemUI( "Giao Th­ëng ThiÖn LÖnh", "Th­ëng ThiÖn LÖnh cã thÓ gia t¨ng c«ng tr¹ng chiÕm lÜnh thµnh cña bang héi, khi ®iÓm tİch lòy c«ng tr¹ng ®Õn mét møc nµo ®ã, tÊt c¶ bang chóng trong bang héi ®Òu nhËn ®­îc phÇn th­ëng, bang ph¸i cña  b¹n ®ang chiÕm lÜnh thµnh thŞ lµ<color=read>"..arraycityindextoname[nCityIndex].."<color>, c«ng tr¹ng lµ:<color=read>"..nNum.."<color>", "onsubmitconfirm", "oncancel" );
end

-- »ñÈ¡¿É»ñµÃ½±ÀøµÄÁîÅÆÊıÄ¿
function GetMaxCardCount()
	local count = GetTongMemberCount()
	if (count == 0) then
		return 999999999
	end
	if (count > 1500) then	-- (1500, +¡Ş)
		return 49999
	elseif (count > 900) then	-- (900, 1500]
		return 39999
	elseif (count > 600) then	-- (600, 900]
		return 29999
	elseif (count > 300) then	-- (300, 600]
		return 19999
	else 						-- (0, 300]
		return 9999
	end
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("Ng­¬i ch­a giao Th­ëng ThiÖn LÖnh")
		return
	end
	
	--ÅĞ¶Ï±¾°ï»áÕ¼ÁìµÄ³ÇÊĞ
	local nCityIndex = gettongownercity();
	if (nCityIndex < 1) then
		Say("B¹n ch­a gia nhËp bang héi hoÆc bang héi cña b¹n ch­a chiÕm lÜnh ®­îc thµnh thŞ, kh«ng thÓ nhËn Th­ëng ThiÖn LÖnh.", 0)
		return
	end
		
	--ÅĞ¶ÏÎïÆ·ÊÇ·ñÎªÉÍÉÆÁî
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_AWARDMEDIAL_NGENTYPE or
			DetailType ~= AEXP_AWARDMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_AWARDMEDIAL_PARTYPE) then
				Msg2Player("H×nh nh­ ng­¬i trªn ng­êi ng­¬i cã thø kh«ng ph¶i Th­ëng ThiÖn LÖnh!")
				return 0			
		end
	end
	local nTotalNum = 0;
	--É¾³ıËùÓĞÉÍÉÆÁî
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	--if (nNum < 0) then
		--nNum = 0
	--end
	nNum = nNum + nTotalNum;
	SetGlbValue(arraycitytoglobalvalue[nCityIndex], nNum)
	SetTask(1074,1);
	
	local strTongName = GetCityOwner(nCityIndex)	
	if (nNum >= GetMaxCardCount()) then
		Msg2Player("Bang ph¸i cña c¸c b¹n chiÕm lÜnh thµnh thŞ "..arraycityindextoname[nCityIndex].."nhËn ®­îc phÇn th­ëng,   mau nhanh l·nh th­ëng ®i!")
		WriteLog( "["..date("%Y-%m-%d %X").."] Bang héi:"..strTongName.."Thµnh thŞ "..arraycityindextoname[nCityIndex].."NhËn ®­îc phÇn th­ëng."..GetAccount().."("..GetName()..") ®· giao"..nTotalNum.."mét Th­ëng ThiÖn LÖnh (Current OnlineTime: "..GetGameTime().." sec)" );
		beginadward(nCityIndex)
	else
		CityData[nCityIndex] = CityData[nCityIndex] + nTotalNum
		if (CityData[nCityIndex] > AEXP_ADDMAX_SAVE) then
			CityData[nCityIndex] = 0			
			WriteLog( "["..date("%Y-%m-%d %X").."] Bang héi"..strTongName.."Thµnh thŞ "..arraycityindextoname[nCityIndex].."V× "..GetAccount().."("..GetName()..") ®· giao"..nTotalNum.."mét Th­ëng ThiÖn LÖnh,  sè l­îng lµ "..nNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
			savevalue()			
		end
		Msg2Player("C«ng tr¹ng bang héi cña c¸c b¹n ®· t¨ng lªn"..nTotalNum..", tr­íc m¾t lµ:"..nNum);
	end 	
end

function ontakeprize()
	
	-- ÅĞ¶ÏÍæ¼Ò°ï»áËùÕ¼³ÇÊĞµÄË÷Òı
	local nCityIndex = gettongownercity()	
	if (nCityIndex < 1 ) then
		Say("<#> B¹n ch­a gia nhËp bang héi hoÆc bang héi b¹n ch­a chiÕm lÜnh ®­îc thµnh thŞ, kh«ng thÓ nhËn phÇn th­ëng.", 0);
	 	return 0
	end
	 
	--ÅĞ¶ÏÍæ¼Ò°ï»áËùÕ¼³ÇÊĞÊÇ·ñ»ñµÄ½±Àø
	local nAdwardCityIndex = GetGlbValue(AEXP_GLOBAL_ADWARD_CITY)
	if (nAdwardCityIndex < 1) then
		Say("<#> HiÖn t¹i kh«ng cã thµnh thŞ nhËn ®­îc phÇn th­ëng, kh«ng thÓ nhËn.", 0);
		return 0
	end
	
	if (nAdwardCityIndex ~= nCityIndex) then
		Say("<#> B¹n ®ang ë trong bang héi cã c«ng tr¹ng chiÕm lÜnh thµnh thŞ kh«ng ®ñ, kh«ng nhËn ®­îc phÇn th­ëng.", 0);
		return 0
	end
	 
	local nNow = GetCurrentTime()
	local nLastdate = GetGlbValue(AEXP_GLOBAL_ENDDATE);
	if (nNow > nLastdate) then
		Say("<#> Thêi gian l·nh th­ëng ®· hÕt, kh«ng thÓ nhËn ®­îc phÇn th­ëng c«ng tr¹ng thµnh thŞ kú nµy.", 0);
		SetTask(1074,0);
		return 0
	end
	
	--ÅĞ¶ÏÍæ¼ÒµÄÈë°ïÊ±¼ä
	if (GetJoinTongTime() < AEXP_PLAYERTONG_LIMIT * 24 * 60) then
		Say("<#> Thêi gian gia nhËp bang ph¸i cña b¹n ch­a ®ñ<color=red>"..AEXP_PLAYERTONG_LIMIT.."<color>ngµy, kh«ng thÓ nhËn phÇn th­ëng.", 0);
		return 0
	end
	
	--ÅĞ¶ÏÍæ¼Ò×îºóÒ»´ÎµÄÁì½±ÈÕÆÚ
	local today = tonumber(date("%Y%m%d"))
	local nLastAdward = GetTask(AEXP_TASK_ADWARDDATE)
	if (today == nLastAdward) then
		Say("<#> PhÇn th­ëng h«m nay b¹n ®· nhËn, kh«ng thÓ nhËn thªm mét lÇn n÷a!", 0);
		return 0
	end
	
	--Èç¹ûËùÓĞÌõ¼ş¶¼Âú×ãÄÇÃ´¸øÓë½±Àø
	if(GetTask(1074) ~= 1) then
		Say("<#> B¹n kh«ng giao nép Th­ëng ThiÖn LÖnh cho bang héi, kh«ng thÓ nhËn ®­îc phÇn th­ëng.",0);
		return 0
	end
	giveprize();
	return 1
end

--Èç¹û¶¼³É¹¦ÄÇÃ´£¬¸øÍæ¼Ò½±Àø
function giveprize()
	--½±Àø(ÏÉ²İÂ¶µÄ½±Àø)
	--Ëæ¼´ĞÎ³É½±Àø
	local iRand = random(1,1)
	if (iRand == 1) then
		local nExpRate = 0--GetNpcExpRate()
		if (nExpRate == nil) then
			nExpRate = 1
		end
		if (nExpRate <= 100) then
			AddSkillState(440, 1, 1, AEXP_ADWARD_TIME * FRAME2TIME * 60 * 60);
			SetTask(1074,0);
			Say("Chóc mõng! B¹n nhËn ®­îc "..AEXP_ADWARD_TIME.."PhÇn th­ëng t¨ng gÊp ®«i ®iÓm kinh nghiÖm trong mét giê ", 0)
		else
			Say("<#> Xin lçi! HiÖn t¹i kh«ng thÓ cho b¹n ®iÓm kinh nghiÖm gÊp béi.", 0)
			return 1
		end
	else
		--ÔÚÕâÀïÌí¼Ó±ğµÄ½±Àø°É 	
	end
	
	--Õâ¶Î»°·ÅÖÃµ½ÕâÀï»¹ÊÇÇ°Ãæ£¿
	--ÉèÖÃÍæ¼Ò×îºóÁì½±ÈÕÆÚ
	WriteLog( "["..date("%Y-%m-%d %X").."] c«ng tr¹ng thµnh thŞ ®­îc tİnh tíi mét giíi h¹n nµo ®ã. Ng­êi ch¬i"..GetAccount().."("..GetName()..") ®· nhËn ®­îc phÇn th­ëng (Current OnlineTime: "..GetGameTime().." sec)" );	
	
	-- ÉèÖÃÉÏ´ÎÁì½±µÄÈÕÆÚ
	local today = tonumber(date("%Y%m%d"))
	SetTask(AEXP_TASK_ADWARDDATE, today)
end

function onchecknum()
	--µÃµ½Íæ¼ÒËùÔÚ°ï»áÕ¼Áì³ÇÊĞµÄË÷Òı
	--Èç¹ûĞ¡ÓÚ1ÄÇÃ´±íÊ¾Íæ¼ÒµÄ°ï»áÃ»ÓĞÕ¼Áì³ÇÊĞ
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1 ) then
		Say("<#> B¹n ch­a gia nhËp bang héi hoÆc bang héi b¹n  ch­a chiÕm lÜnh ®­îc thµnh thŞ, kh«ng cã ®iÓm tİch lòy c«ng tr¹ng thµnh thŞ.", 0);
		return 
	end
	
	--µÃµ½Íæ¼Ò°ï»áÕ¼Áì³ÇÊĞµÄÉÍÉÆÁìÊıÁ¿
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	Say("<#> Bang héi c¸c b¹n chiÕm lÜnh thµnh thŞ lµ<color=red>"..arraycityindextoname[nCityIndex].."<color>, c«ng tr¹ng thµnh thŞ lµ:<color=red>"..nNum.."<color>", 0);
end

function oncancel()
	return
end

function onhelp()
	Talk(2, "continuefun_help","<#> HÖ thèng giíi thiÖu Th­ëng ThiÖn Ph¹t ¸c: Nh©n vËt trªn cÊp 50 cã thÓ ®¸nh qu¸i ®Ó nhËn ®­îc Th­ëng ThiÖn LÖnh vµ Ph¹t ¸c LÖnh. Thµnh viªn cña c¸c bang ph¸i chiÕm l·nh c¸c thµnh thŞ lín cã thÓ ®Õn D­¬ng Ch©u chç Th­ëng ThiÖn Sø [n÷] giao Th­ëng ThiÖn LÖnh, gióp bang ph¸i tİnh lòy c«ng tr¹ng t­¬ng øng cã ®­îc.", "TÊt c¶ ng­êi ch¬i cã thÓ ®Õn D­¬ng Ch©u chç Ph¹t ¸c Sø [nam] sö dông Ph¹t ¸c LÖnh trõng ph¹t 7 thµnh thŞ lín. Mçi khi ng­êi ch¬i giao mét Ph¹t ¸c LÖnh cho bÊt cø thµnh thŞ nµo th× sè l­îng tİch lòy Th­ëng ThiÖn LÖnh thµnh thŞ ®ã gi¶m ®i mét c¸i.");
end

function continuefun_help()
	Talk(3, "", "Khi mét thµnh thŞ nµo ®ã mµ cã c«ng tr¹ng tİch lòy tíi mét møc nµo ®ã, bÊt cø thµnh viªn nµo gia nhËp h¬n mét ngµy cã giao nép Th­ëng ThiÖn LÖnh ®Òu cã thÓ trong thêi gian quy ®Şnh nhËn ®­îc phÇn th­ëng 4 giê nh©n ®«i ®iÓm kinh nghiÖm, ®ång thêi sè l­îng Th­ëng ThiÖn LÖnh cña c¸c thµnh thŞ kh¸c trë vÒ 0.","Chó ı: <color=red>Trong thêi gian nµy kh«ng ®­îc sö dông Tiªn Th¶o lé, ®ång thêi mét khi ®· chÕt th× sÏ mÊt c«ng hiÖu nh©n ®«i ®iÓm kinh nghiÖm.<color> Trong thêi gian l·nh th­ëng nÕu mét thµnh thŞ nµo cã c«ng tr¹ng ®¹t ®Õn ®iÒu kiÖn ph¸t th­ëng, th× bang ph¸i míi nhÊt ®ã sÏ ®­îc nhËn th­ëng, nh÷ng bang chóng tr­íc trong bang cò kh«ng thÓ nhËn ®­îc bÊt cø phÇn th­ëng nµo.", "Quan hÖ quy m« bang héi vµ c«ng tr¹ng thµnh thŞ cÇn thiÕt: Nh©n sè<=300, c«ng tr¹ng 9999;300<nh©n sè<=600, c«ng tr¹ng 19999;600<nh©n sè<=900, c«ng tr¹ng 29999;900<nh©n sè<=1500, c«ng tr¹ng 39999;1500<nh©n sè, c«ng tr¹ng 49999.");
end