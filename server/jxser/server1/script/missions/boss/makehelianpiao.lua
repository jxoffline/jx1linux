--ºÎÁ¯Æ®(568)£¬ÉúÓÚÃ¿Ìì16£º05£¬ÔÚ19,3248,4278
function main()
	mapindex = SubWorldID2Idx(19)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 568
	bosslvl = 95
	posx = 3248*32
	posy = 4278*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "Hµ Linh Phiªu", 1)
	AddGlobalNews("Cã ng­êi nh×n thÊy ThÊt Hån L¹c Ph¸ch Hµ Linh Phiªu ®· xuÊt hiÖn ë T©y nam (406, 267) KiÕm C¸c. ")
end; 