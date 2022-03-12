-- ÁÙ°²¡¡Ö°ÄÜ¡¡ÉñÃØÉÌÈË
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--°×½ğ×°±¸
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--ÖØÖı°×½ğ×°±¸
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
--Exchange exp to meridan material - Modified By DinhHQ - 20120712
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	local nNpcIndex = GetLastDiagNpc();	
	local szNpcName = "ThÇn Bİ Th­¬ng Nh©n"
	local tbDailog = DailogClass:new(szNpcName);	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<npc>Ta cã ı tõ T©y Vùc xa x«i ®Õn Trung Nguyªn muèn mua mét sè ®Æc s¶n nh­ thñy tinh, kim nguyªn b¶o vµ ng©n phiÕu. NÕu nh­ ng­¬i cã nh÷ng vËt phÈm trªn th× ta còng cã 1 sè vËt phÈm quı muèn cïng ng­¬i trao ®æi."
	tbDailog:AddOptEntry("Trao ®æi §å phæ vò khİ", get1);
	tbDailog:AddOptEntry("Mua Kú tr©n dŞ b¶o", get2);
	tbDailog:AddOptEntry("Xö lı <trang bŞ tæn h¹i>", deal_brokenequip);
	tbDailog:AddOptEntry("Ta muèn ®æi b¶o r­¬ng>", BaiBaoXiang_Give_UI);
	tbDailog:Show()	
	
--	local tbDecOpp =
--	{
--		"<dec><npc>Ta cã ı tõ T©y Vùc xa x«i ®Õn Trung Nguyªn muèn mua mét sè ®Æc s¶n nh­ thñy tinh, kim nguyªn b¶o vµ ng©n phiÕu. NÕu nh­ ng­¬i cã nh÷ng vËt phÈm trªn th× ta còng cã 1 sè vËt phÈm quı muèn cïng ng­¬i ®æi.",
--		
--		--Change request 04/06/2011, ®ãng chÕ t¹o trang bŞ b¹ch kim - Modified by DinhHQ - 20110605
--		--"Ta muèn th¨ng cÊp cho trang bŞ B¹ch Kim nµy/upgrade_paltinaequip",
--		--"Ta muèn chÕ t¹o trang bŞ Hoµng Kim thµnh trang bŞ B¹ch Kim/upgrade_goldformplatina",
--		
--		--"ÎÒÏëÇëÄãÖØÖı°×½ğ×°±¸/recoin_platina_main",
--		"<#> Trao ®æi §å phæ vò khİ /get1",
--		"<#> Mua Kú tr©n dŞ b¶o/get2",
--		"<#> Xö lı <trang bŞ tæn h¹i>/deal_brokenequip",
--		--"ÎÒÏëÁË½â°×½ğ×°±¸²ğ½â/unweave_paltinaequip",
--		"<#>Ta muèn ®æi b¶o r­¬ng/BaiBaoXiang_Give_UI",
--		"<#> Ta xem thö tr­íc ®·!/no",
--		
--	};
--	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
--	
--	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
--	CreateTaskSay(tbDecOpp);
end;

function no()
end;