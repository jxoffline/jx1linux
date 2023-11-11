--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")

function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("Hoµn Hån §¬n", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("Hoµn Hån §¬n", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	AddSkillState(462, 6, 0, 60)		-- Ã¿°ëÃëÉúÃü»Ø¸´£ºÔö¼Ó3000µã(×î¶à»Ö¸´20000µãÉúÃü) ºÄÊ±6s
	Msg2Player("Ng­¬i ®· sö dông 1 Hoµn Hån §¬n")
	return 0
end
