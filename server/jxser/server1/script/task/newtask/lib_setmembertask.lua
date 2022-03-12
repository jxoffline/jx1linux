-------------------------------------------------------------------------
-- FileName		:	lib_setmembertask.lua
-- Author		:	longxiangquan
-- CreateTime	:	2004-12-27 21:51:39
-- Desc			:	组队的所有玩家任务变量皆改变的类
-------------------------------------------------------------------------

-- myTaskNumber ：需要改变的任务变量编号
-- myOrgValue   ：符合条件的判断值
-- myTaskValue  ：改变后的变量值
-- SetMemberTask 的返回值如果是 0 则只改变不组队玩家的变量，大于或者等于 1 则为改变了组队玩家变量的数量
-- 无论是单人还是组队时都没有改变玩家的变量时则返回 80
-- 而任何条件都不满足的异常处理则返回 110

Include("\\script\\task\\newtask\\newtask_head.lua")

function SetMemberTask(myTaskNumber,myOrgValue,myTaskValue,fnCallback)

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local myMemberTask
	local myChangeMember = 0
	
	if (nMemCount == 0 ) then
		myMemberTask = GetTask(myTaskNumber)
		
		if (myMemberTask == myOrgValue) then
			nt_setTask(myTaskNumber,myTaskValue)
			fnCallback()
		end
		
	else
		for i = 1, nMemCount do
		
			PlayerIndex = GetTeamMember(i)
			myMemberTask = GetTask(myTaskNumber)
		
			if (myMemberTask == myOrgValue) then	-- 符合了条件的队友才改变任务变量	
			
				nt_setTask(myTaskNumber,myTaskValue)
				myChangeMember = myChangeMember + 1
				
				fnCallback();
			end
			
		end
		
		PlayerIndex = nPreservedPlayerIndex;
		
	end
	
end;

