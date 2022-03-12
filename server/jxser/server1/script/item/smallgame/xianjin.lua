
local tbItemMagic = 
{
	--详细ID且只能是magicscript.txt下的物品
	[2795] =  {nId = 668, nLevel = 5, szName = "Huy詎 Hu﹏ H穖 T躰h"},
	[2796] =  {nId = 669, nLevel = 10, szName = "B蓎 l祄 ch薽"},
}


function main(nItemIndex)
	--需要检查使用的地图

	local _,_,nId = GetItemProp(nItemIndex)
	local tbSkill = %tbItemMagic[nId]
	CastSkill(tbSkill.nId, tbSkill.nLevel)
	Msg2Player(format("Чi hi謕  %s 1 <color=0xB5FDD7>%s<color>", tbSkill.szDo or "s緋 x誴", tbSkill.szName))
	
end