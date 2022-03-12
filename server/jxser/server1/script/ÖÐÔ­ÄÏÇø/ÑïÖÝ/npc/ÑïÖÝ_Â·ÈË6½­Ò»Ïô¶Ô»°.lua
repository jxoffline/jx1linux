--ÖÐÔ­ÄÏÇø ÑïÖÝ¸® Â·ÈË6½­Ò»Ïô¶Ô»°

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(194) == 1 then
		allbrother_0801_FindNpcTaskDialog(194)
		return 0;
	end
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_jiangyixiao()
	else
		i = random(0,1)

			if (i == 0) then
			Say("Kh«ng cã c« g¸i nµo s¸nh b»ng c« Êy, trong m¾t ta, chØ cã mét m×nh nµng. Nh­ng v× sao th× ta kh«ng gi¶i thÝch ®­îc?",0)
			return
			end;
			
			if (i == 1) then
			Say("Ta tuy nghÌo, nh­ng ta ®èi víi HiÓu Ch©n lµ thËt lßng!",0)
			end;
			
			
	end
end

