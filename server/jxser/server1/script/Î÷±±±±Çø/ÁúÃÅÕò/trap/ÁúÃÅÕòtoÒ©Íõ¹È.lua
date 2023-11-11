--Î÷±±±±Çø ÁúÃÅÕòtoÒ©Íõ¹È
--TrapID£ºÎ÷±±±±Çø 5

function main(sel)
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		SetFightState(1);
		NewWorld(140, 2429, 3731);
		AddTermini(183);
	else
		Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	end
end;