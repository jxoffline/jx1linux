Include("\\script\\item\\techan_zijingao.lua")
Include("\\script\\item\\techan_dahuandan.lua")

----·é»ğÓ¢ĞÛÁî»î¶¯ Èë¿Ú
function enter_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	local tbDescribe = {"<dec>Ho¹t ®éng Phong Háa Anh Hïng LÖnh b¾t ®Çu tõ <color=yellow>01-12-2006<color> ®Õn <color=yellow>24h00 01-01-2007<color>. Sö dông Phong Háa Anh Hïng LÖnh ®Ó mua c¸c vËt phÈm vµ ®æi LÖnh bµi gäi Boss sÏ tiÕp tôc ®Õn <color=yellow>08-01-2007<color>. Néi dung chi tiÕt xem trªn trang chñ. <enter>Tr­íc m¾t sè l­îng anh hïng lÖnh cña ng­¬i lµ: <color=yellow>"..nCount.." c¸i<color>.<enter>Ng­¬i muèn tham gia ho¹t ®éng nµo?", 
	"§æi phong háa anh hïng lÖnh/change_contribution_heroling", 
	"§em Phong Háa Anh Hïng lÖnh ®Ó mua vËt phÈm/saleby_heroling", 
	"§em Phong Háa Anh Hïng LÖnh ®æi lÊy LÖnh bµi gäi Boss/change_heroling_bosscharm", 
	"§em MËt th­ ®æi lÊy LÖnh bµi vinh dù/change_letter_honour",
	"Rêi khái/tong_cancel"};
	
	CreateTaskSay(tbDescribe);
end;

-----ÒÔ·é»ğÓ¢ĞÛÁî¹ºÂòÌØÊâÎïÆ· Start
function saleby_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	CreateTaskSay({"<dec><color=yellow>Phong Háa Anh Hïng LÖnh<color> dïng ®Ó mua c¸c vËt phÈm ®Æc biÖt. VËt phÈm ®Æc biÖt vÉn ph¶i tiªu hao <color=yellow>®iÓm cèng hiÕn c¸ nh©n<color> ®Ó ®æi. Khi mua vËt phÈm sÏ trõ vµo sè l­îng lÖnh bµi vµ ®­îc ghi l¹i ë <color=yellow>sè l­îng lÖnh bµi cña bang bŞ tiªu hao<color>. Sè l­îng tiªu hao nµy sÏ quyÕt ®Şnh bang héi cã thÓ nhËn ®­îc bao nhiªu lÖnh bµi gäi Boss trong tuÇn, vµ bang héi cã quyÒn tham gia ho¹t ®éng MËt th­ hay kh«ng."
	.."<enter>Sè l­îng Phong Háa Anh Hïng LÖnh cã thÓ sö dông hiÖn t¹i lµ: <color=yellow>"..nCount.." c¸i<color>."
	.."<enter>Tæng ®iÓm cèng hiÕn hiÖn t¹i cã thÓ sö dông lµ: <color=yellow>"..GetContribution().." ®iÓm<color>."
	.."<enter>Ng­¬i muèn mua vËt phÈm g×?", 
	"Tö Kim Cµo/saleby_heroling_enter",
	"Tói ThÇn kú/saleby_heroling_enter",
	"Méc nh©n/saleby_heroling_enter",
	"Vßng s¸ng ¸m ¶nh/saleby_heroling_enter",
	"Vßng s¸ng H­¬ng Tiªu/saleby_heroling_enter",
	"Vßng s¸ng Th­¬ng ¦ng/saleby_heroling_enter",
	"MÆt n¹ ngôy trang/saleby_heroling_enter",
	"§¹i Hoµn §¬n/saleby_heroling_enter",
	"Trë vÒ/enter_heroling",
	"Rêi khái/tong_cancel"});
end;

