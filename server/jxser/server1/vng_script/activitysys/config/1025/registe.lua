Include("\\vng_script\\activitysys\\config\\1025\\head.lua")
Include("\\vng_script\\activitysys\\config\\1025\\config.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\vng_script\\activitysys\\vngtaskmanager.lua")
pActivity.tbConfig = tbConfig
pActivity:InitTaskGroup(VngTaskManager)
G_ACTIVITY:AddActivity(pActivity)