-------------------------------------------------------------------------
-- FileName		:	Partner_liangongmuzhuang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-19 15:40:15
-- Desc			:  	练功木桩脚本
-------------------------------------------------------------------------
Include("\\script\\task\\partner\\education\\partner_educationpeople.lua") --调用 nt_getTask 同步变量到客户端的类

function OnDeath()
	pe_liangongmuzhuang()
end