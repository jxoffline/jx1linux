Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")

function VnLoadNpcs()	
	tbVngNpcList =	{									
								{ szName = "ThÇn Tµi ", 	nLevel = 1, nNpcId = 1528, nMapId = 37, nPosX = 1757*32, nPosY = 3074*32, nIsboss = 0, szScriptPath = "\\vng_script\\features\\thammayman\\main.lua",},
								{ szName = "Sø Gi¶ Trao Th­ëng", 	nLevel = 95, nNpcId = 2107, nMapId = 53, nPosX = 1626*32, nPosY = 3195*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "B¸ch HiÓu Sinh", 	nLevel = 95, nNpcId = 1659, nMapId = 80, nPosX = 1746*32, nPosY = 3013*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 53, nPosX = 1626*32, nPosY = 3167*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 20, nPosX = 3545*32, nPosY = 6194*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 99, nPosX = 1647*32, nPosY = 3195*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 100, nPosX = 1623*32, nPosY = 3181*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 101, nPosX = 1708*32, nPosY = 3157*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 121, nPosX = 1950*32, nPosY = 4498*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 153, nPosX = 1649*32, nPosY = 3183*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "V« Danh", 	nLevel = 95, nNpcId = 2107, nMapId = 174, nPosX = 1622*32, nPosY = 3185*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},								
								{ szName = "ThuÇn Hãa M· §¹i S­", 	nLevel = 1, nNpcId = 230, nMapId = 54, nPosX = 1661*32, nPosY = 3046*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},	
								{ szName = "Tr¹i ngùa", 	nLevel = 1, nNpcId = 1171, nMapId = 54, nPosX = 1663*32, nPosY = 3041*32, nIsboss = 0, szScriptPath = "",},	 --npc Trang Tr¹i thuÇn hãa ngùa
								{ szName = "B¸ch nghÖ nh©n", 	nLevel = 1, nNpcId = 650, nMapId = 53, nPosX = 1582*32, nPosY = 3151*32, nIsboss = 0, szScriptPath = "\\vng_script\\features\\reset_store_pass.lua",},
								{ szName = "ThÈm V¹n Tam", 	nLevel = 1, nNpcId = 2107, nMapId = 37, nPosX = 1735*32, nPosY = 3103*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "TÜnh T©m §¹i S­", 	nLevel = 1, nNpcId = 64, nMapId = 162, nPosX = 1656*32, nPosY = 3156*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "Sø gi¶ trao th­ëng liªn ®Êu", 	nLevel = 1, nNpcId = 129, nMapId = 1, nPosX = 1665*32, nPosY = 3215*32, nIsboss = 0, szScriptPath = "\\vng_script\\activitysys\\vng_npcdailog.lua",},
								{ szName = "D· tÈu", 	nLevel = 1, nNpcId = 108, nMapId = 11, nPosX = 3154*32, nPosY = 5066*32, nIsboss = 0, szScriptPath = "\\vng_script\\features\\quest_daily\\datau.lua",},
								
							}
	for i=1,getn(tbVngNpcList) do		
		basemission_CallNpc(tbVngNpcList[i])	
		--print("VnLoadNpcs szName: "..tbVngNpcList[i].szName)
	end
end

AutoFunctions:Add(VnLoadNpcs)
