--

tb_xmas2007_city = 
{
	[1] 	= "Ph­îng T­êng",
	[37] 	= "BiÖn Kinh",
	[80]  = "D­¬ng Ch©u",
	[11]  = "Thµnh §«",
	[78]  = "T­¬ng D­¬ng",
	[176] = "L©m An",
	[162]	= "§¹i Lı",
	[321]	= "Tr­êng B¹ch S¬n Nam",
	[322]	= "Tr­êng B¹ch S¬n B¾c",
}
tb_xmas2007_strattime = {8,15,22}
function YDBZ_get_randomlist(item,nmax)
	local ni
	for ni = 1,nmax do
		local p = random(1,nmax)
		item[ni],item[p] = item[p],item[ni]
	end
	return item
end

function xmas2007_findgirl_returnmin()
	local nmin = tonumber(date("%M"))
	local nhour = tonumber(date("%H"))
	local nsign = 0
	for ni,ntime in tb_xmas2007_strattime do 
		if nhour == ntime then
			nsign = 1
			break
		end
	end
	if nsign == 1 then
		local ntasknim = 0
		if nmin >=0 and nmin < 20 then
			ntasknim = 20
		elseif nmin >=20 and nmin < 40 then
			ntasknim = 40
		elseif nmin >=40 and nmin < 60 then
			ntasknim = 60	
		end	
		return ntasknim
	else
		return 0
	end
		return 0
end