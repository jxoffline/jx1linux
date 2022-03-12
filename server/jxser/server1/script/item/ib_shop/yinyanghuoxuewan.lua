-- ÎÄ¼şÃû¡¡£ºyinyanghuoxuewan.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£ºÒõÑô»îÑªÍè
-- ×÷ÓÃ	   £ºÈ«¿¹+ 25% ÉúÃü+ 500 µã ÉÁ±Ü+ 500 µã ÅÜËÙ+ 20% ÓĞĞ§Ê±¼ä15·ÖÖÓ
-- ´´½¨Ê±¼ä£º2011-07-15 14:34:59

function main(nItemIndex)
	local nTime = 15 * 60 *18
	local tbSkill = { 1121,256,259,257,}

	for i=1,getn(tbSkill) do
		AddSkillState(tbSkill[i], 1, 1, nTime)
	end	
	Msg2Player("Ng­¬i ®· sö dông" .. "¢m D­¬ng Ho¹t HuyÕt §¬n") 
	return 
end