-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	ÓÎÏ·ÍÆ¹ãÔ±ÏµÍ³
-- Include("\\script\\misc\\spreader\\spreader.lua")
---------------------------------------------------------------------------

IncludeLib("SPREADER")

Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
--Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")		--ÁìÈ¡¶ªÊ§»Æ½ð×°±¸

function main()
--DinhHQ
--20110322: Hæ trî copy nh©n vËt cho gi¶i ®Êu VLMC
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if now >= 20110328 and now <= 20120401 then
		Talk(1, "", "Chøc n¨ng t¹m ®ãng")
		return
	end
	game_spreader()
end
function game_spreader()
	if (SWITCH_SPREADER ~= 1) then
		Talk(1, "", "<color=green>Th«ng c¸o<color>: chøc n¨ng nµy ch­a ®­îc më, xin xem th«ng b¸o cña trang web!");
		return 0;
	end
	local szOp = 
	{
		"NhËp cd-key kÝch ho¹t tµi kho¶n/gsp_input_cdkey",
		"NhËn ®­îc phÇn th­ëng! /gsp_phase_prize",
		"NhËn s­ ®å thiÕp hoµng kim ng­êi míi/gsp_accept_goldcard", 
		"Liªn quan Th«ng c¸o.../gsp_about",
		"Båi th­êng cho bang héi ®ang chiÕm thµnh/about_castellan_remedy",
		"§Æt l¹i tªn cho nh©n vËt/about_rename_role",		
		"§Æt l¹i tªn cho bang héi/about_rename_tong",
		"Ng­êi ch¬i ®æi tªn nh©n vËt khi chuyÓn sang Server míi/rename_role_tranfer",
		"Nh©n tiÖn ghÐ qua th«i/gsp_cancel",
		"NhËn l¹i trang bÞ Hoµng Kim ®· mÊt!/restore_golditem",
	};
	
	if (SYSCFG_PRODUCT_REGION_ID	== DEF_PRODUCT_REGION_CN) then -- ´óÂ½°æ±¾
		Say("Hoan nghªnh vµo <color=green>Th«ng c¸o<color>, cã g× cÇn gióp ®ì?", 7,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[8]);
	elseif (SYSCFG_PRODUCT_REGION_ID	== DEF_PRODUCT_REGION_VN) then -- Ô½ÄÏ°æ±¾	
		Say("Xin hái cã thÓ gióp g× cho quý kh¸ch?", 10,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[7],
			szOp[8],
			szOp[10],
			szOp[9]);
	else
		Say("Xin hái cã thÓ gióp g× cho quý kh¸ch?", 1,
			szOp[8]);	
	end
end

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		Msg2Player("Ban ch­a l·nh gi¶i th­ëng gi¶i th­ëng cña ho¹t ®éng khuyÕn m·i! B©y giê tÆng b¹n.");
		gsp_newaccount_gift_core();
		nValue = nValue + 1; -- ´Ë²½¿É×ö¿É²»×ö
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "Tµi kho¶n nµy ®· kÝch ho¹t, kh«ng cÇn nhËp cd-key. Nh­ng b¹n cã thÓ kh«ng nhËn ®­îc thÎ S­ ®å Hoµng Kim, xin liªn hÖ víi Vinagame."
		Talk(1, "", "<color=green>Th«ng c¸o<color>:"..szError);
		gsp_writeLog(szError);
		return -1;
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY_PAY) then
		szError = "Tµi khoµn nµy ®· kÝch ho¹t, kh«ng cÇn nhËp cd-key. C¸m ¬n b¹n ®· ñng hé!"
		Talk(1, "", "<color=green>Th«ng c¸o<color>:"..szError);
		-- gsp_writeLog(szError);
		return -1;
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Xin nhËp cd-key:");
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>Th«ng c¸o<color>, xin xem trang web chÝnh thøc.");
end

function gsp_cancel()
end

