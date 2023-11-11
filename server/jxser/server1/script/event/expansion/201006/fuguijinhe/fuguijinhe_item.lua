Include("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua")

-- return 1: ²»É¾³ıµ±Ç°µÄÎïÆ·£¬ return 0: É¾³ıµ±Ç°ÎïÆ·
-- §iÒu ChØnh Phó Quı CÈm Hép - Created by AnhHH  20110919
tbMapList =
{
	[11]	=	1,	
	[1]		=	1,	
	[37]	=	1,	
	[176]	=	1,	
	[162]	=	1,	
	[78]	=	1,	
	[80]	=	1,	
}
function main(itemidx)
	-- §iÒu ChØnh Phó Quı CÈm Hép - Created by AnhHH  20110919
	if (IsCityMap() ~=1) then
		Talk(1, "", "Khu vùc thµnh thŞ phi chiÕn ®Êu míi cã thÓ sö dông")
		return 1
	end

	if (tbBetInfo:IsActive() ~= 1 or tbBetInfo:UseJinhe() ~= 1) then
		return 1;
	else
		return 0;
	end
end    

	-- §iÒu ChØnh Phó Quı CÈm Hép - Created by AnhHH  20110919
function IsCityMap()
 	local nMapID =GetWorldPos()
	if (tbMapList[nMapID] == 1 and GetFightState() == 0) then
		return 1
	else
		return 0
	end
end       
                                                  