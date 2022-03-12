-- ¹¦ÄÜ£ºÖØÖı×°±¸
-- Ğ¡ÀË¶à¶à 2008.1.14

Include( "\\script\\task\\system\\task_string.lua" );

-- ÖØÖı
Include("\\script\\global\\recoin_goldenequip.lua")
-- ÍêÃÀ°²°îÊ×ÊÎ
Include("\\script\\task\\equipex\\head.lua");
-- °×½ğ×°±¸
Include("\\script\\global\\platina_upgrade.lua")
--ÖØÖı°×½ğ×°±¸
--Include("\\script\\global\\recoin_platinaequip.lua")
--Include("\\script\\event\\reclaim_equip\\reclaim_equip.lua") --»ØÊÕ°ó¶¨ÎïÆ·

Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- ¶Ò»»¾«Á¶±¦Ïä
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")	-- ¶Ò»»ĞÂ×°±¸ÁîÅÆ£¨×ÏòşµÈ£©
Include("\\script\\activitysys\\npcdailog.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<dec><npc>ThËt kh«ng ngê ta ®©y ®· mai danh Èn tİch ®· l©u nh­ vËy, thÕ mµ vÉn bŞ nhµ ng­¬i t×m thÊy ®­îc, ch¾c lµ ng­¬i v× muèn chÕ t¹o <color=yellow> trang bŞ Hoµng Kim <color> mµ ®Õn ®©y chø g×."
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	
	local aryDescribe =
	{
	--	"Ta muèn t×m hiÓu vÒ bé An bang Hoµn mü./main_talk",
	--	"Ta muèn mêi ng­¬i trïng luyÖn trang bŞ b¹ch kim/platina_main",
		--"ÎÒÏëÇëÄãÖØÖı½ğÎÚ×°±¸/refine_jinwu",
		--"ÎÒÏëÇëÄãÖØÖı°×½ğ×°±¸/recoin_platina_main",
	--	"Nhê ng­¬i gióp ta ph©n m¶nh mét sè trang bŞ hoµng kim./split_entry",
	--	"Ta muèn sö dông m¶nh trang bŞ ®Ó hîp thµnh trang bŞ Hoµng Kim./compose_entry",
		--"Ta muèn ®æi thiÕt huyÕt ®¬n/exchange_tiexuedan",
		--"ÎÒÏë½øĞĞÍêÃÀºèÓ°Ê×ÊÎµÄÖÆ×÷/perfect_hongying_main",
		--"ÎÒÕâÀïÓĞÒ»Ğ©¶àÓàµÄ´òÔì²ÄÁÏ/equipex_recycle_main",
		--"ÎÒÏë°ÑËéÆ¬»»³ÉÏàÍ¬»Æ½ğ×°±¸µÄÆäËûËéÆ¬/exchange_entry",
		--"Ta muèn lÊy trang bŞ ®æi thµnh hån th¹ch/exchange_olditem",
		--"Ta muèn dïng hån th¹ch ®æi lÖnh bµi/exchange_lingpai",
		--"Ta muèn dïng lÖnh bµi ®æi trang bŞ/exchange_lingpai2goldequip",
	}
	for i = 1, getn(aryDescribe) do
		local _,_, szOpt, szFun = strfind(aryDescribe[i], "([^/]+)/([^/]+)")
		local fn = getglobal(szFun)
		if fn then
			tbDailog:AddOptEntry(szOpt, fn);	
		end
	end
	
	
	
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
	
-- Èç¹û½ÓÁËÍêÃÀ°²°îÈÎÎñ£¬²åÈëÑ¡Ïî
--	local nNextStatus = check_nexttask_status();
--	if (check_nexttask_condition() == 1) then
--		tinsert(aryDescribe, 2, "ÎÒÏë¼ÌĞø´òÔìÍêÃÀµÄ°²°îÊ×ÊÎ/nexttask_talk");
--	end
--	tinsert(aryDescribe, 2, "»ØÊÕÓÀ¾Ã°ó¶¨×°±¸/reclaimBindEquip_main");
	
end

function exchange_tiexuedan()
	if (CalcFreeItemCellCount() < 2) then
		Say("§Ó ®¶m b¶o an toµn cho vËt phÈm, h·y ®Ó chõa ra 2 « trèng trë lªn", 0);
		return
	end
	GiveItemUI("§æi thiÕt huyÕt ®¬n", "Xin h·y bá 1 trang bŞ hoµng kim m«n ph¸i bÊt kú vµo « bªn d­íi", "do_exchange_tiexuedan", "onCancel")
end

function do_exchange_tiexuedan(nCount)
	if nCount ~= 1 then
		CreateTaskSay({"Sè l­îng vËt phÈm bá vµo kh«ng ®óng yªu cÇu", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/exchange_tiexuedan", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end

	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);	--Æ·ÖÊ
	
	if (nQuality ~= 1 or GetGlodEqIndex(nItemIndex) > 140) then
		CreateTaskSay({"H·y ®­a cho ta 1 trang bŞ hoµng kim m«n ph¸i", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/exchange_tiexuedan", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"§æi thiÕt huyÕt ®¬n Error",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Xãa trang bŞ hoµng kim m«n ph¸i thÊt b¹i:\t"..GetItemName(nCurItemIdx)));
	end
	
	
	for i = 1, 20 do
		AddItem(6, 1, 2163, 1, 1, 0);
	end
	Msg2Player("Chóc mõng ®¹i hiÖp ®· nhËn ®­îc 20 ThiÕt HuyÕt §¬n!");
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"§æi thiÕt huyÕt ®¬n Success",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			format("§æi %s thu ®­îc thiÕt huyÕt ®¬n", GetItemName(nItemIndex))));
end