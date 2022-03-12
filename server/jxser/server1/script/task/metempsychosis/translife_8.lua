-- ¹¦ÄÜ£º8×ª
-- ×÷Õß£ºÁÎ¸ß²Ó
-- ´´½¨Ê±¼ä£º2016-10-11

Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")



TransLife8 = {};
tbTL8MainDlg = {};
TSK_TASK_IS_TS8=2683

TransLife8.tbNeedItem = {
    {6, 1, 4476,  "Ngäc ChuyÓn Sinh", 3, -1, 5}
};

TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION = 4236;  -- ±£´æ8×ª¶Ô»°¹ý³ÌÖÐÑ¡ÔñµÄ¼¼ÄÜÑ¡Ïî
TransLife8.TRANSLIFE_8_SKILL = {
    {"§¹i DiÖp KhÝ Tr¸o", 993},
    {"Träng kÝch tuyÖt ®èi", 998}
};

TransLife8.TB_SKILL_LEVEL_UP = {
    [10] = 1,
	[150] = 2,
	[151] = 2,
	[152] = 2,
	[153] = 2,
	[154] = 2,
	[155] = 2,
	[156] = 2,
	[157] = 2,
	[158] = 2,
	[159] = 2,
	[160] = 2,
	[161] = 2,
	[162] = 2,
	[163] = 2,
	[164] = 2,
	[165] = 2,
	[166] = 2,
	[167] = 2,
	[168] = 2,
	[169] = 2,
	[170] = 3,
	[171] = 3,
	[172] = 3,
	[173] = 3,
	[174] = 3,
	[175] = 3,
	[176] = 3,
	[177] = 3,
	[178] = 3,
	[179] = 3,
	[180] = 3,
	[181] = 3,
	[182] = 3,
	[183] = 3,
	[184] = 3,
	[185] = 3,
	[186] = 3,
	[187] = 3,
	[188] = 3,
	[189] = 3,
	[190] = 4,
	[191] = 4,
	[192] = 4,
	[193] = 4,
	[194] = 4,
	[195] = 4,
	[196] = 4,
	[197] = 4,
	[198] = 4,
	[199] = 4,
	[200] = 4
};

-- Óë½ðÉ½ÕÆÃÅ¶Ô»°Ñ¯ÎÊÈçºÎ½øÐÐ8×ª´¥·¢µÄ»Øµ÷
function TransLife8:ShowMainDlg()
	CreateNewSayEx("Sau khi ®¹t cÊp 200 trïng sinh 7, cã thÓ ®em cho ta 5 c¸i Ngäc Trïng Sinh, ®ång thêi ng­¬i ph¶i häc B¾c §Èu Trïng Sinh ThuËt - C¬ së thiªn , ta sÏ gióp ng­¬i trïng sinh 8.", tbTL8MainDlg);
end

function TransLife8:Init()
	self:RegisterEvent();
	self:InitDialog();
end

function TransLife8:RegisterEvent()
    for nLevelConfig, tbParam in TransLife8.TB_SKILL_LEVEL_UP do
		EventSys:GetType("OnPlayerLevelUp"):Reg(nLevelConfig, TransLife8.OnLevelUpProcess, self, nLevelConfig);
	end
end

-- The auto level up of the skill of translife 8.
function TransLife8:OnLevelUpProcess(nLevel)
	if ST_GetTransLifeCount() == 8 and TransLife8.TB_SKILL_LEVEL_UP[nLevel] then
		local nSkillLevel = TransLife8.TB_SKILL_LEVEL_UP[nLevel];
		local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);

		if (nSelection > 0) and (TransLife8.TRANSLIFE_8_SKILL[nSelection]) then
			local _, nSkillID = unpack(TransLife8.TRANSLIFE_8_SKILL[nSelection]);
			AddMagic(nSkillID, nSkillLevel);
		end
	end
end

function TransLife8:InitDialog()
	tinsert(tbTL8MainDlg, {"B¾t ®Çu trïng sinh 8", self.BeginTransLife8, {self}});
	tinsert(tbTL8MainDlg, {"Ta kh«ng muèn trïng sinh 8"});
