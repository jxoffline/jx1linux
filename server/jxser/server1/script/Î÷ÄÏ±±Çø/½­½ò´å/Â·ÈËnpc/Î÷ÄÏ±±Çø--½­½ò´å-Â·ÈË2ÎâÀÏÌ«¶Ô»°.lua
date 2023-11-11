----Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË2ÎâÀÏÌ«¶Ô»°

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_wulaotai()
	else
		Say("Tuy ta kh«ng cã con trai, nh­ng ®· cã mét ®øa con g¸i ngoan hiÒn hiÕu thuËn, ng­êi ta ®Òu nãi bµ nhµ ta cã phóc!",0)
	end
end;