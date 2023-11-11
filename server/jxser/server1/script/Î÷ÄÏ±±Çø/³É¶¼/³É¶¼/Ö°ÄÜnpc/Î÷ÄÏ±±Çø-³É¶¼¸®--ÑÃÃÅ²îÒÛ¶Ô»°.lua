--Î÷ÄÏ±±Çø ³É¶¼¸® ÑÃÃÅ²îÒÛ¶Ô»° ÊÀ½çÈÎÎñ£¨³É¶¼É±Ò°Öí£©
-- Update: Dan_Deng(2004-03-19)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";

Include("\\script\\global\\repute_head.lua")

Include([[\script\global\Â·ÈË_ÑÃÃÅÎÀ±ø.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	Uworld11 = GetTask(11)
	if (Uworld11 == 100) then			-- ÈÎÎñÍê³É
		W11_prise()
	elseif (Uworld11 < 255) and (Uworld11 >= 1) then		-- ÈÎÎñÖĞ
		Talk(1,"","Muèn l·nh th­ëng h¶? GiÕt m­êi con heo rõng ®i råi h·y nãi!")
	elseif (Uworld11 > 255) then		-- ÈÎÎñÒÑ¾­Íê³É
		Talk(1,"","GÇn Thµnh §« cã rÊt nhiÒu nói, th­êng cã heo rõng xuÊt hiÖn,lÇn nµy may nhê cã ng­¬i míi cã thÓ b¶o ®¶m ®­îc thu ho¹ch cña n¨m nay.")
	else			-- Î´½ÓÈÎÎñ
		Talk(1,"","Ng­¬i d¸m x«ng vµo nha m«n? §óng lµ ¨n gan hïm mËt gÊu!")
	end
end;

function W11_prise()
	Talk(1,"","§· giÕt chÕt 10 con heo rõng? Tèt qu¸! Ta thay mÆt tr¨m hä Thµnh §« ®a t¹ ng­¬i vµ c¸c vŞ hiÖp sÜ ®· ra tay. §©y lµ 500 l­îng th­ëng!")
	Earn(500)
	SetTask(11,date("%Y%m%d"))
	i = random(0,99)
	if (i < 50) then			-- 50%¼¸ÂÊ
		x = 3
	elseif (i < 85) then		-- 35%¼¸ÂÊ
		x = 4
	else							-- 15%¼¸ÂÊ
		x = 5
	end
	AddRepute(x)
	Msg2Player("NhiÖm vô hoµn thµnh, ®­îc th­ëng 50 l­îng b¹c, ®iÓm thanh thÕ cña b¹n ®­îc t¨ng "..x.."®iÓm.")
end;
