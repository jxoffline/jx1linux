-- ÄÏÔÀÕò¡¡Â·ÈË¡¡Åí´óÒ¯ (Ãû¾Ô±¼»ğÈÎÎñ)
-- 2004/4/17 Ãû¾Ô±¼»ğÈÎÎñ by fangjieying

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld76 = GetTask(76)
--	if (GetLevel() >= 60) and (Uworld76 == 0) then       -- ·ûºÏÈÎÎñÌõ¼ş
--		Talk (8,"","Íæ¼Ò£ºÀÏ´óÒ¯£¬ÄúµÄ²èÒûÏÂÒ»¿Ú±ãÂú×ìÉú½ò£¬À§·¦È«ÎŞ°¡¡£","Åí´óÒ¯£º²»Â÷ÄúËµ£¬Ğ¡ÀÏ¶ù¼¸Ê®ÄêµÄ¹¦·ò£¬¶¼»¨ÔÚÕâÉÏÃæÁË¡£","Íæ¼Ò£ºÔÚÏÂ¾­Äê±¼²¨£¬³£ÊÜÈÕ¶¾Ö®º¦£¬ÈôÄÜÌìÌìºÈµ½ÄúµÄÁ¹²è£¬ÄÇÕæÊÇÒ»´ó¿ì»î¡£","Åí´óÒ¯£ºÄª·ÇÄãÊÇ½­ºşÖĞÈË£¿","Íæ¼Ò£º²»´í£¬ÀÏ´óÒ¯ÕæÊÇÄ¿¹âÈç¾æ¡£","Åí´óÒ¯£º°¥Ñ½£¡Ì«ºÃÁË¡£Ğ¡ĞÖµÜ£¬ÎÒ¼ûÄãÓ¢Æø±ÆÈË£¬ÓÖÊÇ½­ºşÅóÓÑ¡£Ğ¡ÀÏ¶ùÕâÓĞÒ»¼şÊÂÏëÇëÄã°ïÃ¦£¬ÈôÄÜ³ÉÔòÄãÄÇÈÕĞĞÖ®¿àÒ²×Ô¿É½â¡£","Íæ¼Ò£º´óÒ¯ÄúÇĞÄªÕÛÉ·Ğ¡×Ó£¬ÓĞÊÂ¾¡¹ÜËµ¡£","Åí´óÒ¯£ºĞ¡ĞÖµÜ¿´ÎÒÉí±ßÕâÆ¥Âí¡£")
--		SetTask(76,10)
--		Msg2Player("Ì½²éÅí´óÒ¯Éí±ßµÄÂí")
	if (Uworld76 == 10) then
		Talk (1,"","«ng h·y xem con ngùa bªn c¹nh ta nµy. ")
	elseif (Uworld76 == 20) then
		SetTask(76,25)
		Talk (3,"W76_get","Mµu l«ng thuÇn khiÕt, kú liÖt nh­ ho¶, bèn vã kháe m¹nh, ch¹y nhanh nh­ bay. §©y lµ con ngùa tuyÖt vêi. ","Ng­¬i thËt lµ cã m¾t nh×n, con B«n Háa nµy lµ cña mét tiÓu l·o ®Ö. Sau khi «ng Êy qua ®êi th× do ta thay thÕ ch¨m sãc. ChØ tiÕc lµ c¸ch ®©y kh«ng l©u, Ho¶ Nhi m¾c bÖnh nªn ngµy cµng yÕu, cÇn ph¶i nhanh chãng trŞ liÖu. ","¤i. §¸ng tiÕc t¹i h¹ kh«ng ph¶i lµ thÇy thuèc, kh«ng ®ñ søc gi¶i quyÕt. ")
	elseif (Uworld76 == 25) then				-- ÖĞ¶ÏºóÖØ½ÓÈÎÎñµÄ´¦Àí
		Talk(1,"W76_get","ThÕ nµß? §ång ı gióp l·o kh«ng?")
	elseif (Uworld76 == 60) then
		Talk(1,"W76_prise","Qu¶ nhiªn ®· ch÷a lµnh, kh«ng biÕt ta ph¶i t¹ ¬n ng­¬ithÕ nµo ®©y!")
	elseif (Uworld76 == 30) then				-- ÈÎÎñ½øĞĞÖĞ
		if (HaveItem(393) == 0) then         -- ÊéĞÅ¶ªÊ§´¦Àí
			Talk (1,"","Kh«ng ngê tiÓu huynh ®Ö l¹i bÊt cÈn thÕ, th«i ®­îc råi ®Ó ta viÕt l¹i bøc th­ vËy. ")
			AddEventItem(393)			-- Í¨ÓÃÊéĞÅ
		else
			Talk (1,"","TiÓu huynh ®Ö, bÖnh cña B«n Ho¶ kh«ng thÓ ®îi l©u ®­îc n÷a ph¶i nhanh lªn th«i ")
		end
	elseif (Uworld76 == 70) then			-- ÈÎÎñÒÑ¾­Íê³É
		Talk(1,"","Tuy B«n Ho¶ kh«ng biÕt nãi nh­ng ta nh×n thÊy nã rÊt nhí ng­¬i")
	else
		Talk(1,"","B¹n rÎ! Kh«ng cã viÖc g× th× nªn häc mét chót nghÒ nghiÖp, kh«ng nªn c¶ ngµy v¸c kiÕm chĞm chĞm giÕt giÕt. ")
	end
