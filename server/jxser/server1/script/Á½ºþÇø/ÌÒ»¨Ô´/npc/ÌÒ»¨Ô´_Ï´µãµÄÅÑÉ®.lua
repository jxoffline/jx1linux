--Ï´¼¼ÄÜµãµÄÅÑÉ®
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2004-02-04) Ï´µãĞŞ¸ÄÎª¿ÉÒÔÏ´255´Î
-- Update: Dan_Deng(2004-05-27) Ğ¡¶ùÊ§×ÙÈÎÎñ (Uworld42 = GetTask(42))
-- ÁÙÊ±±äÁ¿Éè¶¨: ³õ´Î¼¼ÄÜ(1),³õ´ÎË®¾§(257),¶à´ÎË®¾§(10),Ãâ·Ñ(1024)
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")


function main()
--	Uworld137 = GetTask(137)
--	UTask_world13 = GetTask(13)
	Uworld42 = GetTask(42)
	tbTrainSkill150:ResetDailyTask()
--	SetTaskTemp(1,0)		-- ¸´Î»£¬±ÜÃâÈÎºÎ¸ÉÈÅ
	if (Uworld42 == 40) then					-- Ğ¡¶ùÊ§×ÙÈÎÎñ
		Talk(12,"","V« danh ®¹i s­! Ta ®Õn t×m ®øa bĞ mÊt tİch ë §¹i Lı, B¶ §¹o Nh©n giíi thiÖu ta ®Õn! ","A di ®µ phËt! L·o T¹p Mao nµy lµ ng­êi trong s¹ch. Kh«ng biÕt! Kh«ng biÕt. ","Mong ®¹i s­ tõ bi bá qua, nãi cho t¹i h¹ biÕt!","N¨m x­a l·o n¹p bŞ trôc xuÊt khái s­ m«n,Ph­¬ng Tr­îng Hµ t¨ng cã tõ bi kh«ng","Kh«ng biÕt ®¹i sù bŞ trôc xuÊt v× lı do g×? ","ThËt kú l¹! Ng­¬i hái nhiÒu lµm gi?Ha! Ha! L·o n¹p kh«ng nh÷ng nãi cho ng­¬i biÕt lı do trôc xuÊt, mµ cßn sÏ tiÕt lé vÒ chuyÖn mÊt tİch cña ®øa bĞ ","Ha! Ha! Th× ra hßa th­îng ®· ph¹m giíi","Nãi nhá th«i! A di ®µ phËt! ThiÖn tai thiÖn tai!","R­îu thŞt ®· nÕm qua, t©m kh«ng h­íng PhËt tæ n÷a. Tham mét chót kh«ng ph¶i lµ c¸i sai qu¸ lín. ","Ha! Ha! Tèt! Ng­¬i hîp víi ta ®Êy! Ta nãi cho ng­¬i biÕt! Kú thùc ®øa bĞ ¨n c¾p ®ã kh«ng ph¶i lµ ng­êi xÊu g×, ch¼ng qua nã muèn lµm mét viÖc rÊt quan träng, chØ m­în mét chót sau ®ã sÏ tr¶!","§¹i s­! M­êi m¹ng ng­êi kh«ng ph¶i lµ ®å vËt, nãi m­în lµ sao?","§­îc! Ng­¬i ®i t×m mét ng­êi tªn lµ Long Truy Vò. N¨m x­a h¾n, ta, Ph¶ T¹p Mao, th»ng bĞ ¨n c¾p hîp l¹i thµnh 'Vâ L©m Tø Kú'. ChØ cã h¾n míi biÕt ng­êi kia hiÖn thêi ë ®©u")
		SetTask(42,50)
		AddNote("NhiÖm vô ®øa bĞ mÊt tİch: §i t×m Long Truy vò hái tin tøc vÒ ®øa bĞ mÊt tİch. ")
		Msg2Player("NhiÖm vô ®øa bĞ mÊt tİch: §i t×m Long Truy vò hái tin tøc vÒ ®øa bĞ mÊt tİch. ")
