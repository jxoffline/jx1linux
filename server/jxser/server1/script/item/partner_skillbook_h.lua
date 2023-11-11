--partner_skillbook.lua (¼¼ÄÜÊé½Å±¾)
--create by luobaohang @20050802
--last edit by luobaohang @20050816

IncludeLib("FILESYS");
IncludeLib("PARTNER");

Include("\\script\\lib\\string.lua");

TabFile_Load("\\settings\\partner\\skill_requirement.txt", "skill_require")
--randomseed(GetCurrentTime())

function SkillBookScript(iItem, nType)
	local partner_index = PARTNER_GetCurPartner()
	if (partner_index == nil or partner_index <= 0) then
		Msg2Player("<#> B¹n ch­a chän ®ång hµnh!")
		return 1 
	end
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
		--ÅĞ¶ÏÎåĞĞÊôĞÔ
	if (series_limit ~= -1) then
		--Msg2Player(series_limit); µ÷ÊÔ
		--Msg2Player(PARTNER_GetSeries(partner_index));
		if (series_limit ~= PARTNER_GetSeries(partner_index)) then
			Msg2Player("<#> §ång hµnh cña b¹n ngò hµnh kh«ng hîp víi s¸ch nµy, ch­a thÓ t×m hiÓu bİ quyÕt bªn trong");
			return 1
		end
	end
		--ÅĞ¶ÏÍ¬°éĞèÇóµÈ¼¶
	local level_require = base_level + (item_level - 1) * level_increment;
	local partner_level = PARTNER_GetLevel(partner_index);
	if (level_require > partner_level) then
		Msg2Player("<#> §ång hµnh cña b¹n ®¼ng cÊp kh«ng hîp víi s¸ch nµy, ch­a thÓ t×m hiÓu bİ quyÕt bªn trong");
		return 1
	end
		--ÅĞ¶ÏÊÇ·ñ¸ßÓÚÍ¬°éµ±Ç°¼¼ÄÜµÈ¼¶
	local skill_level, skill_exp = PARTNER_GetSkillInfo(partner_index, skill_id);
	if (skill_level >= item_level) then
		Msg2Player("<#> §ång hµnh cña b¹n sím ®· biÕt ®­îc kü n¨ng nµy, c¶m thÊy kh«ng cßn g× dÓ häc n÷a.");
		return 1
	elseif (skill_level ~= item_level-1) then --²»ÄÜÌø¼¶
		Msg2Player("<#> §ång hµnh cña b¹n kü n¨ng c¨n b¶n cßn kĞm, ®õng nªn véi qu¸!");
		return 1
	elseif (skill_level == 0) then	--µ±Ç°¼¼ÄÜÎ´Ñ§Ï°¹ı
		if (nType == 2) then
			--ÅĞ¶ÏÊÇ·ñÓĞ¼¼ÄÜ¿ÕÎ»
			local skill_can_learn = {1, 2, 3, 5, 7, 9, 11, 13, 15, 16} --¿ÉÑ§Ï°¼¼ÄÜÊıµÈ¼¶ĞèÇó
			local skills_learn = PARTNER_GetAllSkill(partner_index, 2);
			local nIndexTmp = floor(partner_level/10) + 1;
			if (nIndexTmp < 0) then 
				nIndexTmp = 0;
			elseif (nIndexTmp > 10) then 
				nIndexTmp = 10;
			end
			local nSkillsLearn;
			if (skills_learn == nil) then
				nSkillsLearn = 0;
			else
				nSkillsLearn = getn(skills_learn);
			end
			if (nSkillsLearn >= skill_can_learn[nIndexTmp]) then
				Msg2Player("<#> §¼ng cÊp ®ång hµnh hiÖn t¹i cña b¹n kh«ng thÓ häc thªm kü n¨ng phô trî míi, muèn häc kü n¨ng phô trë ®¼ng cÊp ph¶i cao h¬n.");
				return 1
			end
		elseif (nType == 3)	then
			local skills_learn = PARTNER_GetAllSkill(partner_index, 3);
			if (skills_learn ~= nil and getn(skills_learn) > 0) then--ÒÑÑ§¹ı¾ø¼¼
			 	Msg2Player("<#> §ång hµnh cña b¹n ®· n¾m b¾t ®­îc mét tuyÖt kü, kh«ng thÓ häc thªm n÷a");
			 	return 1
			 end
		else	--²»ÊÇ¸½¼Ó¼¼ÄÜ»ò¾ø¼¼²»ÄÜÑ§Ï°
			Msg2Player("<#> §ång hµnh cña b¹n tham kh¶o mËt tŞch ®· nöa ngµy, ch­a thÓ t×m ra bİ quyÕt bªn trong");
		end
	end
	if (nType == 0) then
		local nTaskValue = PARTNER_GetTaskValue(partner_index, 11)
		if (nTaskValue >= 20) then
			Msg2Player("<#> §ång hµnh cña b¹n kh«ng thÓ häc kü n¨ng nµy n÷a!")
			return 1
		end
		PARTNER_SetTaskValue(partner_index, 11, nTaskValue + 1)
	end
	--Ñ§Ï°¼¼ÄÜÊé
	--local skills_add = random(skill_level + 1, item_level)
	PARTNER_AddSkill(partner_index, nType, skill_id, item_level)
	Msg2Player("<#> §ång hµnh cña b¹n ®· l·nh ngé ®­îc kü n¨ng cÊp "..tostring(item_level).." "..GetSkillName(skill_id))
	return 0
end

function GetDesc(iItem)
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
	--Í¬°éĞèÇóµÈ¼¶
	local skill_name = GetSkillName(skill_id);
	local level_require = base_level + (item_level - 1) * level_increment
	local level_skillrequire = item_level - 1;
	local strDesc = format("<color=yellow> quyÓn thø %d", item_level)
	strDesc = strDesc.."\n §¼ng cÊp ®ång hµnh cÇn:"..level_require;
	if (series_limit >= 0) then
		strDesc = strDesc.."\n Ngò hµnh ®ång hµnh cÇn:"..toSeries(series_limit);
	end
	if(level_skillrequire > 0) then
		strDesc= strDesc.."\n CÇn<"..skill_name..">"..level_skillrequire.."cÊp";
	end
	return strDesc;
end