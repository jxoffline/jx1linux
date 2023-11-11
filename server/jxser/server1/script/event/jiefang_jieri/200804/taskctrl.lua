-- 文件名　：taskctrl.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-15 11:16:09



--任务变量 说明
--2473	越南南方解放活动 版本号
--2474	越南南方解放活动 使用旗碎片的个数
--2475	越南南方解放活动 使用完整旗帜经验上限
--2556	越南南方解放活动 记录赛跑报名的地图Id
--2557	越南南方解放活动占用
--2333	越南南方解放活动占用


jiefang_0804_ActTimeH_S = 2008120500
jiefang_0804_ActTimeH_E = 2009010424

jiefang_0804_TSK_Version		= 2473
jiefang_0804_TSK_FlagCount		= 2474
jiefang_0804_TSK_FlagExpLimit	= 2475
jiefang_0804_TSK_MapId			= 2557
jiefang_0804_TSK_AwardState		= 2333
jiefang_0804_TSKV_FlagCount		= 1975
jiefang_0804_TSKV_FlagExpLimit	= 1200000000

--在活动的最长时间内 发现 版本号与活动开始时间不一致，则清空其他任务变量
function jiefang_0804_ResetTask()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"))
	--活动开始，到兑奖结束
	if nDateH >= jiefang_0804_ActTimeH_S and nDateH <= jiefang_0804_ActTimeH_E then
		
		if GetTask(jiefang_0804_TSK_Version) ~= jiefang_0804_ActTimeH_S then
			SetTask(jiefang_0804_TSK_Version, jiefang_0804_ActTimeH_S)
			SetTask(jiefang_0804_TSK_FlagCount, 0)
			SetTask(jiefang_0804_TSK_FlagExpLimit, 0)
			SetTask(jiefang_0804_TSK_MapId, 0)
			SetTask(jiefang_0804_TSK_AwardState, 0)
		end
	end
	
end