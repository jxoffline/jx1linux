
function GameSvrConnected(dwGameSvrIP)
bFind , key1, mapid = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
if (bFind == 1) then 
	if (IsMapOnGameSvr(mapid, dwGameSvrIP ) == 1) then 
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, mapid, "iii");		
		if (bResult == 1) then 
			success = SaveCustomDataToSDBOw("GoldBoss", Sid, mapid, "iii", npctid, npclevel, 0);
			NotifySDBRChanged1Svr(dwGameSvrIP, "GoldBoss", Sid ,mapid ,1);		
			msg = format("Ph­¬ng ¸n Qu¸i Hoµng Kim %d, ph¸t hiÖn GameSvr %d khëi ®éng kÕt nèi víi Relay, xuÊt hiÖn qu¸i vËt, khu vùc %d, ID Npc%d,   ®¼ng cÊp Npc%d.", Sid, dwGameSvrIP, mapid, npctid, npclevel);
			OutputMsg(msg);
		else
			success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);		
		end;
	else
		OutputMsg("M¸y chñ khëi ®éng l¹i kh«ng tån t¹i Boss d­íi ®©y:"..Sid);
	end
end

end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	TaskName("Boss Hoµng kim"..Sid)
	TaskInterval(Interval)
	TaskCountLimit(Count)
	if (StartHour ~= -1 and StartMin ~= -1) then 
		TaskTime(StartHour, StartMin);
	end;
	success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);
	OutputMsg("Xãa d÷ liÖu qu¸i vËt Hoµng kim trong database"..Sid);
end

function TaskContent()
	bFind , key1, key2 = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
	if (bFind == 1) then
		OutputMsg("T×m thÊy d÷ liÖu qu¸i vËt Hoµng kim rong database".. Sid..","..key2.."D÷ liÖu ph­¬ng ¸n");
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, key2, "iii");
		msg =	format("D÷ liÖu %d trong ph­¬ng ¸n qu¸i vËt Hoµng kim lµ Npc: %d, §¼ng cÊp:%d, Tr¹ng th¸i: %d", Sid, npctid, npclevel, npcstate);
		OutputMsg(msg);
		if (bResult == 1) then 
			if (npctid == 0 and npcstate == 0 and npclevel == 0) or (npctid ~= 0 and npclevel ~=0 and npcstate == 0) then 
				create, mapid, npcid, npclevel = NewBoss();
				if (create == 1) then 
					msg = format("Qu¸i vËt Hoµng kim %d trong ph­¬ng ¸n kh«ng cã hoÆc ®· chÕt, s¾p xuÊt hiÖn qu¸i vËt hoµng kim míi, sè h×nh mÉu Npc lµ %d, ®¼ng cÊp Npc %d.   ", Sid, mapid, npcid, npclevel);
					OutputMsg(msg);
					success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
					NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
				end
			end
		end
	else
		create, mapid, npcid, npclevel = NewBoss();
		msg = format("Qu¸i vËt Hoµng kim %d trong ph­¬ng ¸n kh«ng tån t¹i, s¾p xuÊt hiÖn qu¸i vËt hoµng kim míi, sè h×nh mÉu Npc lµ %d, ®¼ng cÊp Npc %d   ", Sid, mapid, npcid, npclevel);
		OutputMsg(msg);
		success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
		NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
	end
end

