--ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË15ÁõÔ±Íâ¶Ô»°
--by xiaoyang  (2004\4\12)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld127 = GetTask(127)
	Uworld30 = GetByte(GetTask(30),1)
	if (Uworld127 < 10) and (GetLevel() >= 90) and (Uworld30 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="tianren" ) then   --·ûºÏÈÎÎñÌõ¼ş
		Talk (14,"Uworld127_step1","Êy!. ","L·o viªn ngo¹i! Ng­êi lµm sao vËy? ","Mét lêi khã nãi hÕt! Ng­¬i h·y mau chãng rêi khái ®©y, nÕu kh«ng còng sÏ bŞ liªn lôy ","Rèt cuéc ®· x¶y ra chuyÖn g×? Cø nãi ra xem ta cã thÓ gióp g× ®­îc kh«ng? T¹i h¹ bÊt tµi, chØ cã chót søc lùc th«i ","C¸c h¹ lµ ng­êi trong giang hå? ","M¸u ®æ trong giang hå, ®Òu cã phÇn cña ta ","VËy th× qu¸ tèt råi! Kh«ng biÕt lµ ng­¬i ®· tõng nghe qua tªn ThÊt c«ng chóa Hoµn Nhan TuyÕt Y cña §¹i Kim ch­a? ","Hoµn Nhan c«ng chóa lanh lîi th«ng minh, dung nhan tuyÖt thÕ, lµ con g¸i mµ Hoµng Th­îng yªu nhÊt ","Kh«ng sai! Con trai cña l·o phu hiÖn ®ang lµm c«ng sai trong phñ cña c«ng chóa ","Nh­ vËy th× qu¸ tèt råi? ¤ng cßn g× ph¶i lo buån? ","§¸ng lo lµ c« c«ng chóa nµy vèn ®­îc c­ng chiÒu qu¸ ®¸ng. GÇn ®©y nghe nãi c«ng chóa muèn b¾t con ®¹i ®iªu ®· hµng tr¨m tuæi ë L­u m«n quan s¬n, dï nã ®· c¾n träng th­¬ng nhiÒu ng­êi, ®Õn KhuyÓn tö còng vËy. ","BŞ träng th­¬ng? VËy viÖc ®iÒu trŞ thÕ nµo råi? ","L·o phu chØ cã mét İt gia s¶n, KhuyÓn Tö l¹i bŞ träng th­¬ng nh­ vÇy. Nh­ng trong vßng 1 th¸ng kh«ng b¾t ®­îc con linh ®iªu ®ã th× c¶ nhµ sÏ bŞ chĞm ®Çu ","A! nghiªm träng vËy sao " )
	elseif (Uworld127 == 10) and (HaveItem(374) == 0) then
		AddEventItem(374)
		Msg2Player("L¹i nhËn ®­îc lÖnh bµi ë phñ c«ng chóa ")
		Talk(1,"","ThÊy ng­¬i còng tµm t¹m, lÖnh bµi ®©y lÊy ®i!")
	elseif (Uworld127 == 100) or (Uworld127 == 110) then                                                             --ÈÎÎñÍê³É
		Talk(4,"U127_finish","Cuèi cïng ng­¬i còng quay l¹i!"," L­u tiªn sinh! ChuyÖn cña LÖnh lang kh«ng cã g× ph¶i lo l¾ng ","MÆc dï ta ®· rÊt tin t­ëng ng­¬i, nh­ng thËt sù còng kh«ng tin lµ ng­¬i cã thÓ b¾t ®­îc Linh ®iªu! NÕu nh­ b¾t ®­îc, th× ®¹i ©n cña ng­¬i ®èi víi L­u gia, ta dï cho ®Õn chÕt còng kh«ng thÓ quªn!"," §õng qu¸ kh¸ch s¸o! T¹i h¹ xin c¸o tõ.")
	elseif (Uworld127 > 10)and (Uworld127 < 100) then                                            --ÈÎÎñ½øĞĞÖĞ
		Talk(1,"","Sinh m¹ng cña c¶ gia ®×nh ta n»m trong tay ng­¬i, ng­¬i nhÊt ®Şnh ph¶i thµnh c«ng!")
	elseif (Uworld127 >= 245) then                                                                 --ÈÎÎñÍê³Éºó
		Talk(1,"","Mêi ©n nh©n vµo nhµ ngåi, trªn giang hå sèng chÕt khã l­êng! Xin h·y b¶o träng th©n thÓ!")
	else    
		Talk(1,"","Ai sèng trªn ®êi ®Òu nh­ nhau, chØ cÇn vui vÎ sèng qua ngµy lµ ®­îc.")
	end
end;

function Uworld127_step1()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Çy! Nãi ra còng chØ lµm trß c­êi cho thiÕu hiÖp mµ th«i")
	else
		Say("Thêi h¹n ®· hÕt råi! B©y giê biÕt ph¶i lµm sao ®©y!",2,"Hõm! Mäi ng­êi kh«ng cÇn lo l¾ng! Ta ®ang ®îi thö xem c« c«ng chóa h­ ®èn nµy lîi h¹i thÕ nµo?! /U127_get","ThÕ lùc cña c«ng chóa rÊt m¹nh, t¹i h¹ sî kh«ng ®­¬ng næi /no")  --ÈÎÎñÆô¶¯
	end
end

function U127_get()
	Talk(3,"","C«ng chóa lµ ng­êi ®éc ¸c h¸o th¾ng! Tèt nhÊt ng­¬i kh«ng nªn dİnh vµo","¤ng yªn t©m! Ta nhÊt ®Şnh sÏ b×nh an trë vÒ!","Tèt l¾m! §©y lµ lÖnh bµi nhËp cung, ta ë ®©y chê tin vui cña ng­¬i.")
	AddEventItem(374)
	SetTask(127,10)
	Msg2Player("TiÕp nhËn nhiÖm vô: §i t×m Hoµng Nhan TuyÕt Y, ®Ó lÊy l¹i sù c«ng b»ng cho L­u viªn ngo¹i ")
	AddNote("TiÕp nhËn nhiÖm vô: §i t×m Hoµng Nhan TuyÕt Y, ®Ó lÊy l¹i sù c«ng b»ng cho L­u viªn ngo¹i ")
end

function no()
end

function U127_finish()
	if(GetTask(127) == 110) then
      SetTask(127,255)
   else
      SetTask(127,245)				  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
	   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
	   AddRepute(add_repute)
	   Msg2Player("Hoµn thµnh nhiÖm vô, trë vÒ L­u gia, danh väng t¨ng lªn "..add_repute.."®iÓm.")
	   AddNote("Quay l¹i chç L­u viªn ngo¹i, hoµn thµnh nhiÖm vô. ")
end
