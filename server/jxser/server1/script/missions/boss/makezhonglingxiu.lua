--ÖÓÁéĞã(567)£¬ÉúÓÚÃ¿Ìì00£º05£¬ÔÚ224,1889,2973
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 567
	bosslvl = 95
	posx = 1889*32
	posy = 2973*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "Chung Linh Tó ", 1)
	AddGlobalNews("Cã ng­êi nh×n thÊy Thóy Yªn m«n Lª Hoa sø gi¶ Chung Linh Tó t¹i sa m¹c §«n Hoµng (236, 185) giÕt chÕt v« sè ng­êi cña Thiªn NhÉn Gi¸o. ")
end; 