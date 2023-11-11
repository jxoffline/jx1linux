--½­ÄÏÇø ÁúÈª´åtoÎäÒÄÉ½
--Trap ID£º½­ÄÏÇø 9

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(193, 1937, 2851);
		AddTermini(154);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;
