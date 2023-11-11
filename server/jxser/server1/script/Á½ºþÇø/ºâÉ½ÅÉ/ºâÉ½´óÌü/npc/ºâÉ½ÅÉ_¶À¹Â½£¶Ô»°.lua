--Á½ºşÇø ºâÉ½ÅÉ ¶À¹Â½£¶Ô»° ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
-- By: Dan_Deng(2004-02-03)

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\chuangong.lua")
Include("\\script\\task\\lv120skill\\head.lua")		-- 120¼¶¼¼ÄÜÈÎÎñ

Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog.szTitleMsg = "<npc>L©u ngµy kh«ng gÆp! T×m ta cã viÖc g×?"
	tbDailog:AddOptEntry("Ta ®Õn b¸i pháng Minh chñ.", old_main)
	tbDailog:AddOptEntry("Minh Chñ ng­êi cã biÕt NguyÖt Ca §¶o nµy cã tån t¹i thËt hay kh«ng?", yuegedao_help)
	tbDailog:Show()
	
--	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
--		Describe(strimg..GetName().."ºÃ¾Ã²»¼ûÁË£¬½üÈÕÕÒÎÒÓĞÊ²Ã´ÊÂ£¿",3,"ÎÒÊÇÌØÀ´°İ·ÃÒ»ÏÂÃËÖ÷Äã¡£/old_main", "ÎÒÏë´òÌı¹ØÓÚ´«¹¦µÄÊÂÇé¡£/chuangong_info", "ÎÒÏëÈ¡ÏûÉÏ´ÎµÄ´«¹¦ÉêÇë!/cg_undo")
--	else
--		Describe(strimg..GetName().."ºÃ¾Ã²»¼ûÁË£¬½üÈÕÕÒÎÒÓĞÊ²Ã´ÊÂ£¿",2,"ÎÒÊÇÌØÀ´°İ·ÃÒ»ÏÂÃËÖ÷Äã¡£/old_main", "ÎÒÏë´òÌı¹ØÓÚ´«¹¦µÄÊÂÇé¡£/chuangong_info" )
--		Describe(strimg..GetName().."ºÃ¾Ã²»¼ûÁË£¬½üÈÕÕÒÎÒÓĞÊ²Ã´ÊÂ£¿",1,"ÎÒÊÇÌØÀ´°İ·ÃÒ»ÏÂÃËÖ÷Äã¡£/old_main");
--	end
end

function old_main()
	Uworld39 = GetTask(39)
	Uworld40 = GetTask(40)
	Udate = tonumber(date("%Y%m%d"))						-- ĞèÒª×ª»»³ÉÊıÖµ²ÅÄÜÖ±½Ó½øĞĞ±È½Ï
	if (Uworld39 == 10) then									-- ÈÎÎñ½øĞĞÖĞ
		if (Uworld40 == 1023) then									-- bin(1111111111)£¬ÈÎÎñÍê³É
			U39_prise()
		else
			Talk(1,"U39_progress", 11332)
		end
	elseif (Uworld39 == 0) or ((Udate > Uworld39) and (Uworld39 > 20040101)) then			-- ÈÎÎñÆô¶¯Ìõ¼ş£º´óÓÚ20¼¶£¬ÉùÍûµÈ¼¶´óÓÚ2¼¶£¬ÈÎÎñÎ´×ö¹ı»òÒÑÍê³É³¬¹ı1ÈÕ
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
			Say(11333 ,2,"Kh«ng thµnh vÊn ®Ò, ta cã thÓ lµm ®­îc. /U39_yes","Ta hiÖn rÊt bËn, ®Ó khi kh¸c nãi tiÕp. /no")
		else
			Talk(3,"", 11334, 11335, 11336)
		end
	elseif (Uworld39 >= Udate) then								-- ÈÎÎñÒÑÍê³É£¬Î´µ½ÖØ¸´Ê±¼ä
		Talk(2,"", 11337, 11338)
	else																	-- ÆäËü(???)
		Talk(1,"", 11339)
		SetTask(39,0)
		SetTask(40,0)
	end
end;

function U39_yes()
	Talk(1,"", 11340)
	SetTask(39,10)
	SetTask(40,0)
	Earn(10000)
	Msg2Player("TiÕp nhËn nhiÖm vô Th¸i ®é Vâ L©m: Thay §éc C« KiÕm ®i th¨m dß th¸i ®é c¸c m«n ph¸i cã ®ång lßng liªn kÕt diÖt n­íc Kim hay kh«ng. ")
	AddNote("TiÕp nhËn nhiÖm vô Th¸i ®é Vâ L©m: Thay §éc C« KiÕm ®i th¨m dß th¸i ®é c¸c m«n ph¸i cã ®ång lßng liªn kÕt diÖt n­íc Kim hay kh«ng. ")
