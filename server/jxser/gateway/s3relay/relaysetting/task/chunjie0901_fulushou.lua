-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æÒ» 2009ÄêĞÂÄê-¸£Â»ÊÙĞ¡ÓÎÏ·

-- Edited by ×Ó·Çô~
-- 2009/01/07 15:58
-- 
-- ======================================================

function TaskShedule()
	TaskName("2009Xinnian_FuLuShou");
	TaskInterval(60);
	local nhour = tonumber(date("%H"));
	local nstarth = 0;
	if nhour >= 23 then
		nstarth = 12;
	else
		tb_xmas2009_strattime = {12,19};
		for ni,nh in tb_xmas2009_strattime do
			if nh >= nhour then
				nstarth = nh;
				break
			end
		end
	end
	
	TaskTime(nstarth, 0);
	OutputMsg(format("2009Xinnian_FuLuShou %d:%d Start...",nstarth,0));
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"));
	if ndate < 09011612 or ndate > 09021519 then
		return 
	end
	
	local nhm = tonumber(date("%H%M"))
	
	if nhm >= 1200 and nhm < 1300 then
		--Í¨¹ıpass
	elseif nhm >= 1900 and nhm < 2000 then
		--Í¨¹ıpass
	else
		return
	end
	
	local nrand = random(1, 2);
	local narry = random(1, 6);
	
	GlobalExecute(format("dwf \\script\\event\\chunjie_jieri\\200901\\fulushou\\findnpc.lua chunjie0901_findnpc(%d, %d, %d)",nrand, ndate, narry));
	
	local szMsg = "HiÖn t¹i 3 vŞ thÇn cña chóng ta ®ang muèn t×m nhau ®Ó cïng lªn Thiªn §×nh b¸i kiÕn Ngäc Hoµng, c¸c nh©n sÜ h·y cïng gióp hä.";
	GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg));
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

