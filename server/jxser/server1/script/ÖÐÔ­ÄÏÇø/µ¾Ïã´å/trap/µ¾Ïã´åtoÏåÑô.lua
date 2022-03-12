--ÖĞÔ­ÄÏÇø µ¾Ïã´åtoÏåÑô
--TrapID£ºÖĞÔ­ÄÏÇø 73
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)

if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(78, 1799, 3425)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1335, 3397)						--×ß³öTrapµã
end

end;
