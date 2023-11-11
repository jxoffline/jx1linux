-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	游戏推广员系统
-- Include("\\script\\misc\\spreader\\head.lua")
---------------------------------------------------------------------------

-------------------------------------------------------
SWITCH_SPREADER = 1; -- 功能开关，如果关闭，请赋值nil
-------------------------------------------------------

-------------------------------------------------------
-- 各种奖励方式:
--赠送一：[新手开户卡(KS开头)、金山推广员系统帐号(KSTG开头)]
--	剑侠20级白马一匹
--	纹银10000两 (1万两)

--赠送二：[cd-key激活帐号]
--	输入cd-key激活帐号时，送黄金师徒卡一张
--  到达30级，可领取30万银两
--	到达40级，可领取40万银两
--	到达50级，可领取100万银两
--	到达80级，可领取90级技能

------------------------
 -- 新手推广系统所用的扩展点(16位)
GSP_ACCOUNT_EXTPOINT = 7;
	GSP_ACCOUNT_TYPE_NORMAL 		= 0; -- 普通帐号
	GSP_ACCOUNT_TYPE_UNKNOWN		= 1; -- 原游戏推广站帐号？？
	GSP_ACCOUNT_TYPE_NEWPLAYER 		= 2; -- 新手推广帐号[新手开户卡(KS开头)] - 领取“赠送一”之后 +1
	GSP_ACCOUNT_TYPE_NEWPLAYER_PAY	= 3; -- 已领取“赠送一”
	GSP_ACCOUNT_TYPE_SPREADERSYS 	= 4; -- 游戏推广系统帐号(KSTG开头)]) - 领取“赠送一”之后 +1
	GSP_ACCOUNT_TYPE_SPREADERSYS_PAY= 5; -- 已领取“赠送一”
	GSP_ACCOUNT_TYPE_CDKEY 			= 8; -- 通过cd-key激活的帐号 - 领取“赠送二”的黄金师徒卡后 +1
	GSP_ACCOUNT_TYPE_CDKEY_PAY 		= 9; -- 已领取“黄金师徒卡”("赠送二"的第一部分)
-------------------------------------------------------

-------------------------------------------------------
-----------------------
 -- 任务变量：记录游戏推广员系统角色信息	
GSP_TASKID_ROLEREINFO = 1398;
	GSP_TASKID_TAG_BYTE_ROLETYPE 	= 1;	-- GetByte(1) = 0 - 普通角色, 1 - CDKEY激活角色
	GSP_TASKID_TAG_BIT_30BONUS 		= 8+3;	-- GetBit(8+3) = 1 -  已领取30级奖励
	GSP_TASKID_TAG_BIT_40BONUS 		= 8+4; 	-- GetBit(8+4) = 1 -  已领取40级奖励
	GSP_TASKID_TAG_BIT_50BONUS 		= 8+5;	-- GetBit(8+5) = 1 -  已领取50级奖励
	GSP_TASKID_TAG_BIT_80BONUS 		= 8+8;	-- GetBit(8+8) = 1 -  已领取80级奖励
-----------------------
	-- 角色类型(任务变量的第个字节)
		GSP_TASKID_ROLETYPE_NORMAL 	= 0; -- 普通角色
		GSP_TASKID_ROLETYPE_CDKEY 	= 1; -- CDKEY激活角色
-------------------------------------------------------

-------------------------------------------------------
-- 以下值与PaySys定义一致
GSP_CDKEY_ACTION_SUCCESS 	= 1 -- 成功
GSP_CDKEY_ACTION_FAILED	 	= 2 -- 失败
GSP_CDKEY_E_CDKEYERROR		= 3 -- CDKEY不正确
GSP_CDKEY_E_NEWTIMEOUT 		= 75 -- 帐号已超时》10小时了
GSP_CDKEY_E_NEWACTIVED 		= 76 -- 帐号已被激活
-------------------------------------------------------

-----------------
function gsp_writeLog(szMsg)
	WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..")"..szMsg);
end
