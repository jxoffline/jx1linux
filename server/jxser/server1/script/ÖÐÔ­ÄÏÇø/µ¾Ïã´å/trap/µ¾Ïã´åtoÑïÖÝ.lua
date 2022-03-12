--ÖĞÔ­ÄÏÇø µ¾Ïã´åtoÑïÖİ
--TrapID£ºÖĞÔ­ÄÏÇø 75
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)

if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(80, 1446, 3077)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1911, 3211)						--×ß³öTrapµã
end

end;
