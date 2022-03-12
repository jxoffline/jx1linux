--ÖĞÔ­ÄÏÇø ÏåÑô¸® ÂëÍ·´¬·ò1¶Ô»°
--suyu
--200306015

CurWharf = 4;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("Nhµ ta mÊy ®êi lªnh ®ªnh trªn Tr­êng Giang, ®õng thÊy thuyÒn ta nhá mµ xem th­êng, chë 4,5 ng­êi còng kh«ng hÒ hÊn g×!", 3, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel", "§i §µo Hoa ®¶o (3) /go_thd");
	--else
	--	Say("Nhµ ta mÊy ®êi lªnh ®ªnh trªn Tr­êng Giang, ®õng thÊy thuyÒn ta nhá mµ xem th­êng, chë 4,5 ng­êi còng kh«ng hÒ hÊn g×!", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel");
	--end
end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh«ng cã tiÒn ngåi thuyÒn th× ng­¬i ®i bé vËy! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(237);
	-- if (nRet == 1) then
	--	Msg2Player("´¬·ò£º×î½üÈ¥ÌÒ»¨µºµÄÈË¿ÉÕæ¶à¡£ºÃ°É£¬Äã×øºÃà¶£¡")
	if (nRet == -1) then
		Talk(1,"","Phİ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
