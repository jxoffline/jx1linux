--À¶ÒÁÒÁ(582)£¬ÉúÓÚÃ¿Ìì21£º31£¬ÔÚ181,1636,3073
function main()
	mapindex = SubWorldID2Idx(181)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 582
	bosslvl = 95
	posx = 1636*32
	posy = 3073*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "Lam Y Y", 1)
	AddGlobalNews("Nghe nãi Ngò §éc Gi¸o Chñ H¾c DiÖn Lang Qu©n vµ n÷ Lam Y Y ®ang luyÖn c«ng trong (204, 191) L­ìng Thñy ®éng. ")
end; 