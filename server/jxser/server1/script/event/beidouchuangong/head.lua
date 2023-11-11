-- 文件名　：head.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-25 16:39:37
TSK_BeiDouChuanGong_EXP				= 1967	-- 基本任务变量 值小于亿时使用
TSK_BeiDouChuanGong_EXP_EX			= 2303	-- 扩展任务变量 单位：亿
TSK_BeiDouChuanGong_NIANYUE			= 1966	-- 普通真丹的上次使用时间
TSK_BeiDouChuanGong_USEDTIME_ZIJIN	= 2667	-- 紫金真丹的上次使用时间
TSK_BeiDouChuanGong_USEDTIME_HUANG	= 2668	-- 黄真丹的上次使用时间
TSKV_BeiDouChuanGong_UseLimit	=  60 * 60 * 24 * 60 --单位秒，60天

-- 获取北斗传功的当前经验值
function GetBeiDouChuanGongExp()
	return GetTask(TSK_BeiDouChuanGong_EXP_EX)*1e8 + GetTask(TSK_BeiDouChuanGong_EXP);
end

-- 设置北斗传功的当前经验值
function SetBeiDouChuanGongExp(nExp)
	SetTask(TSK_BeiDouChuanGong_EXP,	mod(nExp, 1e8));
	SetTask(TSK_BeiDouChuanGong_EXP_EX,	nExp / 1e8);
end