-- ÁìÈ¡½×¶Î½±Àø
function gsp_phase_prize()
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	if (GetByte(nValue, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>Th«ng c¸o<color>: B¹n ch­a sö dông cd-key kÝch ho¹t tµi kho¶n nµy, kh«ng thÓ l·nh th­ëng. Mäi chi tiÕt xin xem trªn trang web.");
		return 0;
	end
	
	local nLevel = GetLevel();
	local nBonus = 0;
	local nPrizeLevel = 0;
	local nBit = 0;
	-----------------
	if (nLevel < 30) then
		Talk(1, "", "<color=green>Th«ng c¸o<color>: HiÖn ®¼ng cÊp cña b¹n lµ "..GetLevel().."cÊp, ch­a l·nh gi¶i th­ëng.<enter>Khi b¹n ®Õn cÊp 30, 40, 50, 80 h·y ®Õn nhËn gi¶i th­ëng! Cè lªn! <enter><enter><color=green>H­íng dÉn<color>: Cho phÐp b¹n sö dông <color=yellow>Hoµng Kim S­ ®å thiÕp<color>.");
		return 0;
	end
	if (nLevel >= 30 and GetBit(nValue, GSP_TASKID_TAG_BIT_30BONUS) == 0) then
		nPrizeLevel = 30;
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		nBonus = 300000; -- 30W
	-----------------
	elseif (nLevel >= 40 and GetBit(nValue, GSP_TASKID_TAG_BIT_40BONUS) == 0) then
		nPrizeLevel = 40;
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		nBonus = 400000; -- 40W
	-----------------
	elseif (nLevel >= 50 and GetBit(nValue, GSP_TASKID_TAG_BIT_50BONUS) == 0) then
		nPrizeLevel = 50;
		nBit = GSP_TASKID_TAG_BIT_50BONUS;
		nBonus = 1000000; -- 100W
	end
	-----------------
	if (nBonus > 0) then
		Earn(nBonus);
	elseif (nLevel >= 80 and GetBit(nValue, GSP_TASKID_TAG_BIT_80BONUS) == 0) then
		nPrizeLevel = 80;
		nBit = GSP_TASKID_TAG_BIT_80BONUS;
		if (gsp_prize_skills90() == 0) then -- Ñ§»á90¼¶¼¼ÄÜ = 0:Ñ§Ï°Ê§°Ü
			nPrizeLevel = 0;
			nBit = 0;
		end
	end
	-----------------
	
	if (nPrizeLevel ~= 0) then
		print("Value:"..nValue)
		nValue = SetBit(nValue, nBit, 1); -- ÉèÖÃÁìÈ¡±ê¼Ç
		print("Value:"..nValue)
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
		Talk(1, "", "<color=green>Th«ng c¸o<color>: B¹n nhËn ®­îc"..nPrizeLevel.."phÇn th­ëng cña giai ®o¹n nµy! Cè g¾ng nç lùc thªm nhÐ!");
	else
		Talk(1, "", "<color=green>Th«ng c¸o<color>: B¹n ®· l·nh gi¶i th­ëng, h·y cè g¾ng!");
	end
end

-- CDKEY¼ìÑé½á¹û·µ»Ø´¦Àí
function gsp_cdkey_verify_result(nResult)

	local szMsg = 
	{
		"Khi ph¸t sinh lçi, xin h·y liªn hÖ víi GM!",
		"cd-key v« hiÖu, xin nhËp ®óng cd-key!",
		"cd-key chÝnh x¸c, tµi kho¶n ®· kÝch ho¹t! Chµo mõng vµo Th«ng c¸o!",
		"ThÊt b¹i: Tµi kho¶n ®· sö dông h¬n 10 giê, kh«ng thÓ ®¨ng nhËp vµo l¹i!",
		"ThÊt b¹i: Tµi kho¶n nµy ®· kÝch ho¹t, kh«ng thÓ ®¨ng nhËp n÷a!"
	};
	local nSel = 1;
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2;
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3;
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4;
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 5;
	end

	gsp_writeLog(szMsg[nSel].." result: "..nResult);
	Msg2Player(szMsg[nSel]);
	Talk(1, "", " [<color=green>Th«ng c¸o<color>]"..szMsg[nSel]);

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
		gsp_config_for_join();
	end
	
	return 1;
end

-- ¼ÓÈëÏµÍ³£¬ÅäÖÃÏà¹ØÐÅÏ¢
function gsp_config_for_join()
	-- ÉèÖÃCDKEY¼¤»î
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, GSP_ACCOUNT_TYPE_CDKEY - nValue);
	
	gsp_accept_goldcard();
end

-- ½ÓÊÜ»Æ½ðÊ¦Í½¿¨
function gsp_accept_goldcard()
	-- ÉèÖÃ½ÇÉ«ÀàÐÍ for spreader
	SetTask(GSP_TASKID_ROLEREINFO, 0); -- ÏÈÇåÁã£¬ÓÐÎÞ±ØÒª£¿
	local nTaskValue = 0;
	nTaskValue = SetByte(nTaskValue, GSP_TASKID_TAG_BYTE_ROLETYPE, GSP_TASKID_ROLETYPE_CDKEY);
	SetTask(GSP_TASKID_ROLEREINFO, nTaskValue);
	--print("GSP_TASKID_ROLEREINFO:"..nTaskValue);
	-- ¸ü¸ÄÀ©Õ¹µãÊý¾Ý
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1);
	
	-- ËÍ»Æ½ðÊ¦Í½¿¨£¬±ê¼Ç»Æ½ðÍ½µÜ
	AddItem(6, 1, 441, 1, 0, 0); -- »Æ½ðÊ¦Í½¿¨
	SetTask(TKID_GOLD_APPRENTICE, 1); -- ±ê¼Ç½ÇÉ«Îª»Æ½ðÍ½µÜ
	
	local szMsg = "B¹n nhËn ®­îc <color=yellow>ThÎ Hoµng Kim S­ ®å<color>! Dïng nã ®Ó b¸i s­, b¹n vµ s­ phô ®Òu sÏ nhËn ®­îc nhiÒu phÇn th­ëng!"; 
	Msg2Player(szMsg);
	Talk(1, "", "<color=green>Th«ng c¸o<color>:"..szMsg);
	-- gsp_writeLog("»ñµÃ»Æ½ðÊ¦Í½¿¨");
