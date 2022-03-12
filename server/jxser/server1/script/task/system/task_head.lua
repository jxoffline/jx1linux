
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÈÎÎñÏµÍ³»Øµ÷º¯ÊıÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/07/04 PM 19:59

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ÎïÆ·¿âÖ§³Ö
IncludeLib("ITEM");

-- Ëæ»úÈÎÎñµÄ´¦ÀíÖ§³Ö
Include("\\script\\task\\random\\task_head.lua");


-- ÈÎÎñ¹ı³Ì¼ä´«µİÈÎÎñ ID µÄÁÙÊ±±äÁ¿ºÅ
TASK_TEMP_ID = 201;

-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ×ÜÊı
TASK_CHECKITEM_NUM = 202;

-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ÆğÊ¼±äÁ¿ºÅ
TASK_CHECKITEM_START = 203;

-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ×î´óÊı
TAKS_CHECKITEM_MAX = 20;


TaskID_Table = {
	CanCancel    = 4,
	TaskText_Row = 5,
}

-- ÈÎÎñÌõ¼şµÄ±í¸ñ¶¨Òå
Condition = {

	TaskType_Row    = 1,
	TaskDesc_Row    = 2,
	
	TaskStart       = "B¾t ®Çu nhiÖm vô ",	
	TaskEnd         = "KÕt thóc nhiÖm vô ",
	LevelMore       = "®¼ng cÊp lín ",
	LevelLess       = "®¼ng cÊp nhá ",
	LevelEqual      = "®¼ng cÊp",
	ValueMore       = "thay ®æi lín",
	ValueLess       = "thay ®æi nhá ",
	ValueEqual      = "thay ®æi",
	ReputeMore      = "danh väng lín",
	HaveItem        = "vËt phÈm",
	
	CanRestart      = "Cã thÓ thi triÓn tiÕp",

}

-- ÈÎÎñÄÚÈİµÄ±í¸ñ¶¨Òå
Entity = {

	TaskType_Row          = 1,
	Goods_Genre_Row       = 2,
	Goods_Detail_Row      = 3,
	Goods_Particular_Row  = 4,
	Goods_Level_Row       = 5,
	Goods_GoodsFive_Row   = 6,
	Goods_Quality_Row     = 7,
	Goods_GoodsNum_Row    = 8,
	Goods_DelGoods_Row    = 9,
	Goods_RecordSeed_Row  = 10,
	Money_Row             = 11,
	KillNpcName_Row       = 12,
	DropItemRate_Row      = 13,
	TalkNpcName_Row       = 14,
	TalkNpcMap_Row        = 15,
	TaskText_Row          = 16,
	
	Collect               = "thu thËp vËt phÈm ",
	CollectGoldItem       = "thu thËp Trang bŞ Hoµng Kim",
	CollectNpcItem		  = "GiÕt qu¸i r¬i ra vËt phÈm",
	KillNpc               = "s¸t qu¸i",
	TalkNpc               = "§èi tho¹i",

}

-- ÈÎÎñ½±ÀøµÄ±í¸ñ¶¨Òå
Award = {

	AwardType_Row         = 1,
	AwardText_Row         = 2,
	Goods_Genre_Row       = 3,
	Goods_Detail_Row      = 4,
	Goods_Particular_Row  = 5,
	Goods_Level_Row       = 6,
	Goods_GoodsFive_Row   = 7,
	Goods_Quality_Row     = 8,
	Goods_RandomSeed_Row  = 9,
	Goods_GoodsNum_Row    = 10,
	MoneyNum_Row          = 11,
	ExpNum_Row            = 12,
	ReputeNum_Row         = 13,
	AwardTask_Row         = 14,
	SelectTask_Row        = 15,
	ArrayID_Row           = 16,
	ArrayRate_Row         = 17,
	AlliedAward_Row       = 18,
	
	Money                 = "TiÒn",
	Exp                   = "kinh nghiÖm ",
	Goods                 = "vËt phÈm ",
	GoldItem              = "Trang bŞ Hoµng Kim",
	Task                  = "B¾t ®Çu nhiÖm vô ",
	RandomTask            = "NgÉu nhiªn_MËt ®å nhiÖm vô ",  -- ÌØÊâµÄ½±ÀøÀàĞÍ£¬µ÷ÓÃÌØ¶¨µÄ¹ı³Ì²úÉúÒ»¸öÈÎÎñ¾íÖá
	AlliedAwardIndex      = "hÖ thèng phÇn th­ëng",      -- ÌØÊâµÄ½±ÀøÀàĞÍ£¬Ö±½ÓË÷Òıµ½±ğµÄÈÎÎñ½±ÀøÉÏ£¬²¢ÅÉ·¢Ò»Ä£Ò»ÑùµÄ½±Àø
	TreasureMap           = "Tµng B¶o §å",        -- ÌØÊâµÄ½±ÀøÀàĞÍ£¬µ÷ÓÃÌØ¶¨µÄ¹ı³Ì¸øÍæ¼Ò·¢Ò»ÕÅ²Ø±¦Í¼
	
}

