-- ÁÙ°² Â·ÈËNPC ÕÅ¿££¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(3) == 1 then
		allbrother_0801_FindNpcTaskDialog(3)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld75 = GetTask(75)
	U75_sub5 = GetTask(56)
	if (UTask_gb == 50*256+20) and (HaveItem(139) == 0) then		--´ø×Å50¼¶ÈÎÎñ
		Talk(5,"L50_Step1","Tr­¬ng ®¹i nh©n! Chóng ta l¹i gÆp nhau","LÇn tr­íc may nhê cã quı bang hiÖp nghÜa gióp ®ì! Kh«ng biÕt lÇn nµy t¹i h¹ cã thÓ gióp ®­îc g×?","Bang chñ ph¸i ta mang bøc ®Şa ®å cña Trung Nguyªn giao ®Õn cho Hoµng Th­îng. Nh­ng kh«ng cã lÖnh bµi nªn kh«ng thÓ vµo ®­îc Hoµng cung","VËy kh«ng lo! ë ®©y ta cã lÖnh bµi. Xin cø cÇm lÊy mµ dïng","§a t¹ Tr­¬ng ®¹i nh©n!")
	elseif (UTask_gb == 50*256+30) then
		Talk(5,"L50_Step2","Tr­¬ng ®¹i nh©n! §©y lµ lÖnh bµi th«ng hµnh! Xin göi l¹i cho ngµi!","Sao råi! §· gÆp ®­îc Hoµng th­îng ch­a?","Hoµng th­îng th× ch­a gÆp. Nh­ng mµ cã gÆp mét vŞ lµ Tµo c«ng c«ng, «ng ta lµ ng­êi th©n tİn cña Hoµng th­îng. Ta ®· giao cho «ng Êy!","Ai da! §¹i sù kh«ng thµnh råi! Ng­¬i cßn cã ®iÒu ch­a biÕt, g· Tµo c«ng c«ng nµy vèn cã quan hÖ mËt thiÕt víi bän Kim quèc. Hoµng th­îng ®· kh«ng cßn tin dïng «ng ta n÷a. B©y giê ®Şa ®å l¹i r¬i vµo tay «ng ta. E r»ng sÏ l¹i s¾p cã ®¹i häa","ThËt kh«ng ngê! §· vµo ®Õn hoµng cung råi vËy mµ l¹i cßn bŞ lõa! Tr­¬ng ®¹i nh©n ®õng lo! Ta sÏ ®i ®o¹t l¹i bøc ®Şa ®å ®ã!")
	elseif (UTask_gb == 50*256+50) then		--´Ë´¦²»ÔÙ¼ì²âÁ½ÑùÎïÆ·ÊÇ·ñ´æÔÚ£¬¸öÈË¾õµÃ²»ÊÇºÜÓĞÒâÒå£¬¶øÇÒÒ²Ê¡ÁË²»ÉÙ¹¤×÷Á¿
		Talk(3,"L50_Step3","Ta ®· ®o¹t l¹i bøc ®Şa ®å nµy. LÇn nµy xin giao l¹i cho Tr­¬ng ®¹i nh©n! Khi nµo Hoµng th­îng l©m triÒu xin h·y giao tËn tay cho Hoµng Th­îng","Còng ®­îc. LÇn nµy ta sÏ v× sù thŞnh trŞ cña triÒu ®×nh mµ hµnh ®éng","Lµ ng­êi Tèng Quèc,cÇn ph¶i nh­ vËy! T¹i h¹ c¸o tõ! ")
	elseif (UTask_gb >= 50*256+20) and (UTask_gb < 50*256+40) and (HaveItem(139) == 0) then
		AddEventItem(139)
		Msg2Player("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
		Talk(1,"","LÖnh bµi th«ng hµnh bŞ mÊt råi? Kh«ng sao! Ta vÉn cßn mét c¸i. ")
	elseif (Uworld75 == 10) and (U75_sub5 < 10) then		-- È­ÇãÌìÏÂÈÎÎñÖĞ£¬½ÓÈ¡×ÓÈÎÎñ
		if (HaveItem(384) == 1) then
			SetTask(56,10)
			AddNote("NhËn nhiÖm vô tiÕp theo: Gióp Tr­¬ng TuÊn t×m 5 miÕng Ng©n L­îng kho¸ng ")
			Msg2Player("NhËn nhiÖm vô tiÕp theo: Gióp Tr­¬ng TuÊn t×m 5 miÕng Ng©n L­îng kho¸ng ")
			Talk(1,"","Ta còng kh«ng muèn lµm khã ng­¬i. §óng lóc ta còng ®ang ®Şnh chÕ t¹o mét chiÕc ¸o gi¸p míi. Ng­¬i h·y ®i t×m gióp ta 5 miÕng L­îng Ng©n Kho¸ng")
		else
		 	Talk(1,"","§Õn c¶ mét bøc th­ tİn còng kh«ng cã,chØ lµ nãi miÖng.Ta lµm sao cã thÓ tin ng­¬i?")
		end
	elseif (Uworld75 == 10) and (U75_sub5 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅĞ¶Ï
		if (GetItemCount(118) >= 5) then
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			SetTask(56,20)
			AddNote("T×m ®­îc 5 miÕng Ng©n L­îng kho¸ng: §· hoµn thµnh nhiÖm vô ")
			Msg2Player("T×m ®­îc 5 miÕng Ng©n L­îng kho¸ng: §· hoµn thµnh nhiÖm vô ")
			Talk(1,"","TiÓu b»ng h÷u lµm viÖc thËt cã n¨ng lùc. TiÒn ®å sÏ réng më ")
		else
			Talk(1,"","H×nh nh­ kho¸ng th¹ch vÉn cßn thiÕu! Cè lªn! Cè lªn!")
		end
	else
		Talk(1,"","ThËt hiÕm cã ®­îc c¬ héi ®Ó thÓ hiÖn hÕt søc m×nh nh­ vËy, nh­ng mµ còng c¶m thÊy g©n cèt r· rêi!Çy!")
	end
end;

function L50_Step1()
	AddEventItem(139)
	AddNote("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
	Msg2Player("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
end

function L50_Step2()
	DelItem(139)
	SetTask(8,50*256+40)
	AddNote("LËp tøc ®i lÊy l¹i bøc ®Şa ®å Trung Nguyªn ")
	Msg2Player("LËp tøc ®i lÊy l¹i bøc ®Şa ®å Trung Nguyªn ")
end

function L50_Step3()
	SetTask(8,50*256+60)
	DelItem(199)
	AddNote("§· giao bøc ®Şa ®å Trung Nguyªn ®ã cho Tr­¬ng TuÊn råi! ")
	Msg2Player("§· giao bøc ®Şa ®å Trung Nguyªn ®ã cho Tr­¬ng TuÊn råi! ")
end
