--Î÷±±±±Çø ÁúÃÅÕòto»ÆºÓÔ´Í·
--TrapID£ºÎ÷±±±±Çø 1

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(122, 1612, 3328);
		AddTermini(182);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;