function check_salebyheroling(nTongID, nPrice)
	if (nTongID == 0) then
		return 0;
	end;
	local nContribution = GetContribution();
	local nHeroling = GetTask(TASKID_HEROLING_COUNT);
	if (nHeroling < 1) then
		CreateTaskSay({"<dec>§iÓm cèng hiÕn kh«ng ®ñ, h·y cè g¾ng t×m ®iÓm cèng hiÕn tr­íc ®·.", "KÕt thóc ®èi tho¹i/tong_cancel"});
	elseif (nContribution < nPrice) then
		CreateTaskSay({"<dec>HiÖn t¹i kh«ng cã Phong Háa Anh Hïng LÖnh, sau khi tİch lòy ®ñ ®iÓm cèng hiÕn míi cã thÓ ®Õn nhËn Phong Háa Anh Hïng LÖnh.", "KÕt thóc ®èi tho¹i/tong_cancel"});
	else
		return 1
	end;
	return 0;
end;


-----**´ó»¹µ¤**
function sale_heroling_dahuandan(nCount, nPrice)
		local nRestH, nRestM = adddahuandan_main(10, nCount);	--1.6±¶ĞèÒª 10¼¶×÷·»
		Msg2Player("<#>B¹n mua ®­îc 1 viªn"..nCount.."§¹i Hoµn §¬n, thêi gian sö dông §¹i Hoµn ®¬n hiÖn t¹i lµ "..nRestH.."giê "..nRestM.."phót.")
end;
-----**´ó»¹µ¤ end


-----**Î±×°Ãæ¾ß**
function sale_heroling_weizhuang(nCount, nPrice)
	for i = 1, nCount do
		AddItem(0,11,366,1,0,0);
	end;
		Msg2Player("B¹n ®¹t ®­îc "..nCount.." 24 giê, mÆt n¹ ngôy trang cã thÓ sö dông 10 lÇn")
end;
-----**Î±×°Ãæ¾ß end


-----**²ÔÓ¥¹â»·**
function sale_heroling_cangying(nCount, nPrice)
	delguanghuan()
	AddSkillState(728, 1, 1, 10886400 * nCount, 1);--7Ìì
	Msg2Player("NhËn ®­îc 1 vßng danh hiÖu Th­¬ng ¦ng, thêi gian cßn l¹i lµ "..(7*nCount).."Ngµy");
end;
-----**²ÔÓ¥¹â»· end


-----**Ïã½¶¹â»·**
function sale_heroling_xiangjiao(nCount, nPrice)	
	delguanghuan()
	AddSkillState(727, 1, 1, 10886400 * nCount,1);--7Ìì
	Msg2Player("NhËn ®­îc 1 vßng danh hiÖu H­¬ng Tiªu, thêi gian cßn l¹i lµ "..(7*nCount).."Ngµy");
end;
-----**Ïã½¶¹â»· end


-----**°µÓ°¹â»·**
function sale_heroling_anying(nCount, nPrice)
	delguanghuan()
	AddSkillState(730, 1, 1, 10886400 * nCount, 1);--7Ìì
	Msg2Player("NhËn ®­îc 1 vßng danh hiÖu ¢m ¶nh, thêi gian cßn l¹i lµ "..(7*nCount).."Ngµy");
end;
-----**°µÓ°¹â»· end

function delguanghuan()
	for i = 726, 731 do
		AddSkillState(i, 1, 1, 0);
	end;
end;

-----**ĞŞÁ¶Ä¾ÈË**
function sale_heroling_xiulianmuren(nCount, nPrice)
	for i = 1, nCount do
		local nItemIndex = AddItem(6,1,1085,1,1,0)
		SetSpecItemParam(nItemIndex, 1, nTongID)
		SetSpecItemParam(nItemIndex, 2, 10)
		SyncItem(nItemIndex)
	end;
	Msg2Player("NhËn ®­îc "..nCount.." mét Méc Nh©n.")
end;
-----**ĞŞÁ¶Ä¾ÈË end

-----**ĞŞÀí°ü**
function sale_heroling_xiulibao(nCount, nPrice)
	for i =1, nCount do
		local nItemIndex = AddItem(6,1,1084,1,1,0)
		SetSpecItemParam(nItemIndex, 2, GetLocalDate("%y%m%d"))
		SyncItem(nItemIndex)
	end;
		Msg2Player("NhËn ®­îc "..nCount.." tói ®å nghÒ, thêi gian cßn l¹i lµ 7 ngµy.")
