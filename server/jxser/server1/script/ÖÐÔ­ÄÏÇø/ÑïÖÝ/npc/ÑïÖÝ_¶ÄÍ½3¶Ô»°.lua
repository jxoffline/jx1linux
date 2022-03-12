--ÖĞÔ­ÄÏÇø ÑïÖİ¸® ¶ÄÍ½3¶Ô»°
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_dugun()
	else
		Say("T­ëng lµ dÔ th¾ng ®­îc mÊy v¸n, kÕt qu¶ l¹i thua n÷a! ThËt kh«ng ®µnh lßng!", 0);
	end
end;




