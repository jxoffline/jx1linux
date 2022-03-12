--Méc nh©n lÖnh bµi - Created by DinhHQ - 20110510
IncludeLib("SETTING"); 
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				 
									
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		
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
	
	if (n_cur_date ~= n_my_date) then						
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
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."Méc nh©n",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, 10)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("Méc nh©n ®· xuÊt hiÖn, h·y mau ®i luyÖn tËp.")			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		
		end
		return 0
	else
		Msg2Player("Méc nh©n chØ cã thÓ sö dông ë khu vùc chiÕn ®Êu.")
		return 1
	end
end