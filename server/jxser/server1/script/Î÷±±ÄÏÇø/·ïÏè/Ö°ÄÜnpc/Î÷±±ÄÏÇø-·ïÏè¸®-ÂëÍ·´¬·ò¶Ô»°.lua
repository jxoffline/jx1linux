--Î÷±±ÄÏÇø ·ïÏè¸® ÂëÍ·´¬·ò¶Ô»°
--suyu
--200306015

CurWharf = 1;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("Hoµng hµ chÝn khóc uèn quanh, em bê bªn Êy cßn anh bªn nµy....", 3, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel", "§i §µo Hoa ®¶o (7) /go_thd");
	--else
	--	Say("Hoµng hµ chÝn khóc uèn quanh, em bê bªn Êy cßn anh bªn nµy....", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel");
	--end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh«ng tiÒn kh«ng thÓ lªn thuyÒn! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(241);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","PhÝ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
