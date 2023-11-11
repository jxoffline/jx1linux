Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	if PlayerFunLib:VnCheckInCity ("default") ~= 1 then
		return 1
	end
	local tbMoney = {szName = "Ng©n L­îng", nJxb =10000000, nCount = 1}
	tbAwardTemplet:Give(tbMoney, 1, {"ShopMoi", "SuDungTuiTienVan"})
end