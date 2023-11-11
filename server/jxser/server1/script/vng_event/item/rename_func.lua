Include("\\script\\global\\rename_head.lua")
Include("\\script\\lib\\log.lua")
TSK_RENAME_FUNC_LIMIT = 3060
TIME_TO_NEXT_USE = 604800 -- 7*24*60*60

function main(nIdx)
	if (GetBit(GetTask(TASKVALUE_BLEND), 1) == 1) then
		Talk(1, "", "C¸c h¹ hiÖn cã 1 lÇn ®æi tªn, xin h·y ®Õn gÆp Sø Gi¶ ë c¸c th«n trÊn ®Ó ®æi sang tªn míi.")
		return 1;
	end
	local nCurTime = GetCurServerTime()
	if nCurTime < (GetTask(TSK_RENAME_FUNC_LIMIT) + TIME_TO_NEXT_USE) then
		Talk(1, "", "CÇn ph¶i sau 7 ngµy tõ lÇn sö dông tr­íc míi cã thÓ dïng vËt phÈm nµy.")
		return 1
	end
	SetTask(TSK_RENAME_FUNC_LIMIT, nCurTime)
	local nVal = SetBit(GetTask(TASKVALUE_BLEND), 1, 1)
	SetTask(TASKVALUE_BLEND, nVal)	
	Msg2Player("Sö dông vËt phÈm thµnh c«ng, xin h·y ®Õn gÆp Sø Gi¶ ë c¸c th«n trÊn ®Ó tiÕn hµnh ®æi tªn.")
	tbLog:PlayerActionLog("SuDungTinhDanhChiLenhThanhCong")
end