
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÈÎÎñÏµÍ³»Øµ÷º¯Êı´¦ÀíÎÄ¼ş
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

-- ¶ÁÈëÊı¾İ¶¨ÒåÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_head.lua");

-- ¶ÁÈë DEBUG Êä³ö´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_debug.lua");

-- ¶ÁÈë¶Ô»°×Ö·û´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_string.lua");

Include([[\script\tong\tong_award_head.lua]]);-- byÖ¾É½£¬°ï»áÖÜÄ¿±ê¹±Ï×¶È
-- ÇëÇó¿ªÊ¼Ò»¸öĞÂÈÎÎñ
function ApplyTask(taskname)

	-- ¼ì²éÈÎÎñÊÇ·ñÂú×ã¿ªÊ¼Ìõ¼ş
	local result = OnCheckTaskStart(taskname);
	if (result == 1) then
		OnTaskSay(taskname, 0);
		return 1;
	end
	return 0;
end

-- ¼ì²éÈÎÎñÊÇ·ñ¿ÉÒÔ¿ªÊ¼µÄ»Øµ÷º¯Êı
function OnCheckTaskStart(taskName)
	
	local nRow, nCol = TaskConditionMatrix(taskName);
	local strType, strDesc = "","";
	local nCheck = 0;
	local i,j = 0,0;
	
	local nLevel = 0; -- µÈ¼¶ÅĞ¶ÏµÄÌõ¼ş»ñÈ¡
	
	CDebug:MessageOut("B¾t ®Çu xem"..taskName.." ®iÒu kiÖn");
		
		-- Èç¹ûÈÎÎñ¸ù±¾²»ĞèÒªÌõ¼ş£¬ÔòÖ±½Ó¿ªÊ¼
		if nRow==0 or nRow==nil then return 1; end;
	
		-- ¿ªÊ¼Ñ­»·±éÀúÕû¸öÈÎÎñÌõ¼ş±í
		for i=1, nRow do
		
			strType = TaskCondition(taskName, i, Condition.TaskType_Row);
			strDesc = TaskCondition(taskName, i, Condition.TaskDesc_Row);
			
			-- ÈËÎïµÈ¼¶´óÓÚµÄÌõ¼şÅĞ¶Ï
			if strType==Condition.LevelMore then
				nLevel = tonumber(strDesc);
				if GetLevel()>nLevel then
					CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn ®¼ng cÊp lín, th«ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ÈËÎïµÈ¼¶Ğ¡ÓÚµÄÌõ¼şÅĞ¶Ï
			if strType==Condition.LevelLess then
				nLevel = tonumber(strDesc);
				if GetLevel()<nLevel then
					CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn ®¼ng cÊp nhá, th«ng qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- ÈËÎïµÈ¼¶µÈÓÚµÄÌõ¼şÅĞ¶Ï
			if strType==Condition.LevelEqual then
				nLevel = tonumber(strDesc);
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn ®¼ng cÊp, th«ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ÈÎÎñÊÇ·ñÒÑ¾­¿ªÊ¼µÄÌõ¼şÅĞ¶Ï
			if strType==Condition.TaskStart then
				if GetTaskStatus(strDesc)==1 then
					CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn cã ®iÒu kiÖn"..strDesc.."B¾t ®Çu, th«ng qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- ÈÎÎñÊÇ·ñÒÑ¾­½áÊøµÄÌõ¼şÅĞ¶Ï
			if strType==Condition.TaskEnd then
				if GetTaskStatus(strDesc)==3 then
					CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn cã ®iÒu kiÖn"..strDesc.."KÕt thóc, th«ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			--ÈÎÎñÊÇ·ñ¿ÉÒÔÖØ¸´¿ªÊ¼
			if strType==Condition.CanRestart then
				if tonumber(strDesc)==1 then
					CDebug:MessageOut(taskName.." §iÒu kiÖn b¾t ®Çu cña nhiÖm vô lµ cã thÓ b¾t ®Çu l¹i, th«ng qua");
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					nCheck = nCheck + 1;
				end;
			end;
			
			-- Èç¹ûÊ²Ã´¶¼²»Ìî
			if strType=="" then
				CDebug:MessageOut(taskName.." nhiÖm vô nµy ®­îc miÔn vËt phÈm, th«ng qua.");
				nCheck = nCheck + 1;
			end;
	
		end;
		
		-- Èç¹ûÈÎÎñÒÑ¾­¿ªÊ¼ÁË£¬ÄÇÔò²»ÄÜ·´¸´¿ªÊ¼
		if GetTaskStatus(taskName)~=0 then
			CDebug:MessageOut(taskName.." nhiÖm vô nµy ®· b¾t ®Çu, kh«ng thÓ quay l¹i n÷a");
			return 0;
		end;
		
		-- Èç¹ûÈ«²¿Ìõ¼ş·ûºÏ£¬Ôò·µ»Ø 1
		if nCheck==nRow then
			CDebug:MessageOut(taskName.." nhiÖm vô nµy toµn bé ®­îc th«ng qua");
			WriteTaskLog(taskName.." §iÒu kiÖn ®· ®¸p øng, cã thÓ b¾t ®Çu nhiÖm vô.");
			return 1;
		else
			return nil;
		end;

