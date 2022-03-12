function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Boss Hoµng Kim 2215")
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(1440)
	
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	--Éè¶¨¶¨Ê±ÆÚÆô¶¯Ê±¼ä
	
	TaskTime(22, 00);
	
	--É¾³ı´ÓÇ°µÄÊı¾İ
	for i= 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("Xãa d÷ liÖu qu¸i vËt Hoµng kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end