-- ÈÎÎñÁÙÊ±±äÁ¿µÄ´æ´¢ ID ¶¨Òå
TmpType = {
	
	Collect        = "Collect",
	CollectGold    = "CollectGold",
	KillNpc        = "KillNpc",
	TalkNpc        = "TalkNpc",
	ItemNpc        = "ItemNpc",
	ItemRate       = "ItemRate",
	ItemSeed       = "ItemSeed",

}

-- »ñÈ¡Ò»¸öÈÎÎñµÄ¼òÒªÃèÊö
function GetTaskText(taskName)

local strText = TaskId(TaskNo(taskName), 1, TaskID_Table.TaskText_Row);

	if strText==nil then strText=""; end;
	
	return strText;
end;


-- »ñÈ¡Ò»¸öÈÎÎñËùÊôµÄÊÂ¼şÃû
function GetTaskEventName(taskName)

local nEventID = GetTaskEventID(taskName)
	return TaskEvent(nEventID, 1, 1);
end;


-- ¼ì²éÒ»¸öÈÎÎñÊÇ·ñ¿ÉÒÔÈ¡Ïû
function CheckTaskCanCancel(taskName)
	local nCanCancel = tonumber(TaskId(TaskNo(taskName), 1, TaskID_Table.CanCancel));
	
	if nCanCancel~=nil and nCanCancel~=0 then
		return 1;
	else
		return 0;
	end;
	
end;


-- Ñ¯ÎÊÊÇ·ñÈ¡ÏûÈÎÎñ
function CancelTaskConfirm(nTaskID)
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
	Say("ThËt sù muèn hñy bá nhiÖm vô nµy kh«ng: <color=yellow>"..szText.."<color>.", 
		2,
		"Muèn/#CancelTaskMain("..nTaskID..")",
		"Kh«ng muèn/Task_Exit");
end;


-- È¡ÏûÈÎÎñµÄÖ÷¹ı³Ì
function CancelTaskMain(nTaskID)
	
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
		SetTaskStatus(taskName, 0);
		CloseTask(taskName);
		
		Msg2Player("§· hñy bá thµnh c«ng: <color=yellow>"..szText.."<color>.");
		
		WriteTaskLog("Hñy bá nhiÖm vô:"..taskName);
		
end;


-- Ö´ĞĞÈÎÎñ¶Ô»°
function ShowTaskSay(taskID)

local taskName = TaskName(taskID)

	OnTaskSay_Call(taskName, GetTaskStatus(taskName));
	
end;


-- ÓÃ¶Ô»°Ãæ°æÏÔÊ¾ÈÎÎñµÄÏêÏ¸ĞÅÏ¢
function ShowTaskInfo(taskID)

local taskName = TaskName(taskID);
local strInfo = TaskTalk(taskName, 1, 6);

	Say(strInfo, 1, "Trë l¹i/#BackTaskStart("..TaskNo(taskName)..")");

end;


-- ·µ»ØÈÎÎñ¶Ô»°Ö÷Ãæ°æ
function BackTaskStart(taskID)
	OnTaskSay_Call(TaskName(taskID), 0);
end;


