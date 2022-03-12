if (not __DIS_GMSCRIPT_H__) then
	__DIS_GMSCRIPT_H__ = 1;

function tong_opendisciple(nMapID)
    local nMapIndex = SubWorldID2Idx(nMapID);
    if (nMapIndex < 0) then --¼ì²éµØÍ¼
        return
    end;
    local GAMEMAPID = 822;
    local PREPAREMISSIONID = 37;
    local MISSIONID = 38;
    local GLOBALVALUE = 852;
    
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(GAMEMAPID);
	CloseMission(MISSIONID);
	
	SubWorld = nMapIndex;
	CloseMission(PREPAREMISSIONID);

	OpenMission(PREPAREMISSIONID);
	SubWorld = OldSubWorld;
end;
	
end;	--// end of __DIS_GMSCRIPT_H__