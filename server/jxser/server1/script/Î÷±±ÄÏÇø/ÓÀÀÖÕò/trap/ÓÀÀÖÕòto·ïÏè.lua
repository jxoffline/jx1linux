--Î÷±±ÄÏÇø ÓÀÀÖÕòto·ïÏè¸®
--TrapID£ºÎ÷±±ÄÏÇø 28
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)

if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(1, 1800 ,3603)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1411, 2913)						--×ß³öTrapµã
end

end;
