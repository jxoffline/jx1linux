--Î÷±±ÄÏÇø ·ïÏè¸® ïÚ¾ÖÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(188) == 1 then
		allbrother_0801_FindNpcTaskDialog(188)
		return 0;
	end
	
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_shuangying()
	else
		i = random(0,1)
		if (i == 0) then
		Say("Song ¦ng tiªu côc chóng ta ë T©y B¾c, b¹n bÌ tèt xÊu ®Òu cã. V× vËy c«ng viÖc b¶o Tiªu kh«ng thÊt tho¸t, còng nhê vµo sù nÓ mÆt cña b¹n bÌ trªn giang hå ",0)
		else
		Say("Chóng ta lµ nh÷ng ng­êi b¶o Tiªu, ngoµi kh¶ n¨ng cßn ph¶i dùa vµo hai ch÷ 'giao t×nh' víi b»ng h÷u trªn giang hå. Cã lóc cßn hiÖu qu¶ h¬n rÊt nhiÒu", 0)
		end;
	end
end
		
		