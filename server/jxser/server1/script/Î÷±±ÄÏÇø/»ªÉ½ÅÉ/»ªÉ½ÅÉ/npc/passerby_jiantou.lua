-- »ªÉ½ÅÉ¼ýÍ·¶Ô»°½Å±¾

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","Nghe nãi Vâ L©m TruyÒn Kú cã nhiÖm vô Hoµng Kim, §Ö tö Hoa S¬n ph¸i ®· xuèng nói lµm nhiÖm vô, sau nµy ng­¬i h·y quay l¹i!");
	end
end