-- »ñÈ¡Ò»¸öÈÎÎñËùĞèÒªµÄÍê³ÉÌõ¼şÊıÁ¿
function GetTaskFinishConditionNum(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nRightCheck = nRow;
	local i=0;
	
	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		-- Èç¹ûÓĞÊÕ¼¯¹ÖÎïµôÂäÎïÆ·µÄÈÎÎñ£¬Ôò²»¼ÆËã
		if strType==Entity.CollectNpcItem then
			nRightCheck = nRightCheck - 1;
		end;
	end;
	
	return nRightCheck;
end;


-- »ñÈ¡Ò»¸öÈÎÎñµÄËÑ¼¯ÀàĞÍÊÇÎïÆ·»¹ÊÇ»Æ½ğ×°±¸
-- ·µ»ØÖµ£º1 ÎªÎïÆ·£¬2 Îª»Æ½ğ×°±¸£¬nil ÎªÃ»ÊÕ¼¯ÈÎÎñ
function GetTaskCollectType(taskName)

local nRow, nCol = TaskEntityMatrix(taskName);	
local checkType = nil;
local i=0;

	-- ¼ì²é´ËÈÎÎñÊÇÕÒ»Æ½ğ×°±¸»¹ÊÇÕÒÆÕÍ¨ÎïÆ·
	for i=1, nRow do
		
		-- ÊÇ»Æ½ğ×°±¸
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
			checkType=2;
		end;
		
		-- ÊÇÆÕÍ¨ÎïÆ·
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
			checkType=1;
		end;
		
	end;
	
	return checkType;
	
end;

-- ·µ»ØÒ»¸öÈÎÎñÖĞÊÕ¼¯ÀàĞÍµÄÎïÆ·Êı×é
-- ÎïÆ·Êı×éÀàĞÍ£º{nGenre, nDetail, nParticular, nLevel, nGoodsFive, nNum, nIsDel}
-- »Æ½ğ×°±¸Êı×éÀàĞÍ£º{nQuality, nNum, nIsDel}
function GetTaskCollectArray(taskName, nType)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
local nQuality, nGoodsNum, nDelGoods = 0,0,0;

local nRow, nCol = TaskEntityMatrix(taskName);
local aryCollect = {}
local i=0;

	if (nType==1) then
		for i=1, nRow do
		
			nGenre      = tonumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
			nDetail     = tonumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
			nParticular = tonumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
			nLevel      = tonumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
			nGoodsFive  = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nGenre,
						 nDetail,
						 nParticular,
						 nLevel,
						 nGoodsFive,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	if (nType==2) then
		for i=1, nRow do
			nQuality    = tonumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nQuality,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	return aryCollect;

end;

-- È¡µÃÒ»¸öÈÎÎñËùÒªÊÕ¼¯ÎïÆ·µÄ×ÜÊı
function GetTaskCollectNum(taskName)

local nNum = 0;
local strType = "";
local nRow, nCol = TaskEntityMatrix(taskName);

local i=0;

	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nNum = nNum + nGoodsNum;
		end;
	end;
	
	return nNum;
	
end;


-- È¡µÃÒ»ÈÎÎñÊÕ¼¯ÎïÆ·µÄĞĞÊı
function GetTaskCollectRow(taskName)

local aryRow = {}
local nRow, nCol = TaskEntityMatrix(taskName);
local i=0;

	for i=1, nRow do
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
		
			if aryRow[i]==nil then rawset(aryRow, i, {}); end;
			
			rawset(aryRow, i, {nGoodsNum, 0});
		end;
		
	end;
	
	return aryRow;

end;


-- ·¢½±µÄÖ÷º¯ÊıÈë¿Ú£¬Ö»Ğèµ÷ÓÃ´Îº¯Êı¼´¿ÉÊµÏÖÍêÕûµÄ·¢½±
-- ´«Èë²ÎÊı£ºstring:taskName ·¢½±µÄÈÎÎñÃû³Æ
-- ´«Èë²ÎÊı£ºnAlliedTask ¿ÉÑ¡²ÎÊı£¬Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±ÀøÀ´·¢½±
function PayAwardMain(taskName, nAlliedTask)

	local nRow, nCol = TaskAwardMatrix(taskName);
	local nResult = 0; -- ·¢½±µÄ½á¹û£¬Èç¹ûÓĞ¿ªÊ¼ĞÂÈÎÎñµÄ»°Ôò·µ»Ø 1
	local i=0;
	
	local aryAward = {{}};
	local strType = "";
	local strArray = "";
	local strArrayRate = "";
	
	local nIsArray = 0; -- ÅĞ¶ÏÊÇ·ñÓĞÊı×é
	
	local nAdd = 0; -- ¼ÆËã¸ÅÂÊÊ±ÀÛ¼ÓµÄ±äÁ¿
	local nRandom = 0; -- È¡µÄËæ»úÖµ
	
	local nIsTaskStart = 0;  -- ÊÇ·ñ¿ªÊ¼ĞÂÈÎÎñ


	-- Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±Àøµ÷ÓÃ´Ë¹ı³ÌÀ´·¢½±
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;
	
		CDebug:MessageOut(taskName.."phÇn th­ëng khi b¾t ®Çu nhiÖm vô ");
	
		for i=1, nRow do
		
			strType = TaskAward(taskName, i, Award.AwardType_Row);
			strArray = TaskAward(taskName, i, Award.ArrayID_Row);
			strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
			
			-- Èç¹û½±Àø±»¶¨ÒåÁËÊı×é
			if strArray~="" then
			
				CDebug:MessageOut(taskName.."sè phÇn th­ëng bao gåm.");
				
				-- Èç¹ûÊı×é²»´æÔÚÔò³õÊ¼»¯Êı×é
				if aryAward[tonumber(strArray)]==nil then
					CDebug:MessageOut(taskName.."b¾t ®Çu më th­ëng"..tonumber(strArray));
					rawset(aryAward, tonumber(strArray), {}); 
				end;
				
				 rawset(aryAward[tonumber(strArray)],
				 		getn(aryAward[tonumber(strArray)])+1,
				 		{i,tonumber(strArrayRate)}
				 		);
				 		
				 nIsArray = 1;
			else
				nResult = PayAward(taskName, i, strType, nAlliedTask);
				-- ´¢´æÊÇ·ñ¿ªÊ¼ÈÎÎñ
				if nResult==1 then nIsTaskStart = 1; end;
			end;
		
		end;
		
		-- Èç¹û½±Àø±»¶¨ÒåÁËÊı×é£¬Ôòµ÷ÓÃÊı×é·¢½±º¯Êı
		if nIsArray==1 then
			CDebug:MessageOut(taskName.."®iÒu chØnh l¹i hµm sè ph¸t th­ëng");
			for i=1, getn(aryAward) do
				if PayAwardForArray(taskName, aryAward[i], nAlliedTask)==1 then
					nResult = 1;
					nIsTaskStart = 1;
				end;
			end;
		
		end;
		
		
		-- Èç¹ûÈÎÎñ½±ÀøÃ»ÓĞ¿ªÊ¼ĞÂÈÎÎñµÄ»°ÔòÕ¹¿ªÈÎÎñÍê³ÉºóµÄ¶Ô»°
		if nIsTaskStart==0 then
			CDebug:MessageOut(taskName.." Ch­a më nhiÖm vô míi. §iÒu chØnh l¹i thêi gian ph¸t th­ëng");
			CreateTaskSay({TaskTalk(taskName, 1, 5),
						  "KÕt thóc ®èi tho¹i/OnTaskExit"
						  });
			return 1;
		end;
		
		return 1;
		
end;


-- ·¢½±µÄÍ³Ò»Ï¸½Ú´¦Àí¹ı³Ì
-- ´«Èë²ÎÊıÎªÈÎÎñµÄÃû×Ö¡¢½±ÀøĞĞºÅ¡¢·¢½±ÀàĞÍ
-- ´«Èë²ÎÊı£ºnAlliedTask ¿ÉÑ¡²ÎÊı£¬Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±ÀøÀ´·¢½±
function PayAward(taskName, nRow, strType, nAlliedTask)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nNum = 0,0,0,0,0,0,0;
local nMoney, nExp = 0,0
local nRandomItemIndex = 0;  -- ²úÉúËæ»úÈÎÎñ¾íÖáµÄË÷Òı
local nRandomTaskID = 0;  -- ²úÉúËæ»úÈÎÎñµÄÈÎÎñË÷Òı

-- Èç¹ûÎïÆ·ĞèÒª¼ÇÂ¼Ëæ»úÖÖ×Ó£¬Ôò¼ÇÂ¼ĞòºÅ
local nRandomSeedRecord = 0;

-- Ëæ»úÖÖ×ÓÊı	
local nRandomSeed = 0;

local strAlliedTask = ""; -- ÀàËÆÈÎÎñ½±ÀøµÄË÷Òı
local nAlliedRow, nAlliedCol = 0,0;
local strAlliedType = "";
local strShowName = "";  -- Êä³öÏÔÊ¾µÄÈÎÎñÃû

local strTask = "";
local strText = "";

local nResult = 0;

local i=0;

	-- Òì³£´¦Àí
	if taskName=="" or taskName==nil then
		-- Ğ´ LOG
		WriteTaskLog("®· thay ®æi qu¸ tr×nh nhËn th­ëng phi ph¸p");		
		return
	end;

	-- Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±Àøµ÷ÓÃ´Ë¹ı³ÌÀ´·¢½±
	if nAlliedTask~=nil and nAlliedTask~=0 then
		strShowName = TaskName(nAlliedTask);
	else
		strShowName = taskName;
	end;
	
	-- Òì³£´¦Àí
	if strShowName==nil then strShowName=""; end;

	-- Èç¹û½±ÀøµÄÀàĞÍÊÇ½ğÇ®
	if strType==Award.Money then		
		nMoney = TaskAward(taskName, nRow, Award.MoneyNum_Row);
		
		if nMoney==nil or nMoney=="" then nMoney=0; end;
		
		Earn(nMoney);
		
		Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>tiÒn<color=green>"..nMoney.."<color>");
		CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ tiÒn:"..nMoney);
	end;
	
	-- Èç¹û½±ÀøµÄÀàĞÍÊÇ¾­Ñé
	if strType==Award.Exp then
		nExp = TaskAward(taskName, nRow, Award.ExpNum_Row);
		AddOwnExp(nExp);
		
		Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>®iÓm kinh nghiÖm<color=green>"..nExp.."<color>");
		CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ ®iÓm kinh nghiÖm:"..nExp);
	end;

	-- Èç¹û½±ÀøµÄÀàĞÍÊÇÎïÆ·
	if strType==Award.Goods then
	
		nGenre      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Genre_Row));
		nDetail     = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Detail_Row));
		nParticular = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Particular_Row));
		nLevel      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Level_Row));
		nGoodsFive  = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsFive_Row));
		nNum        = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsNum_Row));
		
		-- ½±ÀøµÄÎïÆ·ÎÄ×Ö
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		for i=1, nNum do
			AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
		end;
		
		Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>vËt phÈm<color=green>"..strText..nNum.."c¸i<color>");
		
		-- Ğ´ LOG
		WriteTaskLog("trong nhiÖm vô:"..strShowName.."NhËn ®­îc vËt phÈm:"..strText);
		
		CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ vËt phÈm:"..strText);
	end;
		
	-- Èç¹û½±ÀøµÄÀàĞÍÊÇ»Æ½ğ×°±¸
	if strType==Award.GoldItem then
	
		nQuality = tonumber(TaskAward(taskName, nRow, Award.Goods_Quality_Row));
		nRandomSeedRecord = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_RandomSeed_Row));
		
		if nRandomSeedRecord~=-1 then
			nRandomSeed = GetTmpValue(taskName, TmpType.ItemSeed..nRandomSeedRecord);
			-- AddItemEx Ö¸ÁîĞèÒª½«»Æ½ğĞòºÅ -1
			AddItemEx(4, nRandomSeed, 1, 0, nQuality - 1, 0, 0, 0, 0, 0);
			CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ trang bŞ hoµng kim, sè hiÖu nhiÖm vô lµ:"..nQuality.." NhiÖm vô ngÉu nhiªn:"..nRandomSeed);
		else
			AddGoldItem(0, nQuality);
		end;

		-- ½±ÀøµÄÎïÆ·ÎÄ×Ö
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>trang bŞ hoµng kim:<color=Orange>"..strText.."<color>");
		
		-- Ğ´ LOG
		WriteTaskLog("trong nhiÖm vô:"..strShowName.."NhËn ®­îc mét bé trang bŞ hoµng kim:"..nQuality);
		
		CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ trang bŞ hoµng kim, sè hiÖu nhiÖm vô lµ:"..nQuality);
	end;
	
	-- Èç¹û½±ÀøÀàĞÍÊÇ¿ªÊ¼Ò»¸öÈÎÎñ
	if strType==Award.Task then
		strTask = TaskAward(taskName, nRow, Award.AwardTask_Row);
		nResult = ApplyTask(strTask);
		CDebug:MessageOut(strShowName.."phÇn th­ëng b¾t ®Çu nhiÖm vô tªn lµ:"..strTask..", kÕt qu¶ lµ:"..nResult);
		return 1;
	end;
	
	-- Èç¹û½±ÀøÀàĞÍÊÇ²úÉúÒ»¸öËæ»úÈÎÎñ¾íÖá
	if strType==Award.RandomTask then
		
		-- Ñ¡ÔñÒ»¸öµÚ¶ş²ãµÄËæ»úÈÎÎñ
		nRandomTaskID = TaskNo(selectNextTask());
		
		if nRandomTaskID~=nil and nRandomTaskID~=0 then
			-- Éú³ÉÒ»¸öÈÎÎñ¾íÖá
			nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
			SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
			
			-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
			SyncItem(nRandomItemIndex);

			Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>:<color=green> nhËn ®­îc 1 mËt ®å<color>");
			CDebug:MessageOut(strShowName.."phÇn th­ëng cña nhiÖm vô lµ 1 mËt ®å ngÉu nhiªn! Sè hiÖu nhiÖm vô lµ:"..nRandomTaskID.." tiÕp theo lµ:"..nRandomItemIndex);
		else
			CDebug:MessageOut(strShowName.."nhiÖm vô thÊt b¹i!");
		end;
		
	end;
	
	
	-- Èç¹û½±ÀøÀàĞÍÊÇ²Ø±¦Í¼
	if strType==Award.TreasureMap then
		-- ²úÉúÒ»ÕÅ²Ø±¦Í¼
		CreateTreasureMap();
		
		Msg2Player("B¹n nhËn ®­îc<color=White>"..GetTaskText(strShowName).."<color>phÇn th­ëng:<color=green>mét tÊm Tµng B¶o §å!<color>");
		
		-- Ğ´ LOG
		WriteTaskLog("trong nhiÖm vô:"..strShowName.."NhËn ®­îc 1 tÊm Tµng B¶o §å.");
	end;
	
	
	-- Èç¹û½±ÀøÀàĞÍÊÇ½±ÀøË÷Òı
	if strType==Award.AlliedAwardIndex then

		-- »ñÈ¡½±ÀøË÷ÒıÃû
		strAlliedTask = TaskAward(taskName, nRow, Award.AlliedAward_Row);
		
		CDebug:MessageOut(taskName.."Lo¹i phÇn th­ëng:"..strAlliedTask);
		
		-- °Ñ×Ô¼º±¾Éí×ª»»³ÉÒ»¸öÊı×Ö´«½øÈ¥
		PayAwardMain(strAlliedTask, TaskNo(taskName));
		
	end;
	
	return 0;

