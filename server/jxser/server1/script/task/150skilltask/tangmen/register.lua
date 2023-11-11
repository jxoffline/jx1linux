Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\tangmen\\tangmen.lua")
--Më nhiÖm vô nhËn kü n¨ng 150 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "§­êng M«n"
pTask.m_nTaskId = 2
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
