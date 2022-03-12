--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")
function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("Tiªu Diªu T¸n", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("Tiªu Diªu T¸n", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	CastSkill(1052, 1)
	Msg2Player("Ng­¬i ®· sö dông 1 Tiªu Diªu T¸n")
	return 0
end
