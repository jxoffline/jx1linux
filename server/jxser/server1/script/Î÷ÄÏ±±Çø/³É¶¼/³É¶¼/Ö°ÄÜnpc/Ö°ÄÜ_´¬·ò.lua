--Î÷ÄÏ±±Çø ³É¶¼ ´¬·ò¶Ô»°

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("ë ®©y tuy kh«ng cã bÕu tµu nh­ng ta còng cã c¸ch ®­a ng­¬i ®i!", 2, "§i §µo Hoa ®¶o (6) /go_thd", "Kh«ng ngåi/OnCancel")
	else
		Talk(1, "", "Kh«ng biÕt bao giê ë ®©y míi cã mét bÕn tµu!")
	end
end;

function  OnCancel()
   Talk(1,"","Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(240);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","PhÝ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
