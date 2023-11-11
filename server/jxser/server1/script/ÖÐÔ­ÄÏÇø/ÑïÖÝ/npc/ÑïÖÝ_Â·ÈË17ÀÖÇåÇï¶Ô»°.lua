--ÖĞÔ­ÄÏÇø ÑïÖİ¸® Â·ÈË17ÀÖÇåÇï¶Ô»°
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_leqingqiu()
	else
		Say("Ta ch¶ng cã b¶n lÜnh g×, chØ biÕt dùa vµo tµi vÏ tranh mµ sèng qua ngµy", 0);
	end
end;




