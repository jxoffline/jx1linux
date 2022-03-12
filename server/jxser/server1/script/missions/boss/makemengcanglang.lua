--ÃÏ²ÔÀË(583)£¬ÉúÓÚÃ¿Ìì22£º31£¬ÔÚ204,1626,3379
function main()
	mapindex = SubWorldID2Idx(204)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 583
	bosslvl = 95
	posx = 1626*32
	posy = 3379*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "M¹nh Th­¬ng L­¬ng", 1)
	AddGlobalNews("Cã ng­êi nh×n thÊy C¸i bang ChÊp ph¸p ch­ëng l·o M¹nh Th­¬ng L­¬ng t¹i Phi thiªn ®éng (202, 210) ®ang truy s¸t ph¶n ®å M¹nh ViÔn Tµi ")
end; 