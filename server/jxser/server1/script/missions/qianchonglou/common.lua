tbPlayerHandle = {}

tbPlayerHandle.OPERATION_QUIT = 1
tbPlayerHandle.OPERATION_OPEN_UI = 2
tbPlayerHandle.OPERATION_USE_GUN = 3
tbPlayerHandle.OPERATION_CLOSE_UI = 4
tbPlayerHandle.OPERATION_EXTRA_GUN = 5


TSK_DATE = 3182
TSK_BASE_POINT = 3183
TSK_AWARD_POINT = 3184
TSK_PLAY_TIME = 3185
TSK_DAILY_LIMIT = 3187
TSK_AWARD_POINT_EXCHANGE = 3423   -- 玩家奖励分兑换量

function tbPlayerHandle:GetBasePoint()
	return GetTask(%TSK_BASE_POINT)
end

function tbPlayerHandle:GetAwardPoint()
	return GetTask(%TSK_AWARD_POINT)
end

function tbPlayerHandle:GetPlayTime()
	return GetTask(%TSK_PLAY_TIME)
end

-- 获取玩家奖励分的兑换量
function tbPlayerHandle:GetAwardPointExchange()
	return GetTask(%TSK_AWARD_POINT_EXCHANGE)
end
