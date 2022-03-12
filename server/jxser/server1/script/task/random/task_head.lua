
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/08/12 PM 10:28

-- Ö»ÓĞÍíÉÏËûÃÇÊÇÔÚÒ»ÆğµÄ
-- Ëû¿¿½üËı£¬Óµ±§Ëı
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëı¿´×ÅËû£¬ĞÄÀïÈáÈí¶øÌÛÍ´
-- ËıÏë£¬Ëı»¹ÊÇ°®Ëû
-- Ëı²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëı²»ÖªµÀ£¬³ıÁËÕâÖÖ½Ó´¥£¬ËıµÄ°²È«¸ĞºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËıÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ğÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");


-- À©Õ¹±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabex.lua");

-- ²Ø±¦Í¼Í·ÎÄ¼şµÄÖ§³Ö
Include("\\script\\task\\random\\treasure_head.lua");

tabMainType = new(KTabFileEx, "\\settings\\task\\random\\rate_type.txt", "MainType");

tabTalk = new(KTabFileEx, "\\settings\\task\\random\\rate_talk.txt", "TalkTable");
tabColl = new(KTabFileEx, "\\settings\\task\\random\\rate_coll.txt", "CollTable");
tabShow = new(KTabFileEx, "\\settings\\task\\random\\rate_show.txt", "ShowTable");
tabKill = new(KTabFileEx, "\\settings\\task\\random\\rate_kill.txt", "KillTable");
tabNext = new(KTabFileEx, "\\settings\\task\\random\\rate_nexttask.txt", "NextTable");

stuTaskFile = {
	["NhiÖm vô §èi tho¹i "] = tabTalk,
	["NhiÖm vô thu thËp "] = tabColl,
	["hiÓn thŞ nhiÖm vô "] = tabShow,
	["NhiÖm vô S¸t qu¸i "] = tabKill,
}

-- ÈÎÎñ±äÁ¿¶¨Òå

ID_RANDOMTASK = 1301;  -- ´æ´¢µ±Ç°Íæ¼Ò½Óµ½µÄËæ»úÈÎÎñ
ID_RANDOMTASK_WAIT = 1302; -- ´æ´¢µ±Ç°´ı½ÓµÄËæ»úÈÎÎñ
ID_RANDOMSTATE = 1303;  -- ´æ´¢Ëæ»úÈÎÎñµÄ½øÕ¹Çé¿ö
ID_RANDOMBOOK = 1304;   -- ´æ´¢Íæ¼Òµ±Ç°µÄ¾íÖáÈÎÎñ£¨µÚ¶ş²ã£©

ID_RANDOMBOOKDATE = 1305;  -- ´æ´¢Íæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáµÄÌìÊı
ID_RANDOMBOOKNUM = 1306;  -- ´æ´¢Íæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáµÄ´ÎÊı

ID_RANDOMTASKDATE = 1308;  -- ´æ´¢Íæ¼Ò½ÓËæ»úÈÎÎñÊ±µÄÈÕÆÚ
ID_RANDOMTASKNUM = 1309; -- ´æ´¢Íæ¼Ò½ÓÊÜËæ»úÈÎÎñµÄ´ÎÊı

ID_RANDOMBOOKTEMP = 1307;  -- ´æ´¢Íæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáµÄÁÙÊ± INDEX£¬ÓÃÓÚÉ¾³ı
ID_RANDOMTASKTEMP = 2391;  -- ´æ´¢°ï»á»î¶¯ÖĞËæ»úÈÎÎñÁîÅÆ INDEX

ID_USETREAMAP_TIME = 1738;  -- ´¢´æÍæ¼ÒÍÚ±¦µÄ´ÎÊı

-- ³õÊ¼»¯Ëæ»úÈÎÎñ»·¾³£¬Èç¹ûÌõ¼ş³ÉÁ¢Ôò´´½¨Ò»¸öÈÎÎñ
-- ³É¹¦Ôò·µ»Ø 1£¬Ê§°ÜÔò·µ»Ø 0
function initRandomTask()

