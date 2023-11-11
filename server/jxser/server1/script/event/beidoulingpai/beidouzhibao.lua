Include("\\script\\event\\beidoulingpai\\beidouactivity.lua")
Include("\\script\\event\\beidoulingpai\\lang.lua")

function main()
	local nPlayerTaskId = GetBitTask(tbBeidouActivity.TSK_TASK_STATE, tbBeidouActivity.TSK_BIT_TASK_ID, tbBeidouActivity.TSK_BIT_ID_LEN)
	local nPlayerTaskDone = GetBitTask(tbBeidouActivity.TSK_TASK_STATE, tbBeidouActivity.TSK_BIT_TASK_DONE, 1)
	if nPlayerTaskId == 0 then
		Talk(1, "", %MSG_ERR_NO_TASK)
		return 1
	end
	local nTaskType = %tbBDTaskList[nPlayerTaskId].nTaskType
	if tbBeidouActivity:GiveAward(nTaskType, nPlayerTaskId) == 1 then
		SetTask(tbBeidouActivity.TSK_TASK_STATE, 0)
		local nFinishTaskCount = GetTask(tbBeidouActivity.TSK_FINISH_COUNT)
		SetTask(tbBeidouActivity.TSK_FINISH_COUNT,nFinishTaskCount+1)
		local nHourTaskCount = GetTask(tbBeidouActivity.TSK_HOUR_COUNT)
		SetTask(tbBeidouActivity.TSK_HOUR_COUNT, nHourTaskCount+1)
		SetBitTask(tbBeidouActivity.TSK_AWARD_STATE, tbBeidouActivity.TSK_BIT_DOUBLE_AWARD, 1, 0)
		Msg2Player(%MSG_BEIDOUZHIBAO)
	else
		return 1
	end
end