end

function TransLife8:BeginTransLife8()

	local nCheckCode = self:CheckCondition()
	if nCheckCode ~= 1 then
		return
	end
	
	self:ChooseOneResistance();
end


function TransLife8:CheckCondition()
	local is_ts7 = GetTask(TSK_TASK_IS_TS7)
	if (is_ts7 < 1) then
		Talk(1,"", "§¹i hiÖp h·y trïng sinh 7 råi ®Õn gÆp ta!");
		return 0
	end

	local is_ts8 = GetTask(TSK_TASK_IS_TS8)
	if (is_ts8 > 0) then
		Talk(1,"", "§¹i hiÖp ®· trïng sinh lÇn 8 råi. Xin kiÓm tra l¹i");
		return 0
	end

	if(GetLevel() < 200) then
		Talk(1,"", "§¹i hiÖp h·y ®¹t cÊp 200 råi quay l¹i!");
		return 0
	end

	--admin edit
	-- local nTransLifeCount = ST_GetTransLifeCount()
	-- if nTransLifeCount >= 8 then
	-- 	Talk(1,"", "Ng­¬i ®· tiÕn hµnh trïng sinh 8 råi.");
	-- 	return 0;
	-- end

	-- if nTransLifeCount ~= 7 or GetLevel() < TB_LEVEL_LIMIT[8] then
	-- 	Talk(1,"", format("ChØ cã hiÖp sÜ cÊp %d trïng sinh 7 míi cã thÓ tiÕn hµnh trïng sinh 8.", TB_LEVEL_LIMIT[8]));
	-- 	return 0;
	-- end
	
	-- if (check_zhuansheng_level() ~= 1) then	
	-- 	return 0;
	-- end

	-- local nTaskValue = GetTask(2885);
	-- local nTmpRes = floor(nTaskValue/100);
	-- if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
	-- 	Talk(1,"", "Ng­¬i ®· nhËn nhiÖm vô kü n¨ng 150, xin h·y hoµn thµnh nhiÖm vô råi h·y ®Õn gÆp ta");
	-- 	return 0;
	-- end

	-- if (CalcItemCount(2,0,-1,-1,-1) > 0) then			--Ð¶ÏÂ×°±¸
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "§­îc råi./OnCancel"});
	-- 	return 0;
	-- end

	-- if check_zhuansheng_league(LG_WLLSLEAGUE) == 1 then	--Õ½¶Ó¹ØÏµ
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "§­îc råi./OnCancel"});
	-- 	return 0;
	-- end

	-- if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then			--»ù´¡ÆªµÄÑ§Ï°
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "§­îc råi./OnCancel"});
	-- 	return 0;
	-- end

	--check item
	if self:CheckItemNeedCondition() == 0 then
		return 0;
	end
	
	return 1;
end

-- ¼ì²é×ªÉúÓñÊÇ·ñ×ã¹»
function TransLife8:CheckItemNeedCondition()
	for nIndex, tbItemParam in TransLife8.tbNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		local nCurCount = CalcItemCount(nRoomPos, nGenre, nDetail, nParticular, nLevel)
		if nCurCount < nNeedItemCount then
            local dialogContent = format("<npc>Trïng sinh 8 cÇn <color=red>%d<color> c¸i %s, h·y chuÈn bÞ xong råi quay l¹i.", nNeedItemCount, szItemName);
            local tbSelection = {
                {"§­îc råi."}
            };
            CreateNewSayEx(dialogContent, tbSelection);
			return 0;
		end
	end
	
	return 1;
end