end;


-- ¸ù¾İ´«ÈëµÄÊı×éÀ´Ëæ»úÑ¡È¡Ò»¸ö½±Àø·¢¸øÍæ¼Ò
-- ´«Èë²ÎÊı£ºtaskName£ºÈÎÎñÃû  aryAward{nRow, nRate}£º½±ÀøÊı×é
-- ´«Èë²ÎÊı£ºnAlliedTask ¿ÉÑ¡²ÎÊı£¬Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±ÀøÀ´·¢½±
function PayAwardForArray(taskName, aryAward, nAlliedTask)

local strType = "";

local nAdd = 0;
local nResult = 0;
local nRandom = 0;
local nIsTaskStart = 0; -- ÅĞ¶ÏÊ¼ÊÇ·ñÓĞÈÎÎñ¿ªÊ¼
local i=0;

local RATE_ADD = 100; -- ¸ÅÂÊ¶¼³Ë 100 £¬ÒÔ·ÀÖ¹³öÏÖĞ¡Êı

	-- Èç¹û·Ç¿Õ£¬Ôò±íÃ÷ÊÇÓÉË÷Òı½±Àøµ÷ÓÃ´Ë¹ı³ÌÀ´·¢½±
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;

	for i=1, getn(aryAward) do
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
	end;
	
	nRandom = random(1, nAdd);
	
	CDebug:MessageOut(taskName.."phÇn th­ëng ngÉu nhiªn cã ®­îc:"..nRandom);
	
	if nAdd~=10000 then -- Èç¹û¸ÅÂÊÏà¼Ó²»µ½ 10000 µÄÈİ´í´¦Àí
		print(taskName.."®iÒn nhËp phÇn th­ëng cã sai sãt");
		nRandom=1; 
	end;
	
	nAdd = 0;
	
	-- °ÑÊı×éÀïÃæµÄ¶«Î÷·¢³öÈ¥
	for i=1, getn(aryAward) do
		
		strType = TaskAward(taskName, aryAward[i][1], Award.AwardType_Row);
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
		
		if nAdd>=nRandom then
			CDebug:MessageOut(taskName.."Sè phÇn th­ëng cã ®­îc"..aryAward[i][1].." ");
			nResult = PayAward(taskName, aryAward[i][1], strType, nAlliedTask);
			
			if nResult==1 then
				nIsTaskStart = 1;
			end;
			
			break;
		end;
	end;
	
	return nIsTaskStart;
	
