-------------------------------------------------------------------------
-- FileName		:	enemy_tembugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:43:14
-- Desc			:   山神庙关卡的小怪脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");


function temple_killbugbear()
	local _, _, nMapIndex = GetPos()
	--local Uworld1205 = nt_getTask(3000)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1214 = nt_getTask(1214)  --刀妖叛徒剧情变量
	if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th阨 gian t╪g g蕄 i 甶觤 kinh nghi謒 c馻 b筺  k誸 th骳!")
		else
			AddOwnExp(TEMBUGBEAR_EXP)    --给予一倍的经验
		end
	end
	
	if  ( Uworld1214 ~= 0 ) then
		nt_setTask(1214,Uworld1214+1)
	end
	
	if ( Uworld1214+1 >= 20 ) then
		Msg2Player("B筺  ho祅 th祅h t﹎ nguy謓 o Y猽 trc l骳 l﹎ chung, nh薾 頲 t礽 s秐 c馻 anh ta  l筰.")
		if ( SubWorldIdx2ID( nMapIndex ) == 390 ) then
			AddOwnExp(50000)
			nt_setTask(3000,nt_getTask(3000)+16)
		elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) then
			AddOwnExp(100000)
			nt_setTask(3000,nt_getTask(3000)+18)
		elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) then
			AddOwnExp(150000)
			nt_setTask(3000,nt_getTask(3000)+24)
		end
		nt_setTask(1214,0)
	end
	messenger_killnpc_jifen(TEMBUGBEAR_MESSENGEREXP,TEMBUGBEAR_MAPID)
	messenger_killbugbear_inteam(TEMBUGBEAR_EXP,TEMBUGBEAR_MAPID)   --增加队伍内玩家经验
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 8);
end

