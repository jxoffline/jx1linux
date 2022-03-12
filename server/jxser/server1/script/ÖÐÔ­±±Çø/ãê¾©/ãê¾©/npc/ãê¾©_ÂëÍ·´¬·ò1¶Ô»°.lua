--ÖÐÔ­±±Çø ãê¾©¸® ÂëÍ·´¬·ò1¶Ô»°
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("S«ng Hoµng Hµ uèn l­în chÝn khóc, chóng t«i ®· quen sèng ë ®©y, biÕt ®­îc nh÷ng chç nguy hiÓm. Kh«ng biÕt kh¸ch nh©n muèn ®i ®Õn ®o¹n nµo? Cã ®i kh«ng? ", 3, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel", "§i §µo hoa ®¶o (4) /go_thd");
	--else
	--	Say("S«ng Hoµng Hµ uèn l­în chÝn khóc, chóng t«i ®· quen sèng ë ®©y, biÕt ®­îc nh÷ng chç nguy hiÓm. Kh«ng biÕt kh¸ch nh©n muèn ®i ®Õn ®o¹n nµo? Cã ®i kh«ng? ", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel");
	--end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh«ng tiÒn kh«ng thÓ lªn thuyÒn! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(238);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","PhÝ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
