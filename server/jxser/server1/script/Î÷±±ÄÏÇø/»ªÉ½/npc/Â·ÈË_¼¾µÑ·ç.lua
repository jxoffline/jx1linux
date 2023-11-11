-- \script\Î÷±±ÄÏÇø\»ªÉ½\npc\Â·ÈË_uworld122_¼¾µÑ·ç.lua
-- by xiaoyang(2004\4\15) ÉÙÁÖ90¼¶ÈÎÎñ

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld122 = GetTask(122)
	Uworld38 = GetByte(GetTask(38),2)
	if(Uworld122 < 10) and (GetLevel() >= 90) and (Uworld38 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="shaolin" ) then
		Talk(8,"U122_get","Lı huynh! LuËn vÒ v¨n th× ®Ö kh«ng b»ng huynh, nh­ng tËp vâ kh«ng nh­ ®äc s¸ch, cßn cÇn ph¶i cã c«ng phu","Th­êng huynh! S¸ch ë Tµng kinh c¸c cã ngµn v¹n, nÕu nh­ ai còng nh­ huynh kh«ng chŞu ®äc s¸ch th× PhËt ph¸p ThiÕu L©m ®· sím kh«ng tån t¹i trªn thÕ gian.","PhËt ®¹o lµ ph¶i tù nhiªn, tu hµnh kh«ng nhÊt thiÕt ph¶i theo s¸ch vë. Huèng chi Th­êng mç tuy ch­a tõng ®äc s¸ch nh­ng ®©u ph¶i kh«ng biÕt ch÷. Vâ c«ng cña huynh kh«ng nh­ ta, l¹i muèn häc vâ c«ng th­îng thõa","Nh­ thÕ lµ kh«ng hîp lı. Chïa cña ta truíc khi häc vâ ph¶i nghiªn cøu PhËt ®iÓn vµ gi¶i bá téi lçi ®i, nÕu kh«ng sÏ chÕt sím, ta chØ muèn tèt cho huynh th«i.","Nãi nh­ vËy, ®µnh ph¶i so tµi mét trËn. ThiÕu L©m nghiªm cÊm ®ång m«n t­¬ng tµn, chóng ta lªn l«i ®µi Hoa S¬n c«ng b»ng so tµi, sinh tö do trêi ®Şnh.","§Êu th× ®Êu! §Ö khuyªn huynh chø kh«ng ph¶i lµ ®Ö sî huynh!","Ha! Ha! Hai vŞ! T¹i h¹ ®øng bªn ngoµi nghe hÕt c¶. ThiÕu L©m lµ vâ l©m b¾c ®Èu. Hai vŞ kh«ng nªn s¸t th­¬ng tİnh mÖnh nhau","VŞ nµy...t¹i h¹ còng lµ bÊt ®¾c dÜ th«i!")
	elseif(Uworld122 > 10) and (Uworld122 < 50) then
		Talk(2,"","Lı huynh kh«ng nh­êng cho th× t¹i h¹ còng kh«ng kh¸ch khİ ®©u.","T¹i h¹ cã ­u thÕ râ rµng, Th­êng huynh chí lµm khã!")
	elseif (Uworld122 == 60) then
		Talk(4,"Uworld122_ashamed","Th­êng huynh! Lı huynh! Hai vŞ ®õng thÕ n÷a!","C¶m t¹ ©n cøu m¹ng cña c¸c h¹!","§ång m«n t­¬ng tranh, hËu qu¶ khã l­êng,hèi hËn còng kh«ng kŞp!","ThiÕu L©m lµ r­êng cét cña vâ l©m, t¹i h¹ cã thÓ gióp ®ì ®­îc hai vŞ, thËt vinh h¹nh! Mäi viÖc ®· xö lı xong! Ta ph¶i quay vÒ ThiÕu L©m phôc mÖnh.")
   elseif (Uworld122 == 50) and (HaveItem(392) == 1) then
   	Talk(4,"U122_step","ThiÕu L©m T¨ng Chóng lÖnh ë ®©y! §Ö tö ThiÕu L©m lËp tøc nghe lÖnh!","Chİnh thùc lµ ThiÕu L©m T¨ng Chóng lÖnh! Ta xin tu©n theo hiÖu lÖnh!","C¸c h¹ cø sai khiÕn!","HiÖn t¹i qu©n Kim ®ang Èn nÊp trong nói Hoa S¬n, ®· bao v©y chóng ta. Chóng ta thõa lóc chóng ®ang bè trİ, chia ra ®¸nh gi¶i v©y, sau ®ã tËp hîp l¹i.")
   elseif (Uworld122 == 50) then			-- ×´Ì¬ÕıÈ·£¬µ«Ã»ÓĞÁîÅÆ
   	Talk(1,"","Ng­¬i lµ ai? Dùa vµo c¸i g× mµ can thiÖp vµo chuyÖn cña chóng ta?")
   elseif (Uworld122 == 55) then			-- ÈÎÎñÖĞµÄÈ±Ê¡¶Ô»°
   	Talk(2,"","NhiÖm vô cña ta ®· hoµn thµnh, bªn huynh thÕ nµo?","Ta thËt kh«ng yªn t©m, c¸c huynh quay l¹i xem thö, ®îi ta mét l¸t!.")
   elseif (Uworld122 == 65) and (HaveItem(392) == 0) then		-- ÖØĞÂÈ¡»ØÁîÅÆ
   	Talk(1,"","§a t¹ ©n cøu m¹ng cña c¸c h¹, ®©y lµ lÖnh bµi xin göi l¹i!")
   	AddEventItem(389)
   	Msg2Player("LÊy lÖnh bµi ThiÕu L©m vÒ ")
   elseif (Uworld122 >= 240) then		-- ÈÎÎñÒÑÍê³É
   	Talk(1,"","LÇn tr­íc nhÊt thêi hå ®å, nÕu kh«ng cã c¸c h¹ t­¬ng trî th× qu¶ thËt hËu qu¶ khã l­êng!")
   else
   	Talk(1,"","Th­êng huynh! LÇn nµy ta tû vâ c¸ nh©n, nÕu s­ phô biÕt nhÊt ®Şnh sÏ tr¸ch m¾ng ®óng kh«ng?")
   end