end

------------------
-- 90¼¶¼¼ÄÜ
SKILLS_90 = {
	{	{318,1},{319,1},{321,1}}, --ÉÙÁÖ
	{	{322,1},{323,1},{325,1}}, --ÌìÍõ
	{	{339,1},{302,1},{342,1},{351,0}}, --ÌÆÃÅ
	{	{353,1},{355,1},{390,0}}, --Îå¶¾
	{	{328,1},{380,1},{332,0}}, --¶ëáÒ
	{	{336,1},{337,1}}, --´äÑÌ
	{	{357,1},{359,1}}, --Ø¤°ï
	{	{361,1},{362,1},{391,0}}, --ÌìÈÌ
	{	{365,1},{368,1}}, --Îäµ±
	{	{372,1},{375,1},{394,0}}, --À¥ÂØ
}

function gsp_prize_skills90()
	local faction = GetLastFactionNumber()
	if(faction ~= -1) then
		for i=1,getn(SKILLS_90[faction+1]) do
			-- Ã»ÓÐÑ§¹ý£¬²Å¼ÓÉÏ£¬·ñÔò»áÇåµôÔ­À´µÄ¼¶±ð
			if (HaveMagic(SKILLS_90[faction+1][i][1]) == -1) then
				AddMagic(SKILLS_90[faction+1][i][1],SKILLS_90[faction+1][i][2])
			end
		end
		Msg2Player("Chóc mõng b¹n ®· v­ît qua thö th¸ch cña <color=green>Th«ng c¸o<color>, cã thÓ l·nh ngé kü n¨ng cÊp 90 ")
		AddGlobalNews("Mäi ng­êi cïng nhau chóc mõng"..GetName().."ThuËn lîi th«ng qua thö th¸ch cña Th«ng c¸o cã thÓ l·nh ngé kü n¨ng cÊp 90 cña bæn m«n.")
		return 1;
	end
	Msg2Player("B¹n ch­a nhËp m«n! Kh«ng thÓ l·nh ngé ®­îc kü n¨ng cÊp 90!")
	Talk(1, "", "B¹n ch­a nhËp m«n! Kh«ng thÓ l·nh ngé ®­îc kü n¨ng cÊp 90!");
	return 0;
end

