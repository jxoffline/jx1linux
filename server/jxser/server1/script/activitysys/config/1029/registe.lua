Include("\\script\\activitysys\\config\\1029\\head.lua")
Include("\\script\\activitysys\\config\\1029\\config.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")
pActivity.tbConfig = tbConfig
pActivity:InitTaskGroup(TaskManager)
G_ACTIVITY:AddActivity(pActivity)
