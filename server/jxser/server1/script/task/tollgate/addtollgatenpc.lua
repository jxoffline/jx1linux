-------------------------------------------------------------------------
-- FileName		:	addtollgatenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-15 14:29:14
-- Desc			:	各种关卡任务的npc加载脚本
-------------------------------------------------------------------------

Include( "\\script\\task\\tollgate\\killbosshead.lua" )

function  add_alltollgatenpc()
	
	add_killertasknpc(AddNpc_flypoint6079);
	add_killertasknpc(AddNpc_flypoint8089);
	add_killertasknpc(AddNpc_flypoint90);
	add_killertasknpc(AddNpc_templeboss);
	add_killertasknpc(AddNpc_turesureboss);
	add_killertasknpc(AddNpc_turesurebug);
	add_bossnpc(AddNpc_flyboss);
	add_messengernpc(AddNpc_allbugbear);
	
end
