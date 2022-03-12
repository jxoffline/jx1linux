-- Hép ch×a khãa vµng
-- By: ThanhLD (20130417)
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	if (CalcFreeItemCellCount () <1) then
		Talk(1,"","Hµnh trang kh«ng ®ñ chæ trèng, h·y chõa Ýt nhÊt 1 « trèng trong hµnh trang")
		return 1
	end
	local tbKeys = {szName = "Ch×a khãa vµng", tbProp = {6,1,30191,0,0,0}, nCount = 3}	
	tbAwardTemplet:Give(tbKeys, 1, {"TinhNangKey", "SuDungHopChiaKhoaVang"})	
	return 0	
end
