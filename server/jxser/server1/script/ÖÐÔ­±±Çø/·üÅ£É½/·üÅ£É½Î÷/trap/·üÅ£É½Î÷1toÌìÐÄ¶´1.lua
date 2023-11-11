--ÖĞÔ­±±Çø ·üÅ£É½1toÌìĞÄ¶´1
--Trap ID£ºÖĞÔ­±±Çø 16

function main(sel)
	if (GetTask(129) == 50) then			-- ÖÜÔÆÈªÈÎÎñ
		Say("Võa ®Õn cöa ®éng, ®ét nhiªn b¹n nghe tiÕng kªu th¶m th­¬ng, h×nh nh­ lµ tiÕng cña Chu V©n TuyÒn..",2,"§i cøu ng­êi /U129_50","Kh«ng chó ı ®Õn, ®i vµo ®éng Thiªn T©m. /enter_cave")
	elseif (GetTask(129) == 55) then		-- Õ½¶·Î´½áÊø£¬Ç¿ÆÈ½øÈëÌìĞÄ¶´
		Talk(1,"go_Zhome","§øng l¹i! TiÕp chiªu ®©y! ")
	else
		enter_cave()
	end
end;

function enter_cave()
	SetFightState(1)
	NewWorld(42, 1584, 3221);
	AddTermini(107)
end

function U129_50()
	SetTask(129,55)
	Talk(4,"go_Zhome","T¹i sao c¸c ng­¬i t¹i sao lµm h¹i Chu huynh? ","Ng­¬i tõ ®©u ®Õn? §õng cã nhiÒu chuyÖn!","Xem ra bøc th­ gi¶ m¹o nµy, th× ra lµ m­u ma ch­íc quû cña bän ng­¬i!","Hõ! Thiªn NhÉn bän ta hµnh sù, kh«ng ai cã thÓ biÕt ®­îc. Nh­ng ng­¬i ®· biÕt ®­îc chuyÖn nµy, th× bän ta ®µnh tiÔn ng­¬i cïng h¾n vÒ bªn kia thÕ giíi vËy. ")
end

function go_Zhome()
	SetFightState(1)
	NewWorld(232,1612,3204)
end
