if (not __TONG_SF_GMSCRIPT_H__) then
	__TONG_SF_GMSCRIPT_H__ = 1;
	
function tong_openspringfestival(nMapID)
    local nMapIndex = SubWorldID2Idx(nMapID);
    if (nMapIndex < 0) then --¼ì²éµØÍ¼
        return
    end;
    local GAMEMAPID = 824;
    local PREPAREMISSIONID = 39;
    local MISSIONID = 40;
    local GLOBALVALUE = 853;
    
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(GAMEMAPID);
	CloseMission(MISSIONID);
	
	SubWorld = nMapIndex;
	CloseMission(PREPAREMISSIONID);
	
	OpenMission(PREPAREMISSIONID);
	SubWorld = OldSubWorld;
end;
	
end;	--// end of __TONG_SF_GMSCRIPT_H__