end;


-- ÈÎÎñ¿ªÊ¼Ê±µÄÏ¸½Ú´¦Àí
function OnTaskStart(taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local nOldRow, nOldCol = 0, 0;  -- ÉÏÒ»´ÎËæ»úÈÎÎñµÄÎ¬¶È
	
	local szOldTaskName = "";  -- ÉÏÒ»´ÎËæ»úÈÎÎñµÄÃû×Ö
	
	local strType = ""
	local nKillEvent = 0;
	local nEventResult = 0;
	local i=0;
	
	local nDelItemResult = 0;  -- É¾³ıËæ»úÈÎÎñ¾íÖáÎïÆ·µÄ·µ»ØÖµ
	
	local nEvent = GetTaskEventID(taskName); -- ÅĞ¶ÏÊÇÄÄÒ»¸öÊÂ¼şµÄ¿ªÊ¼
	
		-- Èç¹ûÊÇËæ»úÈÎÎñµÄ¿ªÊ¼
		if nEvent==3 then

			-- Èç¹ûÊÇÍ¨¹ı°ï»áÈÎÎñÁîÅÆÆô¶¯µÄ
			if GetTask(ID_RANDOMTASKTEMP)~=0 then
				
				nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMTASKTEMP));

				-- ½«ÁÙÊ±±äÁ¿ÇåÁã
				SetTask(ID_RANDOMTASKTEMP, 0);
								
				-- Òì³£´¦Àí£¬É¾³ı²»³É¹¦
				if nDelItemResult~=1 then
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					return 0;
				end;
				
			end;

			szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	
			-- Èç¹ûĞÂµÄËæ»úÈÎÎñÓë¾ÉµÄ²»Í¬£¬ÔòÇå¿ÕÕıÔÚ½øĞĞµÄËæ»úÈÎÎñ
			if szOldTaskName~=taskName then
				SetTaskStatus( szOldTaskName, 0 );
				CloseTask( szOldTaskName );
			end;
			
			-- »ñµÃÖ®Ç°µÄÎ¬¶È
			nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
			
			-- Èç¹ûµ±Ç°ÕıÔÚ½øĞĞµÄÈÎÎñÓĞÉ±¹Ö¼ÆÊı£¬ÔòÇå¿Õ¼ÆÊıÆ÷
			for i=1, nRow do
				nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
				if nKillEvent~=nil or nKillEvent~="" then
					RemovePlayerEvent(tonumber(nKillEvent));
				end;
			end;
		
			-- ½«µ±Ç°ÕıÔÚ½øĞĞµÄÈÎÎñID´¢´æ
			SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
			
			-- ½«ÈÎÎñ½ø³ÌÉèÖÃÎªÒÑ¾­½ÓÁËÈÎÎñ
			setRandomTaskState(2);
			
			-- Í¬²½ÈÎÎñ±äÁ¿
			SyncTaskValue(ID_RANDOMTASK);
			
			-- Ğ´ÈëËæ»úÈÎÎñÍê³ÉµÄÊ±¼äºÍ´ÎÊı
			writeRandomTaskEnable();

		end;
	
		-- Èç¹ûÊÇ¾íÖáÈÎÎñµÄ¿ªÊ¼ÔòÉ¾³ıÈÎÎñÎïÆ·
		if nEvent==4 then
			
			nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMBOOKTEMP));
			
			-- Òì³£´¦Àí£¬É¾³ı²»³É¹¦
			if nDelItemResult~=1 then
				SetTaskStatus(taskName, 0);
				CloseTask(taskName);
				return 0;
			end;
			
			SetTask(ID_RANDOMBOOKTEMP, 0);
			
			-- ½«µ±Ç°ÕıÔÚ½øĞĞµÄËæ»úÈÎÎñID´¢´æ
			SetTask(ID_RANDOMBOOK, TaskNo(taskName));
			
			-- Í¬²½ÈÎÎñ±äÁ¿
			SyncTaskValue(ID_RANDOMBOOK);

			-- Ğ´ÈëÃ¿Ìì¿ªÆôµÄÊ±¼äÓë´ÎÊı
			writeTaskBookTimes();
			
		end;
	
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			nKillEvent = TaskEntity(taskName, i, Entity.KillNpcName_Row);
			nNpcItemRate = TaskEntity(taskName, i, Entity.DropItemRate_Row);
			
			-- Èç¹ûÊÇÊÕ¼¯ÎïÆ·ÈÎÎñ£¬ÔòÔ¤ÏÈÕ¼¾İÒ»¸öÁÙÊ±±äÁ¿
			if strType==Entity.Collect then
				CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn kiÕm lo¹i vËt phÈm, ph¶i giao n¹p kŞp lóc");	
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- Èç¹ûÊÇÊÕ¼¯»Æ½ğ×°±¸ÈÎÎñ£¬ÔòÔ¤ÏÈÕ¼¾İÒ»¸öÁÙÊ±±äÁ¿
			if strType==Entity.CollectGoldItem then
				CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn kiÕm trang bŞ hoµng kim, ph¶i giao n¹p kŞp lóc");
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- Èç¹ûÊÇÊÕ¼¯¹ÖÎïµôÂäÎïÆ·ÈÎÎñ£¬ÔòÔ¤ÏÈÕ¼¾İÒ»¸öÁÙÊ±±äÁ¿£¬±äÁ¿ÄÚÈİÎª¼ÆÊıÆ÷µÄ±àºÅ
			if strType==Entity.CollectNpcItem then
				CDebug:MessageOut(taskName.." NhiÖm vô yªu cÇu giÕt qu¸i thu thËp vËt phÈm, cÇn sö dông biÕn sè t¹m thêi");
				SetTmpValue(taskName, TmpType.ItemNpc, tonumber(nKillEvent));
				
				CDebug:MessageOut(taskName.."NhiÖm vô yªu cÇu giÕt qu¸i thu thËp vËt phÈm, thiÕt lËp x¸c suÊt vËt phÈm:"..nNpcItemRate);
				SetTmpValue(taskName, TmpType.ItemRate, tonumber(nNpcItemRate));
				
				nEventResult = AddPlayerEvent(tonumber(nKillEvent));
				
				if nEventResult==0 then
					CDebug:MessageOut(taskName.."Khëi ®éng bé ®Õm sè qu¸i bŞ giÕt ph¸t sinh lçi, id lµ:"..nKillEvent);
				end;
				
			end;
			
			-- Èç¹ûÓĞÉ±¹Ö¼ÆÊıµÄ»°Ôò¿ªÆôÒ»¸ö¼ÆÊıÆ÷£¬²¢Ò²Õ¼ÓÃÒ»¸öÁÙÊ±±äÁ¿
			if nKillEvent~="" and strType==Entity.KillNpc then
				CDebug:MessageOut(taskName.." cÇn më chøc n¨ng s¸t qu¸i. Sè hiÖu lµ "..nKillEvent);
				SetTmpValue(taskName, TmpType.KillNpc, 0);
				AddPlayerEvent(tonumber(nKillEvent));
			end;
			
			-- Èç¹ûÓĞÓë NPC ¶Ô»°µÄ»°ÔòÕ¼ÓÃÒ»¸öÁÙÊ±±äÁ¿
			if strType==Entity.TalkNpc then
				CDebug:MessageOut(taskName.." nhiÖm vô nµy cÇn ®èi tho¹i víi NPC, ph¶i tiÕn hµnh kŞp thêi.");
				SetTmpValue(taskName, TmpType.TalkNpc, 0);
			end;
			
		end;
		
		-- Èç¹ûÈÎÎñ¿ªÊ¼ºóµÄ¶Ô»°²»Îª¿ÕµÄ»°ÔòËµÒ»¶Î»°
		if TaskTalk(taskName, 1, 2)~="" then
			CreateTaskSay({TaskTalk(taskName, 1, 2),
						   "KÕt thóc ®èi tho¹i/OnTaskExit"}
						  );
		end;
		
		-- ÌáÊ¾Íæ¼ÒÈÎÎñÒÑ¾­¿ªÊ¼
		Msg2Player("B¹n tiÕp nhËn<color=yellow>"..GetTaskText(taskName).."<color>");

