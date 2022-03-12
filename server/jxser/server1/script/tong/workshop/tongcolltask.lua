if (not __TONGRANDOMTASK_H__) then
	__TONGRANDOMTASK_H__ = 1;

Include([[\script\tong\tong_statistics.lua]]);

tab_Workshop = {[1] = "Binh gi¸p", [2] = "Thiªn c«ng", [3] = "MÆt n¹ ", [4] = "Thİ luyÖn", [5] = "Thiªn ı", [6] = "LÔ phÈm", [7] = "Ho¹t ®éng"};

TASK_LP_ITEMID = 1744;			--ÁÙÊ±¼ÇÂ¼ÁîÅÆµÄÎïÆ·ID¡£
TASK_LP_COUNT = 1745;			--¼ÇÂ¼ĞèÒª¼öÊéµÄÊıÁ¿¡£
TASK_LP_ZONGGUANIDX = 1746;		--¼ÇÂ¼ÊÇÄÇ¸ö×Ü¹Ü¡£
TASK_LP_ZONGGUANLEVEL = 1756;	--¼ÇÂ¼Ğ´¼öÊé×Ü¹ÜĞèÒªµÄ¼¶±ğ¡£
TASK_LP_TIMESLIMIT = 2566--Ã¿ÌìÍê³É100´ÎÉÏÏŞ£ºbyte1£º´ÎÊı£»byte2£ºÈÕÆÚ£»byte3£ºÔÂ·İ
--§iÒu chØnh nhiÖm vô r÷a pk - Modified by DinhHQ - 20110810
--DAILY_MAX_TIMES = 2  -- ¸ü¸ÄÃ¿ÌìÍê³ÉÈÎÎñµÄÉÏÏŞÎª2´Î   by wangjingjun IB shop µ÷Õû
DAILY_MAX_TIMES = 100
PER_ASSIGNMENT_PK = 1 -- Ã¿¸öÈÎÎñ¼õÉÙpkÖµ1µã by wangjingjun IB shop µ÷Õû

TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--¼ÇÂ¼Ğ´¼öÊé×Ü¹ÜµÄ°ï»á¡£

--¼ì²éÊÇ·ñÊÇÏàÓ¦×Ü¹ÜµÄ¶Ô»°
function rwlp_taskcheck(nTongID, nWorkshopID)
	local nWKSPType = TWS_GetType(nTongID, nWorkshopID);
	if (nWKSPType ~= GetTask(TASK_LP_ZONGGUANIDX)) then --×Ü¹Ü²»¶Ô
		return 2;
	end
	if (0 == rwlp_mapcheck()) then --ÔÚ¹«¹²°ï»áµØÍ¼
		return 0;
	end;
	return 1;
end;

