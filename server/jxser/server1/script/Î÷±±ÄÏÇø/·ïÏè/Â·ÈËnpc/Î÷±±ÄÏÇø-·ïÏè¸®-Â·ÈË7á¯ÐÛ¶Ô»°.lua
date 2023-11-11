--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË7á¯ĞÛ¶Ô»°

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_cenxiong()
	else
		Say("Chóng ta sinh ë Ph­îng T­êng, lín lªn còng ë Ph­îng T­êng, kh«ng biÕt ®Õn thÕ giíi bªn ngoµi ra sao, cã dŞp sÏ ®i ra ngoµi thö xem!",0)
	end
end;