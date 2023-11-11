CP_MAPTAB = {
				{396, 397, "ThiÕu L©m"},
				{398, 399, "Thiªn V­¬ng"},
				{400, 401, "§­êng M«n"},
			 	{402, 403, "Ngò §éc"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Thóy Yªn"},
			 	{408, 409, "C¸i Bang"},
			 	{410, 411, "Thiªn NhÉn"},
			 	{412, 413, "Vâ §ang"},
			 	{414, 415, "C«n L«n"}
			 }
MISSIONID = 18;
MS_STATE = 1; --ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
MS_ROUND = 4	--¼ÇÂ¼µ±ÌìÈüÊÂµÄÂÖ´Î
CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023
CP_BEGIN_HOUR = 20
CP_END_HOUR = 23



function CP_CheckOpenTime()
	if (tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT and tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		if(tonumber(date("%H")) >= CP_BEGIN_HOUR and tonumber(date("%H")) < CP_END_HOUR) then
			orgworld = SubWorld
			for i = 1, getn(CP_MAPTAB) do
				mapid = CP_MAPTAB[i][1]
				mapindex = SubWorldID2Idx(mapid)
				if (mapindex < 0) then
					print("ANNOUNCE: Héi tr­êng §¹i héi vâ l©m"..CP_MAPTAB[i][3].."Kh«ng cã trªn sever, ", mapid);
				else
					SubWorld = mapindex
					if(GetMissionV(MS_STATE) == 0) then
						OpenMission(MISSIONID)
						str = date("%mth¸ng%dngµy").."cña Vâ l©m"..CP_MAPTAB[i][3].."Thi ®Êu kiÖt xuÊt ®· b¾t ®Çu, ng­êi ch¬i muèn tham gia h·y ®Õn h·y ®Õn L©m An gÆp Sø gi¶ kiÖt xuÊt (203, 202) b¸o danh. §iÒu kiÖn b¸o danh: §¼ng cÊp tõ cÊp 50 ®Õn cÊp 89, sè trËn thi ®Êu Ýt h¬n 40."
						WriteLog(date("%Yn¨m%mth¸ng%dngµy%Hgiê%Mphót:").."§¹i héi vâ l©m"..CP_MAPTAB[i][3].."Thi ®Êu dù tuyÓn m«n ph¸i ®· b¾t ®Çu!")
						AddGlobalCountNews(str, 1)
						SetMissionV(MS_STATE, 1)
						SetMissionV(MS_ROUND, 1)						
					end
				end
			end
			SubWorld = orgworld
		end
	end
end