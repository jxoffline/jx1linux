Include([[\script\item\chrismas\chrismasitem.lua]]);
Include([[\script\lib\coordinate.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		local OldSubWorld = SubWorld;
		local nBeginMapID = GetMissionV(TAB_ACTION[tabidx][6]);
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		
		local nMapId = nBeginMapID + nGroupId - 1;
		nMapId = mod(nMapId, TAB_ACTION[tabidx][9]) + 1;
		local PosX, PosY = getadatatow(TAB_ACTION[tabidx][8], 8 + 8 * nMapId, 15 + 8 * nMapId);
		SetPos(floor(PosX / 32), floor(PosY / 32));
		
		Msg2Player("<#> B¹n sö dông 1 <color=0xB5FDD7>§én §Þa Phï<color>, nh¶y ®Õn vÞ trÝ kh¸c trong b¶n ®å.");
		SubWorld = OldSubWorld;
		return 0;
	end;
	
	------²éÑ¯ÐÂ±í
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --ÐÂ±íÀïÓÐ¶¨Òå
		local tbRace = RACE_TAB_ACTION[tabidx]
		local tbPosList = {}
		
		if type(tbRace.pPosList) == "function" then
			tbPosList = tbRace:pPosList()
		elseif type(tbRace.pPosList) == "string" then
			
			tbPosList[1] = {}
			tbPosList[1][1], tbPosList[1][2] = getadata(tbRace.pPosList)
		end
		
		local nRandId = random(1, getn(tbPosList))
		SetPos(floor(tbPosList[nRandId][1]/ 32), floor(tbPosList[nRandId][2] / 32));
		Msg2Player("<#> B¹n sö dông 1 <color=0xB5FDD7>§én §Þa Phï<color>, nh¶y ®Õn vÞ trÝ kh¸c trong b¶n ®å.");
		return 0;
	end
	Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
	return 1
	
	
end;