--	elseif (GetLevel() >= 50) then				-- and (GetCamp() == 4) then		-- ÔÊĞíÏ´µã£¨²»ÔÙÏŞÖÆºìÃûÏ´µã£©
--		if (Uworld137 > 20) and (Uworld137 <= 30) then			-- 2004-06-11¼¼ÄÜ¸üĞÂ¸øÒ»´ÎÃâ·ÑÏ´µã£¨²»°üÀ¨°×Ãû£©
--			Say("ÊÍÃ÷£º¿´ÔÚÄãÒ²ÊÇÀÏ½­ºşµÄ·İÉÏ£¬Ã»ÓĞË®¾§ÎÒÒ²¸øÄãÖØÉè¼¼ÄÜ1´Î£¬Òª²»Òª°ÑÎÕÕâ¸ö»ú»á£¿",2,"ºÃ£¬ÎÒÒªÖØÉè¼¼ÄÜ/rollback_0611","ÎÒ»¹ÊÇ³ÙµãÔÙÀ´°É/no")
--		elseif (UTask_world13 == 0) then				-- Î´Ï´¹ıµã£¨ÔÊĞíÓÃ¼¼ÄÜ»ò±¦Ê¯Ï´£©
--			Talk(1,"rollback_get","ÊÍÃ÷£º½ÓÊÜ<color=red>Ò×½îÏ´Ëè<color>¶ÔÄãµÄ¸ù¹Ç»áÔì³ÉÒ»¶¨µÄËğÉË£¬ÄãÈÔÈ»ÏëÒªÎÒÌæÄãÏ´Ëè£¿")
--		elseif (UTask_world13 == 511) then		-- Ï´µãÒÑ´ïÉÏÏŞ£¬²»¿ÉÔÙ×÷ÈÎºÎÏ´µã²Ù×÷
--			Talk(1,"","ÊÍÃ÷£ºÄãÏ´ËèµÄ´ÎÊıÊµÔÚÌ«¶à£¬²»¿ÉÔÙ×öÁË¡£Èç¹û»¹ÒªÇ¿ĞĞÔÙÏ´ËèµÄ»°£¬¿ÖÅÂ»á¾­Âö¾¡¶Ï£¬³ÉÎª·ÏÈË£¡")
--		elseif (UTask_world13 == 255) then	-- Ï´µãÒÑ´ïÉÏÏŞ£¬µ«ÉĞÎ´ÓÃ±¦Ê¯»»»Ø¼¼ÄÜµã
--			Say("ÊÍÃ÷£ºÄãÏ´ËèµÄ´ÎÊıÊµÔÚÌ«¶à£¬²»¿ÉÔÙ×öÁË¡£ÁíÍâÄãÈç¹ûÄÜÕÒµ½Èı¿Å¾ÛÌìµØÍòÎïÖ®ÔªÆøË®¾§µÄ»°£¬»¹ÄÜÀûÓÃËüĞŞ²¹Ò»ÏÂÄãÔÚµÚÒ»´ÎÏ´ËèÊ±ÊÜËğµÄ¾­Âö¡£",2,"ÎÒÒÑ¾­´øÁËÈı¿ÅË®¾§À´ÁË/found_jewel_yes","ÄÇ¾ÍËãÁË/no")
--		elseif (UTask_world13 >= 257) and (UTask_world13 < 511) then		-- ¶à´ÎÏ´µã£¨ÎŞ±¦Ê¯»»»Ø¼¼ÄÜ¹¦ÄÜ£©
--			Say("ÊÍÃ÷£º»¹ÏëÏ´ËèµÄ»°£¬³ıÁËÊ®ÍòÁ½Òø×Ó»¹±ØĞëÒªÓĞË®¾§»¤×¡ÄãµÄĞÄÂö£¬·ñÔòÒÔÄãÄÇÒÑÓĞËğÉËµÄ¾­ÂöÊµÔÚÌ«¹ıĞ×ÏÕ¡£",2,"Öî°ãÊÂÎïÒÑ×¼±¸Í×µ±/NEWpay_yes","ÄÇ¾ÍËãÁË/rollback_no")
--		elseif (UTask_world13 >= 1) and (UTask_world13 < 256) then		-- ¶à´ÎÏ´µã£¨²¢ÇÒ¿ÉÓÃ±¦Ê¯»»»Ø¼¼ÄÜµã£©
--			Say("ÊÍÃ÷£º»¹ÏëÏ´ËèµÄ»°£¬³ıÁËÊ®ÍòÁ½Òø×Ó»¹±ØĞëÒªÓĞË®¾§»¤×¡ÄãµÄĞÄÂö£¬·ñÔòÒÔÄãÄÇÒÑÓĞËğÉËµÄ¾­ÂöÊµÔÚÌ«¹ıĞ×ÏÕ¡£ÁíÍâ£¬Èç¹ûÄãÓĞÁËÈı¿ÅË®¾§£¬×îºÃ»¹ÊÇÏÈ°ÑÒ»´ÎÏ´ËèÊ±¾­ÂöÖĞÁôÏÂµÄËğÉËÏÈ¸øĞŞ²¹ÁË£¬³¤Ôò²»Àû¡£",3,"Çë°ïÎÒĞŞ²¹ÉÏ´ÎÊÜËğµÄ¾­Âö/found_jewel_yes","ÎÒÏëÏÈÔÙÏ´Ò»´ÎËè/NEWpay_yes","ÄÇ¾ÍËãÁË/rollback_no")
--		else
--			Talk(1,"","¿ª·¢Õß£ºÏ´µã×´Ì¬³öÏÖÁË´íÎó£¬ÇëÓëÓÎÏ·¹ÜÀíÔ±(GM)ÁªÏµ¡£")
--		end
	else		
		-- È±Ê¡¶Ô»°£¨½âÊÍÏ´µã¸Ä±ä£©
		local szTitle = "B©y giê ng­êi chØ cÇn t×m mét ng­êi Xa phu nµo ®ã, ®Òu cã thÓ ®­a ng­¬i ®i 'TÈy Tñy ®¶o', bÇn t¨ng gióp ng­¬i tÈy tñy!"
		szTitle = szTitle .. "Cã ®iÒu ta cã thÓ ®­a c¸c ng­¬i ®i <color=yellow> Vo Danh MËt C¶nh <color>, t¹i ®ã cã thÓ sö dông kinh nghiÖm ®Ó ®æi lÊy ®é tu luyÖn cña kü n¨ng."
		
		local tbOpt = {}
		--- Thªm Nép vËt phÈm t¨ng ®é tu luyªn skill 150 -- Modified By NgaVN - 20121207
		tinsert(tbOpt, {"Nép vËt phÈm Tu ch©n yÕu quyÕt", tbTrainSkill150.LoadItem, {tbTrainSkill150}})
		-- ½øÈ¥Ö®Ç°ĞèÒªÅĞ¶Ï ÊÇ·ñ¾ßÓĞ150¼¶¼¼ÄÜ£¬·ñÔò²»ËÍ
		
		-- Më tİnh n¨ng ®­a ta ®i V« Danh MËt C¶nh - - Modified By NgaVN - 20121207
		tinsert(tbOpt, {"§­a ta ®i V« Danh MËt C¶nh", toWumingmijin})	
		tinsert(tbOpt, {"§Ó ta suy nghÜ l¹i", no})
		
		CreateNewSayEx(szTitle, tbOpt)
		
				
