Include("\\script\\activitysys\\config\\2\\extend.lua")
Include("\\script\\activitysys\\config\\2\\fairy_pos.lua")

tbWay = 
{
	[1] = "ß´ng",
	[2] = "Nam",
	[3] = "T©y",
	[4] = "bæc ",
}
	
function main()
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nStartTime = 1900
	local nEndTime = 2400
	nTime = mod(nTime,2400)
	if nTime < nStartTime and nTime > nEndTime then
		Talk(1, "", format("Tinh Linh Th∏nh ß∂n v…n ch≠a xu t hi÷n, Æπi hi÷p h∑y ki™n nh…n chÍ ÆÓi!"))
		return
	end
	if tbFairyInfo.nCityMapID == nil and tbFairyInfo.nCityPos == nil then
		Talk(1, "", format("Tinh Linh Th∏nh ß∂n v…n ch≠a xu t hi÷n, Æπi hi÷p h∑y ki™n nh…n chÍ ÆÓi!"))
		return
	end
	local szCityName = %FAIRY_MAP[tbFairyInfo.nCityMapID].szCity

	local nWay = ceil(tbFairyInfo.nCityPos/3)
	local szWay = tbWay[nWay]
	Say( format("T≠¨ng truy“n Tinh Linh Th∏nh ß∂n xu t hi÷n <color=red>%s tπi %s h≠Ìng <color>, Æπi hi÷p h∑y nhanh ch„ng Æ’n Æ„ nhÀn ph«n th≠Îng nh–. MÁi l«n xu t hi÷n chÿ cho <color=yellow>%d<color> l«n ph«n th≠Îng, mÁi ngµy mÁi ng≠Íi chÿ c„ th” nhÀn <color=yellow>%d<color> l«n ph«n th≠Îng phong phÛ", szCityName, szWay , %nFariySurvivalCount, %MAX_CLICK_FAIRY), 1, "ß„ng/OnCancel")

end