---ÖĞÔ­ÄÏÇø\Îäµ±ÅÉ\Îäµ±ÅÉ\npc\wdnpc06.lua
--description: Îäµ±ÅÉÖÜÔÆÈª¡¡Îäµ±40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/15
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-17)
-- updage by xiaoyang(2004\4\15) Îäµ±90¼¶ÈÎÎñ
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	tbDailog:AddOptEntry("NhiÖm vô kü n¨ng cÊp 150", dailog150skill)
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", org_dailog)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	tbDailog:Show()
end

function org_dailog()
	UTask_wd = GetTask(5)
	Uworld129 = GetTask(129)
	if((UTask_wd == 40*256) and (GetLevel() >= 40) and (GetFaction() == "wudang")) then
		Say("Ng­¬i cã thÓ gióp ta kh«ng? Ch­ëng m«n muèn ta ®em <color=Red>1 l¸ th­<color> ®Õn <color=Red>Kª Qu¸n ®éng<color> ®­a cho <color=Red>NhuËn N­¬ng<color>, ®ét nhiªn ta ®ang cã chuyÖn gÊp, ng­¬i thay ta ®­a th­ ®­îc kh«ng?", 2, "Kh«ng thµnh vÊn ®Ò!/L40_get_yes", "Xin lçi, ta cßn cã viÖc kh¸c /L40_get_no")
	elseif (UTask_wd >= 40*256+20) and (UTask_wd <= 40*256+40) and (HaveItem(163) == 0) then		-- µÀ¾ß¶ªÁË
		AddEventItem(163)
		Talk(1,"","Ng­¬i thËt lç m·ng! Th­ cña ch­ëng m«n ®· kh«ng cÇm cßn muèn ch¹y n÷a?")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 1) then					--ÓĞÈóÄïµÄ»ØĞÅ
		Talk(2, "", "Chu s­ huynh! Ta ®· gióp huynh ®­a th­ råi, ®©y lµ th­ håi ©m cña NhuËn N­¬ng!", "VÊt v¶ cho ng­¬i qu¸! §i giao l¸ th­ håi ©m nµy cho Ch­ëng m«n ®i! Ch­ëng m«n ë trong Tö Tiªu ®iÖn.")
		Msg2Player("VÒ tíi nói Vâ §ang t×m Chu V©n TuyÒn, biÕt ®­îc nªn giao th­ cho ch­ëng m«n. ")
		AddNote("VÒ tíi nói Vâ §ang t×m Chu V©n TuyÒn, biÕt ®­îc nªn giao th­ cho ch­ëng m«n ")
		SetTask(5,40*256+80)
	elseif (UTask_wd == 40*256+80) and (HaveItem(164) == 0) then			-- µÀ¾ß¶ªÁË
		AddEventItem(164)
		Talk(1,"","Ng­¬i ®Ó quªn th­ ë chç ta råi!")
	elseif (Uworld129 == 10) then
		Talk(12,"Uworld129_admit","§¹o huynh lµ mét trong 6 vŞ hµo kiÖt Vâ §ang! T¹i h¹ ®· nghe danh tõ l©u, h«m nay míi ®­îc lªn nói thØnh gi¸o.","Tèt!.Chu mç ®· l©u ch­a cã ®èi thñ thùc thô, ch©n tay ngøa ng¸y l¾m råi!"," Vâ §ang ®¹o gia tiªn h­¬ng, tiÓu tö kh«ng d¸m qua mÆt. Lµm sao ta d¸m tû ®Êu nh­ vËy?","Ta vèn kh«ng thİch chÌn Ğp kÎ kh¸c, C¸c h¹ lÇn ®Çu lªn Vâ §ang, c¸ch tû thİ do ng­¬i quyÕt ®Şnh."," Vâ häc nhÊt ®¹o l­u truyÒn ®Õn ngµy nay, tù cæ cã c¸c phÇn néi ngo¹i gia. Xin hái nªn xem träng lo¹i nµo?","Néi gia luyÖn khİ, ngo¹i gia luyÖn th©n. Kh«ng cã th©n thÓ tèt th× lµm sao ®Şnh thÇn? Do ®ã nªn xem träng ngo¹i gia."," Kh«ng ph¶i! Thiªn ®Şa v¹n vËt, t¹o hãa sö nhiªn. NÕu lÊy t©m ngù khİ, lÊy khİ quan tøc, tøc th«ng tù nhiªn míi tu luyÖn ®­îc chİnh ®¹o.","T©m g×? Khİ g×? NÕu mét ng­êi cã 3, 5 bÖnh, hµng ngµy n«n möa ra m¸u, th× c¸i g× gäi lµ thiªn ®Şa."," Vâ c«ng m¹nh nhÊt biÓu hiÖn ë bªn ngoµi. Nh­ng.....","§­îc råi! Ta c·i kh«ng l¹i ng­¬i. NÕu muèn chøng minh nh÷ng thø nµy, hay lµ ng­¬i ®i t×m S­ ®Ö Lı Thiªn Môc cña ta!"," Xin Chu ®¹i hiÖp thø lçi","§i mau! Ng­¬i lµm ta chŞu hÕt næi råi!")
   elseif(Uworld129 == 30)then
   	Talk(6,"Uworld129_admit2","B»ng h÷u! Mau qua ®©y!","Chu huynh cã g× chØ gi¸o?","µ! Cho ng­¬i xem thø nµy!",".....Th­ nhµ? Chóc mõng Chu huynh!","Ha ha! Cha mÑ ë nhµ ®îi ta, ta ph¶i lËp tøc xuèng nói! Nhê B»ng h÷u chuyÓn lêi cho S­ huynh ®Ö ta giïm."," ë ®êi lÊy ch÷ hiÕu lµm ®Çu! Chu huynh yªn t©m!")
   elseif (Uworld129 > 10) and (Uworld129 < 60)then
   	Talk(1,"","Vâ §ang gi÷ vŞ trİ quan träng cña vâ l©m Trung Nguyªn, ®Õn Vâ §ang bµn luËn vÒ vâ c«ng lµ ng­¬i t×m ®óng chç råi.")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","<color=Red>NhuËn N­¬ng<color> ë trong <color=Red>Kª Qu¸n ®éng<color>.")
	elseif (UTask_wd > 40*256+20) and (UTask_wd < 40*256+80) then					--ÒÑ¾­½Óµ½40¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
		Talk(1,"","GÆp NhuËn N­¬ng ch­a? Mäi viÖc thÕ nµo?")
	elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","¢n o¸n gi÷a S­ phô vµ NhuËn N­¬ng, ta cã nghe qua, chØ v× S­ phô h×nh nh­ kh«ng muèn nh¾c ®Õn, chóng ta lµm ®Ö tö còng kh«ng nªn hái nhiÒu qu¸.")
	elseif (UTask_wd >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Chóng ta ®­îc lµm ®ång m«n, tøc lµ cã duyªn, ng­êi h÷u duyªn sau nµy sÏ gÆp l¹i, xin h·y b¶o träng! ")
	else
		dailog150skill()
	end
end

function dailog150skill()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>Ta lu«n tù khuyªn m×nh t¹i Vâ §ang S¬n ch¨m chØ luyÖn vâ c«ng, ®em tÊt c¶ tinh lùc ®­a vµo tu luyÖn vâ häc, tõ tr­íc ®Õn giê kh«ng cã nghÜ ®Õn viÖc lÊy vî sinh con, cho ®Õn b©y giê th× ®· qua c¸i thêi xu©n Êy råi, trong lßng còng cã chót u sÇu."
	G_TASK:OnMessage("Thóy Yªn", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L40_get_yes()
	Talk(1,"","§a t¹! <color=Red>NhuËn N­¬ng<color> ë trong <color=Red>Kª Qu¸n ®éng<color>, h·y mang bøc th­ nµy ®i!")
	Msg2Player("§­îc ch­ëng m«n giao l¸ th­ ®Ó ®­a cho NhuËn N­¬ng. ")
	AddEventItem(163)
	SetTask(5, 40*256+20)
	AddNote("T¹i bê hå Thanh Thuû gÆp Chu V©n TuyÒn, nhËn nhiÖm vô NhuËn N­¬ng, ®Õn ®éng Kª Qu¸n Phôc Ng­u s¬n ®­a th­ cho mét ng­êi gäi lµ NhuËn N­¬ng. ")
	Msg2Player("T¹i bê hå Thanh Thuû gÆp Chu V©n TuyÒn, nhËn nhiÖm vô NhuËn N­¬ng, ®Õn ®éng Kª Qu¸n Phôc Ng­u s¬n ®­a th­ cho mét ng­êi gäi lµ NhuËn N­¬ng. ")
end;

function L40_get_no()
	Say("VËy ta t×m ng­êi kh¸c gióp. ")
end;

function Uworld129_admit()
	SetTask(129,20)  --ÉèÖÃÈÎÎñ±äÁ¿20
	Msg2Player("Sau khi nãi chuyÖn víi Chu V©n TuyÒn, quay l¹i t×m Lı Thiªn Môc. ")
	AddNote("Sau khi nãi chuyÖn víi Chu V©n TuyÒn, quay l¹i t×m Lı Thiªn Môc. ")
end

function Uworld129_admit2()
	SetTask(129,40)
	Msg2Player("Sau khi nãi chuyÖn víi Chu V©n TuyÒn, quay l¹i t×m Lı Thiªn Môc. ")
	AddNote("Chu V©n TuyÒn nhËn th­ gia ®×nh, ng­¬i vui mõng cho h¾n, ®¸p øng thay h¾n nãi víi Lı Thiªn Môc. ")
end
