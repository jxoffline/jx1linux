if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

ChushiHongbao = inherit(KBonus,{
	[1] = {[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,402},[CONST_ITEM_NAME]="ßπi HÂng bao th«n b› "}--"…Ò√ÿ¥Û∫Ï∞¸",
})

function PayHongbao(pid,num)
	for i=1,num do
		ChushiHongbao:payBonus(pid,1)
	end
	return
end