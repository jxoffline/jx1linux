-- ÎÄ¼şÃû¡¡£ºluckybox.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-15 10:47:37
--ÎïÆ·ÉÏµÄËµÃ÷ÎÄ×Ö£º¡° ĞÒÔËÀñºĞÀï¾ßÓĞĞí¶àÉÙ¼ûµÄÆåËéÆ¬¡±
--Ê¹ÓÃ·½·¨£ºÓÒ¼üµã»÷Ê¹ÓÃ
--Ê¹ÓÃ½ØÖ¹Ê±¼ä£º2008Äê05ÔÂ18ÈÕ24µã00·Ö
Include("\\script\\lib\\awardtemplet.lua")
jiefang_0804_luckybox_Award = 
{
	{szName="M¶nh cê 1", tbProp={6, 1, 1735, 1, 0, 0}, nRate = 50},
	{szName="M¶nh cê 2", tbProp={6, 1, 1736, 1, 0, 0}, nRate = 30},
	{szName="M¶nh cê 3", tbProp={6, 1, 1737, 1, 0, 0}, nRate = 15},
	{szName="M¶nh cê 4", tbProp={6, 1, 1738, 1, 0, 0}, nRate = 5},
}
function main()
	if CalcFreeItemCellCount() < 1 then
		Say("Tói hµnh trang ®· ®Çy, h·y dän dÑp hµnh trang ®Ó b¶o ®¶m an toµn cho vËt phÈm.",0)
		return 1;
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate > 20080518 then
		Say("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.", 0);
		return 0;
	end 
	tbAwardTemplet:GiveAwardByList(jiefang_0804_luckybox_Award, "use luckybox")
	return 0;
end