-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   风之骑关卡的小怪脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");


function messenger_killbugbear()
	--local Uworld1205 = nt_getTask(3000)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th阨 gian t╪g g蕄 i 甶觤 kinh nghi謒 c馻 b筺  k誸 th骳!")
		else
			AddOwnExp(FLYBUGBEAR_EXP)    --给予一倍的经验
		end
	end
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 1);
	messenger_killnpc_jifen(FLYBUGBEAR_MESSENGEREXP,FLYBUGBEAR_MAPID)
	messenger_killbugbear_inteam(FLYBUGBEAR_EXP,FLYBUGBEAR_MAPID)   --增加队伍内玩家经验
end

