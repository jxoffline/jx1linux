--½­ÄÏÇø ÁúÈª´åtoÂŞÏöÉ½
--Trap ID£º½­ÄÏÇø 5

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(179, 1618, 3292);
		AddTermini(153);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;
