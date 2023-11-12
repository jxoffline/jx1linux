--µü´úº¯Êı£¬ÓÃÓÚ¼ÆËã¼¼ÄÜÊìÁ·¶È
--¾ßÌå·½·¨£º
--¸ù¾İ1¼¶ÊìÁ·¶È£¬Éı¼¶¼ÓËÙ¶È£¬¼¶Êı£¬ÖØ¸´ÉËº¦´ÎÊı£¬·¶Î§£¬¼ÆËã³öÏàÓ¦µÈ¼¶ÊìÁ·¶È
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--½£åĞÒ£
	wugoushuangxue={ --Îâ¹³ËªÑ©
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,5*1.5},{20,75*1.5}}},
		lightingdamage_v={
			[1]={{1,15},{20,180}},
			[3]={{1,15},{20,180}}
		},
		addskilldamage1={
			[1]={{1,1920},{2,1920}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1925},{2,1925}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage3={
			[1]={{1,1929},{2,1929}},
			[3]={{1,1},{20,35}}
		},
		skill_cost_v={{{1,10},{20,10}}}
	},

	xiaoyaojianfa ={ --åĞÒ£½£·¨
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		deadlystrikeenhance_p={{{1,6},{20,25}},{{1,-1},{2,-1}}}
	},

	yigonghuanyu={ --ÒÆ¹¬»»Óğ
		freezetimereduce_p={{{1,1},{20,30}},{{1,-1},{2,-1}}},
		skill_desc=
			function(level)
				return "Mçi <color=orange> "..floor(Link(level,SKILLS.yigonghuanyu.autocastskill[3]) / 18/256).." gi©y<color> tù ®éng nhËn <color=orange>"..floor(Link(level,SKILLS.yinlv.special_point_add[3])).." tÇng [¢m LuËt]<color>"
				--.."×î¶àÓµÓĞ<color=orange>"..floor(Link(level,SKILLS.yigonghuanyu.special_point_base[3])).."²ã¡¾ÒôÂÉ¡¿<color>"
			end,
		autocastskill = {
			{{1,1917*256 + 1},{20,1917*256 + 20}},--Ä¿±ê¼¼ÄÜid * 256 + µÈ¼¶
			{{1,-1},{20,-1}},-- Îª1±íÊ¾ËãCD£¬²»ËãCDÌî-1
			{{1, (1*18*256 + 100)},{20, (1*18*256 + 100)}},-- ¼ä¸ôÖ¡Êı * 256 + ·¢¶¯¼¸ÂÊ
		},
		special_point_base={
			{{1,1916},{20,1916}},-- Ä¿±ê¼¼ÄÜid
			{{1,-1},{20,-1}},-- ÅäÔÚÖ÷¶¯¼¼ÄÜÊôĞÔÉÏÌî0£¬×÷ÎªbuffÊôĞÔÌî-1
			{{1,10},{20,10}},-- Ôö¼Ó¸öÊı
		}
	},
	yinlv={ --ÒÆ¹¬»»Óğ-ÒôÂÉ£¨Ö÷¶¯£©
		special_point_add={
			{{1,1916},{20,1916}},-- Ä¿±ê¼¼ÄÜid
			{{1,0},{20,0}},-- ÅäÔÚÖ÷¶¯¼¼ÄÜÊôĞÔÉÏÌî0£¬×÷ÎªbuffÊôĞÔÌî-1
			{{1,1},{20,1}},-- Ôö¼Ó¸öÊı
		}
	},

	sataliuxing={ --ìªí³Á÷ĞÇ
		cost_sp={
			{{1,1916},{20,1916}},  -- Ä¿±ê¼¼ÄÜid
			{{1,0},{20,0}}, -- ÌîÁã
			{{1,8},{20,3},{21,3}}, -- ³Ô¼¸¸ö
		},
		skill_param1_v={{{1,280},{15,280}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_desc=
			function(level)
				return "<color=orange>§iÒu kiÖn thi triÓn: <color><color=yellow>"..floor(Link(level,SKILLS.sataliuxing.cost_sp[3])).." tÇng [¢m LuËt]<color>\n"..
				"Kho¶ng c¸ch di h×nh tèi ®a: <color=orange>"..floor(Link(level,SKILLS.sataliuxing.skill_param1_v[1])).."<color>\n"
			end,
	},
	
	yijianfutian={ --ÒĞ½£·÷Ìì
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,55},{20,386}}},
		stun_p={{{1,5},{20,15},{21,15}},{{1,1},{20,12},{21,12}}},
		lightingdamage_v={
			[1]={{1,45},{20,532}},
			[3]={{1,45},{20,532}}
		},
		addskilldamage1={
			[1]={{1,1925},{2,1925}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1929},{2,1929}},
			[3]={{1,1},{20,60}}
		},
		skill_cost_v={{{1,15},{20,40}}}
	},

	yinanbaima={ --Òø°°°×Âí
		fastwalkrun_p={{{1,9},{20,30}},{{1,-1},{20,-1}}},
	},

	xiagurouqing={	--ÏÀ¹ÇÈáÇé
		lifemax_yan_v={{{1,180},{35,6400},{36,6480}},{{1,-1},{20,-1}}},
		unravel_effect={{{1,7},{2,15},{40,300},{41,300}},{{1,-1},{20,-1}}},
	},

	qianliduxing={ --Ç§Àï¶ÀĞĞ£¨ÕòÅÉ£©
		deadlystrikeenhance_p={{{1,6},{30,15}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,25},{30,65},{34,73},{35,90},{36,92}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,25},{20,65},{33,92},{35,118},{38,124},{39,126}},{{1,-1},{30,-1}}},
		addlightingmagic_p={{{1,5},{20,43}},{{1,-1},{2,-1}}},
		addlightingdamage_v={{{1,45},{30,315}},{{1,-1},{2,-1}}},
		lifemax_yan_p={{{1,21},{35,80},{36,81}},{{1,-1},{30,-1}}},
		me2waterdamage_p={{{1,20},{35,20},{36,20}},{{1,-1},{30,-1}}},
		water2medamage_p={{{1,20},{35,20},{36,20}},{{1,-1},{30,-1}}},
		anti_block_rate={{{1,30},{35,30},{36,30}},{{1,-1},{30,-1}}}, 
	},

	jianjuefuyun={ --½£¾ö¸¡ÔÆ£¨½£åĞÒ£90£©
		physicsenhance_p={{{1,24},{33,790}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		stun_p={{{1,5},{20,20},{21,20}},{{1,1},{20,12},{21,12}}},
		deadlystrike_p={{{1,16},{20,25}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,673}},
			[3]={{1,39},{15,200},{20,673}}
		},
		skill_cost_v={{{1,35},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1926},{20,1926}}
		},
		addskilldamage1={
			[1]={{1,1929},{2,1929}},
			[3]={{1,1},{20,35}}
		},
		skill_desc=
			function(level)
				if (level > 10) then
				return "<color=orange>S¸t th­¬ng cuèi vµ hiÖu øng khèng chÕ x2<color>\n "
				end
				return ""
			end,
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_showevent={{{1,2},{20,2}}},
		skill_skillexp_v={
			{
				{1,SkillExpFunc(6860,1.15,1,5,1)},
				{2,SkillExpFunc(6860,1.15,2,5,1)},
				{3,SkillExpFunc(6860,1.16,3,5,1)},
				{4,SkillExpFunc(6860,1.17,4,5,1)},
				{5,SkillExpFunc(6860,1.18,5,5,1)},
				{6,SkillExpFunc(6860,1.19,6,5,1)},
				{7,SkillExpFunc(6860,1.20,7,5,1)},
				{8,SkillExpFunc(6860,1.21,8,5,1)},
				{9,SkillExpFunc(6860,1.22,9,5,1)},
				{10,SkillExpFunc(6860,1.23,10,5,1)},
				{11,SkillExpFunc(6860,1.24,11,5,1)},
				{12,SkillExpFunc(6860,1.23,12,5,1)},
				{13,SkillExpFunc(6860,1.22,13,5,1)},
				{14,SkillExpFunc(6860,1.21,14,5,1)},
				{15,SkillExpFunc(6860,1.20,15,5,1)},
				{16,SkillExpFunc(6860,1.19,16,5,1)},
				{17,SkillExpFunc(6860,1.18,17,5,1)},
				{18,SkillExpFunc(6860,1.17,18,5,1)},
				{19,SkillExpFunc(6860,1.16,19,5,1)},
				{20,SkillExpFunc(6860,1.15,20,5,1)},
			}
		},
	},

	danzhichishang={ --à¢ÖË³Öõü£¨120£©
		autoattackskill={
			{{1,1928*256 + 1},{20,2128*256 + 20},{21,1928*256 + 21}},--¼¼ÄÜid*256 + ¼¼ÄÜµÈ¼¶
			{{1,-1},{20,-1}},
			{{1,20*18*256 + 1},{30,20*18*256 + 10},{31,20*18*256 + 10}}--ÀäÈ´Ê±¼ä*256+¸ÅÂÊ
		},
		skill_desc=
			function(level)
				return "Tróng môc tiªu cã <color=orange> "..floor(Link(level,SKILLS.danzhichishang.autoattackskill[3]) - 20*18*256).."%<color> kİch ho¹t tr¹ng th¸i <color=water>[Say]<color>\n"..
				"Sau mçi lÇn thi triÓn<color=orange>"..floor((Link(level,SKILLS.danzhichishang.autoattackskill[3]) / (18*256))).." gi©y<color> sÏ kh«ng kİch ho¹t l¹i\n\n"..
				"Tr¹ng th¸i <color=water>[Say]<color>: TÊn c«ng t¨ng <color=orange>"..floor(Link(level,SKILLS.danzhichishang_Buff.add_damage_p[1])).."%<color>,"..
				" trong <color=orange>"..floor(Link(level,SKILLS.danzhichishang_Buff.add_damage_p[2]) / 18).."<color> gi©y "
			end,
		skill_skillexp_v={
			{
				{1,17851239},
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
			}
		},
	},
	danzhichishang_Buff={ --à¢ÖË³Öõü_Buff
		add_damage_p={{{1,1},{2,1},{20,10}},{{1,7*18},{20,7*18},{21,7*18}}},
	},

	shibuyisha={ --Ê®²½Ò»É±£¨½£åĞÒ£150£©
		physicsenhance_p={{{1,50},{33,1643}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,48},{15,240},{20,806},{23,1485},{26,1824}},
			[3]={{1,48},{15,240},{20,806},{23,1485},{26,1824}}
		},
		deadlystrike_p={{{1,20},{20,30},{23,33},{26,34}}},
		stun_p={{{1,5},{20,20},{21,20}},{{1,1},{20,12},{21,12}}},
		cost_sp={
			{{1,1916},{20,1916}},  -- Ä¿±ê¼¼ÄÜid
			{{1,0},{20,0}}, -- ÌîÁã
			{{1,3},{20,3}}, -- ³Ô¼¸¸ö
		},
		skill_cost_v={{{1,40},{20,72},{23,82},{26,87}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		missle_hitcount={{{1,25},{20,25}}},
		skill_desc=
			function(level)
				return "KhiÕn ®Şch trong ph¹m vi chŞu <color=orange>"..floor(Link(level,SKILLS.shibuyisha.missle_hitcount[1])).." lÇn <color>tr¶m kİch, mçi môc tiªu tèi ®a tr¶m tr¶m kİch <color=orange>5 lÇn<color>\n"..
				"<color=orange>Thi triÓn nhËn tr¹ng th¸i kh«ng thÓ bŞ chän<color>\n"..
				"<color=orange>§iÒu kiÖn thi triÓn: <color><color=yellow>"..floor(Link(level,SKILLS.shibuyisha.cost_sp[3])).." tÇng [¢m LuËt]<color>\n"
			end,
		skill_skillexp_v={
			{
				{1,300},
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
			}
		},
	},

	shibuyisha_Buff={ --Ê®²½Ò»É±_Buff
		hidebodyunlock={{{1,1},{2,1}},{{1,10},{2,10}}},
		forbit_attack={{{1,1},{2,1}},{{1,7},{2,7}}},
		frozen_action={{{1,1},{2,1}},{{1,10},{2,10}}},
		invincibility={{{1,1},{2,1}},{{1,10},{2,10}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},

	suiyiqu={ --ËæÒâÇú
		--lightingdamage_p={{{1,1},{20,16}}},
		lightingdamage_v={
			[1]={{1,1},{20,16}},
			[3]={{1,1},{20,16}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,1940},{2,1940}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1941},{2,1941}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage3={
			[1]={{1,1942},{2,1942}},
			[3]={{1,1},{20,35}}
		},
		skill_cost_v={{{1,15},{20,20}}}
	},

	xiaoyaoqinfa={ --åĞÒ£ÇÙ·¨
		addlightingmagic_p={{{1,5},{20,43}},{{1,-1},{2,-1}}},
	},

	luoyanpingsha={ --ÂäÑãÆ½É³
		seriesdamage_p={{{1,5},{20,30}}},
		--lightingdamage_p={{{1,1},{20,10}}},
		lightingdamage_v={
			[1]={{1,1},{20,10}},
			[3]={{1,1},{20,10}}
		},
		stun_p={{{1,5},{20,90},{21,90}},{{1,1},{20,12},{21,12}}},
		cost_sp={
			{{1,1916},{20,1916}},  -- Ä¿±ê¼¼ÄÜid
			{{1,0},{20,0}}, -- ÌîÁã
			{{1,8},{20,8}}, -- ³Ô¼¸¸ö
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_desc=
			function(level)
				return "<color=orange>§iÒu kiÖn thi triÓn: <color><color=yellow>"..floor(Link(level,SKILLS.luoyanpingsha.cost_sp[3])).." tÇng [¢m LuËt]<color>\n"..
				"Khi thi triÓn, b¶n th©n vµ <color=orange>"..floor(Link(level,SKILLS.xiaoyaoyu.missle_hitcount[1])).."<color> ®ång ®éi nhËn ®­îc Hé ThuÉn ¢m LuËt\n"..
				"Hé thuÉn kh¸ng s¸t th­¬ng b»ng <color=orange>"..floor(Link(level,SKILLS.xiaoyaoyu.staticmagicshield_p[1])/100).." lÇn<color> néi lùc tèi ®a, duy tr× <color=orange>"..floor(Link(level,SKILLS.xiaoyaoyu.staticmagicshield_p[2])/18).." gi©y<color>\n"
			end,
	},
	xiaoyaoyu={ --åĞÒ£Óğ£¬ÂäÑãÆ½É³_Buff
		--do_stun_p={{{1,1},{20,25},{21,25}},{{1,5*18},{20,5*18}}}, 
		--lightingenhance_p={{{1,1},{20,20}},{{1,5*18},{2,5*18}}},
		lightingdamage_v={
			[1]={{1,1},{20,20}},
			[3]={{1,1},{20,20}}
		},
		staticmagicshield_p={{{1,100},{20,1000},{21,1050}},{{1,5*18},{20,5*18}}},
		missle_hitcount={{{1,1},{20,7},{21,7}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},

	guanglingsan={ --¹ãÁêÉ¢
		--lightingdamage_p={{{1,1},{20,16}}},
		lightingdamage_v={
			[1]={{1,1},{20,16}},
			[3]={{1,1},{20,16}}
		},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		skill_misslenum_v={{{1,2},{11,3},{16,4},{20,4}}},
		skill_cost_v={{{1,70},{20,130}}},
		addskilldamage1={
			[1]={{1,1941},{2,1941}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1942},{2,1942}},
			[3]={{1,1},{20,60}}
		},
	},

	gaoshanliushui={ --¸ßÉ½Á÷Ë®£¨ÇÙåĞÒ£90£©
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		--lightingdamage_p={{{1,1},{33,39}}},
		lightingdamage_v={
			[1]={{1,1},{33,39}},
			[3]={{1,1},{33,39}}
		},
		
		stun_p={{{1,3},{20,60},{21,60}},{{1,1},{20,12},{21,12}}},
		addskilldamage1={
			[1]={{1,1942},{2,1942}},
			[3]={{1,1},{20,35}}
		},
		skill_cost_v={{{1,60},{20,150}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={
			{
				{1,SkillExpFunc(5330,1.15,1,8,1)},
				{2,SkillExpFunc(5330,1.15,2,8,1)},
				{3,SkillExpFunc(5330,1.16,3,8,1)},
				{4,SkillExpFunc(5330,1.17,4,8,1)},
				{5,SkillExpFunc(5330,1.18,5,8,1)},
				{6,SkillExpFunc(5330,1.19,6,8,1)},
				{7,SkillExpFunc(5330,1.20,7,8,1)},
				{8,SkillExpFunc(5330,1.21,8,8,1)},
				{9,SkillExpFunc(5330,1.22,9,8,1)},
				{10,SkillExpFunc(5330,1.23,10,8,1)},
				{11,SkillExpFunc(5330,1.24,11,8,1)},
				{12,SkillExpFunc(5330,1.23,12,8,1)},
				{13,SkillExpFunc(5330,1.22,13,8,1)},
				{14,SkillExpFunc(5330,1.21,14,8,1)},
				{15,SkillExpFunc(5330,1.20,15,8,1)},
				{16,SkillExpFunc(5330,1.19,16,8,1)},
				{17,SkillExpFunc(5330,1.18,17,8,1)},
				{18,SkillExpFunc(5330,1.17,18,8,1)},
				{19,SkillExpFunc(5330,1.16,19,8,1)},
				{20,SkillExpFunc(5330,1.15,20,8,1)},
}
		},
	},

	meihuasannong={ --Ã·»¨ÈıÅª£¨ÇÙåĞÒ£150£©
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,45},{33,75}},
			[3]={{1,45},{33,75}}
		},
		--lightingdamage_p={{{1,2},{33,75}}},
		lightingdamage_v={
			[1]={{1,2},{33,75}},
			[3]={{1,2},{33,75}}
		},
		skill_collideevent={
			[1]={{1,0},{10,0},{11,1},{20,1}},
			[3]={{1,1943},{20,1943}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,0},{10,0},{11,4},{20,4}}},
		skill_cost_v={{{1,72},{20,180},{23,214},{26,231}}},
		skill_skillexp_v={
			{
				{1,300},
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
			}
		},
	},
	yangguansandie={ --Ñô¹ØÈıµş£¨Ã·»¨ÈıÅª×Ó¼¼ÄÜ£©
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,45},{33,47}},
			[3]={{1,45},{33,47}}
		},
		--lightingdamage_p={{{1,1},{33,47}}},
		lightingdamage_v={
			[1]={{1,1},{33,47}},
			[3]={{1,1},{33,47}}
		},
		stun_p={{{1,5},{20,50},{21,50}},{{1,1},{20,12},{21,12}}},
	},

	zhizunyinjian={ --åĞÒ£ÅÉÖÁ×ğÓ¡¼ø¼¼ÄÜ
		special_point_base={
			{{1,1916},{20,1916}},-- Ä¿±ê¼¼ÄÜid
			{{1,-1},{20,-1}},-- ÅäÔÚÖ÷¶¯¼¼ÄÜÊôĞÔÉÏÌî0£¬×÷ÎªbuffÊôĞÔÌî-1
			{{1,2},{20,2}},-- Ôö¼Ó¸öÊı
		}
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--¸ù¾İ2¸öµã£¬ÇóÏßĞÎº¯Êıf(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--µ±x2=x1, ÓĞx=c,¸ÃÖ±ÏßÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ı´Ë2µãµÄ
--º¯ÊıÎª£º
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--¸ù¾İ2¸öµã£¬Çó2´ÎĞÎº¯Êıf(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--µ±x1»òÕßx2 < 0 ,y =0
--µ±x2=x1, ÓĞx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ı´Ë2µãµÄ
--º¯ÊıÎª£ºextrac
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
--¸ù¾İ2¸öµã£¬Çó-2´ÎĞÎº¯Êıf(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--µ±x2»òÕßx1<0, y=0,
--µ±x1=x2,ÓĞx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ı´Ë2µãµÄ
--º¯ÊıÎª£ºextrac
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
--Ãè»æÁ¬½ÓÏß:Link(x,points)
--¸ù¾İpointsÌá¹©µÄÒ»ÏµÁĞµã£¬ÓÃÏàÁÚµÄÁ½¸öµãÃè»æÇúÏß
--return yÖµ
--x ÊäÈëÖµ
--points µã¼¯ºÏ
--ĞÎÈç£ºpointsÊÇĞÎÈç{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}µÄÓ³Éä
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
--¼¼ÄÜÉè¶¨¸ñÊ½ÈçÏÂ£º
--SKILLS={
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôĞÔ=	{
--			[1]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôĞÔ=	{
--			[1]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôĞÔ=	{
--			[1]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôĞÔ=	{
--			[1]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ğ,ÊıÖµ£¬ÇúÏß}£¬{¼¶±ğ£¬ÊıÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¡£¡£¡£¡£¡£
--}
--Èç£º
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--Ä§·¨ÊôĞÔphysicsenhance_p²ÎÊı1£¬1¼¶Ê±Îª35£¬20¼¶Ê±Îª335£¬ÇúÏß²»Ìî£¬Ä¬ÈÏÏßĞÎ
--			[2]={{1,0},{20,0}},
--		},--Ã»ÓĞ[3]£¬±íÊ¾Ä§·¨ÊôĞÔphysicsenhance_p²ÎÊı2£¬Ä¬ÈÏÎªÈÎºÎÊ±ºò¶¼ÊÇ0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--ÒÔÉÏÃèÊö¼¼ÄÜ¡°Èı»·Ì×ÔÂ¡±µÄÄ§·¨ÊôĞÔºÍÊıÖµ
-----------------------------------------------------------
--º¯ÊıGetSkillLevelData(levelname, data, level)
--levelname£ºÄ§·¨ÊôĞÔÃû³Æ
--data£º¼¼ÄÜÃû³Æ
--level£º¼¼ÄÜµÈ¼¶
--return£ºµ±¼¼ÄÜÃû³ÆÎªdata£¬¼¼ÄÜµÈ¼¶Îªlevel
--			Ê±µÄÄ§·¨ÊôĞÔlevelnameËùĞèÇóµÄÈı¸ö²ÎÊıµÄ¾ßÌåÖµ
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


