maptab={};
maptab[1]=209;
maptab[2]=210;
maptab[3]=211;

function main()
	mapcount = getn(maptab)
	for i = 1, mapcount do 
		idx = SubWorldID2Idx(maptab[i]);
		if (idx ~= -1) then 
			SubWorld = idx;
			CloseMission(2);
			CloseMission(4);
			OpenMission(4);
		end;
	end

end;