end;


-- ÓÃÓÚÅĞ¶Ï¶Ô»°ÈÎÎñÊÇ·ñÄÜÍê³É
function CheckTalkCanFinish(taskName)

local nTalkNpc = 0;
local nOrder = 0;
local nFinish = 0;

	if GetTmpValue(taskName, TmpType.KillNpc) ~= nil then
		CDebug:MessageOut(taskName.."XĞt xem nhiÖm vô ®èi tho¹i lµ cã thÓ hoµn thµnh hay kh«ng, biÕn sè t¹m thêi cña nhiÖm vô giÕt qu¸i kh¸c 0.");
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.KillNpc);	
	end;
	if GetTmpValue(taskName, TmpType.Collect) ~= nil then
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.Collect);
	end;
	if GetTmpValue(taskName, TmpType.TalkNpc) ~= nil then
		nOrder = nOrder + 1;
		nTalkNpc = 1;
	end;
	
	if nOrder>1 then
		if nFinish + 1 == nOrder then
			CDebug:MessageOut(taskName.." nhiÖm vô cã thÓ hoµn thµnh");
			return 1;
		else
			return nil;
		end;
	else
		return 1;
	end;

end;


-- ¹¹ÔìÈÎÎñÑ¡Ôñ¶Ô»°
function CreateTalkTask()

