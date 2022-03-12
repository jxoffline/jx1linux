Include("\\script\\event\\vnchristmas2007\\head.lua")

function OnDeath(index)
	local nSubWorld = SubWorld
	local nallrate = tbxmas2007_callboss_item[1]
	SubWorld = world
	for ni = 2, getn(tbxmas2007_callboss_item) do
		local tbitem = tbxmas2007_callboss_item[ni]
		for nj = 1,tbitem[3] do 
			local np = random(1,nallrate)
			if tbitem[1] > np then 
				tbxmas2007_callboss_award(index,tbitem[2])
				xmas2007_sdl_writeLog("Ho¹t ®éng t×m c©y gi¸ng sinh",format("NhËn ®­îc %s",tbitem[4]))
			end
		end
	end
	SubWorld = nSubWorld
end

function tbxmas2007_callboss_award(index,tbitem)
	local nl = getn(tbitem)
	local x, y,world = GetNpcPos(index);
	if nl == 2 then
			DropItemEx(world,x,y,-1,4,-1,1,tbitem[1],tbitem[2],0,0,0,0,0)
	elseif nl == 3 then
			DropItem(world, x, y, -1, tbitem[1], tbitem[2], tbitem[3], 1, 0, 0, 0, 0, 0, 0, 0, 0);
	end
end