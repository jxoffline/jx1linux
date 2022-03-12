
---------------------------------------------------------------------------------
--  ÑÏÖØÉùÃ÷£º´ËÎÄ¼ş²»³é×Ö·û´®
---------------------------------------------------------------------------------

-- Àñ¹Ù½Å±¾
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\ÖĞÇï»î¶¯.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- ÈÎÎñ±äÁ¿ID of Íæ¼Ò×îºóÒ»´ÎÁìÈ¡½ÚÈÕÀñÎïÊ±¼ä
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- ÁÙÊ±ÈÎÎñ±äÁ¿ID of Íæ¼Ò×îºóÒ»´ÎÁìÈ¡½ÚÈÕÀñÎïÊ±¼ä
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- Ö÷³Ç½±Àø
Include("\\script\\event\\superplayeract2007\\event.lua")----³¬¼¶Íæ¼Ò»î¶¯
Include("\\script\\event\\great_night\\event.lua")	-- »Ô»ÍÖ®Ò¹
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- ¶Ò»»»Æ½ğ×°±¸½ğÅÆ
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- Á¶½ğ»î¶¯


-- Ô½ÄÏ0904½â·Å»î¶¯
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- Ô½ÄÏ0905ÉúÈÕ»î¶¯
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:NhËn th­ëng gi¶i ®Êu Ph­¬ng Anh Hµo
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--Trao vßng hµo quang VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--µ¯³ö¶Ô»°¿ò
	tbDailog:AddOptEntry("§ªm Huy Hoµng", onGreat_Night)
