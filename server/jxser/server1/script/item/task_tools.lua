
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÈÎÎñÏµÍ³¹¤¾ß½Å±¾
-- Edited by peres
-- 2005/07/29 PM 12:30

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ¶ÁÈëÈÎÎñÏµÍ³Í·ÎÄ¼ş£¬°üº¬Ëæ»úÈÎÎñ
Include("\\script\\task\\system\\task_main.lua");

strTitle        = "<color=green>CÈm nang nhiÖm vô<color>:";
strTitle_Normal = strTitle.."B¹n muèn xem nhiÖm vô nµo?<enter>"
strTitle_None   = strTitle.."B¹n hiÖn ch­a lµm nhiÖm vô nµo.";
strPublic       = "<color=green>CÈm nang nhiÖm vô<color>:"

-- ½« main() ¸Ä³É main_back ¼´¿É½«Õû¸ö¹¤¾ß½ûÓÃ
function main_back()

Say(strTitle.."B¹n muèn lµm nhiÖm vô nµo trong cÈm nang nhiÖm vô nµy kh«ng?",7,
	"Xem m×nh hiÖn ®ang lµm nhiÖm vô nµo./ShowEventMain",
	"b»ng tay b¾t ®Çu mét nhiÖm vô ®· tån t¹i/MenuStartTask",
	"NgÉu nhiªn nhËn ®­îc mét nhiÖm vô b¹n ®ång hµnh/MenuGetRandomTask",
	"NhËn ®­îc mét nhiÖm vô cã tÊt c¶ vËt phÈm cÇn thiÕt/MenuGetTaskItem",
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
	
	rawset(aryTalkText, getn(aryTalkText)+1, "§ãng/OnTaskExit");
	
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
	rawset(strMain, getn(strMain)+1, "§ãng/OnTaskExit");
	
	SelectDescribe(strMain);

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


-- Ñ¡ÔñÊÖ¶¯¿ªÊ¼Ò»¸öÈÎÎñ
function MenuStartTask()
	AskClientForString("_StartTask", "", 1, 20, "NhËp sè thø tù hoÆc tªn nhiÖm vô:");
end;


-- »Øµ÷º¯Êı£¬ÊÖ¶¯¿ªÊ¼Ò»¸öĞÂÈÎÎñ
function _StartTask(taskName)

-- Èç¹ûÊÇÊı×ÖÔò°ÑËü±ä³ÉÈÎÎñÃû³Æ
if tonumber(taskName)~=nil then
	taskName = TaskName(taskName);
end;

	SetTaskStatus(taskName, 0);
	CloseTask(taskName);
	ApplyTask(taskName);
	
end;


-- Ëæ»úÑ¡ÔñÒ»¸öÍ¬°éËæ»úÈÎÎñ
function MenuGetRandomTask()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö
local nResult = 0;

	if partnerindex==0 or partnerstate==0 then
		Msg2Player(strPublic.."<color=yellow>Kh«ng cã gäi ®ång hµnh kh«ng nhËn ®­îc nhiÖm vô ngÉu nhiªn!<color>");
		return
	end;
	
	nResult = initRandomTask();
		
	if nResult==0 then
		CDebug:MessageOut("Tïy theo nhiÖm vô b¹n sÏ chän sè ID t­¬ng øng!");
	end;

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



-- µÃµ½Ò»¸öÈÎÎñËùĞèÒªµÄËùÓĞÎïÆ·
function MenuGetTaskItem()
	AskClientForString("_GetTaskItem", "", 1, 20, "Xin h·y nhËp mËt khÈu:");
end;


-- »Øµ÷º¯Êı£ºµÃµ½Ò»¸öÈÎÎñËùĞèÒªµÄËùÓĞÎïÆ·
function _GetTaskItem(taskID, nIndex)

local taskName = TaskName(taskID);

	-- Èç¹û´«ÈëµÄÊÇÌØÊâ×Ö·û 9999 µÄ»°ÔòÖ±½ÓÈ¡Ëæ»úÈÎÎñµ±Ç°µÄ
	if tonumber(taskID)==9999 then taskName=TaskName(GetTask(1301)); end;

-- ¼ì²é´ËÈÎÎñÊÇÕÒ»Æ½ğ×°±¸»¹ÊÇÕÒÆÕÍ¨ÎïÆ·
local checkType = GetTaskCollectType(taskName);

-- ÈÎÎñĞèÒªÑ°ÕÒµÄÎïÆ·ÁĞ±í
local aryOrgCollect = {};

-- ÈÎÎñËùÒªµÄÎïÆ·±àºÅ
local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
local i,j,k=0,0,0;

	-- »ñÈ¡ĞèÒªÑ°ÕÒµÄÎïÆ·ÁĞ±í
	if checkType>=1 then
		aryOrgCollect = GetTaskCollectRow(taskName);
	else
		Say("NhiÖm vô ®ã kh«ng cÇn thu thËp vËt phÈm!", 0);
		return
	end;

	-- Èç¹ûÊÕ¼¯µÄÊÇÆÕÍ¨×°±¸
	if checkType==1 then
	
		-- »ñÈ¡´«½øÀ´µÄÎïÆ·ÁĞ±í
		for j, k in aryOrgCollect do
		
				-- ÓÃ×Ô¶¨ÒåµÄ×ª»»Êı×Öº¯ÊıÀ´×ª»»±í¸ñÀïµÄÊı×Ö±êÊ¶
				w_Genre      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Genre_Row));
				w_Detail     = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Detail_Row));
				w_Particular = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Particular_Row));
				w_Level      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Level_Row));
				w_GoodsFive  = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsFive_Row));
				w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));
				w_DelGoods   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_DelGoods_Row));
				
				if w_Level==-1 then w_Level=1; end;
				if w_GoodsFive==-1 then w_GoodsFive=0 end;
				
				for i=1, w_GoodsNum do
					AddItem(w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, 0, 0);
				end;
				
		end;
		
	else
	
		-- »ñÈ¡´«½øÀ´µÄÎïÆ·ÁĞ±í
		for j, k in aryOrgCollect do
		
			w_Quality    = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Quality_Row));
			w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));

				for i=1, w_GoodsNum do
					AddGoldItem(0, w_Quality);
				end;
				
		end;
		
	end;
	
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