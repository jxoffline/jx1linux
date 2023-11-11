Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	if ( not validateDate( CP_UPTO_TRYOUT,CP_END_TRYOUT ) ) then
		return
	end
	orgworld = SubWorld
	for i = 1, getn( CP_MAPTAB ) do
		mapid = CP_MAPTAB[ i ][ 1 ]
		mapindex = SubWorldID2Idx( mapid )
		if ( mapindex < 0 ) then
			print( "ANNOUNCE: Khu v­c thi ®Êu kiÖt xuÊt"..CP_MAPTAB[i][3].."Kh«ng cã trªn sever, ", mapid );
		else
			SubWorld = mapindex
			if( GetMissionV( MS_STATE ) > 0 ) then
				return
			end
			OpenMission(MISSIONID)
			str = date( "%mth¸ng%dngµy" ).."cña Vâ l©m"..CP_MAPTAB[ i ][ 3 ].."Thi ®Êu kiÖt xuÊt m«n ph¸i ®· b¾t ®Çu, ng­êi ch¬i muèn b¸o danh tham gia thi ®Êu h·y ®Õn L©m An ®èi tho¹i víi Sø gi¶ kiÖt xuÊt. §iÒu kiÖn b¸o danh: §¼ng cÊp tõ cÊp 50 ®Õn cÊp 90, sè lÇn tham gia thi ®Êu Ýt h¬n 40."
			WriteLog(date( "%Yn¨m%mth¸ng%dngµy%Hgiê%Mphót:" ).."Vâ L©m"..CP_MAPTAB[ i ][ 3 ].."Thi ®Êu kiÖt xuÊt m«n ph¸i ®· b¾t ®Çu!" )
			AddGlobalCountNews( str, 1 )
			SetMissionV( MS_STATE, 1 )
			SetMissionV( MS_ROUND, 1 )
		end
	end
	SubWorld = orgworld
end