--	tbDailog:AddOptEntry("Tham gia ho¹t ®éng B¶o R­¬ng ThÇn Bİ", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("NhËn th­ëng Chung KÕt Vâ L©m §Ö NhÊt Bang", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("NhËn l¹i TiÒn §ång", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("Ta ®Õn ®æi vËt phÈm event th¸ng 8", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("Më Pass R­¬ng", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("§æi th­ëng ho¹t ®éng th¸ng 10", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("Hç trî cho m¸y sö dông CSM", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("Tham gia online nhËn th­ëng", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("NhËn phÇn th­ëng dµnh cho Th¸i Thó", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("Ho¹t ®éng kİch t©n thñ", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("§¹o cô tÊm ¸o chiÕn sü", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("Ho¹t ®éng t«i luyÖn thĞp", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say("LÔ Quan: HiÖn ®ang trong thêi gian diÔn ra ho¹t ®éng chµo mõng ngµy gi¶i phãng,bµ con ®ang n¸o nøc ¨n mõng chiÕn th¾ng, ®¹i hiÖp cã muèn tham gia kh«ng nµo?", 6, 
			"Ta ®Õn nhËn cÈm nang sù kiÖn/jf0904_getjinnangshijian",
			format("Ho¹t ®éng r­îu mõng chiÕn th¾ng/#tbJiefang0904_jiu:OnDailogMain()"),
			"Ho¹t ®éng chinh phôc ®Ønh FanXiPan/about_denggao",
			"Ho¹t ®éng Oanh LiÖt Thiªn Thu/about_shuizei",
			"Ho¹t ®éng Tiªu DiÖt Thñy TÆc/about_shuizei",
			"Ta chØ ®Õn xem!/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("Quı hãa! Quı hãa! Ta thay mÆt Ph­¬ng tr­îng ThiÕu L©m c¶m ¬n vµ chóc phóc cho ng­¬i!", 7, 
		"Ta muèn d©ng tÆng vßng Kim Liªn Hoa/#v_mljaward(1)",
		"Ta muèn d©ng tÆng vßng Méc Liªn Hoa/#v_mljaward(2)",
		"Ta muèn d©ng tÆng vßng Thñy Liªn Hoa/#v_mljaward(3)",
		"Ta muèn d©ng tÆng vßng Háa Liªn Hoa/#v_mljaward(4)",
		"Ta muèn d©ng tÆng vßng Thæ Liªn Hoa/#v_mljaward(5)",
		"Ta muèn d©ng tÆng vßng Liªn Hoa, mçi hÖ mét c¸i./v_mljaward_all",
		"ChØ lµ hiÕu kú ghĞ qua xem th«i!/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("Ng­¬i ch¼ng ph¶i muèn d©ng tÆng "..tab_NPCIdx[nIdx][2].." sao? H×nh nh­ ng­¬i kh«ng mang theo "..tab_NPCIdx[nIdx][2].."!", 1, "§Ó ta ®i chuÈn bŞ ®·!/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("Ng­¬i ®· d©ng tÆng ®ñ sè "..tab_NPCIdx[nIdx][2].." nµy råi! H·y d©ng tÆng lo¹i kh¸c ®i!", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("Quı hãa qu¸! §©y lµ chót t©m ı mµ Ph­¬ng tr­îng ThiÕu L©m vµ ch­ëng m«n Nga Mi gëi tÆng ng­¬i.", 1, "NhËn lÊy lÔ vËt./OnCancel");
	Msg2Player("B¹n nhËn ®­îc <color=yellow>500000<color> ®iÓm kinh nghiÖm.");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("Ng­¬i ch¼ng ph¶i muèn d©ng tÆng "..tab_NPCIdx[i][2].." sao? H×nh nh­ ng­¬i kh«ng mang theo "..tab_NPCIdx[i][2].."!", 1, "§Ó ta ®i chuÈn bŞ ®·!/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("ThËt c¸m ¬n ng­¬i! Nh­ng 12 Bao l× x× cña ta ®· tÆng ng­¬i hÕt råi.", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --¼ÓÒ»¸ö´ó·ç°ü£»
	Say("Quı hãa qu¸! §©y lµ chót t©m ı mµ Ph­¬ng tr­îng ThiÕu L©m vµ ch­ëng m«n Nga Mi gëi tÆng ng­¬i.", 1, "NhËn lÊy lÔ vËt./OnCancel");
	Msg2Player("B¹n nhËn ®­îc <color=yellow>1000000<color> ®iÓm kinh nghiÖm vµ 1 <color=yellow>Bao l× x×<color>");
end;

-- ½ÚÈÕÁĞ±í
aryHoliday = {	-- ½ÚÈÕÊ±¼ä, ·ûºÏ½ÚÈÕÊ±¼äËùµ÷º¯ÊıÃû, ÖØ¸´ÁìÀñÆ·µÄÌáÊ¾ÎÄ±¾ 
				{ 20040822, onHoliday_QiXi, "C¶nh ®Ñp trêi trong! Hai b¹n sao kh«ng ®i ch¬i lÔ, cßn ë l¹i ®©y lµm g×?" }
				-- ÆäËü½ÚÈÕ
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<#> H«m nay lµ mét ngµy h¹nh phóc cho nh÷ng ®«i l­¬ng duyªn! Ta cã mãn quµ nµy tÆng cho nh÷ng ai ®· kÕt h«n! Chóc c¸c vŞ 'B¸ch niªn giai l·o' ")
			-- ËÍ2¸ö¡°ĞÄĞÄÏàÓ¡·û¡±
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<#>B¹n nhËn ®­îc 2 T©m T©m T­¬ng ¸nh phï!" );
			-- ËÍ9¶ä¡°Ãµ¹å»¨¡±
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<#>B¹n nhËn ®­îc  9 b«ng hoa hång!" );
			-- 50¼¶ÒÔÉÏÍæ¼Ò¼ÓËÍ1¸ö¡°ÌìÉ½ÓñÂ¶¡±
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<#>B¹n nhËn ®­îc mét b×nh Thiªn S¬n B¶o Lé!" );
			end
		else
			Talk(1, "", "<#> Ng­¬i ch¼ng ph¶i ®· nhËn quµ råi sao? Nh­êng cho ng­êi kh¸c víi chø!")
		end
	else
		Talk(1, "", "<#> Ng­¬i ch­a kÕt h«n, kh«ng thÓ nhËn ®­îc quµ!")
	end
end		 	
---------------- È¡Ïû ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": Tµi kho¶n:" .. GetAccount() .. ", nh©n vËt:" .. GetName() .. "," .. object);
end
