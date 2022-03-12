--description: ÌìÈÌ½Ì·çÌÃÌÃÖ÷ÍêÑÕÑ©ÒÂ
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-14)
-- Update: xiaoyang(2004\4\12) ¼ÓÈë90¼¶ÃÅÅÉÈÎÎñ

Include("\\script\\global\\skills_table.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_tr = GetTask(4);
	Uworld127 = GetTask(127)
	if(GetSeries() == 3) and (GetFaction() == "tianren") then
		if(UTask_tr == 30*256) and (GetLevel() >= 30) then
			Say("ChØ vµi ngµy n÷a lµ sinh nhËt MÑ ta - Hoµng hËu n­íc §¹i Kim, bæn §­êng chñ dù ®Şnh tÆng MÉu hËu mét chiÕc ¸o ngäc, nh­ng cßn thiÕu bèn lo¹i ®¸ quı: <color=Red>C¸p HuyÕt Hång, B¨ng Tinh Lam, Tæ MÉu Lôc, V©n Méng Tö<color>. Ta nghe nãi ë <color=Red>TÇn L¨ng<color> cã rÊt nhiÒu ngäc quı, ng­¬i cã muèn gióp ta ®i t×m kh«ng?", 2, "Vinh h¹nh lµm viÖc cho c«ng chóa /L30_get_yes", "Thuéc h¹ vÉn cßn mét chuyÖn kh¸c. /L30_get_no")
		elseif(UTask_tr == 30*256+20) and (HaveItem(59) == 1) and (HaveItem(60) == 1) and (HaveItem(61) == 1) and (HaveItem(62) == 1) then
			L30_prise()
		elseif(UTask_tr > 30*256) and (UTask_tr < 40*256) then					--ÒÑ¾­½Óµ½30¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Ng­¬i cã thÓ nhê <color=Red>¤ §µn Chñ<color> ®­a ®Õn <color=Red>TÇn L¨ng<color>, h·y nhí bèn lo¹i ®¸ quı mµ ta cÇn <color=Red>C¸p HuyÕt Hång<color>, <color=Red>B¨ng Tinh Lam<color>, <color=Red>Tæ MÉu Lôc<color>, <color=Red>V©n Méng Tö<color>.")
		else					--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Phô v­¬ng cÇn ta gióp ng­êi thu phôc Vâ l©m Trung Nguyªn, nÕu Thiªn NhÉn gi¸o kh«ng ®­îc sù ñng hé tõ Phô v­¬ng ta, th× kh«ng thÓ ph¸t triÓn nh­ thÕ nµy.")
		end
	elseif(Uworld127 == 10) and (HaveItem(374) == 1) then
		Talk(15,"Uworld127_killer","Cung kİnh ThÊt c«ng chóa ®iÖn h¹.","Ng­êi kia tõ ®©u ®Õn, t¹i sao ®Õn ®©y? Ng­¬i muèn chÕt sao?","T¹i h¹ kh«ng d¸m ®em tİnh m¹ng m×nh ra ®ïa.","A! Ng­¬i to gan thËt. Ng­êi ®©u! KĞo h¾n ra cho chã ¨n.","Nghe nãi c«ng chóa ®ang t×m kiÕm mét con ®¹i ®iªu?","õm….Ng­¬i biÕt ë ®©u cã sao?","Tuy t¹i h¹ kh«ng biÕt, nh­ng chØ cÇn ngµi ®¸p øng mét ®iÒu kiÖn, ta sÏ cã ngay con ®ã!","õm….L¹i mét tªn chØ biÕt nãi su«ng.","Binh m· §¹i Kim hïng hËu, sao kh«ng sî chÕt ®­îc? Lµm sao ta d¸m lõa ThÊt c«ng chóa?","…..Ng­¬i cÇn ®iÒu kiÖn g×?","Cho ®Õn lóc ta quay l¹i, kh«ng ®­îc giÕt ng­êi nµo trong phñ.","ThËt buån cuêi, nÕu mét n¨m sau ng­¬i vÉn ch­a quay l¹i th× sao?","§¶m b¶o ta sÏ quay l¹i trong mét th¸ng.","§­îc! Qu©n tö nhÊt ng«n. Sau mét th¸ng nÕu kh«ng gÆp ng­¬i, bän chóng sÏ chÕt hÕt!","SÏ kh«ng cã ngµy ®ã ®©u.")
	elseif(Uworld127 == 10) then
		Talk(1,"","Kh«ng cã lÖnh bµi mµ ng­¬i d¸m vµo phñ c«ng chóa ­? Qu¶ lµ gan d¹. Tha cho ng­¬i kh«ng cã ¸c ı, mau ra khái ®©y. LÇn sau ®õng cã tr¸ch.")
	elseif(Uworld127 == 20) and (HaveItem(374) == 0) then
		Talk(1,"","Tªn tiÓu tö nµy, mau cót ®i! Ch¹y cho nhanh nÕu kh«ng ta c¾t ch©n ng­¬i b©y giê!")
	elseif(Uworld127 == 30)and(HaveItem(369) == 1) then
		DelItem(369)
		Talk(6,"Uworld127_over","TuyÕt Y c«ng chóa, ®©y lµ con §¹i ®iªu ngµi cÇn.","Tèt tèt! Ng­¬i qu¶ thËt kh«ng tÖ!","Nh­ng vÉn cã nh÷ng ng­êi kh«ng biÕt g× ®ßi lÊy ®Çu ta.","§õng tİnh to¸n víi bän Êy lµm g×, sau nµy ng­¬i chØ cÇn theo ta lµ ®­îc.","Xin thø lçi, t¹i h¹ lang thang giang hå quen råi. Kh«ng muèn theo ai c¶.",".....D¸m nãi thÕ tr­íc mÆt ta, tr­íc giê chØ cã m×nh ng­¬i.")
	elseif(Uworld127 == 30) then
		Talk(1,"","con §¹i ®iªu ®©u? LÊy ®­îc råi mau ®­a ra chø!")
	elseif(Uworld127 == 255) then
		if(GetSex() == 0) then
			Talk(1,"","H¶o tû tû, lÇn sau h·y ®Õn ch¬i víi TuyÕt Y.")
		else
			Talk(1,"","H¶o huynh, lÇn sau h·y ®Õn ch¬i víi TuyÕt Y.")
		end
	elseif(UTask_tr >= 70) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Ng­¬i thËt lµ nh©n tµi hiÕm cã, hy väng chóng ta sÏ lµ huynh ®Ö chø kh«ng ph¶i kÎ thï, cã c¬ héi ta sÏ tiÕn cö ng­¬i víi Phô v­¬ng, phôc vô cho §¹i Kim ta, cho tªn hoµng ®Õ Nam triÒu kia ph¶i ®Òn m¹ng chø?")
	else
		Talk(1,"","Gi¸o chñ Thiªn NhÉn gi¸o lµ quèc s­ §¹i Kim ta, Phô v­¬ng rÊt quı träng «ng ta, v× thÕ cho ta gia nhËp bæn gi¸o lµm §­êng chñ nh­ b©y giê.")
	end
end;

function L30_get_yes()
	Talk(1,"","Phong §­êng §­êng chñ Tèt qu¸, nh­ng nghe nãi ®­êng ®Õn TÇn L¨ng rÊt nguy hiÓm, nhiÒu ng­êi ®i t×m ch©u b¸u ph¶i bá m¹ng, ng­¬i cã thÓ ®Õn BiÖn Kinh ®i xa phu, nh­ng <color=Red>¤ §µn Chñ<color> th«ng th¹o khu vùc T©y B¾c, ng­¬i cã thÓ nhê h¾n ®­a ng­¬i ®i.")
	SetTask(4, 30*256+20)
	AddNote("T¹i tÇng hÇm thø 3 cña Thiªn NhÉn gi¸o gÆp Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y (213, 201) , nhËn <color=red>nhiÖm vô B¶o Th¹ch<color>. §i TÇn L¨ng t×m 4 lo¹i ®¸ quı. ")
	Msg2Player("T¹i tÇng hÇm thø 3 cña Thiªn NhÉn gi¸o gÆp Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y (213, 201) , nhËn <color=red>nhiÖm vô B¶o Th¹ch<color>. §i TÇn L¨ng t×m 4 lo¹i ®¸ quı. ")
end;

function L30_get_no()
	Talk(1,"","..........… ")
end;

function L30_prise()
	Talk(1,"","Ng­¬i thËt tµi, lo¹i ®¸ quı thÕ nµy mµ còng t×m ®­îc! MÉu hËu h¼n sÏ rÊt thİch chiÕc ¸o ngäc!")
	SetRank(58)
	DelItem(59)
	DelItem(60)
	DelItem(61)
	DelItem(62)
	SetTask(4, 40*256)
--	AddMagic(141)
--	AddMagic(138)
--	AddMagic(140)
	add_tr(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("§­a bèn lo¹i ®¸ quı cho Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y, hoµn thµnh nhiÖm vô B¶o Th¹ch. §­îc phong: U Minh Tö SÜ. Häc ®­îc vâ c«ng: LiÖt Háa T×nh Thiªn, Th«i s¬n §iÒn H¶i, Phi Hång V« Tİch. ")
	AddNote("Quay l¹i Thiªn NhÉn gi¸o, ®­a bèn lo¹i ®¸ quı cho Phong §­êng §­êng chñ Hoµn Nhan TuyÕt Y, hoµn thµnh nhiÖm vô B¶o Th¹ch. Trë thµnh U Minh Tö SÜ. ")
end;

function Uworld127_killer()
	DelItem(374)
	SetTask(127,20)
	AddNote("NhËn nhiÖm vô: §Õn KiÕm c¸c b¾t §¹i ®iªu ")
	Msg2Player("NhËn nhiÖm vô: §Õn KiÕm c¸c b¾t §¹i ®iªu ")
end

function Uworld127_over()
	if (GetTask(4) >= 70*256) and (GetTask(4) ~= 75*256) then		-- ÊÇÌìÈÌ³öÊ¦µÜ×Ó
		Talk(2,"","Hßm s¸ch mËt cña Thiªn NhÉn ta giao cho ng­¬i, nÕu tõ chèi ta sÏ giÕt ng­¬i, quyÕt kh«ng nuèt lêi.","§· nh­ vËy, t¹i h¹ kh«ng thÓ kh«ng nhËn lêi.")
		if (HaveMagic(361) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
      	AddMagic(361,1)
		end
		if (HaveMagic(362) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
   	   AddMagic(362,1)
		end
		if (HaveMagic(391) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
	      AddMagic(391)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("§­a §¹i ®iªu cho Hoµn Nhan TuyÕt Y, häc ®­îc kü n¨ng V©n Long Kİch, Thiªn Ngo¹i L­u Tinh, NhiÕp Hån Lo¹n T©m. Quay l¹i b¸o tin cho L­u l·o gia. ")
		SetTask(127,110)
	else
		Talk(1,"","§­îc!lÇn sau nhí ®Õn th¨m TuyÕt Y!")
		SetTask(127,100)
		Msg2Player("§­a §¹i ®iªu cho Hoµn Nhan TuyÕt Y, quay l¹i b¸o tin cho L­u l·o gia ")
	end
end
