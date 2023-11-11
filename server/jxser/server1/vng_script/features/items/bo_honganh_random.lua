--Tói chøa bé trang bÞ Hång ¶nh ngÉu nhiªn  -by thanhld 20160106
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LOG_TITLE = "LOG_EVENT_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	
	local szTitle = ""
	local tbOpt = {}
	szTitle = format("Sö dông vËt phÈm nµy c¸c h¹ nhËn ®­îc mét Bé trang bÞ <color=yellow>Hång ¶nh ngÉu nhiªn thuéc tÝnh <color>.")
	tinsert(tbOpt,format("Ta ®ång ý/#GetAwardHongAnhRandom(%d)",nItemIdx))
	tinsert(tbOpt, "Tho¸t/no")
	if getn(tbOpt) > 0 then		
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function GetAwardHongAnhRandom(nItemIdx)
	if IsMyItem(nItemIdx) ~=1 then
		return
	end	
	if PlayerFunLib:CheckFreeBagCellWH(2, 10, 1, "default") ~= 1  then			
		return
	end
	
	RemoveItemByIndex(nItemIdx)
	local tbHongAnh = {
		{szName="Hång ¶nh ThÈm Viªn UyÓn",tbProp={0,204},nCount=1,nQuality = 1,},
		{szName="Hång ¶nh KiÕm Bµi",tbProp={0,205},nCount=1,nQuality = 1,},
		{szName="Hång ¶nh Môc Tóc	",tbProp={0,206},nCount=1,nQuality = 1,},
		{szName="Hång ¶nh Tô Chiªu",tbProp={0,207},nCount=1,nQuality = 1,},	
	}	
	tbAwardTemplet:Give(tbHongAnh,1,{LOG_TITLE,"Use_TuiQuaHongAnh"})	
	Talk(1,"","Chóc mõng c¸c h¹ nhËn ®­îc bé trang bÞ <color=yellow>Hång ¶nh<color>, tõ nµy giang hå thªm phÇn nÓ phôc!")
end


