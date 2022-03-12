VNXMAS_SNOW_MAXEXP = 300000000;

TSK_VNXMAS_EXPLIMIT = 2520;

TB_SNOWMAN_ID = {
	[1322] = "snowman_green",
	[1323] = "snowman_red",
	[1324] = "snowman_normal",
}

function snowman_green()
	AddSkillState(440, 1, 1, 32400);
	Msg2Player("B¹n ®­îc nh©n ®«i kinh nghiÖm trong 30 phót.");
end;

function snowman_red()
	AddSkillState(440, 1, 1, 64800);
	Msg2Player("B¹n ®­îc nh©n ®«i kinh nghiÖm trong 60 phót.");
end;

function snowman_normal()
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (nMemCount == 0 ) then
		AddSkillState(440, 1, 1, 64800);
		Msg2Player("B¹n ®­îc nh©n ®«i kinh nghiÖm trong 60 phót.");
		return 0
	end

	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		AddSkillState(440, 1, 1, 64800);
		Msg2Player("B¹n ®­îc nh©n ®«i kinh nghiÖm trong 60 phót.");
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;

function isAddExp_Xmasgift(nExp)
	local nCurExp = GetTask(TSK_VNXMAS_EXPLIMIT);
	local nAddExp = nExp;
	if (nCurExp+nExp > VNXMAS_SNOW_MAXEXP) then
		nAddExp = VNXMAS_SNOW_MAXEXP - nCurExp;
	end;
	if (nAddExp <= 0) then
		return 0;
	else
		SetTask(TSK_VNXMAS_EXPLIMIT, nCurExp+nAddExp);
		AddOwnExp(nAddExp);
		return 1;
	end;
end;