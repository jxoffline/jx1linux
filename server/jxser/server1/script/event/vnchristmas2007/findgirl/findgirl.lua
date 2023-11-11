Include("\\script\\event\\vnchristmas2007\\head.lua")

function xmars2007_findgirl(ngirl,nmapid)
	if tonumber(ngirl) == 1 then
		for nmid,szname in tb_xmas_city do
			nSubWorld = SubWorldID2Idx(nmid)
			if nSubWorld >= 0 then
				ClearMapNpcWithName(nmid,"§«ng Nhi")
				ClearMapNpcWithName(nmid,"B¹ch Nhi")
				ClearMapNpcWithName(nmid,"TuyÕt Nhi")
			end
		end
	end
	SetGlbValue(xmas2007_findgirl_gblvalue_taskID,1)
	local worldsub = SubWorldID2Idx(tonumber(nmapid))
	if worldsub < 0 then
		return
	end
	local nmapidw = tonumber(nmapid)
	local tbitem = tb_xmas2007_bossmap[nmapidw]
	local mappos = tbitem[random(1,getn(tbitem))]
	xmas2007_callgirl(tonumber(ngirl),nmapidw,mappos)	--ÕÙ»½girl
	
end

function xmas2007_callgirl(ni,nmapidw,mappos)
	local worldsub = SubWorldID2Idx(nmapidw)
	local bossid = tb_xmas_girl[ni][1]
	local bosslv = tb_xmas_girl[ni][2]
	local bossseries = tb_xmas_girl[ni][3]
	local bossname = tb_xmas_girl[ni][4]
	if bossseries < 0 or bossseries > 4 then
		bossseries = random(0,4)
	end
	--print(nmapidw,mappos[1],mappos[2])
	local nidx = AddNpcEx(bossid,bosslv,bossseries,worldsub,mappos[1]*32,mappos[2]*32,1,bossname, 1) 
	if nidx <= 0 then
		print("Ho¹t ®éng truy t×m thiÕu n÷ thÇn bÝ thÊt b¹i")
	else
		SetNpcParam(nidx,1,ni)
		SetNpcParam(nidx,2,0)
		SetNpcScript(nidx,"\\script\\event\\vnchristmas2007\\findgirl\\girlmain.lua")
	end
end