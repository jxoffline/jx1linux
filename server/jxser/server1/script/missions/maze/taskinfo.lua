IL("FILESYS")
Include("\\script\\lib\\player.lua")

TaskInfo = {
	m_FilePath = "\\settings\\missions\\maze\\taskinfo.txt",
	m_Infos = {}
}

function TaskInfo:Initialize()
	local path = self.m_FilePath
	local ret = TabFile_Load(path, path)
	if (ret == 0) then
		print(format("[MAZE ERROR]Failed to load %s", path))
		return
	end
	local count = TabFile_GetRowCount(path)
	for i = 2, count do
		local nTaskId = tonumber(TabFile_GetCell(path, i, 1))
		local tb = {}
		tb.Name = TabFile_GetCell(path, i, 2)
		tb.Info = format("[%s]<enter>%s", tb.Name, TabFile_GetCell(path, i, 3))
		self.m_Infos[nTaskId] = tb
	end
end

function TaskInfo:Show(nTaskId, player)
	local tb = self.m_Infos[nTaskId]
	if (tb) then
		player:Describe(tb.Info, 1, "BiÕt råi/Cancel")
	end
end

function TaskInfo:GetInfo(nTaskId)
	local tb = self.m_Infos[nTaskId]
	if (not tb) then
		tb = {Name = "Uknown", Info = "Unknown"}
	end
	return tb
end

TaskInfo:Initialize()
