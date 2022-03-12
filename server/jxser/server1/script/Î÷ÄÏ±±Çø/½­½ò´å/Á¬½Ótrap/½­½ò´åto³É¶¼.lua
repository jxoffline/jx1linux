--Î÷ÄÏ±±Çø ½­½ò´åto³É¶¼
--Trap ID£ºÎ÷ÄÏ±±Çø 55
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)

if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(11, 3407, 5295)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(3402, 6019)						--×ß³öTrapµã
end

end;
