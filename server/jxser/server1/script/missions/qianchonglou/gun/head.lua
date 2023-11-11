Include("\\script\\skill\\head.lua")

szExtraGunScript = "\\script\\missions\\qianchonglou\\gun\\extra_gun.lua"
szSpearGunScript = "\\script\\missions\\qianchonglou\\gun\\spear_gun.lua"
nExtraGunScriptId = FileName2Id(szExtraGunScript)
nSpearGunScriptId = FileName2Id(szSpearGunScript)

SKILLS =  
{
	extra_gun={
			execscript=
			{
				[1]={{1,nExtraGunScriptId},{20,nExtraGunScriptId}},
				[2]={{1,1},{20,1}},
				[3]={{1,1},{20,20}}
			},
			missle_speed_v={{{1,28},{20,40}}},
			missle_hitcount={{{1,1},{20,1}}},
			skill_attackradius={{{1,1200},{20,1200}}},
			
	},
	spear_gun={
			execscript=
			{
				[1]={{1,nSpearGunScriptId},{20,nSpearGunScriptId}},
				[2]={{1,1},{20,1}},
				[3]={{1,1},{20,20}}
			},
			missle_speed_v={{{1,28},{20,40}}},
			missle_hitcount={{{1,1},{20,1}}},
			skill_attackradius={{{1,1200},{20,1200}}},
			
	},
}