end

function U39_prise()
	Talk(2,"", 11341, 11342)
	SetTask(39,date("%Y%m%d"))					-- ±äÁ¿¸ÄÎªµ±Ç°ÈÕÆÚ
	SetTask(40,0)									-- ×Ó±äÁ¿¸´Î»
	i = 10+random(1,10)							-- ÉùÍûËæ»ú½±Àø11---20µã
	AddRepute(i)
	Msg2Player("Hoµn thµnh nhiÖm vô Th¸i ®é Vâ L©m cña §éc C« KiÕm, danh väng cña b¹n t¨ng "..i.."®iÓm.")
	AddNote("Quay l¹i Hoµnh s¬n §¹i §×nh, hoµn thµnh nhiÖm vô Th¸i ®é Vâ L©m cña §éc C« KiÕm. ")
end

function U39_progress()
	Uworld40 = GetTask(40)
	faction_list = {"Nga My ph¸i","§­êng M«n","Thiªn V­¬ng Bang","Thiªn NhÉn Gi¸o","Vâ §ang ph¸i","Thóy Yªn m«n","ThiÕu L©m ph¸i","C¸i Bang","C«n L«n ph¸i","Ngò §éc Gi¸o"}
	str = ""
	for i = 1,10 do									-- ¼ì²éÒÑÖÃÎ»µÄÃÅÅÉ£¬ÁĞ±íË³ĞòÈçÉÏÃæÊı×éË³Ğò
		if (GetBit(Uworld40,i) == 1) then
			if (str == "") then
				str = faction_list[i]
			else
--				str = str + "¡¢" + faction_list[i]
--				str = format("%s¡¢%d", str, faction_list[i])
				str = str..", "..faction_list[i]
			end
		end
	end
	if (str == "") then								-- ¸ù¾İ¼ì²é½á¹ûÏàÓ¦¶Ô»°
		Talk(1,"", 11343)
	else
		Talk(1,"","Ng­¬i hiÖn giê ®· ®i ®iÒu tra ®­îc c¸c m«n ph¸i: "..str..", hy väng cã thÓ nhanh mét chót. ")
	end
end

function no()
end

function biguan_talk()
	if (GetLevel() < 120) then
		describe_talk({npc_string(1, "Ng­¬i vÉn ch­a ®¹t cÊp 120, c«ng lùc h·y cßn non kĞm, tèt nhÊt ®õng nhóng tay vµo viÖc nµy.")})
	elseif (GetLastFactionNumber() == -1) then
		describe_talk({npc_string(1, "Ng­¬i v« m«n v« ph¸i, ta vµ ng­¬i còng ch¼ng liªn can g× víi nhau.")})
	else
		local szTemp = "Huynh ®Ö"
		if (GetSex() == 1) then
			szTemp = "N÷ hiÖp"
		end
		local tDialog =
		{
			npc_string(1, "VŞ"..szTemp.." nµy, håi n·y ta ®· tuyªn bè c«ng viÖc cña liªn minh ®· cã ®Ö tö ®i lµm råi, ng­¬i cßn ®Õn t×m ta cã g× ®Ó lµm?"),
			speak_string(1, "Ch¼ng d¸m giÊu minh chñ, ta v× chuyÖn bÕ quan cña «ng mµ ®Õn ®©y. Trong m¾t c¸c nh©n sü vâ l©m, thêi gian nµy còng t¹m gäi lµ th¸i b×nh, kh«ng cã chİnh sù binh biÕn g×. Nh­ng quyÕt ®Şnh cña «ng xem ra h¬i kh¸c th­êng, kh«ng chõng sÏ g©y İt nhiÒu lêi ®ån thåi, giang hå l¹i thªm mét phen bÊt an."),
			npc_string(1, "Giang hå tr­íc nay lu«n rÊt nh¹y c¶m, ch¾c ng­¬i còng hiÓu. Vµ ta còng v× d¹o nµy c¸c danh sü tho¸i Èn cña thËp ®¹i m«n ph¸i ®· t¸i xuÊt giang hå, v× an ®Şnh cña vâ l©m mµ ta quyÕt ®Şnh nh­ vËy."),
			speak_string(1, "NÕu lµ v× chuyÖn yªn ®Şnh vâ l©m, lÏ nµo minh chñ l¹i kh«ng ra mÆt lªn tiÕng viÖc nµy?"),
			npc_string(1, "Lªn tiÕng? HiÖn giê còng ch­a ph¶i lóc, huèng g× ®Õn ta còng kh«ng muèn t×m hiÓu sù t×nh bªn trong, nãi g× ®Õn viÖc lªn tiÕng, tÊt c¶ ®Òu ch­a râ rµng, v× thÕ ta cÇn cã thêi gian ®Ó t×m hiÓu. C¸c h¹ h·y quay vÒ tr­íc ®i, ta cã viÖc cÇn ph¶i gi¶i quyÕt."),
			speak_string(1, "Th«i ®­îc råi, nÕu ®· nh­ thÕ ta còng kh«ng lµm mÊt thêi gian cña bang chñ n÷a. µ, cßn lêi cuèi cïng ta muèn nãi lµ, c¸c nh©n sü vâ l©m v× chuyÖn nµy mµ b¨n kho¨n, riªng ta còng v× chuyÖn nµy mµ b«n ba kh¾p n¬i, nªn còng hi väng minh chñ sím c«ng bè ch©n t­íng cña vô viÖc. Ta xin c¸o tõ."),
			self_string(1, "Xem ra chØ cã rêi khái Hoµnh S¬n Ph¸i, tù tay ®i ®iÒu tra vô viÖc nµy th«i. ViÖc liªn quan ®Õn ®éc c« ®¹i hiÖp, nhÊt ®Şnh ph¶i tõ <color=white>Cöa chİnh ®¹i s¶nh<color> xuÊt hµnh mµ th«i."),
		}
		describe_talk(tDialog)
		SetTask(LV120_SKILL_STATE, 2)
		SyncTaskValue(LV120_SKILL_STATE)
	end
