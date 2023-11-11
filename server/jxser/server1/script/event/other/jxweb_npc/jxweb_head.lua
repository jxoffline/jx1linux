-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - JxWeb沟通使者头文件
-- 文件名　：jxweb_head.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-13 15:25:30

-- ======================================================
Include("\\script\\task\\system\\task_string.lua");	-- 对话处理头文件

-- COMMON 常量 --
JxWeb_Start_Date	= 20090501;		-- 活动起始时间
JxWeb_End_Date		= 20090523;		-- 领取限期
JxWeb_Item_End_Date	= 20090529;		-- 道具使用期限
JxWeb_Item_Expire_Date	= 20090530;		-- 连心丹使用限期 2009-05-29 24：00


-- TSK 任务变量 --
TSK_JxWeb_VERSION	= 2563;		-- 记录活动起始时间
TSK_JxWeb_MAXEXP	= 2564;		-- 记录获得的经验值


JxWeb_Max_Exp = 800000000;			-- 通过活动最多获得	800.000.000
JxWeb_One_Exp = 40000000;			-- 一个奖励经验 	40.000.000
