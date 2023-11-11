--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË15ÊéÉú¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(186) == 1 then
		allbrother_0801_FindNpcTaskDialog(186)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Talk(2, "", "Ng­¬i kh«ng biÕt h¶? §©y chİnh lµ Väng Giang lÇu ®Ó kû niÖm mét ®êi tµi n÷ HuyÕt §µo mµ x©y nªn, truyÒn thuyÕt kÓ r»ng ®· c« tõng lÊy n­íc giÕng ë ®©y, tù tay ®Ò th¬, ®· l­u l¹i nh÷ng c©u th¬ buån lµm ®éng lßng ng­êi.", "HuyÕt §µo lóc sèng rÊt yªu thİch tróc, nªn quanh ®©y mäi ng­êi tr«ng rÊt nhiÒu tróc, ph­îng vÜ th©m th©m, long ng©m tÕ tÕ, tø quı th­¬ng thóy,t ×nh høng v« cïng, th­êng d­¬ng kú gi¸n, khiÕn nhiÒu ng­êi truyÒn tông.")
return
end;

if (i == 1) then
Say("Lªn Väng Giang LÇu mµ nh×n ra xa, dung thµnh tó m¹o, cÈm giang xu©n s¾c, thu vµo tÇm m¾t, khiÕn cho lßng ng­êi tho¶ thİch.",0)
end;

end;