end

function yuegedao_help()
	Talk(2, "yuegedao_fix", "§éc C« KiÕm: thuë thiÕu niªn khi ta hµnh tÈu giang hå cã nghe nãi ®Õn. Ng­¬i hái cã viÖc g× kh«ng?",
													"Ng­êi ch¬i: nh­ ngµy h«m nay NguyÖt Ca LÖnh l¹i t¸i xuÊt giang hå, sau khi ®Ö tö nhËn ®­îc mµ kh«ng biÕt ph¶i xö trİ thÕ nµo cho ph¶i lÏ?")
end

function yuegedao_fix()
	local TSK_LV150_SKILL = 2885
	local FINAL_150SKILL_TASKSTATE = 14
	local tbname_150skill_list = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
	}
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nLevel = GetLevel()
	if nLevel < 150 then
		Talk(1, "", "Ng­¬i vÉn ch­a ®ñ cÊp 150, kh«ng cã t­ c¸ch nhËn NguyÖt Ca LÖnh!")
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Talk(1, "", "Ng­¬i vÉn ch­a gia nhËp m«n ph¸i nµo c¶, kh«ng cã t­ c¸ch nhËn NguyÖt Ca LÖnh!")
		return 1
	end
	local tbSkill = tbname_150skill_list[nFact]
	local nGetAllSkill = 1
	for i = 1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		if HaveMagic(nSkillId) == -1 then
			nGetAllSkill = 0
			break
		end
	end
	local nYueGedaoStep = mod(floor(GetTask(TSK_LV150_SKILL)/100), 100)
	if nGetAllSkill == 1 or nYueGedaoStep >= FINAL_150SKILL_TASKSTATE then
		Talk(1, "", "Xem ra ng­¬i ®· l·nh héi ®­îc rÊt nhiÒu ®iÒu tèt trªn NguyÖt Ca §¶o, ng­¬i kh«ng cÇn ph¶i cã c¸i lÖnh bµi nµy n÷a ®©u, viÔn lé giang hå, ng­¬i cø ®i ®i.")
		return
	end
	local nTaskStep = mod(GetTask(TSK_LV150_SKILL), 100)
	if nTaskStep < tbFactStepList[nFact] then
		Talk(1, "", "Tr­íc tiªn ng­¬i cø lµm cho tèt viÖc mµ s­ m«n cña ng­¬i giao cho råi h·y nãi.")
		return
	end
	if CalcItemCount(-1, 6, 1, 2908, -1) > 0 then
		Talk(1, "", "Râ rµng lµ ng­¬i cã mét NguyÖt Ca LÖnh råi.")
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "Hµnh trang İt cÇn ph¶i cã 1 « trèng")
		return
	end
	Talk(1, "", "Ta vÉn cßn mét NguyÖt Ca LÖnh, ng­êi cø cÇm lÊy ®i, sÏ cã İch l¾m ®Êy.")
	local tbAward = {
		{szName = "NguyÖt Ca LÖnh", tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "§Õn §éc C« KiÕm - Hoµnh S¬n Ph¸i nhËn NguyÖt Ca LÖnh")	
end
