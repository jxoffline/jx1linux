-------------------------------------------------------------------------
-- FileName		:	enemy_temrefresh.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 10:28:14
-- Desc			:   山神庙关卡的刀妖兄弟脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断

function temple_killrefresh()
	local _, _, nMapIndex = GetPos()
	--local Uworld3000 = nt_getTask(3000)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1215 = nt_getTask(1215)  --boss身边刷怪的打怪开关
	
		if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th阨 gian t╪g g蕄 i 甶觤 kinh nghi謒 c馻 b筺  k誸 th骳!")
			else
				AddOwnExp(TEMREFRESH_EXP)    --给予一倍的经验
				nt_setTask(1215,Uworld1215+1)
			end
		end
		
		if ( SubWorldIdx2ID( nMapIndex ) == 390 ) and ( GetGlbValue(817) >= 1 ) then  --判断地图内虎豹骑的数量
			SetGlbValue(817,GetGlbValue(817) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) and ( GetGlbValue(818) >= 1 ) then
			SetGlbValue(818,GetGlbValue(818) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) and ( GetGlbValue(819) >= 1 ) then
			SetGlbValue(819,GetGlbValue(819) - 1 )
		end
		
		if ( nt_getTask(1215) >= 11 ) then
			local w = random(1,5) --随机得到一样好东西
			if ( w== 3 ) then  
				AddItem()
			end
			nt_setTask(1215,0)
		end
		messenger_killnpc_jifen(TEMREFRESH_MESSENGEREXP,TEMREFRESH_MAPID)
		messenger_killbugbear_inteam(TEMREFRESH_EXP,TEMREFRESH_MAPID)   --增加队伍内玩家经验
		print(temrefresh);
end