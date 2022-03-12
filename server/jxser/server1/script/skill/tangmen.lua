--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--唐门
	pili_dan={ --霹雳弹
		physicsenhance_p={{{1,20},{20,80}}},
		seriesdamage_p={{{1,1},{20,10}}},
		poisondamage_v={{{1,1},{20,5}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{20,8}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,1},{20,1}},
			[3]={{1,1113},{20,1113}}
		},
		skill_showevent={{{1,8},{20,8}}},
		addskilldamage1={
			[1]={{1,339},{2,339}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,302},{2,302}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,342},{2,342}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage4={
			[1]={{1,341},{2,341}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage5={
			[1]={{1,249},{2,249}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage6={
			[1]={{1,58},{2,58}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage7={
			[1]={{1,1069},{2,1069}},
			[3]={{1,1},{20,38}}
		},
		addskilldamage8={
			[1]={{1,1070},{2,1070}},
			[3]={{1,1},{20,30}}
		},
		addskilldamage9={
			[1]={{1,1071},{2,1071}},
			[3]={{1,1},{20,35}}
		},
		skill_cost_v={{{1,12},{20,12}}}
	},
	tangmen_anqi={ --唐门暗器
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,7},{2,7}}},
	},
	duohun_biao={ --夺魂镖
		physicsenhance_p={{{1,25},{20,115}}},
		seriesdamage_p={{{1,5},{20,30}}},
		deadlystrike_p={{{1,2},{20,12}}},
		addskilldamage1={
			[1]={{1,342},{2,342}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,1071},{2,1071}},
			[3]={{1,1},{20,38}}
		},
		addskilldamage3={
			[1]={{1,1099},{2,1099}},
			[3]={{1,1},{20,38}}
		},
		addskilldamage4={
			[1]={{1,1100},{2,1100}},
			[3]={{1,1},{20,38}}
		},
		poisondamage_v={{{1,3},{20,8}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,5},{20,16}}}
	},
	xinyan={ --心眼
		addcolddamage_v={{{1,10},{30,110}},{{1,-1},{2,-1}}},
		addpoisondamage_v={{{1,1},{30,10}},{{1,-1},{2,-1}},{{1,10},{2,10}}},
		addphysicsdamage_p={{{1,15},{20,115}},{{1,-1},{2,-1}},{{1,7},{2,7}}},
		anti_do_stun_p={{{1,1},{39,20},{40,20}},{{1,-1},{10,-1}}},
		--poisonenhance_p={{{1,3},{30,33}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,8},{30,26}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,29},{30,106},{33,113},{34,116},{35,149},{38,156},{39,159},{40,162}},{{1,-1},{2,-1}}},
		lifemax_yan_p={{{1,80},{20,80},{36,80}},{{1,-1},{30,-1}}},		--最大生命值（阳）由20%调整到80% 20160801
		me2earthdamage_p={{{1,1},{30,20},{31,20}},{{1,-1},{2,-1}}},--对土系伤害增加：15%
		earth2medamage_p={{{1,1},{30,20},{31,20}},{{1,-1},{2,-1}}},--减少来自土系的伤害：15%
		do_hurt_p={{{1,1},{30,18},{31,18}},{{1,18},{2,18}}},
		--fasthitrecover_v={{{1,0.5},{10,5}},{{1,-1},{2,-1}}}	--取消每一级减少受伤动作时间0.5 20160919
	},
	zhuixin_jian={ --追心箭
		physicsenhance_p={{{1,20},{20,185}}},
		seriesdamage_p={{{1,5},{20,30}}},
		poisondamage_v={{{1,3},{20,8}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,5},{20,15}}},
		addskilldamage1={
			[1]={{1,339},{2,339}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1069},{2,1069}},
			[3]={{1,1},{20,42}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,20},{20,20}}},
	},
	mantian_huayu={ --漫天花雨
		physicsenhance_p={{{1,30},{20,185}}},
		seriesdamage_p={{{1,5},{20,30}}},
		poisondamage_v={{{1,3},{20,8}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{20,8}}},
		addskilldamage1={
			[1]={{1,302},{2,302}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,1070},{2,1070}},
			[3]={{1,1},{20,38}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,40},{20,40}}}
	},
	tianluo_diwang={ --天罗地网
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,80},{20,344}}},
		poisondamage_v={{{1,5},{20,24}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,5},{20,14}}},
		addskilldamage1={
			[1]={{1,302},{2,302}},
			[3]={{1,1},{20,55}}
		},
		addskilldamage2={
			[1]={{1,1070},{2,1070}},
			[3]={{1,1},{20,46}}
		},
		missle_speed_v={{{1,26},{20,28},{21,28}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,45},{20,65}}}
	},
	tianluo_diwang1={ --天罗地网
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,80/2},{20,240/2}}},
		missle_speed_v={{{1,26},{20,28},{21,28}}},
	},
	xiaoli_feidao={ --小李飞刀
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,50},{20,344},{25,344},{26,359}}},
		poisondamage_v={{{1,5},{20,24}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,10},{20,59}}},
		skill_dohurt={{{1,10},{20,53},{21,53}}},
		addskilldamage1={
			[1]={{1,340},{2,340}},
			[3]={{1,1},{20,82}}
		},
		addskilldamage2={
			[1]={{1,1097},{2,1097}},
			[3]={{1,1},{20,68}}
		},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,50},{20,50}}}
	},
	diyan_huo={ --地焰火
		firedamage_v={
			[1]={{1,60},{20,400}},
			[3]={{1,60},{20,400}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		skill_cost_v={{{1,20},{20,60}}}
	},
	duci_gu={ --毒刺骨
		poisondamage_v={
			[1]={{1,8},{20,40}},
			[2]={{1,100},{20,100}},
			[3]={{1,10},{20,10}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		skill_cost_v={{{1,20},{20,60}}}
	},
	chuanxin_ci={ --穿心刺
		seriesdamage_p={{{1,5},{20,30}}},
		physicsdamage_v={
			[1]={{1,60},{20,400}},
			[3]={{1,60},{20,400}}
		},
		skill_cost_v={{{1,20},{20,60}}}
	},
	hanbing_ci={ --寒冰刺
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,60},{20,400}},
			[2]={{1,1},{20,18}},
			[3]={{1,60},{20,400}}
		},
		skill_cost_v={{{1,20},{20,60}}}
	},
	leiji_shu={ --雷击术
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		lightingdamage_v={
			[1]={{1,60},{20,400}},
			[3]={{1,60},{20,400}}
		},
		stun_p={{{1,1},{20,20}},{{1,1},{20,20}}},
		skill_cost_v={{{1,20},{20,60}}}
	},
	luanhuan_ji={ --乱环击
		firedamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		poisondamage_v={
			[1]={{1,20},{20,80}},
			[2]={{1,50},{20,50}},
			[3]={{1,10},{20,10}}
		},
		physicsdamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		colddamage_v={
			[1]={{1,100},{20,400}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,400}}
		},
		lightingdamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		stun_p={{{1,1},{20,20}},{{1,1},{20,20}}},
		skill_cost_v={{{1,60},{20,120}}}
	},
	nomovespeedatt = {
		nomovespeed={
			[1]={{1,100},{10,0}},
			[2]={{1,5*18},{20,20*18}},
			[3]={{1,10},{20,10}}
		},
		skill_cost_v={{{1,1},{20,20}}}
	
	},


	shehun_yueying={ --摄魂月影
		physicsenhance_p={{{1,25},{15,150},{20,301}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		poisondamage_v={{{1,5},{20,31}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,10},{20,59}}},
		skill_cost_v={{{1,30},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,340},{20,340}}
		},
		addskilldamage1={
			[1]={{1,1069},{2,1069}},
			[3]={{1,1},{20,42}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4000,1.215,1,1,3)},
							{2,SkillExpFunc(4000,1.15,2,1,3)},
							{3,SkillExpFunc(4000,1.16,3,1,3)},
							{4,SkillExpFunc(4000,1.17,4,1,3)},
							{5,SkillExpFunc(4000,1.18,5,1,3)},
							{6,SkillExpFunc(4000,1.19,6,1,3)},
							{7,SkillExpFunc(4000,1.20,7,1,3)},
							{8,SkillExpFunc(4000,1.21,8,1,3)},
							{9,SkillExpFunc(4000,1.22,9,1,3)},
							{10,SkillExpFunc(4000,1.23,10,1,3)},
							{11,SkillExpFunc(4000,1.24,11,1,3)},
							{12,SkillExpFunc(4000,1.23,12,1,3)},
							{13,SkillExpFunc(4000,1.22,13,1,3)},
							{14,SkillExpFunc(4000,1.21,14,1,3)},
							{15,SkillExpFunc(4000,1.20,15,1,3)},
							{16,SkillExpFunc(4000,1.19,16,1,3)},
							{17,SkillExpFunc(4000,1.18,17,1,3)},
							{18,SkillExpFunc(4000,1.17,18,1,3)},
							{19,SkillExpFunc(4000,1.16,19,1,3)},
							{20,SkillExpFunc(4000,1.15,20,1,3)},
							}},
	},
	yindao_sheyue={ --银刀射月
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,30},{27,240},{30,320},{31,330}}},
	},
	feidaotang150={ --飞刀唐150
		physicsenhance_p={{{1,30},{15,180},{20,360},{23,576},{26,684}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		poisondamage_v={{{1,6},{20,38},{23,48},{26,53}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,12},{20,72},{23,90},{26,100}}},
		skill_cost_v={{{1,40},{20,80},{23,92}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1097},{20,1097}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		missle_speed_v={{{1,32},{20,40},{21,40}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	feidaotang150_2={ --飞刀唐150第2式
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,30},{20,140},{23,174},{26,192}}},
		--增加第三式银刀射月 edited by LLX
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,340},{20,340}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
	},
	baoyu_lihua={ --暴雨梨花
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,15},{15,200},{20,434}}},
		skill_cost_v={{{1,25},{20,80}}},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		poisondamage_v={{{1,1},{20,19}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_lifetime_v={{{1,18},{20,18*2},{21,18*2}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(12260,1.15,1,1,1)},
							{2,SkillExpFunc(12260,1.15,2,1,1)},
							{3,SkillExpFunc(12260,1.16,3,1,1)},
							{4,SkillExpFunc(12260,1.17,4,1,1)},
							{5,SkillExpFunc(12260,1.18,5,1,1)},
							{6,SkillExpFunc(12260,1.19,6,1,1)},
							{7,SkillExpFunc(12260,1.20,7,1,1)},
							{8,SkillExpFunc(12260,1.21,8,1,1)},
							{9,SkillExpFunc(12260,1.22,9,1,1)},
							{10,SkillExpFunc(12260,1.23,10,1,1)},
							{11,SkillExpFunc(12260,1.24,11,1,2)},
							{12,SkillExpFunc(12260,1.23,12,1,2)},
							{13,SkillExpFunc(12260,1.22,13,1,2)},
							{14,SkillExpFunc(12260,1.21,14,1,2)},
							{15,SkillExpFunc(12260,1.20,15,1,2)},
							{16,SkillExpFunc(12260,1.19,16,1,2)},
							{17,SkillExpFunc(12260,1.18,17,1,2)},
							{18,SkillExpFunc(12260,1.17,18,1,2)},
							{19,SkillExpFunc(12260,1.19,19,1,2)},
							{20,SkillExpFunc(12260,1.15,20,1,2)},
							}},
		addskilldamage1={
			[1]={{1,1070},{2,1070}},
			[3]={{1,1},{20,52}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,30},{20,30},{60,10},{61,10}},
			[3]={{1,301},{20,301}}
		},
		skill_showevent={{{1,0},{10,0},{10,2},{20,2}}},
	},
	zhuixing_zhudian={ --追星逐电
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		poisondamage_v={{{1,1},{20,10}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	nutang150={ --弩唐门150
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,18},{15,240},{20,520},{23,856},{26,1024}}},
		skill_cost_v={{{1,35},{20,100},{23,120}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		poisondamage_v={{{1,1},{20,25},{23,32},{26,36}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_lifetime_v={{{1,18},{20,18*2},{21,18*2}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,18},{20,18},{60,18},{61,16}},
			[3]={{1,1098},{20,1098}}
		},
		skill_showevent={{{1,0},{10,0},{10,2},{20,2}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	nutang150_2={ --弩唐门150第2式
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,18},{15,120},{20,180},{23,252},{26,288}}},
		poisondamage_v={{{1,10},{20,20},{23,23}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	jiugong_feixing={ --九宫飞星
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,10},{15,100},{20,294}}},
		deadlystrike_p={{{1,10},{20,39}}},
		poisondamage_v={{{1,1},{20,30}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,30},{20,75}}},
		addskilldamage1={
			[1]={{1,1071},{2,1071}},
			[3]={{1,1},{20,80}}
		},
		addskilldamage2={
			[1]={{1,1099},{2,1099}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage3={
			[1]={{1,1100},{2,1100}},
			[3]={{1,1},{20,60}}
		},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4680,1.15,1,1,5)},
							{2,SkillExpFunc(4680,1.15,2,1,5)},
							{3,SkillExpFunc(4680,1.16,3,1,5)},
							{4,SkillExpFunc(4680,1.17,4,1,5)},
							{5,SkillExpFunc(4680,1.18,5,1,5)},
							{6,SkillExpFunc(4680,1.19,6,1,5)},
							{7,SkillExpFunc(4680,1.20,7,1,5)},
							{8,SkillExpFunc(4680,1.21,8,1,5)},
							{9,SkillExpFunc(4680,1.22,9,1,5)},
							{10,SkillExpFunc(4680,1.23,10,1,5)},
							{11,SkillExpFunc(4680,1.24,11,1,5)},
							{12,SkillExpFunc(4680,1.23,12,1,5)},
							{13,SkillExpFunc(4680,1.22,13,1,5)},
							{14,SkillExpFunc(4680,1.21,14,1,5)},
							{15,SkillExpFunc(4680,1.20,15,1,5)},
							{16,SkillExpFunc(4680,1.19,16,1,5)},
							{17,SkillExpFunc(4680,1.18,17,1,5)},
							{18,SkillExpFunc(4680,1.17,18,1,5)},
							{19,SkillExpFunc(4680,1.16,19,1,5)},
							{20,SkillExpFunc(4680,1.15,20,1,5)},
							}},
	},
	biaotang150={ --镖唐150
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,12},{15,120},{20,355},{23,637},{26,778}}},
		deadlystrike_p={{{1,12},{20,45},{23,55},{26,60}}},
		poisondamage_v={{{1,1},{20,36},{23,47},{26,52}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,36},{20,90},{23,107}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	biaotang150_2={ --镖唐150第2
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,12},{15,120},{20,355}}},
		deadlystrike_p={{{1,12},{20,45}}},
		poisondamage_v={{{1,1},{20,36}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,36},{20,90}}},
	},
	biaotang150_3={ --镖唐150第3
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,12},{15,120},{20,355}}},
		deadlystrike_p={{{1,12},{20,45}}},
		poisondamage_v={{{1,1},{20,36}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,36},{20,90}}},
	},
	sanhua_biao={ --散花镖
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,20},{20,274}}},
		deadlystrike_p={{{1,10},{20,39}}},
		addskilldamage1={
			[1]={{1,342},{2,342}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1071},{2,1071}},
			[3]={{1,1},{20,42}}
		},
		addskilldamage3={
			[1]={{1,1099},{2,1099}},
			[3]={{1,1},{20,42}}
		},
		addskilldamage4={
			[1]={{1,1100},{2,1100}},
			[3]={{1,1},{20,42}}
		},
		poisondamage_v={{{1,5},{20,24}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_cost_v={{{1,25},{20,50}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
	},
	tangmen120={ --120级技能
		skill_cost_v={{{1,25},{20,60}}},
		skill_mintimepercast_v={{{1,15*18},{20,3*18},{21,3*18}}},
		skill_mintimepercastonhorse_v={{{1,15*18},{20,5*18},{21,5*18}}},
		skill_param1_v={{{1,120},{20,520},{21,520}}},
		skill_desc=
			function(level)
				return "Kho秐g c竎h di h譶h t鑙 產: <color=orange>"..floor(Link(level,SKILLS.tangmen120.skill_param1_v[1])).."<color>\n"..
				"Th阨 gian kh玦 ph鬰 chi猽 th鴆: <color=orange>"..floor(Link(level,SKILLS.tangmen120.skill_mintimepercast_v[1]) / 18).." gi﹜<color>\n"..
				"Th阨 gian kh玦 ph鬰 chi猽 th鴆 tr猲 ng鵤: <color=orange>"..floor(Link(level,SKILLS.tangmen120.skill_mintimepercastonhorse_v[1]) / 18).." gi﹜<color>\n" 
			end,
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
	},
}

-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

