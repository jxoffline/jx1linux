IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â

function main()
	--Msg2Player("´Ë¹¦ÄÜÉÔºó¿ª·Å.¶àĞ»Ö§³Ö!")
	--return 1
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 32400);
	else
		Say("HiÖn t¹i hÖ thèng ®ang cho nh©n ®«i kinh nghiÖm, t¹m thêi kh«ng thÓ sö dông Tu th©n phï.", 0)
		return 1
	end
	return 0
end