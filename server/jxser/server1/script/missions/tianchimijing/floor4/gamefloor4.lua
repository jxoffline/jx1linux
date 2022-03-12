Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor4 = Game:new()

GameFloor4.szMapType = "Thiªn Tr× MËt C¶nh tÇng 4"

GameFloor4.Player = 
{
	szPath = "\\script\\missions\\tianchimijing\\floor4\\playerfloor4.lua",
	szClassName = "PlayerFloor4",
}

GameFloor4.tbForbitItemType = 
{
	"TRANSFER","MATE"
}

GameFloor4.tbNpcTypeList = 
{
	["boss"] = 
	{
		nNpcId = 1610,
		szName = "Hoµng Nhan Qu¶ng D­¬ng",
		nLevel = 95,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\boss.txt",
	},
	["drugstore"] = 
	{
		nNpcId = 203,
		szName = "Chñ d­îc ®iÕm",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\yaodian.lua",
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\drugstore.txt",
	},
	["store"] = 
	{
		nNpcId = 625,
		szName = "R­¬ng chøa ®å",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\chuwuxiang.lua",	
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\store.txt",
	},	
	["wagoner"] = 
	{
		nNpcId = 238,
		szName = "Ng­êi chØ dÉn tÇng thø 4 Thiªn Tr× MËt C¶nh",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\tianchimijing\\floor4\\wagoner.lua",	
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\wagoner.txt",
	},	
}

GameFloor4.tbTrapList = 
{
	["safetofight"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\safetofight1.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tianchimijing\\floor4\\safetofight.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["fighttosafe"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor4\\fighttosafe1.txt",
		szTrapFile = "\\script\\missions\\tianchimijing\\floor4\\fighttosafe.lua",	
	},
}

function GameFloor4:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		if key ~= "boss" then
			self:AddANpc(key, value.szPosPath)
		end
	end
end


function GameFloor4:MoveToTrap(nPlayerIndex, szPosPath)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	local nPlayerX, nPlayerY = CallPlayerFunction(nPlayerIndex, GetPos)
	local nX = -1
	local nY = -1
	local nMinDis = -1
	for i=2,nRowCount do
		nTempX = TabFile_GetCell(szPosPath, i, 1)
		nTempY = TabFile_GetCell(szPosPath, i, 2)
		local nDis = self:GetDistance(nPlayerX, nPlayerY, nTempX, nTempY)
		if (nMinDis == -1 or nMinDis > nDis) then
			nMinDis = nDis
			nX = nTempX
			nY = nTempY
		end
	end
	CallPlayerFunction(nPlayerIndex, SetPos, nX/32, nY/32)
end

function GameFloor4:GetDistance(nX1, nY1, nX2, nY2)
	local nDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	return nDis
end

function GameFloor4:Start()	
	self:AssociateMap(947)
	self:SetForbitItem()
	self:RegAll()	
	self:AddAllTrap()	
	self:AddAllNpc()
	GameFloor4:CallBossInit()
end
