-- ÉÙÁÖ Â·ÈËNPC ·½ÕÉĞşÒò 10¼¶ÈÎÎñ¡¢40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)
-- Update£ºDan_Deng(2003-10-27)ÖØĞ´ÖØ·µÊ¦ÃÅÈÎÎñ£¬²¢ÖØĞÂÕûÀí½Å±¾

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("T×m ta cã viÖc g×?", 2, "Muèn thØnh gi¸o ®¹i s­!/oldentence", "Mõng lÔ ¢n S­, t¹i h¹ ®· t×m ®ñ “ThÎ ¢n S­” vµ “ThÎ Cao §å”./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	G_TASK:OnMessage("ThiÕu L©m", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(3,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(7,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- ×ªÃÅÅÉ´íÎóĞŞÕı
		SetTask(3,75*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end
	
	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(0)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","§éc C« Minh chñ ®· cã hïng tµi chİ lín thÕ nµy, l·o n¹p ®©y nhÊt ®Şnh nghe theo. ChØ lµ bæn tù ®ang l©m vµo c¶nh bŞ trong tay ng­êi Kim, l·o n¹p kh«ng thÓ kh«ng mµng ®Õn tİnh m¹ng c¸c chóng t¨ng trong chïa, kh«ng d¸m tïy tiÖn hµnh sù. PhiÒn anh vÒ nãi víi §éc C« Minh chñ l·o n¹p ®©y xin kh­ít tõ.")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10¼¶ÈÎÎñÆô¶¯
			Say("A Di §µ PhËt! TÊt c¶ ®Ö tö nhËp m«n ®Òu ph¶i qua kh¶o nghiÖm, ng­¬i ®· chuÈn bŞ xong ch­a?",2,"Ta ®· s½n sµng!/L10_get_yes","Ta ch­a s½n sµng!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40¼¶ÈÎÎñ½øĞĞÖĞ
			SetTaskTemp(43,0)		-- ÁÙÊ±±äÁ¿43,¼ÆÊı»Ø´ğÕıÈ·µÄ»°
			Talk(1,"L40_sele3_1","Hai vŞ S­ thóc tæ nhê ®Ö tö ®em n¨m c©u nµy chuyÓn lêi cho Ch­ëng m«n, nãi t©m ı cña hai ng­êi ®· n»m trong n¨m c©u nãi nµy:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40¼¶ÈÎÎñÆô¶¯
			Say("S­ thóc tæ bæn m«n TŞch DiÖt hai ng­êi vâ c«ng ®· ®¹t ®Õn c¶nh giíi th­îng thõa, nh­ng do n¨m x­a hai vŞ v× muèn tr¸nh nĞ sù cÊu xĞ tranh giµnh trong bæn ph¸i, ®· vµo mËt thÊt phİa sau nói bÕ quan kh«ng b­íc ch©n ra, giê ®©y thiªn h¹ ®¹i lo¹i, Trung Nguyªn nguy hiÓm bèn bÒ, vi s­ ®©y muèn nhê ng­¬i thØnh hai vŞ S­ thóc tæ ra t×m c¸ch hãa gi¶i, ng­¬i ®ång ı ®i mêi hä ra kh«ng?",2,"§ång ı!/L40_get_yes","§Ö tö n¨ng lùc yÕu kĞm, e kh«ng g¸nh v¸c ®­îc /no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë£¬ÒÔ¼°¼¼ÄÜµ÷Õû¼ì²éÅĞ¶Ï
			check_skill()
		else
			Talk(1,"","Tèt! Tèt! Cè g¾ng lªn! PhËt Tæ sÏ phï hé cho ng­¬i ®ã.")
		end
--	elseif (UTask_sl == 5*256+20) then			-- ×ªÃÅÅÉÍê³É
--		Talk(1,"defection_complete","ĞşÒò·½ÕÉ£º°¢ÃÖÍÓ·ğ£¬¼ÈÈë¿ÕÃÅ£¬¾ÍºÃºÃÊÕÊ°ĞÄÇé×êÑĞ²Ø¾­¸óÄÚµä¼®£¬²»ÒªÔÙÈ¥¹ÒÂÇÕ½³¡ØËÉ±£¬¹úºŞ¼Ò³ğÁË¡£")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_sele","S­ phô, ®Ö tö cã thÓ m­în kinh ®iÓn trong Tµng Kinh C¸c ®­îc kh«ng vËy?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("5 v¹n l­îng ®· chuÈn bŞ xong ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- ÉÙÁÖÅÉÖØ·µÃÅÅÉ£¬ÊÕ»Ø½ğÖÓÕÖ
--		Say("ĞşÒò·½ÕÉ£ºÌìÍõ°ïÓë½ğ±øÕ½»ğÕıº¨£¬ÄãÈôÍ¶ÈëÌìÍõ°ï£¬¿Ö½ğ±øÒÔ´ËÏò±¾ËÂÆôĞÆ¡£",2,"ÎªÃâÊ¦¸¸·³ÄÕ£¬ÇëÊÕ»ØµÜ×ÓÃûºÅ/defection_yes","µÜ×Ó¿¼ÂÇÎ´ÖÜ£¬ÇëÊ¦¸¸Ô­ÁÂ/no")
	else							-- ³£¹æ¶Ô»°
		Talk(1,"","§èi víi t¨ng nh©n trong chïa ThiÕu L©m mµ nãi, c«ng phu lµ sù tu hµnh, sù täa thiÒn. Môc ®İch luyÖn c«ng cña chóng ta lµ muèn thay ®æi tè chÊt cña mét ng­êi, c¸c t¨ng nh©n luyÖn vâ trong ThiÕu L©m chİnh lµ tu hµnh ®Êy.")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- ÈçÀ´Ç§Ò¶ÊÖ
--		Msg2Player("ÄãÑ§»áÁË¡°ÈçÀ´Ç§Ò¶ÊÖ¡±")
--		Say("ĞşÒò·½ÕÉ£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°ÈçÀ´Ç§Ò¶ÊÖ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("Kh« Thiªn Tu BÊt TËn, NhÊt PhiÕn Du Tö T©m. Giê ng­¬i ®· trë thµnh ng­êi trong giang hå råi nÕu muèn xuèng nói th× h·y ®i ®i!",2,"§¹ t¹ ph­¬ng Tr­îng ©n chuÈn /goff_yes","§Ö tö kh«ng d¸m lµm x»ng lµm bËy /no")
--	end
end
--------------------- ×ªÃÅÅÉÏà¹Ø ------------------------
function defection_complete()
	Msg2Player("Hoan nghªnh b¹n gia nhËp ThiÕu L©m ph¸i, trë thµnh T¶o §Şa T¨ng. ")
	SetRevPos(103,51)		  			--ÉèÖÃÖØÉúµã
	SetTask(7,10*256)					-- ÈëÃÅ
	SetFaction("shaolin")       	--Íæ¼Ò¼ÓÈëÃÅÅÉ
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("Häc ®­îc Kim Cang Phôc Ma. ")
	AddNote("Gia nhËp ThiÕu L©m ph¸i, trë thµnh T¶o §Şa T¨ng, häc ®­îc Kim Cang Phôc Ma. ")
	Msg2Faction("shaolin",GetName().." tõ Thiªn V­¬ng bang ®Õn gia nhËp ThiÕu L©m ph¸i. Lùc l­îng bæn ph¸i ®· m¹nh l¹i cµng m¹nh!",GetName())
end

---------------------- ÖØ·µÃÅÅÉÏà¹Ø --------------------------
function goff_yes()
	Talk(1,"","Hång TrÇn Väng BÊt Xuyªn, Ph©n Tranh Kû Thêi §×nh. §i ®i! Nh­ng nhí lÊy xuèng nói vÉn ph¶i gi÷ lßng tõ bi ®Êy.")
	SetTask(7,70*256)
	AddNote("Rêi khái ThiÕu L©m tù, xuèng nói tiÕp tôc hµnh tÈu giang hå. ")
	Msg2Player("Rêi khái ThiÕu L©m tù, xuèng nói tiÕp tôc hµnh tÈu giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("XuÊt s­ xong ®· kh«ng cßn lµ ®Ö tö ThiÕu L©m, ®­¬ng nhiªn lµ kh«ng ®­îc råi. Nh­ng nÕu muèn tham kh¶o PhËt lı th× ThiÕu L©m lu«n réng më ®ãn ng­¬i trïng ph¶n m«n ph¸i.",2,"Ta muèn quay l¹i ThiÕu L©m /return_yes","Kh«ng cÇn ®©u/no")
end;

function return_yes()
	Talk(1,"","T­îng PhËt l©u ngµy kh«ng tu söa nªn cã phÇn h­ h¹i, nÕu nh­ ng­¬i hãa duyªn cho bæn tù 50000 l­îng th× cã thÓ trïng ph¶n ThiÕu L©m..")
	SetTask(7,70*256+20)
	AddNote("Nép 50000 l­îng b¹c ®Ó quay l¹i ThiÕu L©m ")
	Msg2Player("Nép 50000 l­îng b¹c ®Ó quay l¹i ThiÕu L©m ")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ÓĞ50000Á½
		Talk(1,"","RÊt tèt! C¨n cø theo sù ®ãng gãp cña ng­¬i cho bæn tù, ®­îc vinh h¹nh nhËn chøc danh Hé Ph¸p Tr­ëng l·o.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n häc ®­îc tuyÖt häc trÊn ThiÕu L©m ph¸i Nh­ Lai Thiªn DiÖp, vâ c«ng DŞch C©n Kinh. ")
--		end
		AddNote("§· quay trë l¹i ThiÕu L©m ph¸i. ")
		Msg2Faction(GetName().." ®· trë l¹i ThiÕu L©m, ®­îc phong lµ: Hé Ph¸p Tr­ëng l·o ")
	else
		Talk(1,"","A Di §µ PhËt, h×nh nh­ kh«ng ®ñ 5 v¹n l­îng th× ph¶i.")
	end
end;

------------------------- ÃÅÅÉÈÎÎñÏà¹Ø --------------------------------
function L10_get_yes()
	Talk(1, "", "ChØ cÇn ng­¬i thuËn lîi lÊy ®­îc Kim Liªn hoa trong hÏm Méc Nh©n th× cã thÓ th«ng qua kh¶o nghiÖm")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("TiÕp nhËn thö th¸ch cña ThiÕu L©m ph¸i: lÊy Kim Liªn Hoa tõ Méc Nh©n H¹ng. ")
	Msg2Player("TiÕp nhËn thö th¸ch cña ThiÕu L©m ph¸i: lÊy Kim Liªn Hoa tõ Méc Nh©n H¹ng. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","RÊt tèt! Ng­¬i ®­îc th¨ng lµm Hé ViÖn Vâ T¨ng.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("LÊy ®­îc Kim Liªn Hoa, trë l¹i gÆp HuyÒn Nh©n ph­¬ng Tr­îng, hoµn thµnh thö th¸ch ThiÕu L©m ph¸i. Th¨ng cÊp Hé ViÖn Vâ T¨ng. ")
	Msg2Player("Chóc mõng b¹n! B¹n ®· th¨ng cÊp Hé ViÖn Vâ T¨ng cña ThiÕu L©m ph¸i! Häc ®­îc ThiÕu L©m QuyÒn Ph¸p, ThiÕu L©m C«n Ph¸p, ThiÕu L©m §ao ph¸p. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("NhËn lÖnh cña HuyÒn Nh©n ph­¬ng Tr­îng, ®i thØnh TŞch DiÖt NhŞ T¨ng xuÊt quan. ")
	Msg2Player("NhËn lÖnh cña HuyÒn Nh©n ph­¬ng Tr­îng, ®i thØnh TŞch DiÖt NhŞ T¨ng xuÊt quan. ")
end;

function L40_sele3_1()
	Say("C©u thø nhÊt lµ:",5,"Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_2","Tø ®¹i khæ kh«ng, ngò ©m v« ng· /L40_sele3_2","Nh­ thŞ quan s¸t, tiÖm li sinh tö /L40_sele3_2","ThÕ gian v« th­êng, quèc thæ nguy tuyÖt /L40_sele3_correct1","T©m thŞ ¸c nguyªn, h×nh vi téi tÈu /L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("C©u thø hai lµ:",5,"ThÕ gian v« th­êng, quèc thæ nguy tuyÖt /L40_sele3_3","Tø ®¹i khæ kh«ng, ngò ©m v« ng· /L40_sele3_correct2","Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_3","Nh­ thŞ quan s¸t, tiÖm li sinh tö /L40_sele3_3","T©m thŞ ¸c nguyªn, h×nh vi téi tÈu /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("C©u thø ba lµ:",5,"T©m thŞ ¸c nguyªn, h×nh vi téi tÈu /L40_sele3_4","Nh­ thŞ quan s¸t, tiÖm li sinh tö /L40_sele3_4","Tø ®¹i khæ kh«ng, ngò ©m v« ng· /L40_sele3_4","ThÕ gian v« th­êng, quèc thæ nguy tuyÖt /L40_sele3_4","Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("C©u thø bèn lµ:",5,"Nh­ thŞ quan s¸t, tiÖm li sinh tö /L40_sele3_5","T©m thŞ ¸c nguyªn, h×nh vi téi tÈu /L40_sele3_correct4","ThÕ gian v« th­êng, quèc thæ nguy tuyÖt /L40_sele3_5","Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_5","Tø ®¹i khæ kh«ng, ngò ©m v« ng· /L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("C©u thø n¨m lµ:",5,"Tø ®¹i khæ kh«ng, ngò ©m v« ng· /L40_sele3_result","Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_result","Nh­ thŞ quan s¸t, tiÖm li sinh tö /L40_sele3_correct5","T©m thŞ ¸c nguyªn, h×nh vi téi tÈu /L40_sele3_result","Sinh diÖt biÕn dŞ, h­ ngôy v« chñ /L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- Îå¾äÈ«¶Ô
		Talk(1,"","NhiÖm vô nµy ng­¬i hoµn thµnh tèt l¾m, vi s­ sÏ th¨ng ng­¬i lµm ®Ö tö cÊp 40, ®õng lµm ta thÊt väng nhĞ!")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		AddNote("LÊy ®­îc lêi chØ b¶o tõ chç TŞch DiÖt NhŞ T¨ng, hoµn thµnh nhiÖm vô TŞch DiÖt NhŞ T¨ng. Th¨ng cÊp TruyÒn Kinh La H¸n. ")
		Msg2Player("Chóc mõng b¹n. B¹n ®· th¨ng cÊp TruyÒn Kinh La H¸n cña ThiÕu L©m ph¸i! Häc ®­îc vâ c«ng S­ Tö Hèng. ")
	else
		Talk(1,"","N¨m c©u nãi nµy lµ sao ®©y, cã ph¶i ng­¬i ®· ®äc ng­îc kh«ng?")
	end
	SetTaskTemp(43,0)			-- ÓÃÍêºóÊÍ·Å±äÁ¿
end;

function no()
end
