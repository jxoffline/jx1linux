function TaskShedule()
	TaskName("ho¹t ®éng xÕp h¹ng <Th¸ch thøc thêi gian> mçi ngµy")	
	TaskTime(0, 0);
	TaskInterval(1440)	
	TaskCountLimit(0)
	OutputMsg("[Start] CËp nhËt b¶ng xÕp h¹ng v­ît ¶i 00:00")
end

function TaskContent()
	name , value = Ladder_GetLadderInfo(10235, 1);
	value = value * (-1);
	if (name ~= "") then
		local szTime	= format("%s phót %s gi©y", floor(value/60), floor(mod(value, 60)));
		local szMsg 	= format("Chóc mõng ®éi <%s> ®· hoµn thµnh <th¸ch ®Êu thêi gian> víi thêi gian ng¾n nhÊt <%s>", name, szTime);
		GlobalExecute(format("dw AddGlobalNews([[%s]], 10)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
	Ladder_ClearLadder(10235);
	OutputMsg("CËp nhËt b¶ng xÕp h¹ng v­ît ¶i"); 
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


