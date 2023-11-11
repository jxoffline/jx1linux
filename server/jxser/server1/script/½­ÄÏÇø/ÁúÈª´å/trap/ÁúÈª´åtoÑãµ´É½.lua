--½­ÄÏÇø ÁúÈª´åtoÑãµ´É½
--Trap ID£º½­ÄÏÇø 7

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(195, 682, 2863);
		AddTermini(156);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;
