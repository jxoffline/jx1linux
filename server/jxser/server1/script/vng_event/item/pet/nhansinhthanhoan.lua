IncludeLib("PET")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_event\\item\\pet\\lang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

NSTH_TSK_DAILY_LIMIT = 3058
NSTH_DAILY_MAX_USE = 15

function main(nItemIdx)
	if PET_IsCreate() ~= 1 then
		Talk(1, "", IS_HAVE_PET)
		return 1
	end
	if PlayerFunLib:CheckTaskDaily(NSTH_TSK_DAILY_LIMIT, NSTH_DAILY_MAX_USE, format(USE_ITEM_MAX_PER_DAY, GetItemName(nItemIdx), NSTH_DAILY_MAX_USE), "<") ~= 1 then
		return 1
	end
	PlayerFunLib:AddTaskDaily(NSTH_TSK_DAILY_LIMIT, 1)
	local nOldTamePoint = PET_GetTamePoint()
	local nTamePoint = PET_GetTamePoint() + 1
	PET_SetTamePoint(nTamePoint)	
	Msg2Player(GET_TAME_POINT_MSG..nTamePoint)
	tbLog:PlayerActionLog("SuDungNhanSinhThanHoan", "§iÓm tu luyÖn hiÖn t¹i: "..nOldTamePoint, "§iÓm tu luyÖn míi: "..nTamePoint)
end