end

function U122_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Xem huynh cã vÎ kh«ng khoÎ, hay lµ ®øng c¸ch xa trËn chiÕn ®Ó tr¸nh bŞ s¸t th­¬ng.")
	else
		Say("Nãi nh­ vËy, nÕu huynh chŞu nh­êng danh hiÖu, t¹i h¹ quyÕt kh«ng lµm khã kh¨n!",2,"Xem ra th× khuyªn hai ng­êi kh«ng xong, ta ®µnh lªn ThiÕu L©m mét chuyÕn, hái râ c¨n nguyªn. /Uworld122_yes","C¸c huynh ®¸nh th× cø ®¸nh, kh«ng liªn can ®Õn ta, khuyªn råi mµ c¸c huynh kh«ng nghe, bŞ thiÖt thßi lµ c¸c huynh. /Uworld122_no")
	end
end

function Uworld122_yes()
	Msg2Player("§Ö tö ThiÕu L©m Th­êng B¸ch Lİ vµ Lı §Şch Phong v× tranh häc vâ c«ng th­îng thõa mµ quyÕt ®Êu sèng chÕt. B¹n ®Şnh lªn ThiÕu L©m t×m s­ phô cña hä ®Ó khuyªn ng¨n. ")
	AddNote("§Ö tö ThiÕu L©m Th­êng B¸ch Lİ vµ Lı §Şch Phong v× tranh häc vâ c«ng th­îng thõa mµ quyÕt ®Êu sèng chÕt. B¹n ®Şnh lªn ThiÕu L©m t×m s­ phô cña hä ®Ó khuyªn ng¨n. ")
	SetTask(122,10) --ÉÙÁÖÈÎÎñÆô¶¯
end

function Uworld122_no()
end

function U122_step()
	DelItem(392)
	SetTask(122,55)			-- ²åÈë±äÁ¿ÖĞ
	Msg2Player("T×m ra chç qu©n Kim, giÕt t­íng lÜnh sau ®ã l¹i tËp hîp. ")
end

function Uworld122_ashamed()
	SetTask(122,65)  --ÉèÖÃÈÎÎñ±äÁ¿Îª60
  	AddEventItem(392)		-- ´Ë´¦ÔÙÈ¡»ØÁîÅÆ
	Msg2Player("Cøu Th­êng B¸ch Lİ vµ Lı §Şch Phong, mang lÖnh bµi ThiÕu L©m vÒ ThiÕu L©m b¸o tin. ")
	AddNote("Cøu Th­êng B¸ch Lİ vµ Lı §Şch Phong, vÒ ThiÕu L©m b¸o tin. ")
end