-- ¼ì²éÊÇ·ñÖØ¸´Ñ¡Ôñ¿¹ÐÔ
function TransLife8:CheckResistanceRepetition(nSelection)
    local n_transcount = ST_GetTransLifeCount();
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			
			if i == 7 and n_translevel ~= 0 and n_transresist == nSelection and GetMaxResist(nSelection) < 85 then
			elseif (n_translevel ~= 0 and n_transresist == nSelection) then
                CreateNewSayEx("<npc>"..format("§©y lµ lÇn chuyÓn sinh thø %d vµ ®· chän %s kh«ng thÓ chän nhiÒu lÇn 1 ®iÓm phßng ngù, xin mêi h·y chän l¹i!", i, TB_BASE_RESIST[nSelection]),
                            {
                                {"Lùa chän l¹i tõ ®Çu", TransLife8.ChooseOneResistance, {TransLife8}},
                                {" KÕt thóc ®èi tho¹i!"}
                            });
				return 0;
			end
		end
	end
    return 1;
end

function TransLife8:onSelectSkill(nSelection)
	Msg2Player("chon skill")
    if (self:CheckCondition() == 0) then
		return 0;
	end
	
	local tbTaskNeedItem = TransLife8.tbNeedItem;
	for nIndex, tbItemParam in tbTaskNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		if ConsumeEquiproomItem(nNeedItemCount, nGenre, nDetail, nParticular, nLevel) ~= 1 then
			Say("§¹o cô cÇn thiÕt kh©u trõ nhiÖm vô thÊt b¹i!", 0 );
			return
		end
	end

	-- Record the selection of TRANSLIFE_8_SKILL.
    SetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION, nSelection);
	print(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));

    LeaveTeam();	
	
	--ST_DoTransLife();--trung sinh 8 thanh cong
	--Msg2Player("YYYYYYYYYYYYYY")
	--addskill
	self:AfterTranslifeProcess()
end

function TransLife8:onSelectResistance(nSelection)
    if (self:CheckCondition() == 0) then
		return 0;
	end

    if (self:CheckResistanceRepetition(nSelection) == 0) then

        return 0;
    end

    -- Record the index of resistance the player selected.
    SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, nSelection);
	print(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));


    local tbSkillOption = {};
    for nIndex, skillItem in TransLife8.TRANSLIFE_8_SKILL do
        tinsert(tbSkillOption, {skillItem[1], TransLife8.onSelectSkill, {self, nIndex}});
    end
    tinsert(tbSkillOption, {" KÕt thóc ®èi tho¹i!"});

    CreateNewSayEx("<npc>H·y chän kÜ n¨ng trïng sinh 8 muèn cã:", tbSkillOption);
end

function TransLife8:ChooseOneResistance()
    local tbOption = {};
		
	for nIndex, resistanceName in TB_BASE_RESIST do
		tinsert(tbOption, {resistanceName, TransLife8.onSelectResistance, {self, nIndex}});
	end
	tinsert(tbOption, {" KÕt thóc ®èi tho¹i!"});

    CreateNewSayEx("<npc>H·y chän thuéc tÝnh kh¸ng muèn t¨ng thªm:",tbOption);
end

function TransLife8:AfterTranslifeProcess()
	SetTask(TSK_TASK_IS_TS8, 1)
	ST_LevelUp(-190);
	Talk(1, "", "§¹i HiÖp ®· trïng sinh lÇn 8 thµnh c«ng. Vâ c«ng rÊt th©m hËu, ta xin b¸i phôc!")
	Msg2Player("§¹i HiÖp ®· trïng sinh lÇn 8 thµnh c«ng. Vâ c«ng rÊt th©m hËu, ta xin b¸i phôc!")
   -- Say("§¹i hiÖp, trïng sinh 8 ®· xong, n¨ng lùc ®· t¨ng tr­ëng rÊt nhiÒu, mau mau xem thö sù thay ®æi ®i!", 0);

	local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);
	local skillInfo = TransLife8.TRANSLIFE_8_SKILL[nSelection];
	if skillInfo then
		local szSkillName, nSkillID = unpack(skillInfo);
		AddMagic(nSkillID, 1);
	end
	AddMagicPoint(20)--add 20 ®iÓm kÜ n¨ng
	AddProp(100) --add 100 ®iÓm tiÒm n¨ng
end


TransLife8:Init();