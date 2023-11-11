--Î÷ÄÏÄÏÇø ´óÀí¸® ³¤½­ÂëÍ·´¬·ò¶Ô»°
--suyu
--20031029

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("S«ng Hoµng Hµ uèn l­în chÝn khóc cong, em ë vïng biÓn anh trªn nói, c¸ch nhau Th­¬ng S¬n NhÜ H¶i, muèn gÆp còng kh«ng ®­îc.", 3, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel", "§i §µo Hoa ®¶o (5) /go_thd")
	--else
	--	Say("S«ng Hoµng Hµ uèn l­în chÝn khóc cong, em ë vïng biÓn anh trªn nói, c¸ch nhau Th­¬ng S¬n NhÜ H¶i, muèn gÆp còng kh«ng ®­îc.", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(239);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","PhÝ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
