-- Ã÷ÔÂÕò·µ»Ø³ÇÊÐµØÍ¼
-- lixin 2005-9-6

tab_cityid = {
{520,1,1651,3279},
{521,11,3183,5180},
{522,37,1704,3222},
{523,78,1596,3379},
{524,80,1718,3201},
{525,162,1697,3277},
{526,176,1695,3294},
}



function main()
	local nCount=getn(tab_cityid)
	local task1569=GetTask(1569)
	
	if( task1569 ~= 0 ) then
		Say("B¸nh cña ng­¬i vÉn ch­a hoµn thµnh. Hay lµ h·y ®i t×m Thî b¸nh tr­íc ®i råi rêi khái ®©y sau!",2,"§õng c¶n! Ta ph¶i ®i ®©y!/back_town","§Ó ta suy nghÜ l¹i ®·!/back_mingyue");
		return
	end
	for i=1,nCount do
		if( SubWorldIdx2ID( SubWorld ) == tab_cityid[i][1] ) then
				NewWorld(tab_cityid[i][2],tab_cityid[i][3],tab_cityid[i][4]);
		end;
	end;	
end
	
function back_town()
	local nCount=getn(tab_cityid)
	for i=1,nCount do
			if( SubWorldIdx2ID( SubWorld ) == tab_cityid[i][1] ) then
				NewWorld(tab_cityid[i][2],tab_cityid[i][3],tab_cityid[i][4]);
			end;
	end;
end;

function back_mingyue()
	local nCount=getn(tab_cityid)
	for i=1,nCount do
			if( SubWorldIdx2ID( SubWorld ) == tab_cityid[i][1] ) then
				NewWorld(tab_cityid[i][1],1565,3156);
			end;
	end;
end;