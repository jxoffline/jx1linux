if(not KTABFILE_HEAD) then
	Include ("\\script\\class\\ktabfile.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

GiftsTabfile = new(KTabFile,"/settings/item/hongbao.txt","GIFTS")
BonusHongbao = new(KBonus)
for i=1,GiftsTabfile:getRow() do
	local name = GiftsTabfile:getCell("Name",i)
	local proba = GiftsTabfile:getCell("Proba",i)
	local costly = GiftsTabfile:getCell("Costly",i)
	local msg = GiftsTabfile:getCell("Msg",i)
	if(msg == "") then msg = nil end
	local type = GiftsTabfile:getCell("Type",i)
	local g = GiftsTabfile:getCell("Genre",i)
	local d = GiftsTabfile:getCell("Detail",i)
	local p = GiftsTabfile:getCell("Particular",i)
	local lvl = GiftsTabfile:getCell("Level",i)
	local serise = GiftsTabfile:getCell("Serise",i)
	local log = GiftsTabfile:getCell("Log",i)
	local p1 = GiftsTabfile:getCell("Param1",i)
	if(p1=="") then p1=nil end
	local p2 = GiftsTabfile:getCell("Param2",i)
	if(p2=="") then p2=nil end
	local p3 = GiftsTabfile:getCell("Param3",i)
	if(p3=="") then p3=nil end
	local p4 = GiftsTabfile:getCell("Param4",i)
	if(p4=="") then p4=nil end
	local p5 = GiftsTabfile:getCell("Param5",i)
	if(p5=="") then p5=nil end
	local p6 = GiftsTabfile:getCell("Param6",i)
	if(p6=="") then p6=nil end

	BonusHongbao:addBonus(i,name,proba,costly,msg,type,log,{
			g,d,p,lvl,serise,nil,p1,p2,p3,p4,p5,p6
		})
end
GiftsTabfile:release()

function main()
	if CalcFreeItemCellCount() < 6 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ më ®¹i hång bao.")
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ më ®¹i hång bao.")
		return 1
	end
	local idx = BonusHongbao:randomSelect()
	if(not idx) then
		Msg2Player("B¹n më ®¹i hång bao ra ph¸t hiÖn bªn trong kh«ng cã g× hÕt.")
		return 0
	end
	BonusHongbao:payBonus(PlayerIndex,idx)
	return 0
end