-- À¥ÂØ ÕÆÃÅ è¯çá×Ó ÈëÃÅÈÎÎñ¡¢³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
-- by£ºDan_Deng(2003-07-30)
-- Update£ºDan_Deng(2003-10-27)ÖØĞ´ÖØ·µÊ¦ÃÅÈÎÎñ£¬²¢ÖØĞÂÕûÀí½Å±¾

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	G_TASK:OnMessage("C«n L«n", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 9) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
end

function oldentence()
	local UTask_kl = GetTask(9);
	local nFactID = GetLastFactionNumber();

	if (UTask_kl == 70*256) and (GetFaction() == "kunlun") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_kl == 70*256) and (GetTask(5) >= 5*256) and (GetTask(5) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(5,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_kl == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(9,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (GetTask(5) == 70*256) and (GetTask(9) == 70*256) then			-- ×ªÃÅÅÉ´íÎóĞŞÕı
		SetTask(5,75*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_kl == 80*256 and nFactID == 9 and GetCamp() == 3 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("kunlun");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_kl == 70*256 and nFactID == 9 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(9)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_kl = GetTask(9);
	local Uworld31 = GetByte(GetTask(31),2)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),9) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","Th©n lµ thÇn d©n ®¹i Tèng, chèng giÆc ngo¹i x©m tÊt nhiªn nghÜa bÊt kh¶ tõ, nh­ng nh¹c phô cña §éc C« KiÕm Tr­¬ng Phong tõng phôc vô cho ng­êi Kim. §Ó h¾n thñ lÜnh, chØ e khã lßng mµ phôc tïng")
		Uworld40 = SetBit(GetTask(40),9,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 60*256+20) and (HaveItem(16) == 1)) then	-- ³öÊ¦ÈÎÎñÍê³É
			Talk(2,"L60_prise","Ch­ëng m«n! §Ö tö kinh tr¶i tr¨m gian ngµn khæ, cuèi cïng ®· t×m ®­îc Ngò S¾c th¹ch t¹i Hoµng Hµ nguyªn ®Çu!","ChØ hy väng viªn Ngò S¾c th¹ch nµy cã thÓ mang l¹i hång phóc cho bæn m«n. Ng­¬icã thÓ hoµn thµnh nhiÖm vô to lín khã kh¨n nµy, ta còng c¶m thÊy rÊt yªn vui! Tõ ®©y ng­¬i cã thÓ thuËn lîi xuÊt s­ råi!")
		elseif ((UTask_kl == 60*256) and (GetLevel() >=50)) then		-- ³öÊ¦ÈÎÎñ
			Say("TruyÒn thuyÕt kÓ: n¨m x­a N÷ Oa luyÖn Ngò S¾c th¹ch v¸ trêi, v¸ xong trêi, lÊy nh÷ng viªn ®¸ d­ ra r¶i xuèng trÇn gian, trong ®ã cã 1 viªn r¬i ngay Hoµng Hµ nguyªn ®Çu. Ngò S¾c th¹ch t­îng tr­ng quang minh vµ h¹nh phóc, ai cã ®­îc Ngò S¾c th¹ch, ng­êi ®ã sÏ gÆp may tr¸nh n¹n. NÕu ng­¬icã thÓ gióp bæn ban t×m ®­îc Ngò S¾c th¹ch, ng­¬icã thÓ thuËn lîi xuÊt s­.",2,"VËy ®Ö tö sÏ ®i t×m /L60_get_yes","ChuyÖn ®ã nh­ mß kim ®¸y biÓn, hay lµ th«i vËy. /L60_get_no")
		elseif (UTask_kl == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			check_skill()
			Say("Cã vÎ nh­ vâ nghÖ cña ng­¬i còng kh«ng kĞm, cã thİch xuèng nói thùc tiÔn mét phen?",2,"§Ö tö còng ®ang cã ı ®ã /goff_yes","§Ö tö muèn tËp luyÖn thªm 1 thêi gian n÷a. /no")
		else
			Talk(1,"","Lµm Ch­ëng m«n kh«ng dÔ dµng chót nµo!")
		end
	elseif (Uworld31 == 20) then		--ÈëÃÅÈÎÎñ
		Talk(4,"enroll_prise","Nghe nãi ng­¬i b¾t cho con g¸i ta 1 con kim t¬ hÇu?","§óng vËy!","Uhm! ThÕ th× ng­¬icã yªu cÇu g×?","V·n bèi muèn b¸i tæ nhËp C«n L«n ph¸i häc nghÖ ")
--	elseif (UTask_kl == 5*256+20) then			-- ×ªÃÅÅÉÍê³É
--		Talk(1,"defection_complete","è¯çá×Ó£ººÃ£¬ºÃ£¡ÄãÒ²×ªÁË¹ıÀ´£¬Îäµ±ÅÉÎŞÈËÒÓ£¡")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_kl == 70*256) and ((GetTask(5) < 5*256) or (GetTask(5) == 75*256)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_select","S­ phô! §Ö tö ra giang hå phiªu b¹t ®· ®­îc mét thêi gian, c¶m thÊy m×nh kiÕn thøc kĞm cái, cã thÓ cho ®Ö tö quay vÒ t¸i nhËp m«n ®Ó tiÕn tu vâ c«ng?")
	elseif (GetCamp() == 4) and ((UTask_kl == 70*256+10) or (UTask_kl == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("§¹o lı lµm ng­êi nh­ ng­¬i võa nãi ®ã, häc ®­îc ë ®©u vËy?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
	elseif (GetTask(5) == 70*256+10) and (HaveMagic(182) >= 0) then		-- Îäµ±ÖØ·µÃÅÅÉ£¬ÊÕ»ØÎåÀ×Õı·¨
		Say("Vâ §ang toµn mét lò tham danh lõa g¹t mäi ng­êi, uæng c«ng ta tËn t©m lùc ®µo t¹o ng­¬i thÕ mµ ng­¬i d¸m lµm chuyÖn v« ¬n béi nghÜa nh­ vËy!",2,"Kh«ng sai, ı ta ®· quyÕt. /defection_yes","§Ö tö ®· biÕt lçi råi. /no")
	else
		Talk(1,"","ThiÕu L©m, Vâ §ang th× ®· lµ g×? SÏ cã mét ngµy, ta ®¹p bän hä d­íi gãt giµy")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(275) == -1) then
--		AddMagic(275)					-- Ëª°ÁÀ¥ÂØ
--		Msg2Player("ÄãÑ§»áÁË¡°Ëª°ÁÀ¥ÂØ¡±")
--		Say("è¯çá×Ó£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°Ëª°ÁÀ¥ÂØ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("Cã vÎ nh­ vâ nghÖ cña ng­¬i còng kh«ng kĞm, cã thİch xuèng nói thùc tiÔn mét phen?",2,"D¹! §Ö tö ®i liÒn /goff_yes","§Ö tö tËp luyÖn vÉn ch­a ®ñ /no")
--	end
end
--------------------- ×ªÃÅÅÉÏà¹Ø ------------------------
function defection_complete()
	Msg2Player("Hoan nghªnh b¹n gia nhËp C«n L«n ph¸i, trë thµnh PhÊt trÇn ®Ö tö. ")
	SetRevPos(131,57)		  				-- ÉèÖÃÖØÉúµã
	SetTask(9,10*256)						-- ÈëÃÅ
	SetFaction("kunlun")      			-- Íæ¼Ò¼ÓÈëÀ¥ÂØ
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	AddMagic(169)
	Msg2Player("Häc ®­îc H« Phong ph¸p ")
	AddNote("Gia nhËp C«n L«n ph¸i, trë thµnh PhÊt TrÇn ®Ö tö, häc ®­îc H« Phong ph¸p ")
	Msg2Faction("kunlun",GetName().." tõ Vâ §ang ®Õn gia nhËp C«n L«n ph¸i. Lùc l­îng bæn ph¸i ®· m¹nh l¹i cµng m¹nh!",GetName())
end

-------------------------- ÖØ·µÃÅÅÉÏà¹Ø ---------------------
function goff_yes()
	Talk(1,"","§­îc råi! Ng­¬i h·y ®i ®i! §õng quªn r»ng nhê cã chóng ta mµ ng­¬i míi cã ®­îc ngµy h«m nay!")
	SetTask(9,70*256)
	AddNote("Rêi khái C«n L«n ph¸i, l¹i tiÕp tôc phiªu b¹t giang hå ")
	Msg2Player("Rêi khái C«n L«n ph¸i, l¹i tiÕp tôc phiªu b¹t giang hå ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_select()
	Say("§iÒu nµy kh«ng hîp víi quy ®Şnh cña m«n ph¸i. Nh­ng nÕu ng­¬i lµ ng­êi thÊu hiÓu ®¹o lı, ta cã thÓ gióp ng­¬i nghÜ c¸ch ",2,"TÆng 50000 l­îng b¹c /return_yes","Kh«ng trïng ph¶n s­ m«n n÷a /return_no")
end;

function return_yes()
	Talk(1,"","Tèt l¾m! Qu¶ nhiªn lµ ng­êi biÕt ®iÒu. Ng­¬i ®· ngé ra nh÷ng ®¹o lı lµm ng­êi råi, còng nªn nhanh chãng chuÈn bŞ ®i!")
	SetTask(9,70*256+20)
	AddNote("ChØ cÇn giao n¹p 50. 000 l­îng b¹c th× cã thÓ trïng ph¶n s­ m«n ")
	Msg2Player("ChØ cÇn giao n¹p 50. 000 l­îng b¹c th× cã thÓ trïng ph¶n s­ m«n ")
end;

function return_no()
	Talk(1,"","NÕu nh­ vËy ch¾c ta l¹i ph¶i quay vÒ giang hå tiÕp tôc häc tËp thªm mét thêi gian n÷a. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Tèt l¾m! VËy th× ta sÏ ®i th«ng b¸o tin ng­¬i ®· quay trë l¹i m«n ph¸i. ")
		Pay(50000)
		SetTask(9,80*256)
		SetFaction("kunlun")
--		if (HaveMagic(275) == -1) then
--			AddMagic(182)
--			AddMagic(275)
		add_kl(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n ®· häc tuyÖt häc TrÊn ph¸i S­¬ng Ng¹o C«n L«n, Ngò L«i Chİnh Ph¸p")
--		end
		SetCamp(3)
		SetCurCamp(3)
		SetRank(75)
		AddNote("§· quay trë l¹i C«n L«n ph¸i, l¹i ghi tªn trong m«n ph¸i ")
		Msg2Player(GetName().."<#>§­îc phong lµm Hé Ph¸p Ch©n Qu©n cña C«n L«n ph¸i, trë vÒ ph¸i C«n L«n tiÕp tôc tu hµnh. ")
	else
		Talk(2,"","ChØ nãi miÖng kh¬i kh¬i, kh«ng ®­a ra hµnh ®éng cô thÓ nµo sao?","Xin lçi! Ta sÏ lËp tøc ®i kiÕm tiÒn!")
	end
end;

function return_uncompleted()
	Talk(1,"","Cø Êm Êm óng óng nh­ thÕ, lµm sao cho ng­êi ta tin ®­îc thµnh ı cña ng­¬i!")
end;

----------------------- ÃÅÅÉÈÎÎñÏà¹Ø -------------------
function enroll_prise()
	Talk(1,"","Muèn nhËp m«n th× chØ b»ng c¸i viÖc nhá nhÆt nh­ vËy th«i kh«ng ®ñ, nh­ng thÊy ng­¬ith«ng minh lanh lÑ, bæn to¹ cho phĞp ng­¬i lµm Kı Danh ®Ö tö vËy! ")
	i = ReturnRepute(30,29,3)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)
	Uworld31 = SetByte(GetTask(31),2,127)
	SetTask(31,Uworld31)
	AddNote("<#>Hoµn thµnh nhiÖm vô Kim T¬ HÇu, trë thµnh <color=Red>Kı Danh ®Ö tö<color>. Danh väng cña b¹n t¨ng thªm "..i.."<#>®iÓm.")
	Msg2Player("Hoµn thµnh nhiÖm vô Kim T¬ HÇu, trë thµnh Kı danh ®Ö tö. ")
end;

function L60_get_yes()
	SetTask(9,60*256+10)
	AddNote("TiÕp nhËn nhiÖm vô xuÊt s­: §Õn Hoµng Hµ Nguyªn §Çu t×m Ngò S¾c th¹ch ")
	Msg2Player("TiÕp nhËn nhiÖm vô xuÊt s­: §Õn Hoµng Hµ Nguyªn §Çu t×m Ngò S¾c th¹ch ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(1,"","§a t¹ Ch­ëng m«n! ")
	DelItem(16)
	SetRank(65)
	SetTask(9, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Hoµn thµnh nhiÖm vô xuÊt s­, ®­îc phong lµ Tiªn Phï Ch©n Qu©n ")
	Msg2Player("Chóc mõng B¹n! Thµnh nghÖ xuÊt s­! B¹n ®· ®­îc phong lµ Tiªn Phï Ch©n Qu©n ")
end;
