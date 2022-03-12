--½­ÄÏÇø ÁúÈª´åtoÎå¶¾½Ì
--Trap ID£º½­ÄÏÇø 108

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(183, 1371, 3677);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;
