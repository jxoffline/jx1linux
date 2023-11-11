if (not _H_STARTUP_) then
	_H_STARTUP_ = 1;
Include([[\script\missions\libfestival\head.lua]]);

function startmission()
    local nMapIndex = SubWorldID2Idx(CO_MAPID[1]);
    if (nMapIndex < 0) then --¼ì²éµØÍ¼
        return
    end;
    
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[2]);
	CloseMission(CO_MISSIONID);
	
	SubWorld = nMapIndex;
	CloseMission(CO_PREPAREMISSIONID);
	OpenMission(CO_PREPAREMISSIONID);
	SubWorld = OldSubWorld;
	startmission_add();
end;

end;	--	end of _H_STARTUP_