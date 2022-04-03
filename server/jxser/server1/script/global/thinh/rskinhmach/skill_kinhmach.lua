-- Skill reset kinh mach -- Thinh Nguyen
Include("\\script\\skill\\head.lua")
SKILLS={
		km_socap={		
			vitality_v={{{1,150},{2,150}},{{1,-1},{2,-1}}},
			energy_v={{{1,150},{2,150}},{{1,-1},{2,-1}}},
			strength_v={{{1,150},{2,150}},{{1,-1},{2,-1}}},
			dexterity_v={{{1,150},{2,150}},{{1,-1},{2,-1}}},
			skill_enhance={{{1,180},{2,180}},{{1,-1},{21,-1}}},
			anti_allres_yan_p={{{1,42},{2,42}},{{1,-1},{2,-1}}},
			allres_yan_p={{{1,42},{20,42}},{{1,-1},{2,-1}}},
			lifemax_yan_p={{{1,42},{2,42}},{{1,-1},{2,-1}}},
			lifereplenish_p={{{1,20},{2,20}},{{1,-1},{2,-1}}},
			block_rate={{{1,15},{2,15}},{{1,-1},{2,-1}}},
			anti_block_rate={{{1,15},{2,15}},{{1,-1},{2,-1}}},
			enhancehit_rate={{{1,15},{2,15}},{{1,-1},{2,-1}}}, -- xac suat trong kich
			anti_enhancehit_rate={{{1,15},{2,15}},{{1,-1},{2,-1}}}, -- ty le giam trong kich
			five_elements_enhance_v={{{1,1440},{2,1440}},{{1,-1},{2,-1}}},
			five_elements_resist_v={{{1,1440},{2,1440}},{{1,-1},{2,-1}}},
			anti_sorbdamage_yan_p={{{1,144},{2,144}},{{1,-1},{2,-1}}},
			skill_skillexp_v={{	{1,SkillExpFunc(5000,1.25,1,3,1)},
					{2,SkillExpFunc(5000,1.25,1,3,1)},
					}},
		},
		km_trungcap={		
			vitality_v={{{1,180},{2,180}},{{1,-1},{2,-1}}},
			energy_v={{{1,180},{2,180}},{{1,-1},{2,-1}}},
			strength_v={{{1,180},{2,180}},{{1,-1},{2,-1}}},
			dexterity_v={{{1,180},{2,180}},{{1,-1},{2,-1}}},
			skill_enhance={{{1,220},{2,220}},{{1,-1},{21,-1}}},
			anti_allres_yan_p={{{1,52},{2,52}},{{1,-1},{2,-1}}},
			allres_yan_p={{{1,52},{20,52}},{{1,-1},{2,-1}}},
			lifemax_yan_p={{{1,52},{2,52}},{{1,-1},{2,-1}}},
			lifereplenish_p={{{1,26},{2,26}},{{1,-1},{2,-1}}},
			block_rate={{{1,18},{2,18}},{{1,-1},{2,-1}}},
			anti_block_rate={{{1,18},{2,18}},{{1,-1},{2,-1}}},
			enhancehit_rate={{{1,18},{2,18}},{{1,-1},{2,-1}}}, -- xac suat trong kich
			anti_enhancehit_rate={{{1,18},{2,18}},{{1,-1},{2,-1}}}, -- ty le giam trong kich
			five_elements_enhance_v={{{1,1800},{2,1800}},{{1,-1},{2,-1}}},
			five_elements_resist_v={{{1,1800},{2,1800}},{{1,-1},{2,-1}}},
			anti_sorbdamage_yan_p={{{1,180},{2,180}},{{1,-1},{2,-1}}},
			skill_skillexp_v={{	{1,SkillExpFunc(5000,1.25,1,3,1)},
					{2,SkillExpFunc(5000,1.25,1,3,1)},
					}},
		},
}