--ºÍ¸÷´ó×Ü¹ÜµÄ¶Ô»°
function rwlp_dedaojianshu(nTongID, nWorkshopID)
	local nCount = rwlp_getjuanshucount();
	local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).." -cÊp<color> ";
	local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Ph­êng tæng qu¶n<color>";
	if (nCount >= GetTask(TASK_LP_COUNT)) then	-- Èç¹ûÈÎÎñÒÑ¾­Íê³É£¬Ö±½Ó·µ»Ø
		Say("Thu thËp ®­îc <color=yellow>"..nCount.."<color>Th­ tiÕn cö ®· ®ñ, h·y nhanh chãng vÒ giao cho Thiªn ı Phßng Tæng Qu¶n ®i.", 0)
		return
	end;
	if (rwlp_tongcheck() == 0) then
		Say("Tr­ëng l·o bæn bang ®· göi th­ tiÕn cö cho ng­¬i råi, mau ®Õn bang kh¸c ®Ó thØnh cÊu ®i.", 0);
		Msg2Player("Tr­ëng l·o bang héi ®· gióp ng­¬i, hiÖn cã tÊt c¶ lµ <color=yellow>"..nCount.." bøc <color>Th­ tiÕn cö, cÇn ph¶i t×m ®ñ <color=yellow>"..GetTask(TASK_LP_COUNT).." <color>Th­ tiÕn cö ");
		return
	end;
	
	if (rwlp_workshopcheck() == 0) then
		Say("L·o phu vµ quı bang "..szZGName.." lµ mèi th©m giao, ch¼ng qua lµ sè T¸c ph­êng vÉn ch­a ®ñ."..szLevel..", h·y ®Õn c¸c bang kh¸c thö xem, ng­¬i cÇn ph¶i thu thËp ®­îc <color=yellow>"..GetTask(TASK_LP_COUNT).." <color>Th­ tiÕn cö, tr­íc m¾t ®· cã <color=yellow>"..rwlp_getjuanshucount().."<color>Bøc th­", 0);
		-- Msg2Player("¸Ã°ï»áµÄ"..szZGName.."²»¹»"..szLevel.."£¬²»ÄÜ¸øÄã¼öÊé¡£");
		Msg2Player(format("%s cña bang héi kh«ng ®ñ %s, kh«ng thÓ nhËn th­ tiÕn cö.", szZGName, szLevel));
		return 0;
	end;
	
	add_a_juanshu();
	Say("Nghe nãi <color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."<color>Tæng Qu¶n v× rÊt gÊp viÖc thi cö nªn ®ang thiÕu th­ tiÕn cö mµ lßng ­u t­, l·o phu ta cã qua l¹i víi mét sè quan cña kinh thµnh, lÊy bøc th­ nµy<color=yellow> tiÕn cö<color> mang ®Õn ®ã ta tin r»ng İt nhiÒu còng ®­îc sù gióp ®ì.", 0);
	Msg2Player("B¹n xÕp h¹ng thø <color=yellow>"..(nCount + 1).." bøc <color>Th­ tiÕn cö, cÇn ph¶i t×m ®ñ <color=yellow>"..GetTask(TASK_LP_COUNT).." <color>Th­ tiÕn cö ");
end;

tab_MapforAll = {586, 587, 688, 589, 590, 591, 592, 593, 594, 595, 596, 597};
--¼ì²âÊÇ·ñÔÚ¹«¹²°ï»áµØÍ¼
function rwlp_mapcheck()
	local ww = GetWorldPos();
	if (ww <= 597) then
		return 0
	end;
	return 1;
end;

--¿´¿´ÊÇ·ñÎªÒÑ¾­Áì¹ıµÄ°ï»á
function rwlp_tongcheck()
	if (0 == rwlp_mapcheck()) then
		return 0;
	end;
	ww = GetWorldPos()
	for i = 1, getn(TASK_LP_IDX) do
		if (ww == GetTask(TASK_LP_IDX[i]) ) then
			return 0
		end;
	end;
	return 1;
end;

--¼ì²é×÷·»µÄµÈ¼¶ÊÇ·ñºÏ¸ñ
function rwlp_workshopcheck()
	local ww = GetWorldPos();
	local tab_work = {};	--·ûºÏµÈ¼¶Ìõ¼şµÄ×÷·»ËùÔÚµØÍ¼
	tab_work = get_tongmap_list(GetTask(TASK_LP_ZONGGUANIDX), GetTask(TASK_LP_ZONGGUANLEVEL));
	for i = 1, getn(tab_work) do
		if (ww == tab_work[i]) then
			return 1;
		end;
	end;
	return 0;
end;

function add_a_juanshu()
	local nCount = rwlp_getjuanshucount();
	if (nCount == 9) then
		Say("§· t×m ®­îc 9 th­ tiÕn cö, cã thÓ quay vÒ giao nhiÖm vô.", 0);
		return 0;
	end;
	ww = GetWorldPos();
	nt_SetTask(TASK_LP_IDX[nCount + 1], ww);
	return 1;
end;

function rwlp_getjuanshucount()
	for i = 1, getn(TASK_LP_IDX) do
		if (0 == GetTask(TASK_LP_IDX[i]) ) then
			return i - 1;
		end;
	end;
	return 9;
end;

function rwlp_cleartask()
	for i = 1, getn(TASK_LP_IDX) do
		nt_SetTask(TASK_LP_IDX[i], 0);
	end;
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, 0);
	nt_SetTask(TASK_LP_COUNT, 0);
	nt_SetTask(TASK_LP_ZONGGUANIDX, 0);
end;

function nt_SetTask(nTaskID, nTaskValue)
	if (nTaskID <= 0) then
		return
	end;
	SetTask(nTaskID, nTaskValue);
	SyncTaskValue(nTaskID);
end;

function OnCancel()
	
end;

end; --// end of __TONGRANDOMTASK_H__