local partnerindex, partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = createRandomTask();

	-- Èç¹ûµÈ¼¶Ğ¡ÓÚ 60 ¼¶£¬Ôò²»ÄÜ½ÓÊÜËæ»úÈÎÎñ
	if GetLevel()<60 then
		return 0;
	end;	
	
	-- Èç¹ûÒÑ¾­³¬¹ıÁËÒ»Ìì 1O ´ÎµÄÏŞÖÆÔò²»ÄÜÔÙ²úÉúËæ»úÈÎÎñ
	if checkRandomTaskEnable()~=1 then
		return 0;
	end;
	
	if nTaskID_Now==nTaskID_Wait then -- Èç¹ûÑ¡µ½µÄËæ»úÈÎÎñºÍÖ®Ç°µÄÒ»ÖÂ£¬ÔòÖ±½Ó·µ»Ø 0
		return 0;
	else
		-- ½«»ñÈ¡µ½µÄÈÎÎñ ID ÏÈ´æ´¢ÔÚ´ı½ÓµÄÈÎÎñ±äÁ¿ÖĞ
		SetTask(ID_RANDOMTASK_WAIT, nTaskID_Wait);
		
		-- Í¬²½ÈÎÎñ±äÁ¿
		SyncTaskValue(ID_RANDOMTASK_WAIT);
		
		setRandomTaskState(1);
		TaskTip("B¹n nhËn ®­îc mét nhiÖm vô ngÉu nhiªn");
		
		-- ÉèÖÃÍ¬°éµÄÍ·¶¥ÏÔÊ¾×´Ì¬£¬50 Ãë
		PARTNER_AddState(partnerindex, 662, 1, 50);
		return 1;
	end;

end;


-- ´´½¨Ò»¸öËæ»úÈÎÎñµÄÖ÷º¯Êı£¬½«»ñÈ¡µÄÈÎÎñ ID ´æ´¢ÔÚ±äÁ¿ÖĞ
-- ·µ»ØÖµ£ºÕı³£·µ»Ø´´½¨Ëæ»úÈÎÎñµÄ ID£¬·µ»Ø 0 ÔòÊ§°Ü
function createRandomTask()

	local taskName = selectTask(selectType());   -- Ëæ»úµÃµ½Ò»¸öÈÎÎñ
	local nTaskID = TaskNo(taskName);            -- ½«ÈÎÎñÃû³Æ±ä³ÉÈÎÎñ ID
	
	-- ³ö´í´¦Àí
	if nTaskID~=0 and nTaskID~=nil then
		
		-- ·µ»Ø¸ÃÈÎÎñµÄ ID
		return nTaskID;
	else
		CDebug:MessageOut("nhiÖm vô ngÉu nhiªn bŞ thÊt b¹i, h·y xem kü l¹i!");
		return 0;
	end;

end;

	
-- Ñ¡ÔñÈÎÎñµÄÀàĞÍ
-- ·µ»ØÀàĞÍ string:strType
function selectType()
	local nLevel   = getTaskLevel();
	local nRow     = tabMainType:countArrayRate("Rate"..nLevel);
	local strType  = tabMainType:getCell("TaskType", nRow);
	CDebug:MessageOut("Lùa chän lo¹i nhiÖm vô:"..strType);
	return strType;
end;


-- ¸ù¾İÈÎÎñÀàĞÍÑ¡Ôñ¾ßÌåµÄÈÎÎñ
-- ·µ»ØÀàĞÍ string:taskName
function selectTask(strType)
	local nLevel   = getTaskLevel();
	local nRow     = stuTaskFile[strType]:countArrayRate("Rate"..nLevel);
	local taskName = stuTaskFile[strType]:getCell("TaskName", nRow);
	CDebug:MessageOut("Lùa chän tªn nhiÖm vô cô thÓ:"..taskName);
	return taskName;
end;


-- Ñ¡ÔñµÚ¶ş²ãËæ»úÈÎÎñ
-- ·µ»ØÀàĞÍ string:taskName
function selectNextTask()
	local nRow     = tabNext:countArrayRate("Rate");
	local taskName = tabNext:getCell("TaskName", nRow);
	return taskName;
end;


-- ÉèÖÃËæ»úÈÎÎñµÄ×´Ì¬
-- ´«Èë²ÎÊı£ºint:nState ÈÎÎñµÄ½øÕ¹³Ì¶È£º0ÎªÃ»ÓĞÈÎÎñ£¬1ÎªÒÑÓĞÒ»¸öÈÎÎñ´¥·¢£¬2ÎªÒÑ¾­È·ÈÏÁËÈÎÎñ
function setRandomTaskState(nState)
	SetTask(ID_RANDOMSTATE, nState);
	
	-- Í¬²½ÈÎÎñ±äÁ¿
	SyncTaskValue(ID_RANDOMSTATE);
