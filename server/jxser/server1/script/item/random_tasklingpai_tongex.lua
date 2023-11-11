--ÌØÊâÈÎÎñÁîÅÆÎÄ¼ş
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main(nItem)
	_, nTongID = GetTongName();
	if (nTongID <= 0) then
		Say("Ch­a gia nhËp <color=yellow>bang ph¸i<color>, kh«ng thÓ sö dông lÖnh bµi nhiÖm vô ®Æc biÖt.", 0);
		Msg2Player("Ch­a gia nhËp <color=yellow>bang ph¸i<color>, kh«ng thÓ sö dông lÖnh bµi nhiÖm vô ®Æc biÖt.");
		return 1;
	end;
	local nCount = GetTask(TASK_LP_COUNT);
	SetTask(TASK_LP_ITEMID, nItem); --»ñÈ¡ÁîÅÆµÈ¼¶
	
	if (nCount > 0) then
		Say("<color=green>LÖnh bµi nhiÖm vô<color>: HiÖn t¹i cã nhiÖm vô ngÉu nhiªn ch­a hoµn thµnh, vÉn muèn tiÕp nhËn nhiÖm vô míi sao?", 2,
			"§óng vËy, ta muèn hñy bá nhiÖm vô tr­íc ®©y/cancelformertask",
			"Kh«ng ph¶i, ®îi mét l¸t ®·!/OnCancel");
		return 1;
	else
		wanttask()
		return 1;
	end;
end;

--È¡ÏûÒ»¸öÈÎÎñÁîÅÆÈÎÎñ¡£
function cancelformertask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		rwlp_cleartask();
		Say("§· hñy bá nhiÖm vô <color=yellow>LÖnh bµi nhiÖm vô ®Æc biÖt<color>.", 0);
		Msg2Player("§· hñy bá nhiÖm vô <color=yellow>LÖnh bµi nhiÖm vô ®Æc biÖt<color>.");
	end;
end;

-- ½ÓÊÜÁîÅÆÈÎÎñ
function wanttask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		Say("HiÖn cã nhiÖm vô LÖnh bµi nhiÖm vô ®Æc biÖt, kh«ng thÓ tiÕp nhËn nhiÖm vô míi.", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nItem, nResult;
	
	nItem = GetTask(TASK_LP_ITEMID);
	nLevel = GetItemParam(nItem, 3);
	nWorkshopIdx = GetItemParam(nItem, 4);
	nCount = GetItemParam(nItem, 5);
	if (not nCount or nCount == 0) then
		nResult = init_task()
		nLevel = GetItemParam(nItem, 3);
		nWorkshopIdx = GetItemParam(nItem, 4);
		nCount = GetItemParam(nItem, 5);
	end;
	
	local szContent = "<color=yellow>"..nLevel.."<color> trë lªn ë c¸c bang héi kh¸c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color>, ";
	if (nResult == 0) then
		Say("vèn muèn ng­¬i ®i t×m vµi vŞ "..szContent..", nh­ng tiÕc lµ ®¼ng cÊp <color=yellow>"..tab_Workshop[nWorkshopIdx].." ph­êng<color> cña c¸c bang héi ®Òu kh«ng ®ñ, lÇn sau ®Õn thö xem.", 0);
		Msg2Player("T¹m thêi kh«ng cã ®ñ "..szContent..", lÇn sau ®Õn thö xem.");
		return
	end;
	
	szContent = "<color=yellow>"..nCount.."<color> vŞ"..szContent;
	Say("bæn bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> d¹o nµy tinh thÇn kh«ng ®­îc tèt, muèn lªn kinh øng thİ nh­ng cÇn ph¶i thu thËp ®ñ Th­ tiÕn cö cña c¸c danh sü n¬i ®©y. PhiÒn ng­¬i ®i t×m gióp "..szContent.."Th­ tiÕn cö cña hä.", 2,
	"§­îc, ta sÏ cè g¾ng./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 1)",
	"NhiÖm vô nµy khã qu¸, ta kh«ng d¸m nhËn./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 0)");
end;

--³õÊ¼»¯Ò»¸öÈÎÎñ
function init_task()
	local nLPLvl = GetItemParam(GetTask(TASK_LP_ITEMID), 1); -- ÁîÅÆµÄµÈ¼¶
	
	local nLevel, nWorkshopIdx, nCount;
	nLevel = 1;
	nWorkshopIdx = random(1, 7); -- Ëæ»úÒ»¸ö×÷·»
	
	if (nLPLvl == 1) then
		nLevel = random(1, 3);
	elseif (nLPLvl == 2) then
		nLevel = random(4, 6);
	elseif (nLPLvl == 3) then
		nLevel = random(7, 8);
	end;
	
	nCount = random(1, 9);
	local nMax = get_workshop_count(nWorkshopIdx, nLevel);
	if (not nMax) then
		nMax = 0;
	end;
	if (nCount > nMax) then
		nCount = nMax;
	end;
	
	local nItem = GetTask(TASK_LP_ITEMID);
	SetSpecItemParam(nItem, 3, nLevel);
	SetSpecItemParam(nItem, 4, nWorkshopIdx);
	SetSpecItemParam(nItem, 5, nCount);
	SyncItem(nItem);
	if (nCount > 0) then
		return 1;
	end;
	return 0;
end;

function lp_confirm(nLevel, nWorkshopIdx, nCount, bOK)
	local szContent = "<color=yellow>"..nCount.."<color>vŞ <color=yellow>"..nLevel.."<color> trë lªn ë c¸c bang héi kh¸c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color>";
	
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	
	if (bOK == 1) then
		Say("bæn bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> d¹o nµy tinh thÇn kh«ng ®­îc tèt, muèn lªn kinh øng thİ nh­ng cÇn ph¶i thu thËp ®ñ Th­ tiÕn cö cña c¸c danh sü n¬i ®©y. PhiÒn ng­¬i ®i t×m gióp "..szContent.."Th­ tiÕn cö cña hä.", 1, "Ta biÕt råi!/lp_confirmtwo");
	else
		Say("bæn bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> muèn ng­¬i t×m gióp "..szContent.."Th­ tiÕn cö, ng­¬i kh«ng cã thêi gian sao?",2 ,"Ta vÉn ch­a nhËn nhiÖm vô nµy./lp_confirmtwo", "Ta thËt sù kh«ng muèn nhËn nhiÖm vô nµy./OnCancel");
	end;
end;

function lp_confirmtwo()
	local nItem = GetTask(TASK_LP_ITEMID);

	local nCount = GetItemParam(nItem, 5);
	local nWorkshopIdx = GetTask(TASK_LP_ZONGGUANIDX);
	local nLevel = GetTask(TASK_LP_ZONGGUANLEVEL);
	
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) ~= 1) then
			return
		end;
	end;

	nt_SetTask(TASK_LP_COUNT, nCount);
	Msg2Player("B¹n ®ång ı ®i gÆp <color=yellow>"..nCount.."<color> <color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> ®Ó nhËn nhiÖm vô Th­ tiÕn cö, ®¼ng cÊp <color=yellow>"..tab_Workshop[nWorkshopIdx].." ph­êng<color> cÇn ®¹t cÊp <color=yellow>"..nLevel.."<color>.");
end;
