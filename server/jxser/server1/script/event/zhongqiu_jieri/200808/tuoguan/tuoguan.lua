--zhongchaolong

--	Íæ¼Ò±³°üÂúÊ±£¬ÏµÍ³»áÌáĞÑ²¢²»ÔÙ¸øÍæ¼ÒÎïÆ·¡£
--»¹Ã»µ½Îå·ÖÖÓµÄÏßÉÏÍĞ¹Ü¶ø±»ÖĞ¶Ï£¬ÍĞ¹ÜÊ±¼ä±»Ë¢ĞÂ¡£ (ÏñÔÚÏßÍĞ¹Ü»ñµÃ¾­ÑéµãµÄ¹æÔò)
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
function zhongqiu0808_tuoguan(nSpecialD)
	
	
	if nSpecialD <= 0.5 * 0.5 then
	
		return
	end
	if zhongqiu0808_IsActDate()	~= 1 then
		return 
	end
	
	local tbItem = {szName="Hép Tiªn Vò", tbProp={6, 1, 1795, 1, 0, 0}}
	
	if ST_GetOffliveState() == 0 then
		local nCount = CalcEquiproomItemCount(tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
	
		if CalcFreeItemCellCount() >= 1 or (nCount > 0 and nCount < 50 )  then
	
			tbAwardTemplet:GiveAwardByList(tbItem, "Ho¹t ®éng ñy th¸c thu thËp")
		else
			Msg2Player(format("Hµnh trang cña b¹n ®· ®Çy, kh«ng thÓ nhËn %s.", tbItem.szName))
		end
	end
end