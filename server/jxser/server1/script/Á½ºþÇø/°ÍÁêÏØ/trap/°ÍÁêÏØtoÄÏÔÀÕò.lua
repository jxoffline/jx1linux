--Á½ºşÇø °ÍÁêÏØtoÄÏÔÀÕò
--TrapID£ºÁ½ºşÇø 80
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)
if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(54, 1471 ,2992)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1808, 3456)						--×ß³öTrapµã
end

end;
