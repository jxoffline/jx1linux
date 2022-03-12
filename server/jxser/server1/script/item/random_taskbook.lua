
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñÈÎÎñ¾íÖá´¥·¢½Å±¾
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

strPublic       = "<color=green>MËt ®å nhiÖm vô<color>:";

function main(nIndex)

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö

local nTaskID = GetItemMagicLevel(nIndex, 1);

local nNowTaskID = GetTask(ID_RANDOMBOOK);  -- »ñÈ¡µ±Ç°¾íÖáÈÎÎñµÄ ID

local nTaskState = 0;  -- µ±Ç°¾íÖáÈÎÎñµÄ×´Ì¬

	if (GetProductRegion() == "cn") then
		-- ÅĞ¶ÏÊÇ·ñÕÙ»½³öÍ¬°é
		if partnerindex==0 or partnerstate==0 then
			Msg2Player(strPublic.."<color=yellow>B¹n kh«ng cã ®ång hµnh triÖu gäi kh«ng thÓ ®äc néi dung trong mËt ®å.<color>");
			return 1;
		end;
	end;
	
	-- ÅĞ¶ÏÃ¿Ìì 8 ´ÎµÄÏŞÖÆÊÇ·ñ·ûºÏ
	if checkTaskBookEnable()~=1 then
		Msg2Player(strPublic.."<color= v¹nhite>B¹n h«m nay qu¸ mÖt råi, ®Ó ngµy mai lµm tiÕp nhiÖm vô ®i!<color>");
		return 1;
	end;
	
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)));
	end;
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>MËt ®å nhiÖm vô<color>: HiÖn t¹i b¹n ch­a hoµn thµnh mËt ®å nhiÖm vô, b¹n x¸c ®Şnh lµm nhiÖm vô míi kh«ng?",
			2,
			"Ph¶i, ta muèn bá qua mËt ®å nhiÖm vô tr­íc ®ã/#_confirmRandomBookTask("..nIndex..")",
			"Kh«ng ph¶i, ®îi mét l¸t ®·!/OnTaskExit");
		return 1;
	else
		
		-- Çå¿ÕÈÎÎñ¾íÖáÀïÃæ¼ÇÔØµÄÈÎÎñ£¬·ñÔò²»ÄÜÓÃÈÎÎñÒıÇæ¿ªÊ¼
		SetTaskStatus(TaskName(nTaskID), 0);
		local nResult = CloseTask(TaskName(nTaskID));

		-- ´æ´¢ÎïÆ· INDEX ÔÚÈÎÎñ±äÁ¿ÖĞ
		SetTask(ID_RANDOMBOOKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );

		if nResult~=1 then
			WriteTaskLog("[Tr¹ng th¸i dŞ th­êng] ë Task ID:"..nTaskID..", kh«ng ®­îc ®ãng l¹i ®óng c¸ch! Process lµ: TaskBook Main().");
		end;
		
		return 1;
	end;

end;


-- È·ÈÏ½ÓÊÜ¾íÖáÈÎÎñ
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- Çå¿Õµ±Ç°ÕıÔÚ×öµÄ¾íÖáÈÎÎñ
	SetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMBOOK)));

	-- Çå¿ÕÈÎÎñ¾íÖáÀïÃæ¼ÇÔØµÄÈÎÎñ£¬·ñÔò²»ÄÜÓÃÈÎÎñÒıÇæ¿ªÊ¼
	SetTaskStatus(TaskName(nTaskID), 0);
	local nResult = CloseTask(TaskName(nTaskID));
	
	-- ´æ´¢ÎïÆ· INDEX ÔÚÈÎÎñ±äÁ¿ÖĞ
	SetTask(ID_RANDOMBOOKTEMP, nIndex)
	
	ApplyTask( TaskName(nTaskID) );
	
	if nResult~=1 then
		WriteTaskLog("[Tr¹ng th¸i dŞ th­êng] ë Task ID:"..nTaskID..", kh«ng ®­îc ®ãng l¹i ®óng c¸ch! Process lµ: _confirmRandomBookTask, tham sè ®­a vµo lµ:"..nIndex);
	end;
	
	return
	
end;