--ÍêÑÕÑ©ÒÂ(564)£¬ÉúÓÚÃ¿Ìì21£º05£¬ÔÚ227,1504,3144
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 564
	bosslvl = 95
	posx = 1504*32
	posy = 3144*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "Hoµn Nhan TuyÕt Y", 1)
	AddGlobalNews("Nghe nãi ThÊt c«ng chóa cña Kim quèc Hoµn Nhan TuyÕt Y ®· truy ®uæi theo §oan Méc DuÖ ®Õn Mª Cung ë sa m¹c §«n Hoµng cña n­íc T©y H¹ (188, 196) . ")
end; 