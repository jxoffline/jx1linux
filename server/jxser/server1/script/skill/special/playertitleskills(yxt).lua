Include("\\script\\skill\\head.lua")
SKILLS={
	AddLife={ --生命最大值
		lifemax_yan_v={{{1,1000},{10,1000},{11,1000}},{{1,-1},{2,-1}}},
	},
	AddMana={ --内力最大值
		manamax_yan_v={{{1,2000},{2,2000}},{{1,-1},{2,-1}}},
	},
	AddSpeed={ --移动速度
		fastwalkrun_p={{{1,1},{20,20},{21,20}},{{1,-1},{2,-1}}},
	},
	AddSkillEnhance={ --攻击技能加成
		skill_enhance={{{1,1},{20,20},{21,20}},{{1,-1},{2,-1}}},
	},
	AddResistant={ --全抗
		allres_yan_p={{{1,1},{10,10},{11,10}},{{1,-1},{2,-1}}},
	},
	dixiaoshanghai={ --抵消伤害
		sorbdamage_yan_p={{{1,30},{2,30}},{{1,-1},{2,-1}}},
	},
	shoushanghuifu={ --受伤动作时间
		fasthitrecover_yan_v={{{1,1},{5,5},{6,5}},{{1,-1},{2,-1}}},
	},
	zhongji={ --加重击概率
		enhancehit_rate={{{1,1},{5,5},{6,5}},{{1,-1},{2,-1}}},
	},
	huluequankang={ --忽略全抗
		anti_allres_yan_p={{{1,1},{10,10},{11,10}},{{1,-1},{2,-1}}},
	},
	chaijiegedang={ --拆解格挡概率
		anti_block_rate={{{1,1},{5,5},{6,5}},{{1,-1},{2,-1}}},
	},
	AddGedang={ --格挡
		block_rate={{{1,10},{2,10}},{{1,-1},{2,-1}}},
	},
	AddSkillEnhance1={ --攻击技能加成
		skill_enhance={{{1,1},{10,10},{11,10}},{{1,-1},{2,-1}}},
	},
	AddLife1={ --生命最大值
		lifemax_yan_v={{{1,1000},{2,1000}},{{1,-1},{2,-1}}},
	},
	zhongji1={ --加重击概率
		enhancehit_rate={{{1,10},{2,10}},{{1,-1},{2,-1}}},
	},
	chaijiegedang1={ --拆解格挡概率
		anti_block_rate={{{1,10},{2,10}},{{1,-1},{2,-1}}},
	},
}