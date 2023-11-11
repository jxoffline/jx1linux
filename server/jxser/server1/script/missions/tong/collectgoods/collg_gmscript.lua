if (not __COLLG_GMSCRIPT_H__) then
	__COLLG_GMSCRIPT_H__ = 1;

function collg_opencellectgoods(nMapID)
	local nMapIndex = SubWorldID2Idx(nMapID);
	if (nMapIndex < 0) then --¼ì²éµØÍ¼
	    return
	end;
	local GAMEMAPID = 828;
	local PREPAREMISSIONID = 44;
	local MISSIONID = 45;
	local GLOBALVALUE = 918;
	
	local OldSubWorld = SubWorld; 
	SubWorld = SubWorldID2Idx(GAMEMAPID);
	CloseMission(MISSIONID);
	
	SubWorld = SubWorldID2Idx(nMapID); --3
	CloseMission(PREPAREMISSIONID);
	
	OpenMission(PREPAREMISSIONID);
	SubWorld = OldSubWorld;
end;
	
end;	--// end of __COLLG_GMSCRIPT_H__