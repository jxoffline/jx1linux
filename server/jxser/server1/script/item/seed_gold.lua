--»Æ½ğÖÖ×ÓÊ¹ÓÃºó¿ÉÒÔcall³öÒ»¸ö»Æ½ğÊ¥µ®Ê÷
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
		bossid = 618
		bosslvl = 1
		i = random (1,5) - 1
		AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."C©y th«ng Hoµng Kim",1)
--		CallNpc(i,bossid + i,bosslvl,GetName().."µÄ»Æ½ğÊ¥µ®Ê÷",0,1)
		Msg2Player("B¹n ®· trång thµnh c«ng 1 c©y Hoµng Kim Gi¸ng Sinh!H·y mau l¾c nã ®Ó nhËn c¸c b¶o vËt")
		return 0
	else
		Msg2Player("C¶m ¬n b¹n ®· nu«i d­ìng t«i! Nh­ng t«i chØ cã thÓ sèng ®­îc ngoµi ®ång mµ th«i! Xin h·y mang t«i ®i!")
		return 1
	end
		
end