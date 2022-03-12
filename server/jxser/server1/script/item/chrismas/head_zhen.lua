--SKILLTYPE
--SKILLLEVEL
--SKILLNAME
--SKILLDESCRIBE

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("B¹n ®· sö dông mét <color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		Msg2MSGroup(TAB_ACTION[tabidx][2], "<color=0xB5FDD7>"..GetName().."<color> sö dông <color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end;
	------²éÑ¯ÐÂ±í
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --ÐÂ±íÀïÓÐ¶¨Òå
		local tbRace = RACE_TAB_ACTION[tabidx]
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("B¹n ®· sö dông mét <color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = 0
		if type(tbRace.GetGroupId) == "function" then
			nGroupId = tbRace:GetGroupId()
		end
		Msg2MSGroup(tbRace.nMissionId, "<color=0xB5FDD7>"..GetName().."<color> sö dông <color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end
	Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
	return 1
end;
