-- 新任务系统
-- BY:XIAOYANG(2005-02-22)

IncludeLib("SETTING")
Include("\\script\\task\\newtask\\newtask_head.lua")

function seteducationnpcpos()
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) or ( Uworld1000 == 180 )  then --去找武师
	 	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
			ST_SyncMiniMapObj( 1672*32,2980*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
			ST_SyncMiniMapObj( 1582*32,3460*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
			ST_SyncMiniMapObj( 1904*32,4634*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
			ST_SyncMiniMapObj( 1660*32,3256*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
			ST_SyncMiniMapObj( 1665*32,2958*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
			ST_SyncMiniMapObj( 1659*32,3424*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
			ST_SyncMiniMapObj( 1737*32,3086*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
	 		ST_SyncMiniMapObj( 3636*32,6262*32 )
	 	end
	 elseif ( Uworld1000 == 40 ) or ( Uworld1000 == 140 ) or ( Uworld1000 == 200 ) then --去找龙五 
	 	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
			ST_SyncMiniMapObj( 1617*32,3169*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
			ST_SyncMiniMapObj( 1637*32,3289*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
			ST_SyncMiniMapObj( 2009*32,4484*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
			ST_SyncMiniMapObj( 1621*32,3243*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
			ST_SyncMiniMapObj( 1691*32,3141*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
			ST_SyncMiniMapObj( 1625*32,3195*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
			ST_SyncMiniMapObj( 1620*32,3171*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
	 		ST_SyncMiniMapObj( 3544*32,6224*32 )
	 	end
	 elseif ( Uworld1000 == 80 ) then --去找药铺老板
	 	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
			ST_SyncMiniMapObj( 1598*32,3208*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
			ST_SyncMiniMapObj( 1572*32,3253*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
			ST_SyncMiniMapObj( 1933*32,4552*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
			ST_SyncMiniMapObj( 1601*32,3209*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
			ST_SyncMiniMapObj( 1676*32,3188*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
			ST_SyncMiniMapObj( 1595*32,3228*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
			ST_SyncMiniMapObj( 1658*32,3124*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
	 		ST_SyncMiniMapObj( 3468*32,6165*32 )
	 	end
	 elseif ( Uworld1000 == 100 ) then --去找铁匠铺老板
		if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
			ST_SyncMiniMapObj( 1585*32,3153*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
			ST_SyncMiniMapObj( 1606*32,3252*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
			ST_SyncMiniMapObj( 2000*32,4513*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
			ST_SyncMiniMapObj( 1608*32,3250*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
			ST_SyncMiniMapObj( 1612*32,3136*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
			ST_SyncMiniMapObj( 1669*32,3267*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
			ST_SyncMiniMapObj( 1641*32,3125*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
	 		ST_SyncMiniMapObj( 3438*32,6221*32 )
	 	end	
	 elseif ( Uworld1000 == 120 ) then --去找杂货铺老板
	 	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
			ST_SyncMiniMapObj( 1600*32,3170*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
			ST_SyncMiniMapObj( 1566*32,3202*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
			ST_SyncMiniMapObj( 1914*32,4525*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
			ST_SyncMiniMapObj( 1634*32,3222*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
			ST_SyncMiniMapObj( 1638*32,3143*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
			ST_SyncMiniMapObj( 1606*32,3283*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
			ST_SyncMiniMapObj( 1658*32,3148*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
	 		ST_SyncMiniMapObj( 3369*32,6255*32 )
	 	end	
	 elseif ( Uworld1000 == 340 ) then --找武林盟传人
	 	if( SubWorldIdx2ID( SubWorld ) == 11 ) then  --成都
			ST_SyncMiniMapObj( 3134*32,5046*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 1 ) then  --凤翔
			ST_SyncMiniMapObj( 1624*32,3204*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then  --汴京
			ST_SyncMiniMapObj( 1754*32,3042*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then  --临安
			ST_SyncMiniMapObj( 1535*32,3012*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then  --大理
			ST_SyncMiniMapObj( 1629*32,3184*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then   --襄阳
			ST_SyncMiniMapObj( 1607*32,3260*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then  --扬州
			ST_SyncMiniMapObj( 1775*32,3078*32 )
	 	end	
	 elseif ( Uworld1000 == 360 ) then --找钱庄老板
	 	if ( SubWorldIdx2ID( SubWorld ) == 176 ) then  --临安
			ST_SyncMiniMapObj( 1444*32,3063*32 )
	 	end	
	 elseif ( Uworld1000 == 380 ) then --找城市铁匠
	 	if( SubWorldIdx2ID( SubWorld ) == 11 ) then  --成都
			ST_SyncMiniMapObj( 3106*32,5122*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 1 ) then  --凤翔
			ST_SyncMiniMapObj( 1619*32,3198*32 )
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then  --汴京
			ST_SyncMiniMapObj( 1713*32,3103*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then  --临安
			ST_SyncMiniMapObj( 1683*32,3222*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then  --大理
			ST_SyncMiniMapObj( 1559*32,3266*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then   --襄阳
			ST_SyncMiniMapObj( 1552*32,3218*32 )
	 	elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then  --扬州
			ST_SyncMiniMapObj( 1691*32,3169*32 )
	 	end		 
	 end
end