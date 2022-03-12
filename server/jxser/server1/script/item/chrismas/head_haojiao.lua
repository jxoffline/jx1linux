--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL2
--SKILLLEVEL3
--SKILLLEVEL41
--SKILLLEVEL42
--ITEMNAME
--ITEMDFFECT

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		local i;
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		if (TAB_ACTION[tabidx][5][1] == 1) then
			nGroupId = getgroupid(nGroupId, TAB_ACTION[tabidx][5][2])
		end;
		
		local OldPlayer = PlayerIndex;
		local OldName = GetName();
		local idx = 0;
		local pidx;
		for i = 1, TAB_ACTION[tabidx][4] + 5 do
			idx, pidx = GetNextPlayer(TAB_ACTION[tabidx][2], idx, nGroupId);
			
			if (pidx > 0 and pidx ~= OldPlayer) then	--Ñ¡Ôñ³ýÍæ¼ÒÍâµÄËùÓÐ¶ÔÊÖ£»
				PlayerIndex = pidx;
				AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42);
				Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color> sö dông <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT)
			end;
			
			if (0 == idx) then
				break;
			end;
		end;
		PlayerIndex = OldPlayer;
		Msg2Player("<#> B¹n ®· sö dông mét <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT);
		return 0;
	end;
	------²éÑ¯ÐÂ±í
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --ÐÂ±íÀïÓÐ¶¨Òå
		local tbRace = RACE_TAB_ACTION[tabidx]
		local nGroupId = 0
		if type(tbRace.GetGroupId) == "function" then
			nGroupId = tbRace:GetGroupId()
		end
		local idx, pidx = 0, 0;
		local nPlayerCount = GetMSPlayerCount(tbRace.nMissionId, nGroupId)
		for i = 1, nPlayerCount do
			idx, pidx = GetNextPlayer(tbRace.nMissionId, idx, nGroupId);
			if (pidx > 0 and pidx ~= PlayerIndex) then
				doFunByPlayer(pidx , AddSkillState, SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42);
				doFunByPlayer(pidx, Msg2Player, "<#><color=0xB5FDD7>"..GetName().."<color> sö dông <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT)
			end;
			
			if (idx == 0) then
				break;
			end;
		end
		Msg2Player("<#> B¹n ®· sö dông mét <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT);
		return 0;
	end
	
	--×îºó¶¼²»ÄÜÊ¹ÓÃ
	Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
	return 1
end;