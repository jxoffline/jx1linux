Include("\\vng_script\\activitysys\\config\\1024\\head.lua")
Include("\\vng_script\\activitysys\\config\\1024\\config.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\vng_script\\activitysys\\vngtaskmanager.lua")
pActivity.tbConfig = tbConfig
pActivity:InitTaskGroup()
G_ACTIVITY:AddActivity(pActivity)
