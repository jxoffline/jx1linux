--ÎäÁÖÈÙÓþÁî

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "LÖnh bµi vinh dù Hoµng Kim"},
	[1255]	= {100, "LÖnh bµi vinh dù B¹ch Ng©n"},
	[1256]	= {50, "LÖnh bµi vinh dù Thanh ®ång"},
	[1257]	= {10, "LÖnh bµi vinh dù Hµn thiÕt"},
}

--Ö÷¶Ô»°¿ò
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("CÇn th­¬ng d­îc g× kh«ng?",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("§· sö dông %s, ®iÓm vinh dù t¨ng thªm <color=yellow>%d<color> ®iÓm.", 
									tbItem[2], tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s, tæng céng cã %d ®iÓm", szlog, GetTask(WLLS_TASKID_HONOUR)))
end