local nNpcIndex = GetLastDiagNpc();
local NpcName  = ""

local x, y, subworld = GetNpcPos(nNpcIndex);
local mapName = SubWorldName(subworld);

local aryTask = EnumTaskList();

local aryTaskText = {"Ng­¬i ®Õn lµm g×?"};

local i=0;

	if nNpcIndex==nil then return 0; end;

	if aryTask==nil then return 0; end;
	
	NpcName = GetNpcName(nNpcIndex);
	
	-- Ì¨Íå°æĞèÒª×ª»»¹ıµÄ NPC NAME
	NpcName = NpcName2Replace(NpcName);
	
	for i=1, getn(aryTask) do
		if OnTaskNpcTalk(NpcName, mapName, aryTask[i])==1 then
			rawset(aryTaskText,
					getn(aryTaskText)+1,
					"Ta ®Õn ®Ó"..GetTaskEventName(aryTask[i]).." /#ShowTaskSay("..TaskNo(aryTask[i])..")");
		end;
	end;
	
	rawset(aryTaskText, getn(aryTaskText)+1, "tiÕp tôc nãi chuyÖn tr­íc ®©y/NpcDialog");
	
	if getn(aryTaskText)>2 then
		SelectSay(aryTaskText);
		return 1;
	else
		return 0;
	end;

