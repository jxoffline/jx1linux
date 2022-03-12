Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor1 = Game:new()
GameFloor1.szMapType = "TÇng 1 Thiªn Tr× MËt C¶nh" --¸Ä±äµØÍ¼±íÊ¾
GameFloor1.tbForbitItemType = --ÖØÔØ Î¥½ûµÀ¾ß
{
	"TRANSFER","MATE"
}
GameFloor1.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor1\\playerfloor1.lua",
	szClassName = "PlayerFloor1"
}

GameFloor1.PlayerEnterTrapTime = {
}

GameFloor1.tbNpcTypeList = --npcµÄÀàÐÍ
{
	["Lo¹n Qu¸i"] = 
	{
		nNpcId = 1606,
		szName = "SÜ Tr­ëng",
		nLevel = 95,
		bNoRevive = 0, --ÖØÉú
		nIsboss = 0, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster1.txt"
	},
	["Vùng HuyÔn Qu¸i"] =
	{--ÁíÍâÒ»¸ö¹ÖÎï
		nNpcId = 1608,
		szName = "Ngò Tr­ëng",
		nLevel = 95,
		bNoRevive = 0, --ÖØÉú
		nIsboss = 0, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster2.txt"
	},	
	["HËu Ng­ìng Qu¸i"] = 
	{--ÁíÍâÒ»¸ö¹ÖÎï
		nNpcId = 1607,
		szName = "A Lý Hü",
		nLevel = 95,
		bNoRevive = 0, --ÖØÉú
		nIsboss = 0, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster3.txt"
	},	
	["Tr× Ho·n Qu¸i"] = 
	{--ÁíÍâÒ»¸ö¹ÖÎï
		nNpcId = 1609,
		szName = "SÜ Tèt",
		nLevel = 95,
		bNoRevive = 0, --ÖØÉú
		nIsboss = 0, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
   	szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster4.txt"
	},
	["C¬ quan"] = 
	{
		nNpcId = 1605,
		szName = "C¬ quan",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\skillwood.txt"
	},
	["R­¬ng Binh KhÝ"] = 
	{
		nNpcId = 844,
		szName = "R­¬ng Binh KhÝ",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\propsbox.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\box.lua"
	},
	["C¹m bÉy"] =
	{
		nNpcId = 1611,
		szName = "C¹m bÉy",
		nLevel = 95,
		nSeries = random(0, 4),
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\trapArea.txt"
	},
	["¢n ThÕ Cao Nh©n"] =
	{
		nNpcId = 108,
		szName = "¢n ThÕ Cao Nh©n",
		nLevel = 95,
		bNoRevive = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\master_hand.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\floor1_masterhand.lua"
	}
}
GameFloor1.tbTrapList = 
{
	["A1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["A1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["A2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["A2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["B1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["B1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["B2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["B2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["D1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["D1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["D2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["D2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["E1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["E1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["E2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["E2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["F1"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["F1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["F2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["F2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["G1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g1trap.lua",--Trap½Å±¾µÄÂ·¾¶
	}, 
	["G1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["G2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g2trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["G2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2front.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = ""
	},
	["§iÓm truyÒn tèng cña ¢n ThÕ Cao Nh©n"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\masterhandtrap.txt",
		szTrapFile = ""
	},
	["ToFloor2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\to_floor2.txt",
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\tofloor2.lua"
	}
}

function GameFloor1:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor1:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end


GameFloor1:AssociateMap(935)
GameFloor1:SetForbitItem()

