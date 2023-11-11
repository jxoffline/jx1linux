--description: Îäµ±ÅÉÈóÄï¡¡Îäµ±40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(13) == 1 then
		allbrother_0801_FindNpcTaskDialog(13)
		return 0;
	end
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+40) and (HaveItem(163) == 1) then		-- ÒÑ¾­´ò°ÜÀÏ»¢
		Talk(2, "L40_step", "å! Vâ c«ng cña Vâ §ang ph¸i qu¶ nhiªn qu¶ nhiªn bÊt phµm! Ngay c¶ nh÷ng ®Ö tö cao thñ cña ta còng ®Òu bŞ h¾n ®¸nh b¹i. §¹o NhÊt l·o nhi lµ g× cña ng­¬i?", " §¹o NhÊt Ch©n Nh©n lµ t«n s­ cña t¹i h¹, «ng Êy sai t«i giao bøc th­ nµy ®Õn cho ng­êi!")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,""," §· nh×n thÊy 5 con B¹ch Hæ ch­a? Cã b¶n lÜnh th× h·y ®¸nh b¹i chóng tr­íc ®· råi míi ®Õn nãi chuyÖn víi ta! ")
		AddNote("T¹i ®éng Kª Qu¸n ë Phôc Ng­u s¬n, t×m NhuËn N­¬ng. Ph¶i ®¸nh b¹i n¨m con B¹ch Ngäc Hæ ")
		Msg2Player("T¹i ®éng Kª Qu¸n ë Phôc Ng­u s¬n, t×m NhuËn N­¬ng. Ph¶i ®¸nh b¹i n¨m con B¹ch Ngäc Hæ ")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 0) then						--ÒÑ¾­´ò°ÜÎå»¢£¬ÉĞÎ´ÄÃµ½»ØĞÅ
		Talk(1,"","Th­ håi ©m cña ta ®· ®Ó trong hang ®éng nµy, ng­¬i cã b¶n lÜnh th× h·y vµo ®ã mµ lÊy!")
	elseif (UTask_wd >= 40*256+60) then						--ÄÃµ½»ØĞÅºó
		Talk(1,"","Th× ra h¾n còng biÕt xin lçi ta! Sím h¬n mét chót cã ph¶i hay h¬n kh«ng!")
	else
		Talk(1,"","Ng­¬i lµ ai? D¸m x«ng vµo trong ®éng nµy, thËt kh«ng biÕt sèng chÕt lµ g×!")
	end
end;

function L40_step()
	Talk(1,"","§¹o NhÊt thËt biÕt d¹y ®Ö tö! Th­ ®©u! §­a ta xem! Th× ra lµ h¾n xin lçi ta! Sím biÕt nh­ biÕt nh­ vËy, hµ tÊt khi x­a! Ng­¬i lµ ®Ö tö cña «ng ta th× ta còng kh«ng lµm khã ng­¬i. Ta còng cã mét phong th­ muèn nhê ng­¬i mang vÒ cho «ng Êy. Th­ ")
	DelItem(163)
	SetTask(5, 40*256+60)
	AddNote("Sau khi ®¸nh b¹i n¨m con B¹ch Ngäc Hæ. Míi biÕt lµ th­ håi ©m ®· bŞ NhuËn N­¬ng giÊu trong ®éng ")
	Msg2Player("Th­ håi ©m ®· bŞ NhuËn N­¬ng giÊu trong ®éng, t×m nã vÒ giao cho ch­ëng m«n ")
end;
