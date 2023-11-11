--ÖĞÔ­±±Çø ÖìÏÉÕòtoãê¾©
--TrapID£ºÖĞÔ­±±Çø 59
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)

if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	SetFightState(1);
	NewWorld(37, 1945, 3855)
else
	Talk(1,"","Phİa tr­íc nguy hiÓm! Xin h·y quay vÒ rÌn luyÖn thªm!")
	SetPos(1506, 2860)						--×ß³öTrapµã
end

end;
