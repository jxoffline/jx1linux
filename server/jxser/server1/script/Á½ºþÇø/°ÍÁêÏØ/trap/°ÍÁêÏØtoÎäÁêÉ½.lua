--Á½ºşÇø °ÍÁêÏØtoÎäÁêÉ½
--TrapID£ºÁ½ºşÇø 81
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)
if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(70, 1608 ,3230)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1334, 3306)						--×ß³öTrapµã
end

AddTermini(47)

end;
