Include("\\script\\skill\\head.lua")
SKILLS={
	zhuizongshu ={ --×·×ÙÊõ
		allres_yan_p={{{1,-1},{20,-30}},{{1,18*6},{20,18*12}}},
		fastwalkrun_p={{{1,-1},{20,-30}},{{1,18*6},{20,18*12}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.zhuizongshu.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.zhuizongshu.allres_yan_p[2]) / 18).." gi©y<color>\n"
			end

	},

	jin_xzqs ={ --½ðÏµÏÕÖÐÇóÊ¤
		anti_sorbdamage_yan_p={{{1,5},{20,100}},{{1,18*4},{20,18*8}}},
		fastwalkrun_p={{{1,1},{20,20}},{{1,18*4},{20,18*8}}},
		fire2medamage_p={{{1,-1},{20,-20}},{{1,18*4},{20,18*8}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.jin_xzqs.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.jin_xzqs.anti_sorbdamage_yan_p[2]) / 18).." gi©y<color>\n"
			end,	
		
	},

	mu_xzqs ={ --Ä¾ÏµÏÕÖÐÇóÊ¤
		anti_sorbdamage_yan_p={{{1,5},{20,100}},{{1,18*4},{20,18*8}}},
		fastwalkrun_p={{{1,1},{20,20}},{{1,18*4},{20,18*8}}},
		metal2medamage_p={{{1,-1},{20,-20}},{{1,18*4},{20,18*8}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.mu_xzqs.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.mu_xzqs.anti_sorbdamage_yan_p[2]) / 18).." gi©y<color>\n"
			end,	
		
	},

	tu_xzqs ={ --ÍÁÏµÏÕÖÐÇóÊ¤
		anti_sorbdamage_yan_p={{{1,5},{20,100}},{{1,18*4},{20,18*8}}},
		fastwalkrun_p={{{1,1},{20,20}},{{1,18*4},{20,18*8}}},
		wood2medamage_p={{{1,-1},{20,-20}},{{1,18*4},{20,18*8}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.tu_xzqs.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.tu_xzqs.anti_sorbdamage_yan_p[2]) / 18).." gi©y<color>\n"
			end,	
		
	},

	shui_xzqs ={ --Ë®ÏµÏÕÖÐÇóÊ¤
		anti_sorbdamage_yan_p={{{1,5},{20,100}},{{1,18*4},{20,18*8}}},
		fastwalkrun_p={{{1,1},{20,20}},{{1,18*4},{20,18*8}}},
		earth2medamage_p={{{1,-1},{20,-20}},{{1,18*4},{20,18*8}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.shui_xzqs.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.shui_xzqs.anti_sorbdamage_yan_p[2]) / 18).." gi©y<color>\n"
			end,	
		
	},

	huo_xzqs ={ --»ðÏµÏÕÖÐÇóÊ¤
		anti_sorbdamage_yan_p={{{1,5},{20,100}},{{1,18*4},{20,18*8}}},
		fastwalkrun_p={{{1,1},{20,20}},{{1,18*4},{20,18*8}}},
		water2medamage_p={{{1,-1},{20,-20}},{{1,18*4},{20,18*8}}},
		skill_mintimepercast_v={{{1,20*18},{20,16*18}}},
		skill_mintimepercastonhorse_v={{{1,20*18},{20,16*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.huo_xzqs.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n".."Thêi gian duy tr×: <color=orange>"..floor(Link(level,SKILLS.huo_xzqs.anti_sorbdamage_yan_p[2]) / 18).." gi©y<color>\n"
			end,	
		
	},

}