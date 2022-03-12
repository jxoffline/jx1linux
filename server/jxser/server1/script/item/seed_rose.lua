--Ãµ¹åÖÖ×ÓÊ¹ÓÃºó¿ÉÒÔcall³öÒ»¸öÃµ¹åÊ¥µ®Ê÷
--renbin


IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â
Include("\\script\\global\\forbidmap.lua")

function main()
	
	if ( GetFightState() == 1 ) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("§Êt ®ai ë ®©y kh«ng thİch hîp gieo trång, ra ngoµi rõng trång thö xem!")
			return 1
		end
		local posx = x*32
		local posy = y*32
		bossid = 608
		bosslvl = 1
		i = random (1,5) - 1
		AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."C©y th«ng hoa hång",1)
--		CallNpc(i,608 + i,10,GetName().."µÄÃµ¹åÊ¥µ®Ê÷",0,1)
		Msg2Player("B¹n ®· trång thµnh 1 c©y Hoa Hång Gi¸ng Sinh! H·y mau l¾c nã ®Ó nhËn ®­îc b¶o vËt")
		return 0
	else
		Msg2Player("C¶m ¬n b¹n ®· nu«i d­ìng t«i! Nh­ng t«i chØ cã thÓ sèng ®­îc ngoµi ®ång mµ th«i! Xin h·y mang t«i ®i!")
		return 1
	end
		
end