--		i = random(0,2)
--		if (i == 0) then
--			Talk(1,"","ÊÍÃ÷£º×Ô´ÓÓĞÁË¸üºÃµÄÏ´ËèÈ¥´¦£¬ÎÒÕâÀïÁ¢¿Ì¾Í±äµÃÃÅ¿ÉÂŞÈ¸ÁË¡£")
----			Talk(1,"","ÊÍÃ÷£ºÒ×½îÏ´ËèµÄ¹¦·ò³ö×ÔÒ×½î¾­£¬µ«ÊÇÏëĞŞÁ¶ÕâÃÅ¹¦·òµÄÈË×ÔÉíÈ´±ØĞëÉ¢¾¡È«Éí¹¦Á¦£¬ÍêÈ«ÊÇÎªÈË×÷¼Ş¡£¿ÉºŞÎÒÎªÉÙÁÖ¶øĞŞÏ°ÕâÃÅ¹¦·ò£¬µ½Í·À´È´±»Öğ³öÉÙÁÖ£¡")
----		elseif (i == 1) then
----			Talk(1,"","ÊÍÃ÷£ºÌ°µã²ÆÓÖÓĞÊ²Ã´²»¶ÔÁË£¬ÄÑµÀ³ö¼ÒÈË¾Í±ØĞë²Í·çÒûÂ¶ÁËÂğ£¿¾ÓÈ»ÎªÁËÕâ¾Í°ÑÎÒÖğ³öÉÙÁÖ¡£²»¹ıÒ²ºÃ£¬ÏÖÔÚÎÒÕâÑù·´¶ø¸üåĞÒ£×ÔÔÚ£¡")
--		else
--			Talk(2,"","ÊÍÃ÷£ºÄãÊÇÀ´ÕÒÎÒÏ´ËèµÄÂğ£¿Æ¶É®ÎÒËäÈ»Æ¶²Æ£¬²»¹ıÒ²²»ÈÌÆ­Äã¡£","ÊÍÃ÷£ºÏÖÔÚÄãÖ»ÒªÕÒËæ±ãÄÄ¸ö³ÇÊĞµÄ³µ·ò£¬¶¼¿ÉÒÔËÍÄãÈ¥¡°Ï´Ëèµº¡±£¬±ÈÆ¶É®Ï´Ëè¸ü¼Ó·½±ã¡£")
----			Talk(1,"","ÊÍÃ÷£ºÒ×½îÏ´ËèËäÈ»ÉñÃî£¬µ«±»Ï´ËèÖ®ÈË¸ù¹ÇÈ´ÈÔÈ»ÓĞÒ»¶¨ËğÉË£¬Òò´ËÏëÒªÏ´ËèµÄ»°Ò»¶¨Òª¿¼ÂÇÇå³ş¡£")
--		end
	end
