Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor2 = Game:new()
GameFloor2.szMapType = "Thiªn Tr× MËt C¶nh tÇng thø 2" --¸Ä±äµØÍ¼±íÊ¾
GameFloor2.tbForbitItemType = --ÖØÔØ Î¥½ûµÀ¾ß
{
	"TRANSFER", "PK","MATE"
}
GameFloor2.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor2\\playerfloor2.lua",
	szClassName = "PlayerFloor2"
}

GameFloor2.tbNpcTypeList = --npcµÄÀàÐÍ
{
	["R­¬ng chøa ®å"] = 
	{
		nNpcId = 625,
		szName = "R­¬ng chøa ®å",
		nLevel = 95,		
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\pannier.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\chuwuxiang.lua"
	},
	["Chñ d­îc ®iÕm"] = 
	{
		nNpcId = 389,
		szName = "Chñ d­îc ®iÕm",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\drugstore.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\yaodian.lua"
	},	
	["Thî rÌn"] = 
	{
		nNpcId = 197,
		szName = "Thî rÌn",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\smithy.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tiejiang.lua"
	},
	["Ng­êi tiÕp dÉn MËt C¶nh tÇng 3"] = 
	{
		nNpcId = 108,
		szName = "Ng­êi tiÕp dÉn MËt C¶nh tÇng 3",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\tofloor3npc.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tofloor3npc.lua",
	} 
}
GameFloor2.tbTrapList = 
{

}

function GameFloor2:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor2:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

GameFloor2:AssociateMap(936)
GameFloor2:SetForbitItem()
