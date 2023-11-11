-------------------------------------------------------------------------
-- FileName		:	turebug90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:18:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄÐ¡¹Ö½Å±¾[90¼¶ÒÔÉÏ]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éÐÞÁ·µÄ±í¸ñ

Include("\\script\\activitysys\\functionlib.lua")--ÒýÓÃlib:DoFunByPlayer

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_exp"))  --Ð¡¹Ö¾­Ñé
TUREBUGBEAR_MAPID= 395  --Ç§±¦¿âµÄµØÍ¼id
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_jifen"))  --Ð¡¹Ö¾­Ñé

--Õâ¸ö¾àÀë´ó¸ÅÊÇ2ÆÁ·¶Î§
SHARE_BOSS_DIST_LEN = 80^2--¸Ã¾àÀë·¶Î§ÄÚµÄ¶ÓÓÑÉ±ËÀboss£¬×Ô¼º¿ÉÒÔ¿ª±¦Ïä

function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	set_team_task_temp181(turesureindex)
	
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖÐµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô TÝn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end

function set_team_task_temp181(turesureindex)

--Fix bug nÕu cïng tæ ®éi nh­ng kh«ng cïng m· sè, kh«ng cho hoµn thµnh nhiÖm vô - Modified by DinhHQ - 20110502
	local nTaskCode = GetTask(1201)
	local nOldPlayer = PlayerIndex;
	local nMemberTaskCode = 0
	local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nMemberTaskCode = GetTask(1201)
			if nMemberTaskCode == nTaskCode then
				lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, turesureindex, nSelfMapId, nSelfX, nSelfY);
			end
		end
		PlayerIndex = nOldPlayer
	else
		real_set_task_temp181(turesureindex, 0, 0, 0)
	end
end

function is_near(nMapId, nPosX, nPosY)
	if not nMapId then
		return 0
	end
	if nMapId == TUREBUGBEAR_MAPID then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		if nSelfMapId==nMapId then
			local nDis2 = (nPosX - nSelfX)^2 + (nPosY - nSelfY)^2
			if nDis2 < SHARE_BOSS_DIST_LEN then
				return 1
			end
		end
	elseif nMapId == 0 then
		return 1--Ã»ÓÐ´«ÈëµØÍ¼id
	end
	return 0
end

function real_set_task_temp181(turesureindex, nMapId, nPosX, nPosY)
	local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
	if is_near(nMapId, nPosX, nPosY)==1 then
		SetTaskTemp(181,turesureindex)
		Msg2Player(format("Ng­¬i cã thÓ më B¶o R­¬ng <color=yellow>%d sè<color> Thiªn B¶o Khè",turesureindex));
	end
end

function testMemberDist(nDist)
	local nSave = SHARE_BOSS_DIST_LEN
	SHARE_BOSS_DIST_LEN = nDist
    local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, 0, nSelfMapId, nSelfX, nSelfY);
		end
	end
	SHARE_BOSS_DIST_LEN = nSave
end