end;

function toWumingmijin()
	local tbSkill_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}
	local bResult = 0
	for i=1, getn(tbSkill_150) do
		if HaveMagic(tbSkill_150[i]) ~= -1 then
			bResult = 1
			break
		end
	end

	if bResult == 1 then
		NewWorld(967,1634, 3231)
	else
		Talk(1,"","§îi sau khi häc ®­îc kü n¨ng 150 rßi h·y ®i V« Danh MËt C¶nh!")
	end
end

function rollback_0611()		-- Îª(2004-06-11)Éè¼ÆµÄÃâ·ÑÏ´µã
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1024)		-- ´Ë´ÎÏ´µãÔöÁ¿Îª1024
		rollback_prise()
	else
		Talk(1,"","Ng­¬i hµnh tÈu giang hå l©u nh­ vËy, chØ 100000 ng©n l­îng còng kh«ng cã sao?")
	end
end

function rollback_1212()		-- Îª(2003-12-12)Éè¼ÆµÄÃâ·ÑÏ´µã£¨ÒÑÈ¡Ïû£©
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1)		-- ´Ë´ÎÏ´µãÔöÁ¿Îª1
		rollback_prise()
	else
		Talk(1,"","Tı tiÒn ®ã còng kh«ng cã, lµm sao b«n ba giang hå!")
	end
