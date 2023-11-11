
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÈÎÎñÏµÍ³¹¤¾ß½Å±¾
-- Edited by peres
-- 2005/07/29 PM 12:30

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ¶ÁÈëÊı¾İ¶¨ÒåÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_head.lua");

-- ¶ÁÈë DEBUG Êä³ö´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_debug.lua");

strTitle        = "<color=green>CÈm nang nhiÖm vô<color>:";
strTitle_Normal = strTitle.."B¹n muèn xem nhiÖm vô nµo?<enter>"
strTitle_None   = strTitle.."B¹n hiÖn ch­a lµm nhiÖm vô nµo.";


function main()

Say(strTitle.."B¹n muèn lµm nhiÖm vô nµo trong cÈm nang nhiÖm vô nµy kh«ng?",4,
	"Xem m×nh hiÖn ®ang lµm nhiÖm vô nµo./ShowEventMain",
	"SÏ trë vÒ tr¹ng th¸i ban ®Çu/MenuSetTaskClearn",
	"SÏ xãa toµn bé c¸c nhiÖm vô /MenuSetEventClearn",
	"§ãng/Task_Exit");

return 1;

end;

-- Íæ¼ÒÑ¡Ôñ²é¿´ÊÂ¼ş£¬ÔÚÏÂÃæÁĞ³öËùÓĞÕıÔÚ½øĞĞµÄÊÂ¼ş¹©Íæ¼ÒÑ¡Ôñ
function ShowEventMain()

local i=0;
local aryEvent = EnumEventList();
local aryTalkText = {strTitle_Normal};

	if aryEvent==nil then
		Say(strTitle_None, 0);
		return
	end;
	
	for i,j in aryEvent do
		rawset(aryTalkText,
				getn(aryTalkText)+1,
				TaskEvent(i, 1, 1).."/#ShowEventDetail("..i..")");
	end;
	
	rawset(aryTalkText, getn(aryTalkText)+1, "§ãng/Task_Exit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."D­íi ®©y lµ<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>T×nh tr¹ng chi tiÕt:<enter><enter>"} -- ÈÎÎñÁĞ±í×Ö·û´®

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "Xãa nhiÖm vô nµy/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "Trë l¹i thanh menu chİnh/main");
	rawset(strMain, getn(strMain)+1, "§ãng/Task_Exit");
	
	SelectSay(strMain);

end;


-- Ã¶¾Ù³öµ±Ç°ÕıÔÚ½øĞĞµÄÊÂ¼ş
function EnumEventList()

local aryTask  = EnumTaskList(); -- È¡µÃµ±Ç°ÕıÔÚ½øÕ¹µÄÈÎÎñ
local aryEvent = {}
local i=0;

	if aryTask==nil then return nil; end;
	
	for i=1, getn(aryTask) do
		rawset(aryEvent,
				GetTaskEventID(aryTask[i]),
				1);
	end;
	
	return aryEvent;

end;


-- Ã¶¾Ù³öÒ»ÊÂ¼şËù°üº¬µÄÈÎÎñ£¬·µ»ØÒ»¸öÊı×é
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("Cã ®­îc:"..nEventID.." sè nhiÖm vô lµ:"..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("§ang nhËp sè nhiÖm vô:"..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- »Øµ÷º¯Êı£¬Çå¿ÕÒ»¸öÊÂ¼şËùÓĞÈÎÎñµÄ×´Ì¬£¬°üÀ¨ÁÙÊ±±äÁ¿
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("§ang xãa"..TaskName(aryTask[i]).."Tr¹ng th¸i nhiÖm vô ");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."B¹n ®· xãa hÕt<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>ph©n tİch toµn bé nhiÖm vô ", 0);

end;


-- ½«Ò»¸öÈÎÎñÉèÖÃ³É»¹Î´¿ªÊ¼µÄ×´Ì¬
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "Xin h·y nhËp mËt khÈu:");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."MËt khÈu nµy kh«ng ®óng!", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."B¹n nhËn ®­îc<color=yellow>"..TaskName(taskID).."<color>Trë vÒ tr¹ng th¸i ban ®Çu", 0);

end;


-- ½«Ò»¸öÊÂ¼şÀïËùÓĞµÄÈÎÎñ¶¼Çå¿Õ
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "Xin h·y nhËp mËt khÈu:");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."MËt khÈu nµy kh«ng ®óng!", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- ÓÃ×Ö·û´®±íÊ¾Ò»¸öÈÎÎñµÄ×´Ì¬
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>ch­a b¾t ®Çu<color>",
	[1]=" - <color=green>TiÕn hµnh<color>",
	[2]=" - <color=yellow>§· hoµn thµnh<color>",
	[3]=" - <color=yellow>§· nhËn quµ tÆng<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;