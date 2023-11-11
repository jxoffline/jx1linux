if(not KTABFILE_HEAD) then
	Include "/script/class/ktabfile.lua"
end

if(not KBONUS_HEAD) then
	Include "/script/class/kbonus.lua"
end

if(not MEM_HEAD) then
	Include "/script/lib/mem.lua"
end

ChengShi_GiftsTabfile = new(KTabFile,"/settings/item/chengshidahongbao.txt","CHENGSHI_GIFTS")
ChengShi_BonusHongbao = new(KBonus)
print(ChengShi_GiftsTabfile:getRow())
for i=1,ChengShi_GiftsTabfile:getRow() do
	local name = ChengShi_GiftsTabfile:getCell("Name",i)
	local proba = ChengShi_GiftsTabfile:getCell("Proba",i)
	local costly = ChengShi_GiftsTabfile:getCell("Costly",i)
	local msg = ChengShi_GiftsTabfile:getCell("Msg",i)
	if(msg == "") then msg = nil end
	local type = ChengShi_GiftsTabfile:getCell("Type",i)
	local g = ChengShi_GiftsTabfile:getCell("Genre",i)
	local d = ChengShi_GiftsTabfile:getCell("Detail",i)
	local p = ChengShi_GiftsTabfile:getCell("Particular",i)
	local lvl = ChengShi_GiftsTabfile:getCell("Level",i)
	local serise = ChengShi_GiftsTabfile:getCell("Serise",i)
	local log = ChengShi_GiftsTabfile:getCell("Log",i)
	local p1 = ChengShi_GiftsTabfile:getCell("Param1",i)
	if(p1=="") then p1=nil end
	local p2 = ChengShi_GiftsTabfile:getCell("Param2",i)
	if(p2=="") then p2=nil end
	local p3 = ChengShi_GiftsTabfile:getCell("Param3",i)
	if(p3=="") then p3=nil end
	local p4 = ChengShi_GiftsTabfile:getCell("Param4",i)
	if(p4=="") then p4=nil end
	local p5 = ChengShi_GiftsTabfile:getCell("Param5",i)
	if(p5=="") then p5=nil end
	local p6 = ChengShi_GiftsTabfile:getCell("Param6",i)
	if(p6=="") then p6=nil end

	ChengShi_BonusHongbao:addBonus(i,name,proba,costly,msg,type,log,{
			g,d,p,lvl,serise,nil,p1,p2,p3,p4,p5,p6
		})
end
ChengShi_GiftsTabfile:release()

function main()
	if CalcFreeItemCellCount() < 6 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ më ®¹i hång bao.")
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ më ®¹i hång bao.")
		return 1
	end
	local idx = ChengShi_BonusHongbao:randomSelect()
	if(not idx) then
		Msg2Player("B¹n më ®¹i hång bao ra ph¸t hiÖn bªn trong kh«ng cã g× hÕt.")
		return 0
	end
	ChengShi_BonusHongbao:payBonus(PlayerIndex,idx)
	return 0
end