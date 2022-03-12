--ÖĞÔ­±±Çø ãê¾©¸® ÂëÍ·´¬·ò2¶Ô»°
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("H«m nay xu«i thuyÒn ng­îc dßng, l¹i gÆp ph¶i giã lín, xem ra kh«ng thÓ cø chÌo m·i nh­ thÕ nµy. E r»ng ph¶i lªn bê th«i, ng­¬i cã chŞu lªn kh«ng? ", 3, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel", "§i §µo hoa ®¶o (4) /go_thd");
	--else
	--	Say("H«m nay xu«i thuyÒn ng­îc dßng, l¹i gÆp ph¶i giã lín, xem ra kh«ng thÓ cø chÌo m·i nh­ thÕ nµy. E r»ng ph¶i lªn bê th«i, ng­¬i cã chŞu lªn kh«ng? ", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel");		
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
		Talk(1,"","Phİ ®i thuyÒn ®Õn §µo Hoa §¶o "..AEXP_TICKET.."L­îng, ng­¬i cã ®ñ kh«ng? ")
	end
end
---------------------------------------------------------------
