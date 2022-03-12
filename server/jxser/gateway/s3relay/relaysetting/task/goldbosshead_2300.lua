Include("\\script\\mission\\bossnew\\callboss_new.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua")

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--…Ë÷√∑Ω∞∏√˚≥∆
	TaskName("Boss Hoµng Kim 2300")
	
	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(1440)
	
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	TaskCountLimit(0)
	
	--…Ë∂®∂® ±∆⁄∆Ù∂Ø ±º‰
	
	TaskTime(23, 0);
	
	--…æ≥˝¥”«∞µƒ ˝æ›
	for i= 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("X„a d˜ li÷u qu∏i vÀt Hoµng kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	local tbTempData = tbCallBossNewRandom:GetBossPosS3();
	local ResHandle = OB_Create()
	for _,k in tbTempData do
		ObjBuffer:PushObject(ResHandle, k.nId)
	end
	RemoteExecute("\\script\\missions\\boss\\callboss_new.lua", "tbCallBossNewRandom:CallBossNewFixureGS",ResHandle);
	OB_Release(ResHandle)
	
	OutputMsg("***====Hoπt ÆÈng Boss Ti”u xu t hi÷n====***")
	----GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end

