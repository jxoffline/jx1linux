--Î÷ÄÏÄÏÇø Ê¯¹ÄÕòto´óÀí¸®
--Trap ID£ºÎ÷ÄÏÄÏÇø 2

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(162, 1691, 3517);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;