end

function found_jewel_yes()		-- ÕÒµ½±¦Ê¯£¬»»»Ø¼¼ÄÜµã
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			Pay(100000)
			SetTask(13,GetTask(13) + 256)	-- °Ñ±äÁ¿¸Ä³ÉÓÃ¹ı±¦Ê¯µÄ×´Ì¬
			for i = 1,j238 do DelItemEx(238) end
			for i = 1,j239 do DelItemEx(239) end
			for i = 1,j240 do DelItemEx(240) end
			AddMagicPoint(3)		-- ²¹»ØÏ´µã¿Û³ıµÄ3µã¡£
			Talk(1,"KickOutSelf","Xong råi! Tr­íc m¾t ng­¬i nªn ngåi tŞnh d­ìng mét chót lÊy l¹i søc!")
		elseif (j238+j239+j240 > 3) then
			Say("Ng­¬i h·y ®­a ta 3 viªn Thñy tinh tr­íc, ta míi cã thÓ gióp ng­¬i ®­îc!",1,"VËy ®Ó ta ®i cÊt bít ®å, råi quay l¹i gÆp ®¹i s­. /rollback_no")
		else
			Talk(1,"","Ng­¬i râ rµng kh«ng cã ®ñ 3 viªn Thñy tinh")
		end
	else
		Talk(1,"","Xong råi! Tr­íc m¾t ng­¬i nªn ngåi tŞnh d­ìng mét chót lÊy l¹i søc!")
	end
end

function rollback_get()
	Say("Xong råi! Ta mÖt qu¸! Ng­¬i ®Êm l­ng cho ta chót ®i!",2,"§©y lµ 10 v¹n l­îng, xin ®¹i s­ nhËn cho. /pay_yes","VËy th«i ®i/rollback_no")
end;

function rollback_no()
	Talk(1,"","§ang mong chê ®¹i gi¸ quang l©m, th× ®­îc 10 v¹n l­îng, Ha! Ha! Ha!. ")
end;

function pay_yes()					-- ³õ´ÎÏ´µã£¬ÊÇÓÃµÄ±¦Ê¯£¨²»¿Û¼¼ÄÜ£©
	if (GetCash() >= 100000) then
		if (GetByte(GetTask(13),2) == 0) then		-- ÈôÓÃ¹ıË®¾§¾Í²»ÔÙÔÊĞíÓÃË®¾§Ï´µã
			Say("Ng­¬i h·y ®­a ta 3 viªn Thñy tinh tr­íc, ta míi cã thÓ gióp ng­¬i ®­îc!",3,"Ta cã ba h¹t /pay_jewel","Ta kh«ng viªn ®¸ quı ®ã, kinh m¹ch bŞ th­¬ng còng kh«ng chŞu nçi n÷a råi. /jewel_none","VËy th× ta sÏ thay g©n ®æi cèt muén mét chót /rollback_no")
		else
			jewel_none()
		end
	else
		Talk(1,"","§©y lµ thµnh ı cña ng­¬i sao?Nh­ thÕ th× ng­¬i quay vÒ ®i! ")
	end
end

function pay_jewel()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	if (j238+j239+j240 == 3) then
		SetTaskTemp(1,257)		-- ¼Ç×¡ÊÇÓÃ±¦Ê¯Ï´µÄµã£¨Ï´µã±äÁ¿ÖµÎª257£¬·Ç1£©
		Talk(2,"rollback_prise","Xong råi! Tr­íc m¾t ng­¬i nªn ngåi tŞnh d­ìng mét chót lÊy l¹i søc!","B©y giê h·y ngåi tr­íc mÆt ta")
	elseif (j238 + j239 + j240 > 3) then
		Say("Ng­¬i h·y ®­a ta 3 viªn Thñy tinh tr­íc, ta míi cã thÓ gióp ng­¬i ®­îc!",1,"VËy ®Ó ta ®i cÊt bít ®å, råi quay l¹i gÆp ®¹i s­. /rollback_no")
	else
		Talk(1,"","Ng­¬i râ rµng kh«ng cã ®ñ 3 viªn Thñy tinh")
	end
