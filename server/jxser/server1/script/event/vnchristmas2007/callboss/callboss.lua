Include("\\script\\event\\vnchristmas2007\\head.lua")

function xmars2007_callboss(nmapid)
	local worldsub = SubWorldID2Idx(tonumber(nmapid))
	if worldsub < 0 then
		return
	end
	local nmapidw = tonumber(nmapid)
	local tbitem = tb_xmas2007_bossmap[nmapidw]
	local mappos = tbitem[random(1,getn(tbitem))]
	local nidx = xmas2007_callnpc(1,nmapidw,mappos)	--ÕÙ»½Ê¥µ®Ê÷	
	SetNpcDeathScript(nidx,"\\script\\event\\vnchristmas2007\\callboss\\npcdead.lua")
	local mappositem = mappos
	mappositem[1] = mappos[1] + 1
	xmas2007_callnpc(2,nmapidw,mappositem)	--ÕÙ»½°¢É½
	mappositem[1] = mappos[1] - 1
	xmas2007_callnpc(3,nmapidw,mappos)	--ÕÙ»½°¢ÐÛ
	AddGlobalNews(format("[Ho¹t ®éng gi¸ng sinh] C©y gi¸ng sinh thÇn bÝ do hai thiªn thÇn gi¸ng sinh canh gi÷ ®· b¾t ®Çu xuÊt hiÖn, h·y mau ®i t×m [%s] xem, ®¸nh b¹i hä sÏ nhËn ®­îc nh÷ng kú tr©n dÞ b¶o.",tb_xmas_city[nmapidw]))
end

function xmas2007_callnpc(ni,nmapidw,mappos)
	local worldsub = SubWorldID2Idx(nmapidw)
	local bossid = tb_xmas_boss[ni][1]
	local bosslv = tb_xmas_boss[ni][2]
	local bossseries = tb_xmas_boss[ni][3]
	local bossname = tb_xmas_boss[ni][4]
	if bossseries < 0 or bossseries > 4 then
		bossseries = random(0,4)
	end
	local nidx = AddNpcEx(bossid,bosslv,bossseries,worldsub,mappos[1]*32,mappos[2]*32,1,bossname, 1) 
	if nidx <= 0 then
		print("Ho¹t ®éng gäi Boss thÊt b¹i")
	end
	return nidx
end