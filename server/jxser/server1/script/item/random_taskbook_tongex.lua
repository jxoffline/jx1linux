
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñÈÎÎñ¾íÖá´¥·¢½Å±¾ - °ï»áÁîÅÆÌØ±ğ°æ
-- Edited by peres
-- 2005/09/01 PM 16:40

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");

-- ¶ÁÈëÈÎÎñÏµÍ³Í·ÎÄ¼ş£¬°üº¬Ëæ»úÈÎÎñ
Include("\\script\\task\\system\\task_main.lua");

strPublic       = "<color=green>LÖnh bµi nhiÖm vô<color>:";

local TSK_UseCountPerDay = 2589;

function main(nIndex)

	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö
	
	local nTaskID = GetItemMagicLevel(nIndex, 1);
	
	local nNowTaskID = GetTask(ID_RANDOMTASK);  -- »ñÈ¡µ±Ç°ÁîÅÆÈÎÎñµÄ ID
	
	local nTaskState = 0;  -- µ±Ç°ÁîÅÆÈÎÎñµÄ×´Ì¬

	if (GetProductRegion() == "cn") then
		-- ÅĞ¶ÏÊÇ·ñÕÙ»½³öÍ¬°é
		if partnerindex==0 or partnerstate==0 then
			Msg2Player(strPublic.."<color=yellow>Ch­a gäi ra b¹n ®ång hµnh, kh«ng thÓ ®äc ®­îc néi dung trong lÖnh bµi!<color>");
			return 1;
		end;
	end;
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
	end;
	
	local nUseState = GetTask(%TSK_UseCountPerDay)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nPerDayUseCount = 100
	if floor(nUseState / 256) ~= nCurDate then
		
		nUseState = nCurDate * 256
		SetTask(%TSK_UseCountPerDay, nUseState)
	end
	
	if mod(nUseState, 256) >= nPerDayUseCount then
		
		Talk(1, "", format("Mçi ngµy mçi ng­êi ch¬i chØ ®­îc sö dông vËt phÈm nµy %d lÇn.", nPerDayUseCount))
		return 1
		
	end
	
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>LÖnh bµi nhiÖm vô<color>: HiÖn t¹i cã nhiÖm vô ngÉu nhiªn ch­a hoµn thµnh, vÉn muèn tiÕp nhËn nhiÖm vô míi sao?",
			2,
			"§óng vËy, ta muèn hñy bá nhiÖm vô tr­íc ®©y/#_confirmRandomBookTask("..nIndex..")",
			"Kh«ng ph¶i, ®îi mét l¸t ®·!/OnTaskWait");
		return 1;
	else
		
		-- Çå¿ÕÈÎÎñ¾íÖáÀïÃæ¼ÇÔØµÄÈÎÎñ£¬·ñÔò²»ÄÜÓÃÈÎÎñÒıÇæ¿ªÊ¼
		SetTaskStatus(TaskName(nTaskID), 0);
		CloseTask(TaskName(nTaskID));

		-- ½«´ı½ÓµÄÈÎÎñ´¢´æÔÚÁÙÊ±±äÁ¿ÖĞ
		SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
		-- Í¬²½ÈÎÎñ±äÁ¿
		SyncTaskValue(ID_RANDOMTASK_WAIT);
	
		-- ´æ´¢ÎïÆ· INDEX ÔÚÈÎÎñ±äÁ¿ÖĞ
		SetTask(ID_RANDOMTASKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );
		
		
		SetTask(%TSK_UseCountPerDay, nUseState + 1);
		
		return 1;
	end;

end;


-- È·ÈÏ½ÓÊÜ¾íÖáÈÎÎñ
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- Çå¿Õµ±Ç°ÕıÔÚ×öµÄ¾íÖáÈÎÎñ
	SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMTASK)));

	-- Çå¿ÕÈÎÎñ¾íÖáÀïÃæ¼ÇÔØµÄÈÎÎñ£¬·ñÔò²»ÄÜÓÃÈÎÎñÒıÇæ¿ªÊ¼
	SetTaskStatus(TaskName(nTaskID), 0);
	CloseTask(TaskName(nTaskID));
	
	-- ½«´ı½ÓµÄÈÎÎñ´¢´æÔÚÁÙÊ±±äÁ¿ÖĞ
	SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
	-- Í¬²½ÈÎÎñ±äÁ¿
	SyncTaskValue(ID_RANDOMTASK_WAIT);
	
	-- ´æ´¢ÎïÆ· INDEX ÔÚÈÎÎñ±äÁ¿ÖĞ
	SetTask(ID_RANDOMTASKTEMP, nIndex);
	
	ApplyTask( TaskName(nTaskID) );
	SetTask(%TSK_UseCountPerDay, GetTask(%TSK_UseCountPerDay) + 1);
	
	return
	
end;