end;


--È¡ÏûÔ­ÓĞÈÎÎñµÄº¯Êı
function delorgtask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	-- Çå¿ÕÕıÔÚ½øĞĞµÄËæ»úÈÎÎñ
	SetTaskStatus( szOldTaskName, 0 );
	CloseTask( szOldTaskName );
	-- »ñµÃÖ®Ç°µÄÎ¬¶È
	nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
	-- Èç¹ûµ±Ç°ÕıÔÚ½øĞĞµÄÈÎÎñÓĞÉ±¹Ö¼ÆÊı£¬ÔòÇå¿Õ¼ÆÊıÆ÷
	for i=1, nRow do
		nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
		if nKillEvent~=nil or nKillEvent~="" then
			RemovePlayerEvent(tonumber(nKillEvent));
		end;
	end;
end;

-- ½«µ±Ç°ÕıÔÚ½øĞĞµÄÈÎÎñID´¢´æ
function setnewtask()
	SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
	
	setRandomTaskState(2);	-- ½«ÈÎÎñ½ø³ÌÉèÖÃÎªÒÑ¾­½ÓÁËÈÎÎñ
	SyncTaskValue(ID_RANDOMTASK);	-- Í¬²½ÈÎÎñ±äÁ¿
	writeRandomTaskEnable();	-- Ğ´ÈëËæ»úÈÎÎñÍê³ÉµÄÊ±¼äºÍ´ÎÊı