-- ¼ì²éÊÇ·ñÓÐÔ­Õ¼³Ç°ï»á²¹³¥
function check_castellan_remedy()
	if (GetBit(GetTask(TASKVALUE_BLEND), 3) == 1) then
		return 1;
	end
	return 0;
end

-- Çå³ýÓÐÔ­Õ¼³Ç°ï»á²¹³¥ÈÎÎñ±äÁ¿
function clear_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	value = SetBit(value, 3, 0)
	SetTask(TASKVALUE_BLEND, value)
end

-- Ô­Õ¼³Ç°ï»á²¹³¥
function about_castellan_remedy()
	if (check_castellan_remedy() == 1) then
		Say("<#> Do cã ph¸t sinh trôc trÆc nªn hÖ thèng ®· xö lý sai quyÒn h¹n cña b¹n! Chóng t«i kËp tøc båi th­êng! B¹n cã muèn nhËn båi th­êng ngay b©y giê kh«ng?",
			2,
			"<#> Ta muèn nhËn båi th­êng/take_castellan_remedy",
			"<#> LÇn sau ®Õn nhËn/cancel");
	else
		deny()
	end
end

-- ÁìÈ¡Ô­Õ¼³Ç°ï»á²¹³¥
function take_castellan_remedy()
	Say("<#> Mçi Bang héi chiÕm thµnh nhËn ®­îc phÇn th­ëng båi th­êng: 60 c¸i thÇn bÝ ®¹i hång bao (Do bang chñ nhËn lÊy) vµ 500000000 l­îng (Trùc tiÕp ®­a vµo ng©n quü Bang héi) . Xin h·y x¸c nhËn cßn kho¶ng trèng trªn hµnh trang, b¹n muèn nhËn ngay b©y giê chø?",
		2,
		"<#> Ta muèn nhËn ngay/take_castellan_remedy2",
		"<#> LÇn sau ®Õn nhËn/cancel")
end

function take_castellan_remedy2()
	if (check_castellan_remedy() == 1) then
		for i = 1, 60 do
			AddItem(6, 1, 402, 0, 0, 0, 0)
		end
		local now = date("%Y-%m-%d %H:%M:%S")
		local name = GetName()
		WriteLog(now .. " Båi th­êng cho bang héi ®ang chiÕm thµnh" .. name .. "nhËn ®­îc 60 thÇn bÝ ®¹i hång bao")
		Msg2Player("<#> B¹n nhËn ®­îc 60 c¸i thÇn bÝ ®¹i hång bao")

		tong, res = GetTong()
		if (res == 1 and tong ~= "") then
			local money = 500000000
			AddTongMoney(tong, money)
			WriteLog(now .. " Båi th­êng cho bang héi ®ang chiÕm thµnh" .. name .. "Bang héi hiÖn t¹i" .. tong .. "nhËn ®­îc 60 thÇn bÝ ®¹i hång bao")
			Msg2Player("<#> Bang héi cña b¹n nhËn ®­îc" .. money .. " l­îng")
		end
		clear_castellan_remedy()
	end
end

-- ÖØÃûÍæ¼Ò¸ü¸Ä½ÇÉ«Ãû¶Ô»°
function about_rename_role()
	local strInfo = "<#> Chµo b¹n! V× tªn nh©n vËt cña b¹n vµ ng­êi ch¬i kh¸c gièng nhau, cho nªn hÖ thèng ®· gióp b¹n ®æi tªn, b¹n cã thÓ söa tªn nh©n vËt cña b¹n tr­íc ®©y, cã thÓ kiÓm tra xem tªn ®ã cã dïng ®­îc kh«ng. Chó ý! B¹n chØ cã 1 c¬ héi duy nhÊt ®Ó ®æi tªn, xin h·y cÈn thËn tõng b­íc.";
	local strError= "<#> Xin lçi! B¹n kh«ng thÓ tiÕn hµnh thao t¸c nµy. ( ChØ cã thÓ thay ®æi tªn Nh©n vËt, tªn Bang héi, tªn bang chñ cña bang héi chiÕm thµnh) . Xin liªn hÖ víi GM ®Ó biÕt thªnm chi tiÕt";
	func_online_rename_role(strInfo, strError);