end;


-- Ñ¡ÔñÊÕ¼¯É±¹ÖÎïÆ·ÈÎÎñµÄÎïÆ·£¬ÔÚÃ¿É±Ò»´ÎÖ¸¶¨µÄ¹ÖÊ±´¥·¢
function SelectCollectItemTask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nItemRate = tonumber(GetTmpValue(taskName, "ItemRate"));
	
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local szText = "";
	local nRandom = 0;
	
	if nItemRate==0 or nItemRate==nil then return end;
	
	CDebug:MessageOut(taskName.." X¸c suÊt giÕt qu¸i nhËn ®­îc vËt phÈm:"..nItemRate);
	
		if nRate~=nil or nRate~="" then
			nRandom = random(1, 100);
			if nRandom<=tonumber(nItemRate) then
				
				for i=1, nRow do
					strType = TaskEntity(taskName, i, Entity.TaskType_Row);
					if strType==Entity.CollectNpcItem then
						nGenre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
						nDetail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
						nParticular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
						nLevel      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
						nGoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
						szText      = TaskEntity(taskName, i, Entity.TaskText_Row);
					end;
				end;
				
				AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
				Msg2Player("B¹n nhËn ®­îc 1: <color=green>"..szText.."<color>!");
				
			end;
		end;
end;


