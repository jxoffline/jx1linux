--古塔帮会副本
Include("\\script\\skill\\head.lua")
SKILLS={
		--减少来自金、木伤害
		reducemetalwood={
		metal2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		wood2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		},
		--减少来自木、水伤害
		reducewoodwater={
		water2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		wood2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		},
		--减少来自水、火伤害
		reducewaterfire={
		water2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		fire2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		},
		--减少来自火、土伤害
		reducefireearth={
		fire2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		earth2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		},
		--减少来自土、金伤害
		reduceearthmetal={
		earth2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		metal2medamage_p={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		},
		
		
		--灭魂焚天
		miehunfentian={
		skill_enhance={{{1,100},{60,100}},{{1,-1},{21,-1}}},
		},
		
		--铜墙铁壁
		tongqiantiebi={
			block_rate={{{1,100},{2,100}},{{1,-1},{20,-1}}},
		},
		
		--狂暴战斗
		kuangbaozhandou={
		skill_enhance={{{1,50},{2,50}},{{1,-1},{21,-1}}},
		anti_block_rate={{{1,5},{2,5}},{{1,-1},{2,-1}}},
		},
		
		--五行庇护
		wuxingbihu={
		metal2medamage_p={{{1,20},{2,20}},{{1,-1},{21,-1}}},
		wood2medamage_p={{{1,20},{2,20}},{{1,-1},{21,-1}}},
		water2medamage_p={{{1,20},{2,20}},{{1,-1},{21,-1}}},
		fire2medamage_p={{{1,20},{2,20}},{{1,-1},{21,-1}}},
		earth2medamage_p={{{1,20},{2,20}},{{1,-1},{21,-1}}},
		},
		
		--咆哮重击
		paoxiaozhongji={
		lifemax_yan_v={{{1,5000},{2,5000}},{{1,-1},{10,-1}}},
		lifemax_yan_p={{{1,50},{2,50}},{{1,-1},{30,-1}}},
		enhancehit_rate={{{1,50},{2,50}},{{1,-1},{20,-1}}},
		anti_enhancehit_rate={{{1,15},{10,15}},{{1,-1},{2,-1}}},
		},
		
		--复仇打击
		fuchoudaji={
		add_boss_damage={{{1,50},{60,50}},{{1,-1},{21,-1}}},
		anti_allres_yan_p={
			[1]={{1,20},{20,20}},
			[2]={{1,-1},{20,-1}},
			[3]={},
		},
		allres_yan_p={{{1,25},{2,25}},{{1,-1},{2,-1}}},
		},
		
		--愈合滋养
		yuheziyang={
			block_rate={{{1,100},{2,100}},{{1,18*3},{20,18*3}}},
		},
	
	 
	 
}


