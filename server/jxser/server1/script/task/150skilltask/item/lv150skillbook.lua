
sbook_150skill_list = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
		[10] = {1369,1384 },
		[11] = {1983, 1985}, -- Vu hon
}

sbook_factstep_list = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10] = 1,
		[11] = 1,
	}

function main()
	local TSK_LV150_SKILL = 2885
	local SBOOK_150SKILL_TASKSTATE = 14
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Msg2Player("<color=yellow>Ng­¬i vÉn ch­a gia nhËp m«n ph¸i nµo, kh«ng thÓ häc yÕu quyÕt nµy! <color>");
		return 1
	end
	
	if GetLevel() < 150 then
		Msg2Player("<color=yellow>§¼ng cÊp cña ng­¬i thÊp h¬n 150, kh«ng thÓ häc yÕu quyÕt nµy! <color>");
		return 1
	end
	
	local tb150Skill = sbook_150skill_list[nFact]
	local szMsg = ""
	local nFlag = 0
	for i = 1, getn(tb150Skill) do
		--nFlag = 0
		local nSkillId = tb150Skill[i]
		if (HaveMagic(nSkillId) == -1) then		-- ±ØÐëÃ»ÓÐ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			if nSkillId == 1110 then
				AddMagic(nSkillId, 0)
			else
				AddMagic(nSkillId, 1)
			end
			szMsg = format("%s Ng­¬i häc ®­îc <color=yellow>%s<color>\n", szMsg, GetSkillName(nSkillId))
		else
			szMsg = format("%s Ng­¬i ®· häc <color=yellow>%s<color> råi.\n", szMsg, GetSkillName(nSkillId))
		end
	end
	SetTask(TSK_LV150_SKILL, SBOOK_150SKILL_TASKSTATE*100+sbook_factstep_list[nFact])
	if szMsg == "" then
		--Fix lçi text - Modified By DinhHQ - 20111025
		szMsg = "Ng­¬i ®· nghiªn cøu l·nh héi ®­îc vâ häc, lµ mét b­íc ®ét ph¸ míi t­ëng chõng nh­ kh«ng thÓ ®¹t ®­îc"
		Msg2Player(szMsg)
		return 1
	end
	Msg2Player(szMsg)
end