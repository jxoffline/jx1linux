--Î÷ÄÏ±±Çø ³É¶¼¸® ²ÉÒ©ÉÙÅ®¶Ô»°£¨¡°²É¼¯Ò©²Ä¡±ÈÎÎñ£©
-- Update: Xiao_Yang(2004-04-26)£¨Ôö¼Ó¡°²É¼¯Ò©²ÄÈÎÎñ¡±£©

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld132 = GetTask(132)
	Uworld133 = GetByte(GetTask(133),1)
	if (Uworld132 == 10) and (HaveItem(112) == 1) and (HaveItem(113) ==1) and (HaveItem(114) ==1) and (HaveItem(115) ==1) and (HaveItem(116) ==1) then
		Talk(2,"Uworld132_finish","TiÓu c« n­¬ng! Nh÷ng thø c« cÇn ®Òu ë chç ta","ThËt µ! C¶m ¬n ng­¬i nhiÒu l¾m!")
	elseif (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) and ((Uworld132 < 10) or ((GetGameTime() > Uworld132) and (Uworld132 > 255))) then		-- ¡°²É¼¯Ò©²Ä¡±ÈÎÎñÔÊĞíÆô¶¯
		if (Uworld133 >= 5) then
			SetTask(133,0)
		end
		Talk(5,"Uworld132_get","Çy...","TiÓu c« n­¬ng cã viÖc g× lo l¾ng vËy?","HiÖu thuèc cña ta gÇn ®©y thiÕu vµi vŞ thuèc chñ yÕu. Toµn bé sè thuèc ®ã ë Th­¬ng Ch©u ®Òu bŞ c¸c «ng chñ lín mua hÕt råi,danh dù cña «ng chñ ®· bŞ mÊt s¹ch, nÕu kh«ng cã c¸ch ®Ó chÕ nh÷ng d­îc liÖu nµy th× kh«ng biÕt ph¶i lµm sao n÷a.","ChuyÖn bu«n b¸n ta kh«ng hiÓu nh­ng còng th­êng ®Õn tiÖm cña muéi mua thuèc, cã khã kh¨n g× cø nãi ra biÕt ®©u ta cã thÓ gióp muéi.","ThËt sao? Ng­êi biÕt ë ®©u cã thÓ t×m ®­îc 5 lo¹i: Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ th¶o, Linh Chi kh«ng?","Ha ha,! May qu¸! Nh÷ng lo¹i thuèc nµy ta ®· tõng thÊy qua trong D­îc V­¬ng Cèc")
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Vïng Thµnh §« cã rÊt nhiÒu nói,gÇn th× cã nói Nga Mi,nói Thanh Thµnh, xa mét chót th× cã nói Tø C« N­¬ng, nói D©n S¬n, nói nhiÒu th¶o d­îc tù nhiªn sÏ nhiÒu, ®Æc biÖt lµ Xuyªn Bèi, Thiªn Ma, Trïng Th¶o")
		elseif (i == 1) then
			Talk(1,"","Th¶o d­îc muéi h¸i vÒ, mét İt tù m×nh dïng, mét İt b¸n cho c¸c tiÖm thuèc, ®Ó lÊy tiÒn nu«i sèng m×nh vµ bµ néi.")
		else
			Talk(1,"","Cha mÑ muéi mÊt sím, chØ cßn m×nh ta vµ bµ néi sèng n­¬ng tùa vµo nhau, bµ néi lµ ng­êi th©n duy nhÊt cña muéi")
		end
	end
end;

function Uworld132_get()
	Say("VËy ng­êi cã thÓ gióp ta h¸i mét İt mang vÒ ®©y kh«ng?",2,"ChØ lµ chuyÖn nhá, c« n­¬ng h·y ®îi 1 lóc. /Uworld132_yes","ë ®ã qu¸i vËt rÊt nhiÒu, t¹i h¹ tµi kĞm lùc thÊp, tèt h¬n lµ nªn tËp luyÖn vâ c«ng tr­íc vËy. /Uworld132_no")
end

function Uworld132_yes()
	SetTask(132,10)
	Msg2Player("Ng­¬i nhí lµ ®· thÊy ®­îc 5 vŞ d­îc liÖu Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ Th¶o, Linh Chi ë D­îc V­¬ng Cèc, høa sÏ t×m gióp c« g¸i h¸i thuèc. ")
end

function Uworld132_no()
end

function Uworld132_finish()
	
	local nResult = 0;
	
	-- ¼ì²éÎïÆ·ÊÇ»¹´æÔÚ£¬Èç¹û·Ç 1 ÔòÖ±½Ó return
	for i=112, 116 do
		nResult = HaveItem(i);
		if nResult~=1 then
			return
		end;
		DelItem(i);
	end;
	
	SetTask(132,GetGameTime()+3600)
	
	Uworld133 = GetByte(GetTask(133),1)
	Uworld133_2 = GetByte(GetTask(133),2)
	Cur_date = tonumber(date("%d"))
	if (Uworld133_2 == Cur_date) then
		Uworld133 = Uworld133 + 1
	else
		Uworld133 = 1
	end
	AddRepute(Uworld133)
	Msg2Player("B¹n ®¹t ®­îc"..Uworld133.."®iÓm danh väng")
	if (Uworld133 >= 5)then
		SetTask(133,0)
		AddRepute(10)
		Msg2Player("V× ®· nhiÒu lÇn ra tay gióp ®ì, b¹n ®­îc thªm 10 ®iÓm th­ëng thanh thÕ n÷a! ")
	else
		Uworld133 = SetByte(Uworld133,2,Cur_date)
		SetTask(133,Uworld133)
	end
end
