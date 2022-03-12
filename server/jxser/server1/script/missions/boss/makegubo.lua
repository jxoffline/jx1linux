--¹Å°Ø(566)£¬ÉúÓÚÃ¿Ìì17£º05£¬ÔÚ225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "Cæ B¸ch", 1)
	AddGlobalNews("Nghe nãi Thiªn V­¬ng Bang chñ T¶ sø Cæ B¸ch vµ c¸c ®Çu môc cña Thiªn NhÉn Gi¸o ®· xuÊt hiÖn t¹i Mª Cung sa m¹c (193, 204) §«n Hoµng. ")
end; 