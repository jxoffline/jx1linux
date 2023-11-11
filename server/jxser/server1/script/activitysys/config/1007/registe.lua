Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\activitysys\\config\\1007\\config.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")
pActivity.tbConfig = tbConfig
pActivity:InitTaskGroup()    --Khoi tao Task
G_ACTIVITY:AddActivity(pActivity)
