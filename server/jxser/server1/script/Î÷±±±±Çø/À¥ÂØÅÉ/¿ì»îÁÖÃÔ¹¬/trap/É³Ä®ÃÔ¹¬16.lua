--Î÷±±±±Çø ¿ì»îÁÖtoÉ³Ä®ÃÔ¹¬
--TrapID£ºÉ³Ä®ÃÔ¹¬16

function main(sel)
	i = random(0,2)
	if (GetLevel() >= 80) then
		SetFightState(1);
		AddTermini(195);
		if (i == 0) then 
			NewWorld(224,1620,3216)
		elseif (i == 1) then 
			NewWorld(224,1594,3166)
		else
			NewWorld(224,1622,3144)
		end

	else
		Say("Sa m¹c thËt sù rÊt nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!",1,"Quay l¹i rõng Kho¸i Ho¹t. /no")
		SetPos(1716,3144)
	end
end;

function no()
end
