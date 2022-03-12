IncludeLib("FILESYS")

local LoadTabFile = function(szFile)
	if TabFile_Load(szFile, szFile) ~= 1 then
		print(format("%s open fail", szFile))
		return 
	end
	local nRowCount = TabFile_GetRowCount(szFile) - 1
	local tb = {}
	for i=1, nRowCount do
		for j=1, nRowCount do
			local nValue = tonumber(TabFile_GetCell(szFile, i + 1, j + 1))
			tb[i] = tb[i] or {}
			tb[i][j] = nValue
		end
	end
	TabFile_UnLoad(szFile)
	return tb
end

COMBO_FILE = "\\settings\\missions\\battle\\combo.txt"
SCORES_FILE = "\\settings\\missions\\battle\\scores.txt"
SCORES2TITLE = {1000, 3000, 6000, 10000,-1}

COMBO_COUNT = 3
COMBO_EXT_SCORES = 150

ScoringClass = {}

local COMBO_TABLE = LoadTabFile(COMBO_FILE)
local SCORES_TABLE = LoadTabFile(SCORES_FILE)

function ScoringClass:CalcTitle(nScores)
	for i = 1, getn(SCORES2TITLE) do
		local nStepScores = SCORES2TITLE[i]
		if nScores < nStepScores or nStepScores == -1  then
			return i
		end
	end
end

function ScoringClass:GetScores(nKillerTitle, nDeadTitle)
	if %SCORES_TABLE and %SCORES_TABLE[nKillerTitle] and %SCORES_TABLE[nKillerTitle][nDeadTitle] then
		return %SCORES_TABLE[nKillerTitle][nDeadTitle]
	else
		return 0
	end
end

function ScoringClass:ValidCombo(nKillerTitle, nDeadTitle)
	if %COMBO_TABLE and %COMBO_TABLE[nKillerTitle] and %COMBO_TABLE[nKillerTitle][nDeadTitle] then
		return %COMBO_TABLE[nKillerTitle][nDeadTitle] == 1
	end
end

