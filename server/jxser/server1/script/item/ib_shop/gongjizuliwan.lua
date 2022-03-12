-- ÎÄ¼şÃû¡¡£ºgongjizuliwan.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º¹¥»÷ÖúÁ¦Íè 
-- Ğ§¹û	   : Íâ¹¦¹¥»÷ËÙ¶ÈÔö¼Ó 50% ÄÚ¹¦¹¥»÷ËÙ¶ÈÔö¼Ó 10% ¹¥»÷Á¦Ôö¼Ó 100 µã ÃüÖĞÔö¼Ó 500 µã ÓĞĞ§Ê±¼ä15·ÖÖÓ
-- ´´½¨Ê±¼ä£º2011-07-15 11:53:11

function main(nItemIndex)
	print("Sö dông råi")
	local nTime = 15 * 60 *18
	local tbSkill = { 1120,261,258,260,}
		
	for i=1,getn(tbSkill) do
		AddSkillState(tbSkill[i], 1, 1, nTime)
	end	
	
	Msg2Player("Ng­¬i ®· sö dông" .. "Kİch C«ng Trî Lùc Hoµn")
	return 0
end