end;


-- »ñÈ¡Ëæ»úÈÎÎñµÄ×´Ì¬
-- ·µ»ØÖµ£º0ÎªÃ»ÓĞÈÎÎñ£¬1ÎªÒÑÓĞÒ»¸öÈÎÎñ´¥·¢£¬2ÎªÒÑ¾­È·ÈÏÁËÈÎÎñ
function getRandomTaskState()
	return GetTask(ID_RANDOMSTATE);
end;


-- ¼ì²é½ñÌìÊÇ·ñ»¹ÄÜ¼ÌĞø½ÓËæ»úÈÎÎñ
function checkRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- È¡µÃ½ñÌìµÄÊ±¼ä£¬Äê/ÔÂ/ÈÕ
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- Èç¹ûÊ±¼ä²»ÏàÍ¬Ôò¿ÉÒÔ×ö
	if nNowDate~=nOldDate then
		return 1;
	else
		-- Èç¹ûÃ¿Ìì×öÁË´ïµ½»òÕß³¬¹ı 10 ´ÎÔò²»¿ÉÒÔ×ö
		if nTimes>=10 then
			return 0;
		else
			return 1;
		end;
	end;
	
end;

-- Ğ´ÈëËæ»úÈÎÎñÍê³ÉµÄÊ±¼äºÍ´ÎÊı
function writeRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- È¡µÃ½ñÌìµÄÊ±¼ä£¬Äê/ÔÂ/ÈÕ
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- Èç¹ûÊ±¼ä²»ÏàÍ¬ÔòÇå¿ÕÊ±¼ä
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMTASKDATE, nNowDate);
	SetTask(ID_RANDOMTASKNUM, nTimes + 1);
	
end;



-- ¼ì²é½ñÌìÊÇ·ñ»¹ÄÜ¼ÌĞøÊ¹ÓÃÈÎÎñ¾íÖá
function checkTaskBookEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- È¡µÃ½ñÌìµÄÊ±¼ä£¬Äê/ÔÂ/ÈÕ
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- Èç¹ûÊ±¼ä²»ÏàÍ¬Ôò¿ÉÒÔ×ö
	if nNowDate~=nOldDate then
		return 1;
	else
		-- Èç¹ûÃ¿Ìì×öÁË´ïµ½»òÕß³¬¹ı 8 ´ÎÔò²»¿ÉÒÔ×ö
		if nTimes>=8 then
			return 0;
		else
			return 1;
		end;
	end;
end;


-- Ğ´ÈëÈÎÎñ¾íÖáµ±ÌìÍê³ÉµÄÊ±¼äÓë´ÎÊı
function writeTaskBookTimes()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- È¡µÃ½ñÌìµÄÊ±¼ä£¬Äê/ÔÂ/ÈÕ
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- Èç¹ûÊ±¼ä²»ÏàÍ¬ÔòÇå¿ÕÊ±¼ä
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMBOOKDATE, nNowDate);
	SetTask(ID_RANDOMBOOKNUM, nTimes + 1);
	
end;


-- È·ÈÏ½ÓÊÜËæ»úÈÎÎñµÄ»Øµ÷º¯Êı
function _confirmRandomTask()

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = GetTask(ID_RANDOMTASK_WAIT);
	
	-- Çå¿ÕµÈ´ı½ÓµÄËæ»úÈÎÎñ
	SetTaskStatus(TaskName(nTaskID_Wait), 0);
	CloseTask( TaskName(nTaskID_Wait) );	
	
	-- ½«°ï»áÁîÅÆµÄÁÙÊ±±äÁ¿ÇåÁã
	SetTask(ID_RANDOMTASKTEMP, 0);
	
	ApplyTask( TaskName(nTaskID_Wait) );   -- ÉêÇë¿ªÊ¼Ò»¸öÈÎÎñ

end;


-- »ñÈ¡ÈÎÎñµÄµÈ¼¶Çø¼ä 10~100 Ã¿ 10 ¼¶Ò»¸öµÈ¼¶
-- ·µ»ØÖµ£ºint:level
function getTaskLevel()

	local nLevel = GetLevel();

	if nLevel<10 then return 10; end;	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;
	
end;