end;

-- ¼ì²âÈÎÎñÊÇ·ñÍê³ÉµÄ»Øµ÷º¯Êı
function OnCheckTaskFinish(taskName, nType)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local i=0;
	
	local strType = "";
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local nQuality, nGoodsNum, nDelGoods = 0,0,0;
	local nMoney = 0;
	local strKillNpcName = "";
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local nRightCheck = GetTaskFinishConditionNum(taskName);  -- Íê³ÉÈÎÎñËùĞèÒª´ï³ÉµÄÌõ¼şÁ¿
	local nCheck = 0;
	
		CDebug:MessageOut(taskName.." C¬ sè ®iÒu kiÖn nhiÖm vô cÇn ®¹t ®Õn lµ:"..nRightCheck);
	
		-- Èç¹ûÊÇ¶Ô»°´¥·¢Ìõ¼şÍê³É
		if nType==1 and CheckTalkCanFinish(taskName)==1 then
			CDebug:MessageOut(taskName.." nhiÖm vô ®¹t ®Õn môc tiªu");
			SetTmpValue(taskName, TmpType.TalkNpc, 1);
		end;
		
		-- Èç¹ûÊÇÉ±¹Ö¼ÆÊı´¥·¢Íê³É
		if nType==2 then
			if GetTmpValue(taskName, TmpType.ItemNpc)~=0 and GetTmpValue(taskName, TmpType.ItemNpc)~=nil then
				-- Èç¹ûÊÇÓÉÉ±¹ÖµôÂäµÄÈÎÎñ´¥·¢£¬Ôòµ÷ÓÃÑ¡ÔñÎïÆ·
				SelectCollectItemTask(taskName);
			else
				CDebug:MessageOut(taskName.." nhiÖm vô giÕt qu¸i ®¹t ®Õn môc tiªu");
				Msg2Player(GetTaskText(taskName).."®iÒu kiÖn giÕt qu¸i ®· ®¹t ®­îc");
				SetTmpValue(taskName, TmpType.KillNpc, 1);
			end;
		end;
		
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			-- Èç¹ûÊÇÊÕ¼¯ÎïÆ·µÄÈÎÎñ
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				if GetTmpValue(taskName, TmpType.Collect)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- Èç¹ûÊÇÉ±¹Ö¼ÆÊıµÄÈÎÎñ
			if strType==Entity.KillNpc then
				if GetTmpValue(taskName, TmpType.KillNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- Èç¹ûÊÇÓë NPC ¶Ô»°µÄÈÎÎñ
			if strType==Entity.TalkNpc then
				if GetTmpValue(taskName, TmpType.TalkNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		-- Èç¹ûÈ«²¿Ìõ¼ş·ûºÏ£¬Ôò·µ»Ø 1
		if nCheck==nRightCheck then
			CDebug:MessageOut(taskName.." Môc tiªu tÊt c¶ nhiÖm vô ®· ®¹t ®­îc!");
			return 1;
		else
			return nil;
		end;
	
end;


-- ÈÎÎñ¶Ô»°µÄÈë¿Ú
function OnTaskSay(taskName, nState)

	if nState==0 or nState>=2 then
		OnTaskSay_Call(taskName, nState);
		return
	end;
	
	if CreateTalkTask()~=1 then
		OnTaskSay_Call(taskName, nState);
	end;
	
end;


-- ÈÎÎñ¶Ô»°Ê±µÄ»Øµ÷º¯Êı
function OnTaskSay_Call(taskName, nState)
	local entityRow, entityCol = TaskEntityMatrix(taskName);
	local nRow, nCol = TaskTalkMatrix(taskName);
	local strInfo = ""; -- ÈÎÎñËµÃ÷×Ö¶Î
	
	local nIsGoods = 0; -- ÊÇ·ñÓĞÒªÌá½»ÎïÆ·
	local i=0;
	
	local aryTaskSay = {};
	local strTalk = "";
	
		-- ÅĞ¶ÏÈÎÎñÊÇ·ñÓĞĞèÒªÌá½»µÄÎïÆ·
		for i=1, entityRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				nIsGoods = 1;
			end;
			
		end;
	
		-- ÈÎÎñ¿ªÊ¼Ê±µÄ¶Ô»°´¦Àí
		if nState==0 then
		
			CDebug:MessageOut(taskName.." §èi tho¹i khi nhiÖm vô b¾t ®Çu");
			
			strInfo = TaskTalk(taskName, 1, 6);
			strTalk = TaskTalk(taskName, 1, 1);
			
			-- Èç¹ûÈÎÎñ¿ªÊ¼¶Ô»°Ã»ÓĞµÄ»°Ö±½Ó¿ªÊ¼
			if strTalk=="" then
				CreateTaskSay({TaskTalk(taskName, 1, 2),
							  "§ãng/OnTaskExit"}
					          );
				SelectTaskStart(TaskNo(taskName));
				return
			end;
			
			if strInfo=="" then
				CreateTaskSay({strTalk,
							  "TiÕp nhËn nhiÖm vô /#SelectTaskStart("..TaskNo(taskName)..")",
							  "Kh«ng tiÕp nhËn/#OnTaskExit("..TaskNo(taskName)..")"}
							  );
			else
				CreateTaskSay({strTalk,
								"TiÕp nhËn nhiÖm vô /#SelectTaskStart("..TaskNo(taskName)..")",
								"Xem thuyÕt minh nhiÖm vô /#ShowTaskInfo("..TaskNo(taskName)..")",
								"Kh«ng tiÕp nhËn/#OnTaskExit("..TaskNo(taskName)..")"}
								);
			end;
			return
		end;
	
		-- ÈÎÎñ½áÊøÌá½»Ê±µÄ¶Ô»°´¦Àí
		if nState==1 then
			
			CDebug:MessageOut(taskName.." §èi tho¹i khi tiÕn hµnh nhiÖm vô ");
			
			if nIsGoods==0 then
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					
					aryTaskSay = {strTalk,
								   "Hoµn thµnh nhiÖm vô /#SelectTaskFinish("..TaskNo(taskName)..")",
								   "VÉn ch­a hoµn thµnh/OnTaskExit"};
								   
					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "Hñy bá nhiÖm vô/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;
					
					CreateTaskSay(aryTaskSay);
					
				else
					SelectTaskFinish(TaskNo(taskName));
				end;
				return
			else
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					CDebug:MessageOut(taskName.." CÇn ph¶i giao vËt phÈm ®Ó hoµn thµnh nhiÖm vô! NhÊp vµo giao diÖn 'giao n¹p'");
					-- ½«ÈÎÎñºÅ´¢´æÔÚÁÙÊ±±äÁ¿ÖĞ
					SetTaskTemp(TASK_TEMP_ID, TaskNo(taskName));
					
					aryTaskSay = {strTalk,
								  "Hoµn thµnh nhiÖm vô /OnShowGiveUI",
								  "VÉn ch­a hoµn thµnh/OnTaskExit"};

					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "Hñy bá nhiÖm vô/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;			
					
					CreateTaskSay(aryTaskSay);

				end;
				return
			end;
			
		end;
		
		-- ÈÎÎñ·¢½±Ê±µÄ¶Ô»°´¦Àí
		if nState==2 then
			CDebug:MessageOut(taskName.." §èi tho¹i khi nhËn phÇn th­ëng trong nhiÖm vô ");
			strTalk = TaskTalk(taskName, 1, 4);
			if strTalk ~="" then
				CreateTaskSay({strTalk,
							   "NhËn l·nh phÇn th­ëng/#SelectTaskAward("..TaskNo(taskName)..")",
							   "T¹m thêi ch­a lÊy/OnTaskWait"}
							  );			
			else
				SelectTaskAward(TaskNo(taskName));
			end;
		end;
		
		-- ÈÎÎñÒÑ¾­Íê³É£¬Ôò²»ÓÃÔÙÓë NPC ÓĞÆäËü¶Ô»°
		if nState==3 then
			NpcDialog();
			return
		end;
end;


function OnShowGiveUI()
	GiveItemUI("Giao vËt phÈm","H·y ®Ó nh÷ng vËt phÈm cÇn thiÕt vµo","OnCheckGoods","OnTaskWait");
end;


function OnCheckGoods(nCount)

	-- »ñÈ¡ÁÙÊ±±äÁ¿ÀïÈÎÎñµÄÃû³Æ
	local taskName = TaskName(GetTaskTemp(TASK_TEMP_ID));
	
	-- »ñÈ¡ÈÎÎñµÄĞĞÊıºÍÁĞÊı
	local nRow, nCol = TaskEntityMatrix(taskName);
	
	-- ÈÎÎñĞĞÊıËù¶ÔÓ¦µÄÄÚÈİÀàĞÍ
	local strType = "";
	
	-- ÈÎÎñËùĞèÒªÎïÆ·µÄ MAP
	local aryNeed = {};
	
	-- ËùĞèÒªÉ¾³ıÎïÆ·µÄÊı×é
	local aryDelItem = {};
	
	-- ÈÎÎñËùĞèÒªµÄÎïÆ·×ÜÊı
	local nNeed = GetTaskCollectNum(taskName);
	
	-- ÈÎÎñËùÒªµÄÎïÆ·±àºÅ
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
	-- Íæ¼Ò´«½øÀ´µÄÎïÆ·±àºÅ
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- ÕæÊµµÄÎïÆ·ÊıÁ¿
	local nRealCount, nCheckCount = 0, 0;
	
	-- Èç¹ûÎïÆ·ĞèÒª¼ÇÂ¼Ëæ»úÖÖ×Ó£¬Ôò¼ÇÂ¼ĞòºÅ
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- Èç¹ûÎïÆ·ÊıÁ¿ÓëÒªÕÒµÄÊıÁ¿²»·û£¬Ö±½Ó·µ»Ø
	if nRealCount ~= nNeed then
		CDebug:MessageOut(taskName.."Sè vËt phÈm cÇn:"..nNeed.." ®Æt vµo"..nRealCount.." ®Æt vµo kh«ng phï hîp!");
		SelectTaskFinish(TaskNo(taskName));
		Say("Sè l­îng vËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
		return
	end;
	
	-- ¹¹ÔìÈÎÎñËùĞèÒªÎïÆ·µÄ MAP
	for i=1, nRow do
		
		w_Genre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
		w_Detail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
		w_Particular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
		w_Level      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
		w_GoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
		w_GoodsNum   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		w_DelGoods   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
		
		w_Quality    = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
		
		nRandomSeedRecord = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_RecordSeed_Row));
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			tmpNeedKey = tostring(w_Quality)..","..
						 tostring(w_Genre)..","..
						 tostring(w_Detail)..","..
						 tostring(w_Particular);
			
			-- Èç¹ûÃ»ÓĞÕâ¸ö MAP KEY Ôò³õÊ¼»¯
			if aryNeed[tmpNeedKey] then
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			else
				aryNeed[tmpNeedKey]={};
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			end;

			-- CDebug:MessageOut("¹¹³ÉµÄÈÎÎñÎïÆ·Êı×é£º["..tmpNeedKey.."]£º"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
		end;
		
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
			
				-- Èç¹ûÈÎÎñÎïÆ·²»ĞèÒªÅĞ¶ÏÎåĞĞ»òÕßµÈ¼¶µÄ
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				-- Èç¹ûÏà¶ÔÓ¦µÄ KEY µÄÎåĞĞºÍµÈ¼¶¶¼·ûºÏµÄ»°
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- Èç¹û·ûºÏÌõ¼şµÄÎïÆ·ĞèÒª¼ÇÂ¼Ëæ»úÖÖ×Ó£¬Ôò¼ÇÂ¼
					-- ¼ÇÂ¼µÄ¸ñÊ½Îª£º[ÈÎÎñÃû][Ëæ»úÖÖ×ÓĞòºÅ][Ëæ×ÓÖÖ×ÓÊı]
					if aryNeed[tmpGetKey][j][5]~=-1 then
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTmpValue(taskName, 
									TmpType.ItemSeed..aryNeed[tmpGetKey][j][5], 
									nRandomSeed);
						CDebug:MessageOut(taskName.." vËt phÈm"..tmpGetKey.." Sè ngÉu nhiªn cÇn ghi l¹i:"..nRandomSeed);
					end;
					
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- Çå¿Õ·ûºÏÌõ¼şµÄÊı×é
			aryDelItem = {};
			
			Say("VËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
			return
		end;
		
	end;
	
	-- ¼ì²éÊÇ²»ÊÇËùÓĞµÄÎïÆ·¶¼ÕıÈ·
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("VËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
				return
			end;
		end;
	end;
		
	-- ¼ÇÂ¼Ò»¹²ÓĞ¶àÉÙ¸öÎïÆ·ĞèÒªÉ¾³ı
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("LiÖt kª nh÷ng vËt phÈm cÇn lo¹i bá:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("CÇn ph¶i lo¹i bá:"..aryDelItem[i]);
	end;

	SetTmpValue(taskName, TmpType.Collect, 1);
	SelectTaskFinish(TaskNo(taskName));
	
	return

end;


-- ¼ì²â´ËÈËÎïÊÇ·ñÎªÏàÓ¦ÈÎÎñµÄ¶Ô»°Õß
function OnTaskNpcTalk(npcName, npcMap, taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local i=0;
	
	CDebug:MessageOut("Ph¸n ®o¸n"..npcMap.." trong b¶n ®å"..npcName.." cã ph¶i do"..taskName.." ®èi tho¹i víi nh©n vËt trong nhiÖm vô ");
	
		for i=1, nRow do
		
			strTalkNpcName = TaskEntity(taskName, i, Entity.TalkNpcName_Row);
			strTalkNpcMap = TaskEntity(taskName, i, Entity.TalkNpcMap_Row);
			
			CDebug:MessageOut(taskName.." Nh©n vËt yªu cÇu:"..strTalkNpcName.." B¶n ®å khu vùc yªu cÇu:"..strTalkNpcMap);
			
			if strTalkNpcName==npcName and strTalkNpcMap==npcMap then
				return 1;
			end;
			
		end;
		
		return nil;
	
end;

-- ÈÎÎñ½áÊøÊ±µÄ´¦Àí
function OnTaskFinish(taskName)
	local nEvent = GetTaskEventID(taskName); -- ÅĞ¶ÏÊÇÄÄÒ»¸öÊÂ¼şµÄ¿ªÊ¼

	-- »ñÈ¡É±¹ÖµôÂäÎïÆ·µÄÉ±¹ÖÊÂ¼ş
	local nKillEventID = tonumber(GetTmpValue(taskName, TmpType.ItemNpc));

	-- Èç¹ûËæ»úÈÎÎñµÄ¿ªÊ¼
	if (nEvent==3) then
		tongaward_randomevent();--byÖ¾É½£¬°ï»áÖÜÄ¿±ê
	end;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- ÊÇ·ñÉ¾³ıÎïÆ·ÕıÈ·
	local i=0;
		
		CDebug:MessageOut(taskName.."Lo¹i bá vËt phÈm khi kÕt thóc nhiÖm vô, gåm:"..nItem.."c¸i");
		
		-- Èç¹ûÒ»¸öÎïÆ·Ò²²»ĞèÒªÉ¾³ı£¬ÔòÖ±½Ó·µ»Ø
		if nItem==0 then return end;
	
		-- É¾³ıÈÎÎñËùĞèÒªµÄÎïÆ·
		for i=1, nItem do
			nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
			
			-- Òì³£´¦Àí£¬Èç¹ûÓĞÉ¾³ı²»³É¹¦£¬ÔòÖ±½Ó½«ÈÎÎñ±ä³É»¹Ã»Íê³É
			if nResult~=1 then
				SetTaskStatus(taskName, 1);
				return
			end;
			
		end;
		
		-- ½«ËùĞèÎïÆ·¸öÊıµÄÁÙÊ±±äÁ¿¸øÇåÁË
		SetTaskTemp(TASK_CHECKITEM_NUM, 0);
		
		-- Èç¹ûÓĞÉ±¹Ö¼ÆÊıÆ÷Ôò½«ÆäÉ¾³ı
		if nKillEventID~=0 then
			RemovePlayerEvent(nKillEventID);
		end;
		
		return
	
end;


-- ÈÎÎñ·¢½±´¦Àí
function OnAward(taskName)
	
	-- Èç¹û´ËÈÎÎñ±¾À´¾ÍÒÑ¾­Áì¹ı½±µÄ»°ÔòÖ±½ÓÌø³ö´Ë¹ı³Ì£¬·ÀÖ¹Ë¢½±Àø
	if GetTaskStatus(taskName)==3 then
		return
	end;

	local nResult = PayAwardMain(taskName);
		return nResult;

end;


-- Ê²Ã´¶¼²»×öµÄ¿Õº¯Êı
function OnTaskWait()
	return
end;


-- Ñ¡ÔñÍË³öºóµÄ´¦Àí
function OnTaskExit(taskID)
	
local nTaskID_Now = GetTask(ID_RANDOMTASK);

local nEvent = 0; -- ÅĞ¶ÏÊÇÄÄÒ»¸öÊÂ¼şµÄÈ¡Ïû¹ı³Ì
	
	-- Èç¹û´«½øÀ´µÄ taskID ÊÇ¿ÕÖµ£¬Ôò±íÊ¾ÊÇ²»ĞèÒªÌØÊâ´¦ÀíµÄÈÎÎñµ÷ÓÃ
	if taskID==nil or taskID==0 then return end;
	
	nEvent = GetTaskEventID(TaskName(taskID));
	
	-- Èç¹ûÊÇËæ»úÈÎÎñµÄµ÷ÓÃ
	if nEvent==3 then
		
		setRandomTaskState(2);
	
		-- Çå¿ÕÄ¿Ç°ÕıÔÚ½øĞĞµÄËæ»úÈÎÎñ
		SetTaskStatus(TaskName(nTaskID_Now), 0);
		CloseTask( TaskName(nTaskID_Now) );
		
		--[DinhHQ]
		--20110401: Fix bug lÖnh bµi bang héi
		local nItemIdx = GetTask(ID_RANDOMTASKTEMP)
		if nItemIdx ~= 0 then
			local nG, nD, nP = GetItemProp(nItemIdx)
			if ((nG == 6 and nD == 2 and nP == 1020) or (nG == 6 and nD == 1 and nP == 30106) or (nG == 6 and nD == 1 and nP == 30107) or (nG == 6 and nD == 1 and nP == 30108)) and (GetTask(2589) >= 0) then				
				SetTask(2589, GetTask(2589) - 1);
			end	
		end
		
		Msg2Player("<color=yellow>§· lùa chän kh«ng tiÕp nhËn nhiÖm vô.<color>");
		return
	end;
	
	-- Èç¹ûÊÇ¾íÖáÈÎÎñµÄµ÷ÓÃ
	if nEvent==4 then
		return
	end;

end;