end

function NEWpay_yes()		-- µÚ¶ş´Î£¨¼°ÒÔºó£©Ï´µãÊ±µ÷ÓÃ£¬Ö±½Ó¼ì²éÇ®ºÍ±¦Ê¯£¬²»ÔÙ¼ÇÂ¼ÊÇ·ñ±¦Ê¯Ï´
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			SetTaskTemp(1,10)		-- ÒÑ¾­¿ªÊ¼Ï´µãÁ÷³Ì
			Talk(2,"rollback_prise","Xong råi! Tr­íc m¾t ng­¬i nªn ngåi tŞnh d­ìng mét chót lÊy l¹i søc!","B©y giê h·y ngåi tr­íc mÆt ta")
		elseif (j238 + j239 + j240 > 3) then
			Say("Ng­¬i h·y ®­a ta 3 viªn Thñy tinh tr­íc, ta míi cã thÓ gióp ng­¬i ®­îc!",1,"VËy ®Ó ta ®i cÊt bít ®å, råi quay l¹i gÆp ®¹i s­. /rollback_no")
		else
			Talk(1,"","Ng­¬i râ rµng kh«ng cã ®ñ 3 viªn Thñy tinh")
		end
	else
		Talk(1,"","ChØ 100000 ng©n l­îng còng kh«ng cã, lµm sao ta gióp ng­¬i ®­îc?")
	end
end

function jewel_none()
--	SetTask(13,GetTask(13) + 1)
	SetTaskTemp(1,1)		-- ¼Ç×¡ÊÇÓÃ¼¼ÄÜµãÊıÏ´µÄµã£¨Ï´µã±äÁ¿ÖµÎª1£¬·Ç257£©
	Talk(2,"rollback_prise","Xong råi! Tr­íc m¾t ng­¬i nªn ngåi tŞnh d­ìng mét chót lÊy l¹i søc!","B©y giê h·y ngåi tr­íc mÆt ta")
end

function rollback_cancel()		-- ÒÑ·ÅÆúµÄÎŞÓÃº¯Êı
	i = GetTaskTemp(1)
	if (i > 0) then		-- Èç¹ûÒÑ¾­¿ªÊ¼Á÷³Ì£¬·µ»¹10WÁ½Òø×Ó
		Talk(1,"","Ta tr¶ l¹i tiÒn cho ng­¬i ®©y!")
		Msg2Player("Thİch Minh tr¶ l¹i 10 v¹n l­îng cho b¹n. ")
	end
end