-- ½«Ò»¸ö´«½øÀ´µÄÎïÆ·Ë÷Òı×ª»»³ÉÒ»¸ö STRING µÄ KEY£¬ÒÔ¼°·µ»ØµÈ¼¶ºÍÎåĞĞ
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- ×ª»»Ò»¸öÎïÆ·µÄ±êÊ¶ÎªÊı×Ö£¬Èç¹ûÆäÎª n »òÕßÊÇ nil Ôò·µ»Ø -1
function TranItemNumber(num)

	if num=="n" or num=="" or num==nil then
		return -1;
	end;
	
	if strfind(tostring(num), "/")~=nil then
		return tostring(num);
	end;
	
	return tonumber(num);

end;


-- Ç¿ÖÆ½«Ò»¸ö±äÁ¿×ª»»³ÉºÏ·¨µÄ×Ö·û´®
function TranEnableString(strMain)

	if strMain==nil then
		return "";
	else
		return strMain;
	end;

end;


-- Ã¶¾Ùµ±Ç°ÕıÔÚ½øĞĞµÄÈÎÎñ£¬·µ»ØÒ»¸öÈÎÎñÃûÊı×é
function EnumTaskList()

local aryTask = {}

-- »ñÈ¡µÚÒ»¸öÈÎÎñÃû
local taskName = FirstTask();

	-- Èç¹ûµ±Ç°Ã»ÓĞÈÎÎñÔòÖ±½Ó·µ»Ø
	if taskName==nil then return nil; end;
	
	rawset(aryTask, getn(aryTask)+1, taskName);
	
	while (taskName~=nil) do
		taskName = NextTask();
		rawset(aryTask, getn(aryTask)+1, taskName);
	end;
	
	return aryTask;

end;


-- Í¬²½ÈÎÎñÏµÍ³ËùÕ¼ÓÃµÄËùÓĞ±äÁ¿
function SyncTaskSystemValus()

local nStart, nEnd = 2000, 2300; -- ¿ªÊ¼ºÍ½áÊøµÄ·¶Î§
local i=0;

	for i=nStart, nEnd do
		SyncTaskValue(i);
	end;

end;


-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)

	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	if strMain==nil then return end;

	WriteLog(" [HÖ thèng nhiÖm vô]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]"..strMain);
end;


function Task_Exit()

end;