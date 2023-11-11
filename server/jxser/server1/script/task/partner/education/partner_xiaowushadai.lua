-------------------------------------------------------------------------
-- FileName		:	Partner_wuchangshadai.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-11 21:42:15
-- Desc			:  	校武场沙袋对话
-------------------------------------------------------------------------
Include("\\script\\task\\partner\\education\\partner_educationpeople.lua") --调用 nt_getTask 同步变量到客户端的类

function OnDeath()
	pe_wuchangshadai()
end