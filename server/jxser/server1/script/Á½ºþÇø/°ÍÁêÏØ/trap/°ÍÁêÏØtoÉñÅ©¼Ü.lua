--Á½ºşÇø °ÍÁêÏØtoÉñÅ©¼Ü
--TrapID£ºÁ½ºşÇø 83
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)
if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(74, 2040 ,3259)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1338, 3353)						--×ß³öTrapµã
end

AddTermini(46)

end;