end

function rename_role_tranfer()
	local strInfo = "<#>B¹n chØ cã duy nhÊt 1 c¬ héi ®Ó ®æi tªn nh©n vËt. Cã thÓ xem tr­íc ®Ó lùa chän. Xin xem kü c¸c th«ng tin tr­íc khi quyÕt ®Þnh!";
	local strError= "<#> B¹n kh«ng thÓ thùc hiÖn thao t¸c nµy! ChØ ng­êi ®ang chuyÓn Server míi cã thÓ tiÕnh hµnh. Xin liªn hÖ víi bé phËn phôc vô ®Ó biÕt thªm chi tiÕt!";
	func_online_rename_role(strInfo, strError);
end

-- ÖØÃû°ï»á¸ü¸Ä°ï»áÃû
function about_rename_tong()
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> ChØ cã bang chñ míi cã thÓ thay ®æi tªn Bang héi")
	else
		local TongName, res = GetTong()	
		if (res == 1 and TongName ~= "") then	
			local strS = strfind(TongName,"@") or 0	
			if  strS > 0 then
				SetTask(TASKVALUE_BLEND, SetBit(GetTask(TASKVALUE_BLEND),2,1))
			end
			if (check_renametong() == 1) then
				Say("<#> Chµo b¹n! V× tªn nh©n vËt cña b¹n vµ ng­êi ch¬i kh¸c gièng nhau, cho nªn hÖ thèng ®· gióp b¹n ®æi tªn, b¹n cã thÓ söa tªn nh©n vËt cña b¹n tr­íc ®©y, cã thÓ kiÓm tra xem tªn ®ã cã dïng ®­îc kh«ng. Chó ý! B¹n chØ cã 1 c¬ héi duy nhÊt ®Ó ®æi tªn, xin h·y cÈn thËn tõng b­íc.",
					3,
					"<#> KiÓm tra tªn Bang héi cßn sö dông ®­îc kh«ng?/query_tongname",
					"<#> Söa ®æi tªn Bang héi cña m×nh/change_tongname",
					"<#> §Ó lÇn sau ta thay ®æi vËy/cancel")
			else
				deny()
			end
		end
	end
end

-- ²éÑ¯°ï»áÃû
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 8, "<#> Xin nhËp tªn Bang héi muèn t×m hiÓu");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ¸ü¸Ä°ï»áÃû
function change_tongname()
	Say("<#> C¸c b­íc cô thÓ: §èi tho¹i víi NPC, nhËp tªn bang héi cÇn thay ®æi vµo, b¹n sÏ tù ®éng rêi m¹ng. Sau 3 phót ®¨ng nhËp l¹i, nÕu tªn bang héi ®· thay ®æi th× ®­îc xem ®æi tªn thµnh c«ng; nÕu ch­a thay ®æi, mêi b¹n thùc hiÖn l¹i c¸c b­íc trªn. NÕu xuÊt hiÖn mét sè hiÖn t­îng l¹ xin liªn hÖ GM gi¶i quyÕt.", 
		2,
		"<#> B¾t ®Çu thay ®æi tªn Bang héi/change_tongname2",
		"<#> §Ó ta suy nghÜ l¹i/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 8, "<#> Xin nhËp tªn Bang héi míi vµo");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> ChØ cã bang chñ míi cã thÓ thay ®æi tªn Bang héi")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		local strS = strfind(new_tong,"@") or 0				
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> Kh«ng thÓ thay ®æi tªn Bang héi gièng nhau", 1, "<#> BiÕt råi!/cancel")
			elseif strS > 0 then
				Say("<#> Kh«ng thÓ thay ®æi tªn Bang héi cã ký tù ®Æc biÖt", 1, "<#> BiÕt råi!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny()
	Say("<#> Xin lçi! B¹n kh«ng thÓ tiÕn hµnh thao t¸c nµy. ( ChØ cã thÓ thay ®æi tªn Nh©n vËt, tªn Bang héi, tªn bang chñ cña bang héi chiÕm thµnh) . Xin liªn hÖ víi GM ®Ó biÕt thªnm chi tiÕt",
		1,
		"<#> BiÕt råi!/cancel")
end
