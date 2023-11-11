Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

repute_reward_taskid	= 1865;
repute_reward_date_s	= 20081205;
repute_reward_date_e	= 20090104;

function christmas_repute_main()
	local n_dateD	= tonumber(GetLocalDate("%y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	local n_dateW	= tonumber(GetLocalDate("%w"));
	
	if (n_dateW ~= 0 or n_dateH < 12 or n_dateH >= 14) then	-- »î¶¯Ê±¼äÅÐ¶Ï
		Say("LÔ Quan: HiÖn t¹i vÉn ch­a ®Õn thêi gian nhËn th­ëng. Xin mêi c¸c h¹ quay trë l¹i sau.", 0);
		return
	end
	
	if (GetLevel() < 50) then	-- µÈ¼¶ÅÐ¶Ï
		Say("LÔ Quan: §¹i hiÖp vÉn ch­a ®Õn cÊp 50. H·y luyÖn tËp thªm råi nhËn th­ëng nhÐ.", 0);
		return
	end
	
	if (GetRepute() < 450) then
		Say("LÔ Quan: §iÓm danh vong cña c¸c h¹ vÉn ch­a ®ñ 450, kh«ng thÓ nhËn ®­îc phÇn th­ëng nµy.", 0);
		return
	end
	
	if (GetTask(repute_reward_taskid) == n_dateD) then	-- Ò»ÌìÖ»ÄÜÁìÈ¡Ò»´ÎµÄÅÐ¶Ï
		Say("LÔ Quan: H«m nay ®¹i hiÖp ®· nhËn vËt phÈm nµy råi.", 0);
		return
	end
	
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng!",0);
		return
	end
	
	SetTask(repute_reward_taskid, n_dateD);
	local szName 		= "";
	local nItemIndex	= 0;
	if (GetRepute() > 10000) then
		nItemIndex	= AddItem(6, 1, 1838, 1, 0, 0);
		szName	= "B¹ch Kim Béi";		
	elseif (GetRepute() > 3600) then
		nItemIndex	= AddItem(6, 1, 1837, 1, 0, 0);
		szName	= "Hoµng Kim Béi";
	else
		nItemIndex	= AddItem(6, 1, 1836, 1, 0, 0);
		szName	= "B¹ch Ng©n Béi";
	end
	if (ITEM_GetExpiredTime(nItemIndex) == 0) then
		ITEM_SetExpiredTime(nItemIndex,christmas_box_expiredtime);
		SyncItem(nItemIndex);
	end
	Msg2Player(format("Chóc mõng ®¹i hiÖp ®· thu ®­îc 1 %s!", szName));
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",
			"Ho¹t ®éng gi¸ng sinh 2008 —— NhËn Th­ëng Theo CÊp §é Danh Väng",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			szName));
end

function christmas_repute_info()
	Say("LÔ Quan: Ho¹t ®éng nhËn th­ëng theo danh väng ®­îc diÔn ra tõ 05-12-2008 ®Õn 04-01-2009 chñ nhËt hµng tuÇn vµo 12:00 ®Õn 14:00. Trong thêi gian ho¹t ®éng, c¸c vÞ ®ång ®¹o ®Õn NPC LÔ Quan vµ ®èi tho¹i ®Ó nhËn th­ëng. Ng­êi ch¬i ph¶i ®¹t ®¼ng cÊp tõ 50 trë lªn vµ danh väng ph¶i ®¹t 450 míi cã thÓ nhËn ®­îc phÇn quµ t­¬ng øng.", 0);
end