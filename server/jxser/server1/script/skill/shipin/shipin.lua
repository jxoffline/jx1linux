Include("\\script\\skill\\head.lua")
SKILLS={ --饰品
	bingfengqianli={ --冰封千里
		fastwalkrun_p={{{1,-50},{20,-50}},{{1,18*3},{20,18*3}}},
	},
	binghuanchufa={ --冰环触发
		autoreplyskill={{{1,1021 * 256 + 1},{20,1021 * 256 + 20},{21,1021*256 + 21}},{{1,-1},{2,-1}},{{1,60*18*256 + 50},{19,60*18*256 + 50},{20,60*18*256 + 50},{21,60*18*256 + 50}}},
	},
	binghuanzidan={ --冰环子弹
		forbit_attack={{{1,1},{2,1}},{{1,18*3},{2,18*3}}},
		frozen_action={{{1,1},{2,1}},{{1,18*3},{2,18*3}}},
		invincibility={{{1,1},{2,1}},{{1,18*3},{2,18*3}}},
		forbit_takemedicine={{{1,1},{2,1}},{{1,18*3},{2,18*3}}},
		missle_hitcount={{{1,3},{20,3}}},
	},
	guanghuan_lifemax1={ --加血上限
		lifemax_v={{{1,800},{2,800}},{{1,18*8},{2,18*8}}},
		lifemax_yan_v={{{1,800},{2,800}},{{1,18*8},{2,18*8}}},
	},
	guanghuan_lifemax2={ --减血上限
		lifemax_v={{{1,-800},{2,-800}},{{1,18*8},{2,18*8}}},
		lifemax_yan_v={{{1,-800},{2,-800}},{{1,18*8},{2,18*8}}},
	},
	guanghuan_fastwalkrun1={ --加跑速
		fastwalkrun_p={{{1,30},{2,30}},{{1,18*8},{2,18*8}}},
	},
	guanghuan_fastwalkrun2={ --减跑速
		fastwalkrun_p={{{1,-30},{2,-30}},{{1,18*8},{2,18*8}}},
	},
	zhandan_randmove={ --群体随机走动
		randmove={{{1,1},{2,1}},{{1,4*18},{20,4*18}}},
		missle_missrate={{{1,25},{2,25}}},
		missle_hitcount={{{1,1},{2,1}}},
	},
	zhandan_fatallystrike={ --致命一击
		fatallystrike_p={{{1,75},{2,75}}},
	},
	zhudong_quankang={ --释放自身全抗		
		allres_yan_p={{{1,10},{2,10}},{{1,18*90},{2,18*90}}},
		allres_p={{{1,10},{2,10}},{{1,18*90},{2,18*90}}},
	},
	zhudong_jiangongji={ --主动减攻减速
		fastwalkrun_p={{{1,-30},{2,-30}},{{1,18*60},{2,18*60}}},
		attackratingenhance_p={{{1,-155},{2,-155}},{{1,18*60},{20,18*60}}},
		skill_enhance={{{1,-25},{2,-25}},{{1,18*60},{20,18*60}}},
	},
}

