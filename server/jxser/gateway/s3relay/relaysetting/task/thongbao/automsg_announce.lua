function TaskShedule()
	TaskName("Tin tøc tù ®éng - th«ng b¸o");
	TaskInterval(20);
	-- TaskTime(0, 0);
	TaskCountLimit(0);
	OutputMsg("==========================================================");	
	OutputMsg("[Start] Tù §éng Th«ng B¸o");
end

g_strTipMsg = 
	{
		"Trong trß ch¬i khi ®èi tho¹i víi VÖ binh Thµnh m«n cña c¸c thµnh thŞ vµ ®Ö tö tiÕp dÉn c¸c m«n ph¸i ë c¸c T©n Thñ th«n ®Ó hiÓu ®­îc c¸c h­íng ph¸t triÓn kü n¨ng cña tõng m«n ph¸i vµ khu vùc luyÖn c«ng thİch hîp.",
		"NÕu b¹n ph¸t hiÖn m×nh bŞ mÊt nh÷ng kü n¨ng ®· häc ®­îc, h·y håi s­ sÏ häc ®­îc c¸c kü n¨ng nh­ HuyÕt ChiÕn B¸t Ph­¬ng, V« T©m Tr¶m, Thiªn V­¬ng ChiÕn ı (Thiªn V­¬ng Bang) , cïng víi T©m Nh·n vµ Thiªn La §Şa Vâng (§­êng M«n) .",
		"Mét bé phËn ng­êi ch¬i sau khi hoµn thµnh [NhiÖm vô cÊp 90] cña m«n ph¸i ch­a thÓ nhËn ®­îc kü n¨ng, sau khi [håi s­] vÒ [Viªn Quan tho¸i nhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) ",
		"Mét bé phËn ng­êi ch¬i §­êng M«n sau khi häc [Tô tiÔn thuËt. B¹o Vò Lª Hoa] gÆp t×nh tr¹ng kh«ng thÓ sö dông B¹o Vò Lª Hoa, sau khi trë vÒ [håi s­] l¹i ®Õn [Viªn quan Tho¸i NhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) .",
		"Mét bé phËn ng­êi ch¬i Vâ §ang gÆp t×nh tr¹ng bŞ mÊt ®iÓm kü n¨ng, sau khi vÒ [håi s­] ®Õn [Viªn Quan Tho¸i NhiÖm] l©m An ®Ó chØnh söa l¹i (L©m An [183,182]) ",
		"Sö dông [Kim Th¶o Lé] luyÖn cÊp trong vßng 1 giê sÏ ®­îc ®iÓm kinh nghiÖm gÊp ®«i: Sö dông [B¹ch C©u hoµn] trong vßng 1 giê sÏ ®­îc [tù ®éng ®¸nh qu¸i]. C«ng n¨ng cña 2 lo¹i d­îc phÈm nµy sÏ ®­îc më vµo ngµy ",
		"[HÖ thèng phóc duyªn] th«ng qua thêi gian ch¬i t¨ng dÇn ®Ó ®æi lÊy ®iÓm phóc duyªn. Dïng ®iÓm phóc duyªn ®Õn [ThÇn bİ th­¬ng nh©n LiÔu Êt] T­¬ng D­¬ng ®Ó ®æi lÊy c¸c lo¹i vËt phÈm ®Æc thï.",
		"[HÖ thèng phóc duyªn] ®èi tho¹i víi [Vâ L©m truyÒn nh©n] ë c¸c thµnh thŞ ®Ó biÕt th«ng tin chi tiÕt.",
		--"[Ho¹t ®éng Trung Thu] ¡n b¸nh trung thu, ng¾m tr¨ng s¸ng, vŞnh th¬, gi¶i c©u ®è ch÷-----ho¹t ®éng ®ang triÓn khai toµn diÖn, nhiÒu phÇn th­ëng ®ang chê ®ãn b¹n! Vui lßng ®Õn LÔ Quan c¸c thµnh thŞ ®Ó hái thªm chi tiÕt.",
	};
	
-- ĞÂ¹¦ÄÜÔ¤¸æĞÅÏ¢
g_nFutureDate = 20040723;
STR_HEAD_FUTURE = " [Giang hå truyÒn r»ng]";
g_strFutureMsg = {};
function TaskContent()
	str = "";
	nFutureCount = getn(g_strFutureMsg);
	nCount = getn(g_strTipMsg) + nFutureCount;
	nIndex = random(1, nCount);
	if (nIndex <= nFutureCount) then
		str = getFutureMsg();
		if (strlen(str) <= 0) then 
			str = getTipMsg();
		end
	else
		str = getTipMsg();
	end
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d"));
	str = "";
	if (g_nFutureDate > nCurDate) then
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end
