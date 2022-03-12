Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 52312
Interval = 1440;
Count = 0;
StartHour=12;
StartMin=0;

function NewBoss()
	str = "Nghe nãi §­êng M«n LiÔu Thanh Thanh ®· h¹ s¸t rÊt nhiÒu cao thñ giang hå!"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;



