IncludeLib("PARTNER")
Include("\\script\\lib\\gb_taskfuncs.lua")

LG_PARTNER_JITAN_NAME = "长歌门祭坛"
TB_JITAN_EVENT_RADIO = {40, --掉落高级同伴技能书
						20, --出现Boss
						20, --出现给同伴经验
						20, --什么也不发生
						}
TB_JITAN_AWARD_BOOK = {
		{834,2,5},
		{835,2,5},
		{836,2,5},
		{837,2,5},
		{838,2,5},
		{839,6,8},
		{840,6,8},
		{841,6,8},
		{842,6,8},
		{843,6,8},
		{844,6,8},
		{845,6,8},
		{846,6,8},
		{847,6,8},
		{848,6,8},
		{849,1,5},
		{850,1,5},
		{851,1,5},
		{852,1,5},
		{853,1,5},
		{854,1,5},
		{855,1,5},
		{859,1,5},
		{860,1,5},
		{861,1,5},
		{862,1,5},
		{863,1,5},
		{864,1,5},
		{865,1,5},
		{866,1,5},
		{867,1,5},
		{868,1,5},
		{869,1,5},
		{870,1,5},
		{871,1,5},
		{872,1,5},
		{873,1,5},
		{874,1,5},
		{875,1,5},
		{876,1,5},
		{877,1,5},
		{878,1,5},
		{879,1,5},
		{880,1,5},
		{882,1,5},
		{883,1,5},
		{901,1,5},
	}

TB_JITAN_AWARD_EXP = {
		{1,10,3000},
		{11,20,32000},
		{21,30,100000},
		{31,40,180000},
		{41,50,250000},
		{51,60,350000},
		{61,70,500000},
		{71,80,1000000},
		{81,90,2000000},
		{91,100,3000000},
	}

function main()
	local dtask = gb_GetTask(LG_PARTNER_JITAN_NAME, changgemen_jitan)
	if (dtask == 0) then
		Talk(1, "", "长歌门祭坛：每个小时整点……祭坛五行灵力苏醒……带着同伴来祭拜……会有意想不到的事发生。")
	elseif (dtask == 1) then
		local _, callout = PARTNER_GetCurPartner() 
		if (callout == 0 or callout == nil) then
			Talk(1, "", "长歌门祭坛：祭坛的五行灵力苏醒了，需要同伴的祭拜。")
			return
		end

		local jitan_event = 0
		local jitan_radio = random(100)
		local sum = 0
		for i = 1, getn(TB_JITAN_EVENT_RADIO) do
			sum = sum + TB_JITAN_EVENT_RADIO[i]
			if (sum >= jitan_radio) then
				jitan_event = i
				break
			end
		end
		if (jitan_event == 1) then
			Talk(1, "", "长歌门祭坛：同伴的五行与祭坛的五行灵力相生相融，这是给你的秘籍。")
		elseif (jitan_event == 2) then
			Talk(1, "", "长歌门祭坛：同伴的五行与祭坛的五行灵力相克相斥，接受惩治吧。")
		elseif (jitan_event == 3) then
			Talk(1, "", "长歌门祭坛：同伴的五行与祭坛的五行灵力相生相融，他又成长了。")
		elseif (jitan_event == 4) then
			Talk(1, "", "长歌门祭坛：同伴的五行与祭坛的五行灵力非生非克，下次再来祭拜吧。")
		else
			gb_SetTask(LG_PARTNER_JITAN_NAME, changgemen_jitan, 0)
			return
		end
		gb_SetTask(LG_PARTNER_JITAN_NAME, changgemen_jitan, 0)
		jitan_event_award(jitan_event)
	end
end

function jitan_event_award(eventid)
	local W, X, Y = GetWorldPos()
	if (eventid == 1) then
		local bookid = random( getn( TB_JITAN_AWARD_BOOK ) )
		DropItem(SubWorld, (X - 2) * 32, (Y - 3) * 32, PlayerIndex, 6, 1, TB_JITAN_AWARD_BOOK[bookid][1], random(TB_JITAN_AWARD_BOOK[bookid][2], TB_JITAN_AWARD_BOOK[bookid][3]), 0, 1, 1)
	elseif (eventid == 2) then
		AddNpc(1115, 95, SubWorld, (X + 1) * 32, (Y - 1) * 32, 1, "禁地守卫", 1)
	elseif (eventid == 3) then
		local partneridx = PARTNER_GetCurPartner()
		if (partneridx ~= -1 and partneridx ~= 0) then
			partnerlvl = PARTNER_GetLevel(partneridx)
			for i = 1, getn(TB_JITAN_AWARD_EXP) do
				if (partnerlvl >= TB_JITAN_AWARD_EXP[i][1] and partneridx <= TB_JITAN_AWARD_EXP[i][2]) then
					PARTNER_AddExp(partneridx, TB_JITAN_AWARD_EXP[i][3])
					break
				end
			end
		end
	end
end