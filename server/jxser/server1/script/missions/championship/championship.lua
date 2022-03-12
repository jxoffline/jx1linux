Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	if ( not validateDate(CP_UPTO_TRYOUT,CP_END_TRYOUT) ) then
		return
	end
	orgworld = SubWorld
	for i = 1, getn(CP_MAPTAB) do
		mapid = CP_MAPTAB[i][1]
		mapindex = SubWorldID2Idx(mapid)
		if (mapindex < 0) then
			print("ANNOUNCE: Héi tr­êng §¹i héi vâ l©m"..CP_MAPTAB[i][3].."Kh«ng cã trªn sever, ", mapid);
		else
			SubWorld = mapindex
			if(GetMissionV(MS_STATE) > 0) then
				return
			end
			OpenMission(MISSIONID)
			str = date("%mth¸ng%dngµy").."Vâ l©m ®¹i héi"..CP_MAPTAB[i][3].."M«n ph¸i ®Êu dù tuyÓn ®· b¾t ®Çu, mêi ®Õn Héi tr­êng vâ l©m ®¹i héi ë L©m An b¸o danh thi ®Êu. §iÒu kiÖn b¸o danh: §¼ng cÊp lín h¬n cÊp 90, sè lÇn tham gia ph¶i Ýt h¬n 20 lÇn. LÇn ®Çu b¸o danh nép 10 v¹n l­îng."
			WriteLog(date("%Yn¨m%mth¸ng%dngµy%Hgiê%Mphót:").."§¹i héi vâ l©m"..CP_MAPTAB[i][3].."Thi ®Êu dù tuyÓn m«n ph¸i ®· b¾t ®Çu!")
			AddGlobalCountNews(str, 1)
			SetMissionV(MS_STATE, 1)
			SetMissionV(MS_ROUND, 1)
		end
	end
	SubWorld = orgworld
end