end

function W76_get()
	Say("Kh«ng cÇn tiÓu huynh ®Ö ra tay. L·o H¸n cã quen mét ng­êi, y thuËt tinh th«ng, chØ bã tay víi nh÷ng chøng bÖnh qu¸ nghiªm träng, l¹i kh«ng t×m ®­îc ng­êi ®¸ng tin cËy. Mong ng­¬icã thÓ gióp l·o mét tay!",2,"Kh«ng cã vÊn ®Ò g×, nhÊt ®Şnh sÏ lµm ®­îc /W76_get_yes","H«m nay ta cã viÖc, hay lµ ®Ó lÇn sau /no")
end

function W76_get_yes()                                        -- ÈÎÎñÆô¶¯
	Talk(2,"","§­îc! Ta cã bøc th­ nµy, n¨m x­a ng­êi ®ã ®· chŞu ©n ®øc cña l·o, ng­¬i h·y giao cho ng­êi ®ã, «ng ta nhÊt ®Şnh sÏ ®Õn. Sau khi trŞ xong cho B«n Háa, ta sÏ xin «ng ta d¹y cho ng­¬i thuËt 'Håi ThÓ §Ò Tinh'","D­îc V­¬ng Cèc? B¶ §¹o Nh©n? Ha ha! TiÓu tö vµ «ng ta còng cã duyªn ®Êy! LÇn nµy nhÊt ®Şnh sÏ ®­îc, nÕu kh«ng sÏ kh«ng cßn mÆt mòi ®Ó gÆp «ng.")
	SetTask(76,30)
	AddEventItem(393)			-- Í¨ÓÃÊéĞÅ
	Msg2Player("NhËn ®­îc mét bøc th­ chç Bµnh §¹i Gia, ®i ®Õn D­îc V­¬ng Cèc cøu sèng con ngùa quı B«n Ho¶ ")
	AddNote("NhËn ®­îc mét bøc th­ chç Bµnh §¹i Gia, ®i ®Õn D­îc V­¬ng Cèc cøu sèng con ngùa quı B«n Ho¶ ")
end

function W76_prise()
	Talk(1,"","Bµnh §¹i Gia kh«ng cÇn kh¸ch khİ, ta còng nhê ®ã mµ häc ®­îc İt nhiÒu b¶n lÜnh, còng ®­îc lîi phÇn nµo")
	SetTask(76,70)
	add_repute = ReturnRepute(40,70,3)			-- ÉùÍû½±Àø£º×î´ó40µã£¬´Ó70¼¶ÆğÃ¿¼¶µİ¼õ3%
	AddRepute(add_repute)
	Msg2Player("NhiÖm vô hoµn thµnh, danh väng cña b¹n ®­îc t¨ng lªn "..add_repute.."®iÓm.")
	AddNote("Ch÷a khái bÖnh cho con ngùa B«n Ho¶, hoµn thµnh nhiÖm vô ")
end

function no()
end
