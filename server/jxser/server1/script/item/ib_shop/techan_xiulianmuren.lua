-- ÎÄ¼şÃû¡¡£ºtechan_xiulianmuren.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£ºÌØÊâµÄĞŞÁ¶Ä¾ÈË£¬ÄÜ¹»µş¼Ó£¬¾ùÎª10¼¶µÄÊÔÁ··»Ä¾ÈË		IB shop µ÷Õû
-- ´´½¨Ê±¼ä£º2011-07-15 17:32:35

IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				-- ¼ÇÂ¼×îºóÒ»´ÎÊ¹ÓÃÈÕÆÚByte1
									-- ¼ÇÂ¼×îºóÈÕÆÚÊ¹ÓÃµÄ´ÎÊıByte2
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--ÌØÊâµØÍ¼½ûÓÃ
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end

function main(nItemIndex)
	local n_cur_date = tonumber(GetLocalDate("%d"));
	local n_my_value = GetTask(TSK_MAXCOUNT);
	local n_my_date = GetByte(n_my_value, 1);
	local n_my_count = GetByte(n_my_value, 2);
	
	if (n_cur_date ~= n_my_date) then						-- ×îºóÊ¹ÓÃÊ±²»ÊÇ½ñÌì£¬³õÊ¼»¯Ê¹ÓÃ´ÎÊı¼ÆÊı
		n_my_date =  n_cur_date;
		n_my_value = SetByte(n_my_value, 1, n_cur_date);
		
		n_my_count = 0;
		n_my_value = SetByte(n_my_value, 2, 0);
		
		SetTask(TSK_MAXCOUNT, n_my_value);
	end
	
	
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh«ng thÓ sö dông vËt phÈm nµy t¹i ®©y.")
		return 1
	end
	
	
	
	if (n_my_count >= 100) then
		Msg2Player("Mçi ng­êi ch¬i mçi ngµy chØ ®­îc sö dông nhiÒu nhÊt 100 Tu luyÖn méc nh©n.");
		return 1;
	end
	
	if (GetFightState() == 1) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("ë ®©y lµm sao mµ tËp luyÖn ®­îc chø? H·y ra bªn ngoµi kia.")
			return 1
		end
	--	local nParam1 = GetItemParam(nItemIndex, 2)	--¹ºÂòÄ¾ÈËÊ±×÷·»µÄÊ¹ÓÃµÈ¼¶
		local nParam1 = 10  -- ÌØÊâµÄÄ¾ÈË£¬Ê¹ÓÃµÈ¼¶¾ùÎª10¼¶
		--local nParam2 = GetItemParam(nItemIndex, 3)
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		--local key = random(1,100000)
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."Méc nh©n",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, nParam1)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("Méc nh©n ®· xuÊt hiÖn, h·y mau ®i luyÖn tËp.")
			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		-- ½ñÌìÊ¹ÓÃ´ÎÊı¼ÆÊı
			--SetTask(1740, key)
		end
		return 0
	else
		Msg2Player("Méc nh©n chØ cã thÓ sö dông ë khu vùc chiÕn ®Êu.")
		return 1
	end
end