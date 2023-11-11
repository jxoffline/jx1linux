
-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆
-- 文件名　：translife.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-05 11:00:50

-- ======================================================


IncludeLib("SETTING")
IncludeLib("PARTNER")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")
Include("\\script\\task\\metempsychosis\\translife_6.lua")

function main()

	local n_level = GetLevel();
	local n_setlevel = n_level;
	local n_curexp = GetExp();
	
	local n_resistid = GetTaskTemp(TSKM_ZHUANSHENG_RESISTID);
	local n_transcount = ST_GetTransLifeCount();
	if n_transcount == 5 then
		n_resistid = -2
	end
	
	local nmgpoint, nprop, nresist, naddskill  =	TB_LEVEL_REMAIN_PROP[n_level][n_transcount+1][1],
													TB_LEVEL_REMAIN_PROP[n_level][n_transcount+1][2],
													TB_LEVEL_REMAIN_PROP[n_level][n_transcount+1][3],
													TB_LEVEL_REMAIN_PROP[n_level][n_transcount+1][4];
	
	if (n_level == 199 and n_transcount == 0 and n_curexp >= ZHUANSHENG_XIANDAN_MINEXP) then
		nmgpoint, nprop, nresist, naddskill  =	TB_LEVEL_REMAIN_PROP[200][n_transcount+1][1],
												TB_LEVEL_REMAIN_PROP[200][n_transcount+1][2],
												TB_LEVEL_REMAIN_PROP[200][n_transcount+1][3],
												TB_LEVEL_REMAIN_PROP[200][n_transcount+1][4];
		n_setlevel = 200;
	end
	
	WriteLog(format("[DoTransLife]\t%s\tName:%s\tAccount:%s\tDoTransLife,LEVEL:%d,SetLevel:%d,FACTION:%d,TRANSCOUNT:%d,RESIST:%d,AddMagicPoint:%d,AddProp:%d,AddResist:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), n_setlevel, GetLastFactionNumber(), n_transcount, n_resistid,
						nmgpoint, nprop, nresist));
	zhuansheng_set_gre(n_transcount+1, n_setlevel, n_resistid);
	
	if n_transcount == 5 then
		TransLife6:EnhanceTL5Skill()
	elseif n_transcount == 4 then   -- 5转处理
		--Add fee for translife 5 - modified by DinhHQ - 20130531
		Pay(10000000)
		TRANSLIFE5_translifeOperation()
	elseif n_transcount == 3 then   -- 4转处理
		--Make change translife for free - Modified by DinhHQ - 20130531
		--Pay(ZHUANSHENG_TUITION_4)
		SetTask(TSK_TRANSLIFE_4, 0)		-- 4转任务设置为未接收，杀怪时不会得到霹雳弹
		SetTask(TSK_LEAVE_SKILL_POINT_4, 0)	-- 清空剩余技能点
		SetTask(TSK_USED_SKILL_POINT_4, 0)	-- 清空已经使用的技能点
		SetTask(TSK_LAST_UP_LEVEL_4, 0)		-- 设置最后升级等级为0		
--Change items needed for translife 5 - modified by DinhHQ - 20130603
--		for i=1,getn(TBITEMNEED_4) do
--			local tbProb = TBITEMNEED_4[i].tbProb
--			ConsumeItem(3,TBITEMNEED_4[i].nCount, tbProb[1], tbProb[2], tbProb[3], -1)
--		end		
	elseif n_transcount == 2 then
		--Make change translife for free - Modified by DinhHQ - 20130531
		--Pay(3000000)
	end
	
	SetTask(144, 0);	--免费洗点
	SetRevPos(121, 55);	--设重生点在龙门镇
	zhuansheng_clear_skill(n_level, nmgpoint);		--清掉技能点
	zhuansheng_clear_prop(n_level, nprop);		--清掉潜能点
	
	SetSkillMaxLevelAddons(GetSkillMaxLevelAddons() + naddskill);

	if (n_resistid >= 0 and n_resistid <= 4) then
		AddMaxResist(n_resistid, nresist);
	elseif (n_resistid == -1) then
		for i = 0, 4 do
			AddMaxResist(i, nresist);
		end
	end
	
	local nBaseLevel = 10 --默认转生后升级到10级
		
	ST_LevelUp(nBaseLevel-n_level);	--设等级为10级,避免10级前角色删号不能找回
	SetTask(TSK_ZHUANSHENG_FLAG,0);
	SetTask(TSK_ZHUANSHENG_LASTTIME, GetCurServerTime());
	
	PARTNER_CallOutCurPartner(0)
	--SetTask(TSK_ZHUANSHENG_FLAG, 2);
	if n_transcount ~= 5 then
		Msg2Player("L躰h h閕 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲>");
	end
	
	KickOutSelf();
	--Msg2Player("Translife done")
	return 1
end