function rollback_prise()
--- ÏÈ¿ÛÇ®ºÍ±¦Ê¯¡¢ÖÃ±äÁ¿
	UTask13 = GetTask(13)
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	addon = GetTaskTemp(1)
	if (addon == 1024) then			-- ÊÇÃâ·ÑÌØÊâÏ´µã
		Uworld137 = GetTask(137) + 40
		SetTask(137,Uworld137)
		AddMagicPoint(3)
	elseif (addon == 257) then		-- ÊÇ³õ´ÎÏ´µã£¬²¢ÇÒÊÇÓÃ±¦Ê¯Ï´µÄ
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)		-- ¼Ó3µã¼¼ÄÜ£¬µÖÏúÏ´µã¿Û³ıµÄ3µãÕıºÃ¶ÔÉÏ¡£
		SetTask(13,UTask13 + 257)	-- Ï´µã±äÁ¿µÄ¸Ä±äÎªÔ­±¾Öµ¼ÓÉÏ´Ë´ÎÔö¼ÓÖµ£¨Ãâ·ÑÌØÊâÏ´µãµÄ+0£©
	elseif (addon == 10) then		-- ²»ÊÇ³õ´ÎÏ´µã£¬±ØÓĞ±¦Ê¯¡£Ò²¼Ó3µã¼¼ÄÜ
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)
		SetTask(13,UTask13 + 1)	-- Ï´µã±äÁ¿µÄ¸Ä±äÎªÔ­±¾Öµ¼ÓÉÏ´Ë´ÎÔö¼ÓÖµ
	elseif (addon == 1) then		-- ³õ´ÎÏ´µã£¬ÓÃµÄÊÇ¼¼ÄÜ
		SetTask(13,1)	-- Ï´µã±äÁ¿µÄ¸Ä±äÎªÔ­±¾Öµ¼ÓÉÏ´Ë´ÎÔö¼ÓÖµ
	else
		Talk(1,"","T×nh tr¹ng TÈy tñy cã chót sai sãt! Xin lËp tøc liªn hÖ víi GM ®Ó ®­îc xö lı!")
		return 0
	end
	Pay(100000)
--- È»ºó¿ªÊ¼Ï´µã
	i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
	j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
	n = RollbackSkill()		-- Çå³ı¼¼ÄÜ²¢·µ»ØËùÓĞ¼¼ÄÜµã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£©
	x = 0
	if (i ~= -1) then x = x + i end		-- ÕâÁ½¾äÅĞ¶ÏÊÇÅÅ³ı´ÓÎ´Ñ§¹ıÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊı¼ÆËã´íÎóÇé¿ö
	if (j ~= -1) then x = x + j end
	rollback_point = n - x - 3			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏĞµãÊı·µ»¹£¬µ«ÏÈ¿Û³ıÇá¹¦µÈ
	if (rollback_point + GetMagicPoint() < 0) then		-- Èç¹ûÏ´³ÉÁË¸ºÊı£¬Ôòµ±×÷0£¨ÎªÒÔºó¶à´ÎÏ´µã±£Áô£©
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
--	AddMagic(53,1)				-- Òş²ØµÄ»ù´¡¼¼ÄÜ£¨³¤±ø¡¢¶Ì±ø¡¢Ô¶³Ì£©²»±Ø´¦Àí
--	AddMagic(1,1)
--	AddMagic(2,1)
	if (i ~= -1) then AddMagic(210,i) end			-- Èç¹ûÑ§¹ıÇá¹¦Ôò¼Ó»ØÔ­ÓĞµÈ¼¶
	if (j ~= -1) then AddMagic(400,j) end			-- Èç¹ûÑ§¹ı¡°½Ù¸»¼ÃÆ¶¡±Í¬Ñù´¦Àí
	if (UTask13 == 254) or (UTask_13 == 510) then		-- ÒÑ¾­Ã»ÓĞÏ´µã»ú»áÁË£¬ÌáĞÑÒ»ÏÂÍæ¼Ò
		Msg2Player("Dïng 3 viªn Thñy Tinh tiÕn hµnh tÈy ®iÓm kü n¨ng. B¹n nªn vÒ nhµ nghØ mét l¸t!")
		Say("Ng­¬i ®· TÈy tñy qu¸ nhiÒu lÇn, kinh m¹ch lo¹n hÕt. B©y giê <color=red>kh«ng thÓ tÈy tñy<color> ®­îc n÷a!",1,"Ta biÕt råi!, ta sÏ chó ı. /KickOutSelf")
	else
		Msg2Player("§· tÈy xong ®iÓm kü n¨ng! B¹n cã thÓ tiÕn hµnh ph©n phèi l¹i!")
		Say("§· tÈy xong ®iÓm kü n¨ng! B¹n cã thÓ tiÕn hµnh ph©n phèi l¹i!",1,"§­îc. /KickOutSelf")
	end
--	KickOutSelf()
end;

function no()
end
