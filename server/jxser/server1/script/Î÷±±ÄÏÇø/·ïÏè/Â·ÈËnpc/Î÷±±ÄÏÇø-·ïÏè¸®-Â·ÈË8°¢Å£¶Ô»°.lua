--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË8°¢Å£¶Ô»°

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_aniu()
	else
		Say("Ng­êi ta nãi N÷ Oa ®Ñp nhÊt, còng kh«ng biÕt lµ thËt hay gi¶ n÷a!",0)
	end
end;