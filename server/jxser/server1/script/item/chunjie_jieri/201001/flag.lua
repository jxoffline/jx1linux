Include("\\script\\item\\activityitem.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")

tbFlag_Level10 = {};

function tbFlag_Level10:Award()
	 
	 local bTop10 = 0;
	 local nCount = gb_GetTask("SpringFestival_Flag_Level10", 1);
	 
	 if nCount < 10 then
	 	bTop10 = 1;
	 end
	 
	 if bTop10 == 1 then
	 	tbAwardTemplet:GiveAwardByList({
	 		tbProp={6,1,2127,1,0,0},
	 		nExpiredTime=43200,
	 		},"Sö dông c©y nªu (cÊp 10) ®­îc b¾c ®Èu luyÖn kim thuËt (quyÓn 1)");
	 	gb_AppendTask("SpringFestival_Flag_Level10", 1, 1);
	 	
	 else
	 	tbAwardTemplet:GiveAwardByList({
	 		tbProp={6,1,2126,1,0,0},
	 		nExpiredTime=43200,
	 		},"Sö dông c©y nªu (cÊp 10) ®­îc nhÊt kû cµn kh«n phï");
	 	gb_AppendTask("SpringFestival_Flag_Level10", 1, 1);	 		
	 end
	 
end



