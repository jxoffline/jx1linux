-------------------------------------------------------------------------
-- FileName		:	enemy_turefresh.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 21:36:14
-- Desc			:   千宝库关卡的盗贼脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断

function ture_killrefresh()
	
	local _, _, nMapIndex = GetPos()
	
	--local Uworld1205 = nt_getTask(3000)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1215 = nt_getTask(1215)  --boss身边刷怪的打怪开关
	
		if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th阨 gian t╪g g蕄 i 甶觤 kinh nghi謒 c馻 b筺  k誸 th骳!")
			else
				AddOwnExp(TUREREFRESH_EXP)    --给予一倍的经验
				nt_setTask(1215,Uworld1215+1)
			end
		end
		
		if ( SubWorldIdx2ID( nMapIndex ) == 393 ) and ( GetGlbValue(814) >= 1 ) then  --判断地图内虎豹骑的数量
			SetGlbValue(814,GetGlbValue(814) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) and ( GetGlbValue(815) >= 1 ) then
			SetGlbValue(815,GetGlbValue(815) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) and ( GetGlbValue(816) >= 1 ) then
			SetGlbValue(816,GetGlbValue(816) - 1 )
		end
		
		if ( nt_getTask(1215) >= 11 ) then
			local w = random(1,5) --随机得到一样好东西
			if ( w== 3 ) then  
				--AddItem()
			end
			nt_setTask(1215,0)
		end
		Msg2Player("Nh薾 頲 ph莕 thng")
		
		messenger_killnpc_jifen(TUREREFRESH_MESSENGEREXP,TUREREFRESH_MAPID)
		messenger_killbugbear_inteam(TUREREFRESH_EXP,TUREREFRESH_MAPID)   --增加队伍内玩家经验

end