end;
-----**ĞŞÀí°ü end

-----**×Ï½ğ¸ä**
function sale_heroling_zijingao(nCount, nPrice)
		local nRestH, nRestM = addzijingao_main(nCount);
		Msg2Player("NhËn ®­îc 1 Tö Kim Cµo, thêi gian cßn l¹i lµ "..nRestH.." giê, "..nRestM.."phót")
end;
-----**×Ï½ğ¸ä end

function saleby_heroling_enter(nSel)
	nSel = nSel + 1
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	if (nCount < 1) then
		CreateTaskSay({"<dec>Kh«ng cã Phong Háa Anh Hïng LÖnh th× kh«ng thÓ mua vËt phÈm.", "KÕt thóc ®èi tho¹i/tong_cancel"});
		return 0
	end;
	local arySalebyHeroling = {
						{"<dec>Cã thÓ sö dông <color=yellow>Tö Kim Cµo<color> ®Ó ®µo kho¸ng trªn §µo Hoa §¶o, L­u ı lµ kh«ng thÓ dïng Tö Kim Cµo chung víi c¸c c«ng cô ®µo kho¸ng th­êng kh¸c. NÕu dïng chung th× tr­íc tiªn sÏ trõ thêi gian sö dông Tö Kim Cµo, sau ®ã lµ ®Õn c«ng cô kia. <enter>§Ó nhËn Tö Kim Cµo cÇn tiªu phİ: <color=yellow>200 ®iÓm<color> ", "Muèn nhËn 1 c¸i/#saleby_heroling_confirm(1,200,'sale_heroling_zijingao')", "Muèn nhËn 2 c¸i/#saleby_heroling_confirm(2,400,'sale_heroling_zijingao')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec><color=yellow>Tói ®å nghÒ<color> lµ ®¹o cô cã thÓ ®Æt vµo hµnh trang, gióp söa ch÷a trang bŞ mµ kh«ng cÇn quay vÒ thµnh, vµ ®­¬ng nhiªn lµ ph¶i tr¶ chi phİ t­¬ng ®­¬ng. Tói ®å nghÒ cã thêi h¹n sö dông lµ 1 tuÇn.<enter>§Ó nhËn 1 tói ®å nghÒ cÇn tiªu phİ ®iÓm cèng hiÕn lµ: <color=yellow>50 ®iÓm<color>", "§æi 1 tói ®å nghÒ/#saleby_heroling_confirm(50,'sale_heroling_xiulibao')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>NhÊp chuét ph¶i sö dông ®Ó gäi ra 1 Méc Nh©n. Sau khi ®¸nh b¹i méc nh©n sÏ nhËn ®­îc ®iÓm kinh nghiÖm.<enter>§Ó nhËn 1 Méc nh©n cÇn tiªu phİ ®iÓm cèng hiÕn: <color=yellow>100 ®iÓm<color>", "§æi 1 méc nh©n/#saleby_heroling_confirm(100,'sale_heroling_xiulianmuren')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>Vßng danh hiÖu nµy sÏ cho ng­¬i mét c¶m gi¸c th©m s©u huyÒn ¶o, cã thêi h¹n sö dông lµ 1 tuÇn.<enter>§Ó ®æi lÊy vßng danh hiÖu cÇn sö dông ®iÓm cèng hiÕn: <color=yellow>30 ®iÓm<color>", "NhËn 1 vßng danh hiÖu ¢m ¶nh/#saleby_heroling_confirm(30,'sale_heroling_anying')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>§©y lµ vßng danh hiÖu mang s¾c th¸i ph­¬ng Nam. NhËn vßng H­¬ng Tiªu cÇn sö dông ®iÓm cèng hiÕn lµ <color=yellow>30 ®iÓm<color>. ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn.", "NhËn 1 vßng danh hiÖu H­¬ng Tiªu/#saleby_heroling_confirm(30,'sale_heroling_xiangjiao')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>Ng­¬i thİch bay l­în kh«ng? vßng danh hiÖu nµy mang l¹i c¶m gi¸c mét con chim ¦ng bay ë phİa sau, cã thêi gian sö dông lµ 1 tuÇn.<enter>Muèn nhËn vßng danh hiÖu nµy cÇn sö dông ®iÓm cèng hiÕn lµ: <color=yellow>30 ®iÓm<color>", "NhËn 1 vßng danh hiÖu Th­¬ng ¦ng/#saleby_heroling_confirm(30,'sale_heroling_cangying')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>MÆt n¹ ngôy trang lµ lo¹i mÆt n¹ h¹n chÕ thêi gian 24 giê vµ sè lÇn sö dông kü n¨ng ngôy trang lµ 10 lÇn. Khi dïng hÕt 10 lÇn th× kh«ng thÓ sö dông kü n¨ng ngôy trang ®­îc n÷a.<enter>§iÓm cèng hiÕ cÇn ®Ó ®æi mÆt n¹ ngôy trang lµ: <color=yellow>300 ®iÓm<color>", "§æi 1 mÆt n¹ ngôy trang/#saleby_heroling_confirm(300,'sale_heroling_weizhuang')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
						{"<dec>Lo¹i ®¬n d­îc thÇn kú nµy cã thÓ gióp t¨ng 1.6 lÇn kinh nghiÖm khi ñy th¸c rêi m¹ng, mçi viªn cã thÓ sö dông trong 6 giê.<enter>§iÓm cèng hiÕn ®Ó ®æi lÊy 1 viªn §¹i Hoµn §¬n: <color=yellow>30 ®iÓm<color>", "§æi 1 viªn §¹i Hoµn §¬n/#saleby_heroling_confirm(1,30,'sale_heroling_dahuandan')", "§æi 2 viªn §¹i Hoµn §¬n/#saleby_heroling_confirm(2,60,'sale_heroling_dahuandan')", "§æi 5 viªn §¹i Hoµn §¬n/#saleby_heroling_confirm(5,150,'sale_heroling_dahuandan')", "§æi 10 viªn §¹i Hoµn §¬n/#saleby_heroling_confirm(10,300,'sale_heroling_dahuandan')", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"},
																	};
	if (arySalebyHeroling[nSel]) then
		if (nSel == 8) then
			nRestH, nRestM = GetMinAndSec(GetTask(TASKID_TECHAN_HUANDAN_TIME));
			arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>Thêi gian sö dông §¹i Hoµn §¬n cßn l¹i lµ: <color=yellow>"..nRestH.."giê "..nRestM.." phót<color>"
		end;
		arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>Sè l­îng Phong Háa Anh Hïng LÖnh cã thÓ sö dông hiÖn t¹i lµ: <color=yellow>"..nCount.." c¸i<color><enter>Tæng ®iÓm cèng hiÕn hiÖn t¹i cã thÓ sö dông lµ: <color=yellow>"..GetContribution().." ®iÓm<color><enter>Ng­¬i ®ång ı ®æi kh«ng?"
		CreateTaskSay(arySalebyHeroling[nSel]);
	end;
end;

function saleby_heroling_confirm(nCount, nPrice, szfunc)
	if (not szfunc) then
		szfunc = nPrice;
		nPrice = nCount;
		nCount = 1;
	end;
	local _, nTongID = GetTongName();
	if (check_salebyheroling(nTongID, nPrice) == 1) then
		local nHeroling = GetTask(TASKID_HEROLING_COUNT);
		SetTask(TASKID_HEROLING_COUNT, nHeroling - 1);
		AddContribution(-nPrice);
		heroling_applyaddtask(nTongID, 1);	--Ôö¼Ó°ï»áÀÛ»ı·é»ğÓ¢ĞÛÁîµÄ×ÜÊı
		dostring(szfunc.."("..nCount..","..nPrice..")");
	end;
end;
-----ÒÔ·é»ğÓ¢ĞÛÁî¹ºÂòÌØÊâÎïÆ· End

-----¶Ò»»·é»ğÓ¢ĞÛÁî Start
function change_contribution_heroling()
	if (tonumber(GetLocalDate("%Y%m%d")) > 20070101) then
		CreateTaskSay({"<dec>Ho¹t ®éng Phong Háa Anh Hïng LÖnh sÏ kÕt thóc vµo 01-01-2007. Tr­íc 08-01-2007, ng­êi ch¬i cã thÓ tiÕp tôc dïng Phong Háa Anh Hïng LÖnh ®Ó ®æi phÇn th­ëng.", "KÕt thóc ®èi tho¹i/tong_cancel"});
		return 0;
	end;
	local nWeekOffer = GetWeeklyOffer();--»ñµÃÖÜÀÛ»ı¹±Ï×¶È
	local nUsedOffer = GetTask(TASKID_CONTRIBUTE_USED);
	local nMyCount = GetTask(TASKID_LASTHERO_TAKED);
	local nLastTime = GetTask(TASKID_LASTHERO_DATE);
	local nLastDate = mod(nLastTime , 1000);
	local nLastWeek = floor(nLastTime / 1000);
	local nDate = tonumber(GetLocalDate("%j"));
	local nWeek = tonumber(GetLocalDate("%W"));
	
	if (nWeek ~= nLastWeek) then
		nLastWeek = nWeek;
		SetTask(TASKID_CONTRIBUTE_USED, 0);
		nUsedOffer = 0;
	end;
	if (nDate ~= nLastDate) then
		nLastDate = nDate;
		SetTask(TASKID_LASTHERO_TAKED, 0);
		nMyCount = 0;
	end;
	
	SetTask(TASKID_LASTHERO_DATE, nLastWeek * 1000 + nLastDate);
	local nHeroCount = floor((nWeekOffer - nUsedOffer)/100);
	
	if (nHeroCount > 3 - nMyCount) then
		nHeroCount = 3 - nMyCount;
	end;
	if (nHeroCount > 0) then
		CreateTaskSay({"<dec>§iÓm cèng hiÕn cã thÓ kiÕm tõ c¸c ho¹t ®éng. §iÓm cèng hiÕn nµy sÏ ®­îc hÖ thèng tù ®éng ghi nhËn tİch lòy, mçi khi tİch lòy ®­îc <color=yellow>100 ®iÓm cèng hiÕn<color> th× bang chóng cã thÓ ®Õn TÕ §µn bang héi ®Ó nhËn 1 Phong Háa Anh Hïng LÖnh, sè l­îng nhËn ®­îc mçi ngµy kh«ng thÓ h¬n <color=yellow>3 tÊm<color>, mçi tuÇn sÏ tİnh l¹i tõ ®Çu."
	.."<enter>§iÓm cèng hiÕn tİch lòy tuÇn nµy lµ: <color=yellow>"..nWeekOffer.." ®iÓm<color>."
	.."<enter>Phong Háa Anh Hïng LÖnh cã thÓ ®æi hiÖn t¹i lµ: <color=yellow>"..nHeroCount.." c¸i<color>.",
	"Ta muèn ®æi Phong Háa Anh Hïng LÖnh/#sure_contribution_heroling("..nHeroCount..")", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"});
	else
		CreateTaskSay({"<dec>§iÓm cèng hiÕn cã thÓ kiÕm tõ c¸c ho¹t ®éng. §iÓm cèng hiÕn nµy sÏ ®­îc hÖ thèng tù ®éng ghi nhËn tİch lòy, mçi khi tİch lòy ®­îc <color=yellow>100 ®iÓm cèng hiÕn<color> th× bang chóng cã thÓ ®Õn TÕ §µn bang héi ®Ó nhËn 1 Phong Háa Anh Hïng LÖnh, sè l­îng nhËn ®­îc mçi ngµy kh«ng thÓ h¬n <color=yellow>3 tÊm<color>, mçi tuÇn sÏ tİnh l¹i tõ ®Çu."
	.."<enter>§iÓm cèng hiÕn tİch lòy tuÇn nµy lµ: <color=yellow>"..nWeekOffer.." ®iÓm<color>."
	.."<enter>Phong Háa Anh Hïng LÖnh cã thÓ ®æi hiÖn t¹i lµ: <color=yellow>"..nHeroCount.." c¸i<color>.",
	"Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"});
	end;
end;

function sure_contribution_heroling(ncount)
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	SetTask(TASKID_HEROLING_COUNT, GetTask(TASKID_HEROLING_COUNT) + ncount);	--Ôö¼Ó·é»ğÓ¢ĞÛÁîµÄ×ÜÊı
	SetTask(TASKID_CONTRIBUTE_USED, GetTask(TASKID_CONTRIBUTE_USED) + ncount * 100);	--Ôö¼Ó¶Ò»»ÏûºÄµÄ¹±Ï×¶È
	SetTask(TASKID_LASTHERO_TAKED, GetTask(TASKID_LASTHERO_TAKED) + ncount);		--Ôö¼Ó±¾ÈÕÁìÈ¡µÄ×ÜÊı
	Msg2Player("B¹n ®¹t ®­îc "..ncount.." c¸i Phong Háa Anh Hïng LÖnh.");
end;

-----¶Ò»»·é»ğÓ¢ĞÛÁî End
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;

-----¶Ò»»BossÕÙ»½·û
--AddItem(6, 1, 1022, 10, 0, 0, 0);
function change_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	CreateTaskSay({"<dec>Bang héi cÇn ®em Phong Háa Anh Hïng LÖnh ®Ó ®æi LÖnh bµi gäi Boss. Ph­¬ng thøc tİch lòy lµ: Khi bang chóng dïng Phong Háa Anh Hïng LÖnh ®Ó mua vËt phÈm, th× nã sÏ ®­îc tİch lòy vµo sè lÖnh bµi cña bang héi. Khi ®¹t ®­îc <color=yellow>63 c¸i Phong Háa Anh Hïng LÖnh<color> th× bang chñ hoÆc tr­ëng l·o cã thÓ ®æi lÊy 1 LÖnh bµi gäi Boss.Phong Háa Anh Hïng LÖnh tİch lòy tèi ®a hµng tuÇn lµ <color=yellow>900 c¸i<color>. Vµo tuÇn míi th× Phong Háa Anh Hïng LÖnh sÏ tİnh l¹i tõ ®Çu.<enter>Phong Háa Anh Hïng LÖnh tİch lòy trong tuÇn cña bang lµ: "..nTongHeroling.." c¸i.<enter>Sè l­îng Phong Háa Anh Hïng LÖnh bang héi cã thÓ dïng ®Ó ®æi LÖnh bµi gäi Boss lµ:  "..(nTongHeroling-nUseHeroling).." c¸i<enter>, sè l­îng LÖnh bµi gäi Boss cã thÓ nhËn ®­îc lµ: "..floor((nTongHeroling-nUseHeroling)/63).."c¸i", "§æi lÖnh bµi gäi Boss/sure_heroling_bosscharm", "Trë vÒ/enter_heroling", "Rêi khái/tong_cancel"});
end;


function sure_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>ChØ cã bang chñ hoÆc tr­ëng l·o míi cã thÓ sö dông Phong Háa Anh Hïng LÖnh ®æi LÖnh bµi gäi Boss.", "KÕt thóc ®èi tho¹i/tong_cancel"});
		return 0;
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	local nCount = floor((nTongHeroling-nUseHeroling) / 63);
	if (nCount < 1) then
		CreateTaskSay({"<dec>Phong Háa Anh Hïng LÖnh mµ bang héi cã thÓ dïng ®Ó ®æi 1 lÖnh bµi gäi Boss. Phong Háa Anh Hïng LÖnh tİch lòy cÇn sù nç lùc cña tÊt c¶ mäi ng­êi.", "KÕt thóc ®èi tho¹i/tong_cancel"});
		return 0;
	end;
	if (CalcFreeItemCellCount() < nCount * 2) then
		CreateTaskSay({"<dec>Hµnh trang kh«ng ®ñ chç trèng. Cã kh¶ n¨ng sÏ nhËn "..nCount.." lÖnh bµi gäi Boss, h·y s¾p xÕp l¹i hµnh trang tr­íc.", "KÕt thóc ®èi tho¹i/tong_cancel"});
		return 0;
	end;
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_USEHEROLING, nCount*63);
	for i=1, nCount do
		AddItem(6, 1, 1022, 10, 0, 0, 0);
	end;
	Msg2Player("B¹n ®¹t ®­îc "..nCount.." LÖnh bµi gäi Boss.");
end;
-----¶Ò»»BossÕÙ»½·û end


-----¶Ò»»µĞ¹úÃÜ¼ş
function change_letter_honour()
	CreateTaskSay({"<dec>Khi sè l­îng Phong Háa Anh Hïng LÖnh ®¹t <color=yellow>120 c¸i<color> th× vµo thø 6, thø 7 hµng tuÇn cã thÓ tham gia ho¹t ®éng <color=yellow>Truy t×m mËt th­<color>. Vµo thø 6 vµ thø 7, bªn ngoµi c¸c T©n Thñ Th«n sÏ xuÊt hiÖn <color=yellow>Ng­êi r¬m<color> mang theo c¸c mËt th­. Mäi ng­êi cÇn t×m c¸c mËt th­ cã trªn ng­êi nh÷ng ng­êi r¬m nµy. Thêi gian xuÊt hiÖn cña ng­êi r¬m lµ 7h30, 7h40, 7h50, thêi gian cã thÓ t×m mËt th­ lµ <color=yellow>7h35, 7h45, 7h55<color>. Thêi gian nhËn ®­îc mËt th­ lµ 1 phót. Ta sÏ nhËn mËt th­ tõ cÊp l·nh ®¹o bang, sau ®ã sÏ ®İch th©n ta giao cho triÒu ®×nh. TriÒu ®×nh sÏ tÆng th­ëng cho bang <color=yellow>25 tÊm lÖnh bµi vinh dù H¾c thiÕt<color>. Täa ®é cña ng­êi r¬m lµ: <enter>"
	.."Ba L¨ng HuyÖn: 220/200     Giang T©n Th«n: 438/396<enter>"
	.."VÜnh L¹c TrÊn: 197/188     §¹o H­¬ng Th«n: 215/185<enter>"
	.."Long M«n TrÊn: 233/287     Th¹ch Cæ TrÊn: 214/205<enter>"
	.."Long TuyÒn Th«n: 216/199",
	"MËt th­ ta t×m ®­îc vÒ ®©y!/sure_letter_honour", "Trë l¹i thao t¸c tr­íc/enter_heroling", "Rêi khái/tong_cancel"});
end;

function sure_letter_honour()
	local _, nTongID = GetTongName();
	
	local count = CalcEquiproomItemCount(4,1121,1,-1);
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>Tèt nhÊt sÏ do bang chñ hoÆc tr­ëng l·o giao cho ta.", "Ta biÕt råi/tong_cancel"});
	elseif (count < 1) then
		CreateTaskSay({"<dec>MËt th­ ®©u sao ta kh«ng thÊy?", "KÕt thóc ®èi tho¹i/tong_cancel"});
	elseif (CalcFreeItemCellCount() < 25) then
		CreateTaskSay({"<dec>Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ giao H¾c thiÕt lÖnh.", "§Ó ta xÕp l¹i hµnh trang ®·./tong_cancel"});
	else
		ConsumeEquiproomItem(1,4,1121,1,-1);
		for i = 1, 25 do
			AddItem(6,1,1257,1,1,1); 
		end;
		Msg2Player("NhËn ®­îc 25 c¸i lÖnh bµi vinh dù H¾c thiÕt");
	end;
end;

--Ôö¼Ó°ï»áÀÛ»ı·é»ğÓ¢ĞÛÁî
function heroling_applyaddtask(nTongID, nValue)
	local ntask = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	if (ntask < 900) then
		ntask = ntask + nValue;
		if (ntask + nValue > 900) then
			nValue = 900 - ntask;
		end;
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_HEROLING, nValue);
	end;
end;