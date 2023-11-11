--====Storm LogIn脚本====--
Include("\\script\\event\\storm\\award_npc.lua")

function storm_login()
	storm_anotherday()	--计算日期
	
	--同步TaskValue
	--SyncTaskValueMore( nTaskIdBegin, nTaskIdEnd)
	SyncTaskValue(STORM_TASKID_DAY)
	SyncTaskValue(STORM_TASKID_DAY_POINT)
	SyncTaskValue(STORM_TASKID_DAY_LASTPOINT)
	SyncTaskValue(STORM_TASKID_WEEK_POINT)
	SyncTaskValue(STORM_TASKID_WEEK_LASTPOINT)
	SyncTaskValue(STORM_TASKID_MONTH_POINT)
	SyncTaskValue(STORM_TASKID_MONTH_LASTPOINT)
	SyncTaskValue(STORM_TASKID_DATE)
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i]) then
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
		end
	end
end

