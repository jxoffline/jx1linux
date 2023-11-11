-- Ò°ÛÅÈÎÎñÁ´½Å±¾Í·ÎÄ¼ş
-- Edited by peres
-- 2004/12/25 Ê¥µ®½ÚÔçÉÏ

Include("\\script\\global\\fuyuan.lua"); -- ÓÃÓÚÈ¡µÃ¸£ÔµµÄÎÄ¼ş
Include("\\script\\task\\newtask\\newtask_head.lua"); -- ĞÂÈÎÎñÏµÍ³µÄÍ·ÎÄ¼ş£¬ÓÃÓÚÍ¬²½±äÁ¿

Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı

IncludeLib("FILESYS");
IncludeLib("BATTLE");

TL_MAXTIMES = 20 -- Ã¿¸öÁ´ÓĞ 20 ¸öÈÎÎñ
TL_MAXLINKS = 20 -- Ã¿¸ö»·ÓĞ 20 ¸öÁ´
TL_MAXLOOPS = 20 -- Íæ¼Ò×Ü¹²¿ÉÒÔ×ö 20 »·µÄÈÎÎñ
-- TL_MAXLINKSCOUNT = 4 -- Ã¿¸öÁ´×î¶àÖ»ÄÜ×ö 4 ´Î

TL_UPLEVELEXP = "TaskLink_UpLevel"


DEBUG_TASKVALUE = 1046;  -- ÓÃÓÚ×·²éË¢È¡Ïû»ú»á BUG µÄ±äÁ¿

ID_TASKLINK_LIMITDATE 				= 2419;  -- ¼ÇÂ¼Ã¿ÌìÏŞÖÆµÄÈÕÆÚ
ID_TASKLINK_LIMITNUM  				= 2420;  -- ¼ÇÂ¼Ã¿ÌìÏŞÖÆµÄ´ÎÊı
ID_TASKLINK_LIMITCancelCount 	= 2797;  -- ¼ÇÂ¼Ã¿ÌìÈ¡ÏûµÄ´ÎÊı
TSK_TASKLINK_SEANSONPOINT = 1825	--¼ÇÂ¼¾­Ñé×ª»¯µÄÒ°ÛÅ»ı·ÖÖµ
TKS_TASKLINK_SPITEM	= 2690		-- ¼ÇÂ¼ÁìÈ¡Ò°ÛÅµÄÉñÃØ±¦ÏäÊ±ÈÎÎñ´ÎÊı

-- ¶ÁÈ¡ÎÄ¼şÊ±µÄ×Ö·û´®¶¨Òå
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"
TL_LEVELLINK = "TaskLink_Level"

TL_MAINTASKLEVEL = "TaskLink_MainLevel"
TL_AWARDBASIC = "Award_Basic"
TL_AWARDLINK = "Award_Link"
TL_AWARDLOOP = "Award_Loop"

TL_TASKGOODSTALK = "TaskLink_GoodsTalk"
TL_TASKBUYTALK = "TaskLink_BuyTalk"
TL_TASKSHOWTALK = "TaskLink_ShowTalk"
TL_TASKFINDMAPS = "TaskLink_FindTalk"
TL_TASKUPGROUNDTALK = "TaskLink_UpGroundTalk"
TL_TASKWORLDTALK = "TaskLink_WorldTalk"

-- ÈÎÎñÁ´ TABLE FILE µÄÔ¤ÔØÈë
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- Ã¿¸öµÈ¼¶Ïà¶ÔÓ¦µÄ³õÊ¼µÈ¼¶
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- Ã¿¸öÈÎÎñÀàĞÍÔÚÏàÓ¦µÄµÈ¼¶ÀïÃæ³öÏÖµÄ¼¸ÂÊ
-- TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- Éı¼¶ËùĞèµÄ¾­Ñé±í

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)

TabFile_Load("\\settings\\task\\talk\\talk_findgoods.txt",TL_TASKGOODSTALK)
TabFile_Load("\\settings\\task\\talk\\talk_buygoods.txt",TL_TASKBUYTALK)
TabFile_Load("\\settings\\task\\talk\\talk_showgoods.txt",TL_TASKSHOWTALK)
TabFile_Load("\\settings\\task\\talk\\talk_findmaps.txt",TL_TASKFINDMAPS)
TabFile_Load("\\settings\\task\\talk\\talk_upground.txt",TL_TASKUPGROUNDTALK)
TabFile_Load("\\settings\\task\\talk\\talk_worldmap.txt",TL_TASKWORLDTALK)


-- È·¶¨Íæ¼Òµ±Ç°µÄÈÎÎñ×´Ì¬Ó¦¸ÃÊÇÊôÓÚµÚ¼¸»·
function tl_getfirstloop()
	-- ÓÉÓÚÔİÊ±Ã»ÓĞ»·µÄ²î±ğ£¬ËùÒÔÖ»ÄÜÎª 0 
	return 0
end


-- ×îÖÕµÄÊä³öº¯Êı£¬¸øÓèÍæ¼ÒÈÎÎñ²¢ÇÒÖÃÓÚÈÎÎñ±äÁ¿ÖĞ
function tl_dealtask()

-- Ê×ÏÈÈ·¶¨Íæ¼ÒµÄÈÎÎñµÈ¼¶
local myTaskLevel = tl_gettaskstate(2)

-- È»ºóËæ»úËã³ö¸ÃµÈ¼¶Ó¦¸Ã½øĞĞÊ²Ã´ÀàĞÍµÄÈÎÎñ
local myTaskType = tl_gettasktype(myTaskLevel)

tl_setplayertasktype(myTaskType)

-- ×îºóÔÙ¶ÁÏàÓ¦µÄ±íÈ·¶¨¾ßÌåµÄÈÎÎñÔÚ±í¸ñÖĞµÄĞĞºÅ 
local myTaskID = tl_gettasklink(myTaskType,myTaskLevel)

tl_savetasktablecol(myTaskID)

-- Èç¹ûÊÇÊÕ¼¯µØÍ¼ÈÎÎñµÄ»°Ôò¼ÇÂ¼µØÍ¼µÄ±àºÅºÍÒªÊÕ¼¯µÄ¾íÖáÀàĞÍ
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- µÚ5ÀàÈÎÎñµÄÅĞ¶ÏÌõ¼ş
local myTaskValueType

-- ¼ÇÂ¼ÈÎÎñ±äÁ¿
-- ¼ÇÂ¼Íæ¼ÒµÄÈÎÎñÀàĞÍ
tl_setplayertasktype(myTaskType)

-- ¼ÇÂ¼Íæ¼ÒµÄÈÎÎñ¾ßÌå±í¸ñĞĞÊı
tl_savetasktablecol(myTaskID)

-- ¶ÔÓ¦²»Í¬µÄÈÎÎñ×÷²»Í¬µÄ±äÁ¿´æ´¢´¦Àí

	if ( myTaskType == 1 ) then
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkBuy[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkBuy[3]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkBuy[6]) + 1 ))
		
	elseif ( myTaskType == 2 ) then
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkGoods[1]) + 1 ))
		tl_savetalkvalue(2,random( 2,getn(Task_TalkGoods[2]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkGoods[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkGoods[4]) + 1 ))
		tl_savetalkvalue(5,random( 2,getn(Task_TalkGoods[5]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkGoods[6]) + 1 ))
			
	elseif ( myTaskType == 3 ) then
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkShow[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkShow[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkShow[6]) + 1 ))

		
	elseif ( myTaskType == 4 ) then
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkFind[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkFind[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkFind[6]) + 1 ))

		nt_setTask(1031,myTaskMapID)
		nt_setTask(1032,SetByte(nt_getTask(1032),1,myMapType))
		nt_setTask(1032,SetByte(nt_getTask(1032),2,myMapNum))
		nt_setTask(1025,0) -- Çå¿ÕÔ­À´µÄµØÍ¼Ö¾ÊıÁ¿
	elseif ( myTaskType == 5 ) then -- Èç¹ûÊÇÊôÓÚÊıÖµÉı¼¶µÄÈÎÎñµÄ»°£¬ÔòÅĞ¶ÏÊÇÄÄÖÖÊıÖµ
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkUp[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkUp[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkUp[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkUp[6]) + 1 ))	
		
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then -- Èç¹ûÊÇÕÇ¾­ÑéÖµ
			local nCurExp = GetExp()
			nt_setTask(1033,GetLevel())
			nt_setTask(2574, floor(nCurExp/1e5))
			nt_setTask(1034, mod(nCurExp,1e5))
		elseif (myTaskValueType == 3) then -- Èç¹ûÊÇÕÇÉùÍû
			nt_setTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then -- Èç¹ûÊÇÕÇ¸£Ôµ
			nt_setTask(1026,nt_getTask(151))
		elseif (myTaskValueType == 5) then -- Èç¹ûÊÇÕÇ PK Öµ
			nt_setTask(1026,GetPK())
		elseif (myTaskValueType == 6) then -- Èç¹ûÊÇÕÇËÎ¾©»ı·Ö
			nt_setTask(1026,nt_getTask(747))
		end
		
	elseif ( myTaskType == 6 ) then
		-- ±£´æÈÎÎñ¶Ô»°ÔªËØµÄËæ»úÖµ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkWorld[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkWorld[3]) + 1 ))
	end
	
	tl_settaskcourse(1) -- ÉèÖÃÈÎÎñ½øÕ¹½ø¶ÈÎª 1 

end


-- ÈÎÎñµÄÑ­»·µ½ÏÂÒ»ÂÖ
function tl_taskprocess()

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4)
local myTaskLinksCount = tl_gettaskstate(6) -- ¼ì²âÍæ¼ÒÔÚµ±Ç°µÄÁ´ÖĞÒÑ¾­½øĞĞÁË¼¸´Î

	myTaskTimes = myTaskTimes + 1
	
	if (myTaskLoops >= TL_MAXLOOPS) then
		myTaskLoops = 0;
	end;
	
	if (myTaskTimes >= TL_MAXTIMES) then
	
		myTaskTimes = 0
		myTaskLinksCount = myTaskLinksCount + 1
		
		-- ÏÈÔÚÕâÀï±£´æÒ»´ÎÈÎÎñ×´Ì¬
		tl_settaskstate(1,myTaskTimes)
		tl_settaskstate(2,myTaskLinks)
		tl_settaskstate(6,myTaskLinksCount)
		
		if (tl_counttasklinknum(2) >= TL_MAXLINKS) then -- ÈÎÎñÒÑ¾­½øĞĞµ½»·×´
		
			myTaskTimes = 0
			myTaskLinks = tl_getfirstlink()
--			tl_print("µÃµ½ÁË³õÊ¼ÈÎÎñÁ´£º"..myTaskLinks);
			myTaskLinksCount = 0
			myTaskLoops = myTaskLoops + 1
			
			if (myTaskLoops >= TL_MAXLOOPS) then
				myTaskLoops = 0
			end
			
			tl_settaskstate(1,myTaskTimes)
			tl_settaskstate(2,myTaskLinks)
			tl_settaskstate(6,myTaskLinksCount)
		
		end
		
		if (myTaskLinksCount == tl_gettasklinknum(myTaskLinks)) then -- Èç¹ûÕâ¸öÁ´ÒÑ¾­Íê³ÉÁË¸ÃÍê³ÉµÄÁ´Êı
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end

tl_settaskstate(1,myTaskTimes)
tl_settaskstate(2,myTaskLinks)
tl_settaskstate(3,myTaskLoops)
tl_settaskstate(6,myTaskLinksCount)

-- ÔÚÕâÀï¼ÇÂ¼Ò»ÏÂÈÎÎñµÄ×ÜÊı
nt_setTask(1044, tl_counttasklinknum(1));

end



-- ¼ì²âº¯Êı£¬ÓÃÒÔÈ·ÈÏÍæ¼ÒÊÇ·ñÒÑ¾­Íê³ÉÁËÈÎÎñ
-- ·µ»ØÖµ
-- 1£ºÒÑ¾­´ï³ÉÌõ¼ş
-- 0£º»¹Î´ÄÜÍê³É
-- ´«Èë²ÎÊı nTaskGoods ÓĞ¶à¸ö±í´ï·½Ê½
-- Èç¹ûÊÇÈÎÎñ 1 µÄ»°£ºÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶
-- Èç¹ûÊÇÈÎÎñ 2 µÄ»°£ºÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶¡¢Ä§·¨ÊôĞÔID¡¢Ä§·¨ÊôĞÔÏÂÏŞ¡¢Ä§·¨ÊôĞÔÉÏÏŞ
-- Èç¹ûÊÇÈÎÎñ 3 µÄ»°£ºÄ§·¨ÊôĞÔID¡¢Ä§·¨ÊôĞÔÏÂÏŞ¡¢Ä§·¨ÊôĞÔÉÏÏŞ
function tl_checktask(nTaskGoods)

local i,j

-- ÈÎÎñËùĞèÇóµÄÎïÆ·
local myTaskGoods

-- ÈÎÎñËùĞèÇóÎïÆ·µÄÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶
local myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMax,myMagicMin

-- ÈÎÎñËùĞèÇóÎïÆ·µÄÖÖÀà£¬²»´øÄ§·¨ÊôĞÔºÍ´øÄ§·¨ÊôĞÔ
local myGoodsClean,myGoodsMagic

-- ÈÎÎñËùÒªÇóµÄµØÍ¼Ö¾ ID, µØÍ¼Ö¾µÄÊıÁ¿ºÍµØÍ¼Ö¾µÄÀàĞÍ
local myTaskMaps,myTaskMapNum,myTaskMapType

-- ÈÎÎñËùÒªÇóÉı¼¶µÄÊıÖµºÍÊıÖµÀàĞÍ
local myTaskValue,myTaskValueType,myOrgValue

-- ÈÎÎñËùÒªÇóµÄÉ½ºÓÉçğ¢Í¼ÊıÁ¿
local myWorldMaps,nWorldMaps

-- »ñÈ¡Íæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñÀàĞÍ
local myTaskType = tl_getplayertasktype()
local myTaskID = tl_gettasktablecol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		--tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		
		myGoodsFive = TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive")
		
		if (myGoodsFive == "n") then
			myGoodsFive = 0
			nTaskGoods[5] = 0
		else
			myGoodsFive = tonumber(myGoodsFive)
		end
		
		myLevel = TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level")
		
		if (myLevel == "n") then
			myLevel = 0
			nTaskGoods[4] = 0
		else
			myLevel = tonumber(myLevel)
		end
		
		myMagicID = TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName")
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myLevel,myGoodsFive,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- Èç¹û²»ÓÃÅĞ¶ÏÄ§·¨ÊôĞÔÔòÈ¡´ËÖµ
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			--tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			myMagicID = tonumber(myMagicID)
			--tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."Ä§·¨ÊôĞÔ£º"..myMagicID.." ×îĞ¡Öµ£º"..myMagicMin.." ×î´óÖµ£º"..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myMagicID) and (tonumber(nTaskGoods[7]) >= myMagicMin) and (tonumber(nTaskGoods[7]) <= myMagicMax) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		--tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) and ( nTaskGoods[2] <= myMagicMax )then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = nt_getTask(1025)

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			nt_setTask(1025,myTaskMapNum) -- ÖØĞÂÖÃ 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))
		local n_transcount = ST_GetTransLifeCount();
		if (myTaskValueType == 2) then
			local n_level = nt_getTask(1033);
			local n_exp = nt_getTask(2574) * 1e5 + nt_getTask(1034);
			if (tl_countuplevelexp(n_level, n_exp, n_transcount) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- ÉùÍûÖµ
			myOrgValue = GetRepute()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- ¸£ÔµÖµ
			myOrgValue = nt_getTask(151)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK Öµ
			myOrgValue = GetPK()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 6) then -- ËÎ½ğ»ı·Ö
			myOrgValue = nt_getTask(747)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end			
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (nt_getTask(1027) >= myWorldMaps) then
			nWorldMaps = nt_getTask(1027) - myWorldMaps -- ÔÚÕâÀïÉ¾ÁËĞèÒªµÄÉ½ºÓÉçğ¢Í¼²ĞÆ¬
			nt_setTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end


-- ×Óº¯Êı£¬ÓÃÒÔÈ·¶¨µ±Ç°Íæ¼ÒËù½Óµ½µÄÈÎÎñ¾ßÌåÊÇÄÄÒ»ÖÖÀàĞÍµÄÈÎÎñ
-- ·µ»ØÖµÎª 1~6£¬Èç¹ûÎª 0 ÔòÍæ¼Ò»¹Ã»ÓĞ´¥·¢ÈÎÎñÁ´
function tl_getplayertasktype()

local myTaskType

--	myTaskType = strsub(format("%d",nt_getTask(1021),1,1))
myTaskType = nt_getTask(1021)

return myTaskType

end


-- ×Óº¯Êı£¬ÓÃÒÔÉè¶¨µ±Ç°Íæ¼ÒËù½Óµ½µÄÈÎÎñ¾ßÌåÊÇÄÄÒ»ÖÖÀàĞÍµÄÈÎÎñ
function tl_setplayertasktype(myTaskType)
	nt_setTask(1021,myTaskType)
end


-- ×Óº¯Êı£¬ÓÃÒÔ¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñËù¾ßÌå¶ÔÓ¦µÄ±í¸ñĞĞÊı
function tl_savetasktablecol(myTaskCol)
	nt_setTask(1030,myTaskCol)
end


-- ×Óº¯Êı£¬ÓÃÒÔ¶ÁÈ¡Íæ¼Òµ±Ç°ÈÎÎñËù¶ÔÓ¦µÄ¾ßÌå±í¸ñĞĞÊı
function tl_gettasktablecol()
	return nt_getTask(1030)
end


-- ×Óº¯Êı£¬¼ì²âÈÎÎñµÄ×´Ì¬
-- 1£ºµ±Ç°½øĞĞµÄ´ÎÊı
-- 2£ºµ±Ç°½øĞĞµÄÁ´Êı
-- 3£ºµ±Ç°½øĞĞµÄ»·Êı
-- 4£ºÊ£ÓàÈ¡ÏûµÄ´ÎÊı
-- 5£ºÍæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñºÅ´¢´æÔÚ 1021 ÉÏ
-- 6£ºÍæ¼ÒÔÚÃ¿Ò»»·µÄ¸ÃÁ´ÖĞÒÑ¾­×öÁË¼¸´Î£¬×î´óÎª 4
function tl_gettaskstate(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(nt_getTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = nt_getTask()
elseif ( myTaskState == 6) then
	n = nt_getTask(1035)
end

return n

end


-- ×Óº¯Êı£¬ÉèÖÃÈÎÎñµÄ×´Ì¬
-- 1£ºµ±Ç°½øĞĞµÄ´ÎÊı
-- 2£ºµ±Ç°½øĞĞµÄÁ´Êı
-- 3£ºµ±Ç°½øĞĞµÄ»·Êı
-- 5£ºÍæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñºÅ´¢´æÔÚ 1021 ÉÏ
-- 6£ºÍæ¼ÒÔÚÃ¿Ò»»·µÄ¸ÃÁ´ÖĞÒÑ¾­×öÁË¼¸´Î
function tl_settaskstate(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 3) then
		n = nt_getTask(1020)
		nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 4) then
		n = nt_getTask(1020)
		if myTaskValue<=254 then
			nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
		else
			Msg2Player("Sè lÇn b¹n xãa bá ®· ®¹t ®Õn giíi h¹n <color=yellow>254 lÇn<color>, kh«ng thÓ t¨ng thªm!");
			return
		end;
	elseif ( myTaskState == 6) then
		nt_setTask(1035,myTaskValue)
	end
	
end


-- ×Óº¯Êı£¬ÉèÖÃµ±Ç°ÈÎÎñµÄ½ø³Ì×´Ì¬£¬1¡¢2¡¢3
function tl_settaskcourse(myTaskCourse)
	nt_setTask(1028,myTaskCourse)
end


-- ×Óº¯Êı£¬»ñÈ¡µ±Ç°ÈÎÎñµÄ½ø³Ì×´Ì¬£¬1¡¢2¡¢3
function tl_gettaskcourse()
	return nt_getTask(1028)
end


-- ×Óº¯Êı£¬¼ÇÂ¼¶Ô»°ÔªËØµÄÊıÖµ
function tl_savetalkvalue(myValueType,myTalkValue)

	if (myValueType==1) then
		nt_setTask(1038,myTalkValue)
	elseif (myValueType==2) then
		nt_setTask(1039,myTalkValue)
	elseif (myValueType==3) then
		nt_setTask(1040,myTalkValue)
	elseif (myValueType==4) then
		nt_setTask(1041,myTalkValue)
	elseif (myValueType==5) then
		nt_setTask(1042,myTalkValue)
	elseif (myValueType==6) then
		nt_setTask(1043,myTalkValue)
	end
	
end


-- ×Óº¯Êı£¬»ñÈ¡¶Ô»°ÔªËØµÄÊıÖµ
function tl_gettalkvalue(myValueType)

local myTalkValue

	if (myValueType==1) then
		myTalkValue = nt_getTask(1038)
	elseif (myValueType==2) then
		myTalkValue = nt_getTask(1039)
	elseif (myValueType==3) then
		myTalkValue = nt_getTask(1040)
	elseif (myValueType==4) then
		myTalkValue = nt_getTask(1041)
	elseif (myValueType==5) then
		myTalkValue = nt_getTask(1042)
	elseif (myValueType==6) then
		myTalkValue = nt_getTask(1043)
	end
	
return myTalkValue
	
end


--  //////////////////////////////////////////////////////////////
-- //                  ¶Á±íÓëÈÎÎñµÄÊıÖµ´¦Àí                    //
--//////////////////////////////////////////////////////////////

-- ËÑÑ°µÈ¼¶Ïà¶ÔÓ¦ÈÎÎñ±í£¬È·¶¨Íæ¼Òµ±Ç°µÄÈÎÎñÁ´µÚÒ»µÈ¼¶ÊÇÊôÓÚÄÄÒ»¼¶
function tl_getfirstlink()

	local i
	local myLevel = GetLevel()
	local myTaskLevel,myBelongLevel
	
	for i=1,getn(Task_MainTaskLink) do
		myTaskLevel = Task_MainTaskLink[i][1]
		if (myLevel>=myTaskLevel) then
			myBelongLevel = Task_MainTaskLink[i][2]
		end
	end
	
	return myBelongLevel

end


-- ËÑÑ°ÈÎÎñÁ´×Ü±í£¬»ñÈ¡ÏàÓ¦µÈ¼¶µÄËæ»úÀàĞÍÈÎÎñ
-- ´«Èë²ÎÊı myTaskLevel ÎªÈÎÎñÁ´µÄµÈ¼¶ 1~20
-- ·µ»ØÖµÎª 1~6 1£ºÎïÆ·¹ºÂò 2£ºÎïÆ·Ñ°ÕÒ 3£ºÎïÆ·Õ¹Ê¾ 4£ºµØÍ¼ÊÕ¼¯ 5£ºÊıÖµÉı¼¶ 6£ºÉ½ºÓÉçğ¢
function tl_gettasktype(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- ËùÓĞÈÎÎñÀàĞÍÔÚÒ»¸öµÈ¼¶ÀïµÄ×Ü±ÈÂÊ
	local myTaskType -- ·µ»ØµÄÈÎÎñÀàĞÍ
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	-- ¸ù¾İÈ¨ÖØ¹«Ê½×îºóËæ»ú¼ÆËã³öÈÎÎñÀàĞÍ
	j = random(1,myMainRate)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j <= k) then
			return i
		end
	end
	
	-- Òì³£´¦Àí£¬Èç¹ûÍæ¼Ò¶¼Ñ¡²»µ½ÈÎÎñÀàĞÍµÄ»°¾ÍÑ¡ 4
	
	--tl_print("½Å±¾ÔÚÑ¡ÔñÈÎÎñÀàĞÍµÄÊ±ºò³ö´í£¡");
	
	return 0

end


-- ËÑÑ°ÈÎÎñÁ´£¬È¡µÃÏàÓ¦µÄÈÎÎñ
-- ·µ»ØÖµÊÇ¸ÃÈÎÎñÔÚ±íÖĞµÄĞĞºÅ
function tl_gettasklink(myTaskType,myTaskLevel)

	local myTaskCol -- ¼ÇÂ¼ÈÎÎñµÄĞĞºÅ

	if ( myTaskType == 1 ) then -- Èç¹ûÊÇ¹ºÂòÎïÆ·µÄÈÎÎñ
		myTaskCol = tl_selecttask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = tl_selecttask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = tl_selecttask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = tl_selecttask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = tl_selecttask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = tl_selecttask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end



-- ¸ù¾İÈÎÎñÁĞ±íÀïµÄÈ¨ÖØËæ»úÌô³öÈÎÎñ£¬·µ»ØÖµÎªÏàÓ¦ÈÎÎñ±í¸ñµÄĞĞºÅ
function tl_selecttask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- ÈÎÎñµÄ×ÜÈ¨ÖØ

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	-- ¸ù¾İÈ¨ÖØ¹«Ê½×îºóËæ»ú¼ÆËã³ö¾ßÌåµÄÈÎÎñ
	j = random(1,myMainRate)
	
--	tl_print ("ÈÎÎñµÄ×ÜÈ¨ÖØ:  "..myMainRate)
--	tl_print ("Ëæ»úµ½µÄÈÎÎñÈ¨ÖØ  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			tl_print ("Ñ¡Ôñµ½ÁË±í¸ñÖĞµÄµÚ  "..myTaskTable[myTaskLevel][i][1].."  ĞĞ¡£")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- Òì³£´¦Àí£¬Èç¹ûÍæ¼ÒÑ¡²»µ½µÄ»°Ôò·µ»Ø 2£¬ÎŞÂÛÈçºÎÈÃÍæ¼Ò¼ÌĞø½øĞĞÏÂÈ¥
--	tl_print ("½Å±¾ÔÚÑ¡Ôñ¾ßÌåµÄÈÎÎñÊ±³ö´í£¡")
	return 2
	
end



-- ×Óº¯Êı£¬·´»ØÒ»¸öÈÎÎñÀàĞÍËù¶ÔÓ¦±í¸ñµÄ×Ö·û±êÊ¶
function tl_gettasktextID(myTaskType)

local myTaskTextID

	if (myTaskType == 1) then
		myTaskTextID = TL_BUYGOODS
	elseif (myTaskType == 2) then
		myTaskTextID = TL_FINDGOODS
	elseif (myTaskType == 3) then
		myTaskTextID = TL_SHOWGOODS
	elseif (myTaskType == 4) then
		myTaskTextID = TL_FINDMAPS
	elseif (myTaskType == 5) then
		myTaskTextID = TL_UPGROUND
	elseif (myTaskType == 6) then
		myTaskTextID = TL_WORLDMAPS
	end
	
	return myTaskTextID
end


-- ¼ÆËãÒ»¸öÈÎÎñµÄÈ¨ÖØÔÚÆäµ±Ç°µÈ¼¶ÖĞËùÕ¼µÄ°Ù·Ö±È
-- myTableName ´«ÈëµÄÒª¶ÁÈ¡±í¸ñµÄ×Ö·û
-- myTaskRate µ±Ç°ÈÎÎñµÄÈ¨ÖØ
-- myTableCol Ëù¶Á±íµÄÁĞ(×Ö·û»òÕßÊı×Ö)
function tl_counttaskrate(myTableName,myTaskRate,myTableCol)

local i
local myTotalRate = 0
local myReadRate
local myPercent

local myTableRow = TabFile_GetRowCount(myTableName) -- »ñÈ¡TABLEÎÄ¼şµÄ×ÜĞĞÊı

	for i = 3,myTableRow-1 do
		myReadRate = tonumber(TabFile_GetCell(myTableName,myTableRow,myTableCol))
		myTotalRate = myTotalRate + myReadRate
		i = i + 1
	end

myPercent = (myTaskRate / myTotalRate) * 100

return myPercent

end



-- ¼ÆËã´Ó¾ÉµÈ¼¶Éı¼¶µ½Íæ¼ÒÄ¿Ç°µÄµÈ¼¶ĞèÒª¶àÉÙ¾­ÑéÖµ
function tl_countuplevelexp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()
local n_transcount = ST_GetTransLifeCount();
local nNowExp = tl_getUpLevelExp(myLevel + 1, n_transcount) -- µ±Ç°µÈ¼¶ËùĞèµÄ¾­Ñé

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tl_getUpLevelExp(i + 1, n_transcount)
	end
	
	myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)

	return myTotalExp
else
	return myExp - myOldExp
end

end


-- ×Óº¯Êı£¬¼ÆËãµ±Ç°µÄÁ´ĞèÒªÔÚÆäµÈ¼¶Á´ÖĞÁ¬Ğø×ö¶àÉÙ´Î
-- ÒÑ¾­¹ı²âÊÔ£¬È·±£ÎŞÎó£¬1~20 ¼¶¶¼¿ÉÒÔÕıÈ··µ»Ø
function tl_gettasklinknum(myTaskLink)


local myTaskLevel
local myTaskLinks,myTaskLinksNum

myTaskLevel,myTaskLinksNum = tl_getlinksforlevel(myTaskLink)

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

if 	(myTaskLink==Task_MainTaskLink[myTaskLevel][3]) then
	myTaskLinks = 20 - ((myTaskLinksNum-1) * floor(20 / (myTaskLinksNum)))
else
	myTaskLinks = floor(20 / (myTaskLinksNum))
end

return myTaskLinks

end


-- ×Óº¯Êı£¬È·¶¨¸ÃÁ´ÊôÓÚµÚÒ»¸öµÈ¼¶Á´£¬²¢·µ»ØÆäÁ´ÖĞµÄ³ÉÔ±¸öÊı
function tl_getlinksforlevel(myTaskLink)

local i,j = 0,0
local myTaskLevel, myTaskLinksNum

-- Ê×ÏÈÈ·¶¨Õâ¸öÁ´ÊÇÊôÓÚÄÄ¸öµÈ¼¶Á´
for i=1,getn(Task_MainTaskLink) do
	for j=Task_MainTaskLink[i][2],Task_MainTaskLink[i][3] do
		if (myTaskLink==j) then
			myTaskLevel = i
		end
	end
end

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

return myTaskLevel, myTaskLinksNum

end


-- ×Óº¯Êı£¬¼ÆËãÍæ¼ÒÒ»¹²Á¬Ğø×öÁË¼¸´Î¡¢¼¸Á´¡¢¼¸»·
function tl_counttasklinknum(myCountType)

local i,j = 0,0
local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı

local myCountLoops = tl_gettaskstate(3) -- »ñÈ¡Íæ¼ÒµÄ»·Êı

local nTaskLevel,nTaskNum = tl_getlinksforlevel(myTaskLinks) -- »ñÈ¡¸ÃÁ´ÊôÓÚµÚ¼¸¼¶ÒÔ¼°¸Ã¼¶µÄ³ÉÔ±Êı

if (myTaskLinks==Task_MainTaskLink[nTaskLevel][2]) then -- Èç¹û¸ÃÁ´±¾À´¾ÍÊÇ³õÊ¼Á´£¬ÔòÖ±½ÓÈ¡ÆäÖµ
	myCountLinks = tl_gettaskstate(6)
else
	for i=Task_MainTaskLink[nTaskLevel][2],myTaskLinks - 1 do
		j = j + tl_gettasklinknum(i)
	end
	myCountLinks = j + tl_gettaskstate(6)
end


if (myCountLinks==0) then
	myCountTimes = myTaskTimes + (myCountLoops * 400)
else
	myCountTimes = (myCountLinks * TL_MAXTIMES) + myTaskTimes + (myCountLoops * 400)
end


if (tl_gettaskcourse()==3) or (tl_gettaskcourse()==2) then
	myCountTimes = myCountTimes + 1
end


if (myCountType==1) then
	return myCountTimes
elseif (myCountType==2) then
	return myCountLinks
elseif (myCountType==3) then
	return myCountLoops
end

end


-- ×Óº¯Êı£¬È¡µÃÈÎÎñÏàÓ¦µÄËµÃ÷£¬·µ»ØÒ»¶Î×Ö·û´®
function tl_gettaskinfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

local myWhen, myWhere, myWho, myWhy1, myWhy2, myWhat, myMainTalk

	local myTaskType = tl_getplayertasktype()
	
	if (myTaskType == 1) then
		
		-- ÎïÆ·Ãû³Æ
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo1")
		-- Ä¿µÄµØÃû³Æ
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo")
		
		myWhen = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(3), "Who")
		myWhat = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(6), "What")
		
		myMainTalk = "H·y ®i <color=yellow>"..myTaskInfo1.."<color> Mua gióp ta <color=yellow>"..myTaskOrder.."<color> vÒ ®©y!";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 2) then
	 
		-- Ä§·¨ÊôĞÔ
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MagicCnName")
		-- ¾ßÌåµÄÎäÆ÷Àà±ğ
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"TaskInfo")
		-- ×îĞ¡Ä§·¨ÊôĞÔ
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MinValue")
		-- ×î´óÄ§·¨ÊôĞÔ
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MaxValue")
		
		myWhen = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(1), "When")
		myWhere = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(2), "Where")
		myWho = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(4), "Why1")
		myWhy2 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(5), "Why2")
		myWhat = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(6), "What")		
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "1 c¸i <color=yellow>"..myTaskInfo1.."<color>"
			myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>"..myTaskMainInfo.."<color>.";
		else		
			myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>"..myTaskInfo1.."<color>, <color=yellow>"..myTaskOrder.."<color>, nhá nhÊt: <color=yellow>"..myTaskInfo2.."<color>, lín nhÊt: <color=yellow>"..myTaskInfo3.."<color>.";
		end

		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 3) then 
	
		myWhen = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(6), "What")
		
		-- Ä§·¨ÊôĞÔÖĞÎÄÃû
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MagicCnName")
		-- Ä§·¨ÊôĞÔµÄ×îĞ¡Öµ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MinValue")
		-- Ä§·¨ÊôĞÔµÄ×î´óÖµ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MaxValue")

		myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>"..myTaskOrder.."<color>, nhá nhÊt: <color=yellow>"..myTaskInfo1.."<color>, lín nhÊt: <color=yellow>"..myTaskInfo2.."<color>! Xem xong ta sÏ tr¶ l¹i cho ng­¬i";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 4) then 
		
		-- µØÍ¼µÄÃû³Æ
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"TaskInfo1")
		-- ËùÒªµÄµØÍ¼ÊıÁ¿
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"Num")
		-- µØÍ¼µÄÀàĞÍ
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"MapType")
		
		myWhen = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(6), "What")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "§Şa §å chİ "
		else
			myTaskInfo3 = "MËt chİ "
		end

		myTaskMainInfo = "Ng­¬i h·y ®Õn <color=yellow>"..myTaskOrder.."<color> t×m gióp ta <color=yellow>"..myTaskInfo1.."<color> quyÓn <color=yellow> "..myTaskInfo3.." <color>.";
		
	elseif (myTaskType == 5) then

		myWhen = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(6), "What")

		
		-- ĞèÒªÌáÉıµÄÊıÖµÀàĞÍ
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericType")
		-- ĞèÒªÌáÉıµÄÊıÖµ×ÜÊı
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = "®¼ng cÊp"
			myTaskInfo3 = "®¼ng cÊp"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "TrŞ kinh nghiÖm"
			myTaskInfo3 = "TrŞ kinh nghiÖm"
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "Danh väng"
			myTaskInfo3= "Danh väng"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "Phóc Duyªn"
			myTaskInfo3 = "Phóc Duyªn"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "®iÓm PK"
			myTaskInfo3 = "®iÓm PK"
		elseif (tonumber(myTaskOrder) == 6) then
			myTaskInfo2 = "®iÓm tİch lòy Tèng Kim "
			myTaskInfo3 = "®iÓm tİch lòy Tèng Kim "
		end
		
		myTaskMainInfo = "H·y ®i n©ng cÊp <color=yellow>"..myTaskInfo3.." "..myTaskInfo1.."<color>.";
		
	elseif (myTaskType == 6) then

		myWhen = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(3), "Who")
		
		-- ĞèÒªÊÕ¼¯µÄÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,tl_gettasktablecol(),"Num")
		
		myTaskMainInfo = "H·y ®i t×m gióp ta <color=yellow>"..myTaskOrder.."<color> m¶nh b¶n ®å S¬n Hµ X· T¾c";
	end

	return myTaskMainInfo
 
end

-- ÓÃÓÚÈÎÎñÁ´ DEBUG ĞÅÏ¢´òÓ¡µÄ¹ı³Ì
function tl_print(myPrintText)
--	print ("ÈÎÎñÁ´Êä³öĞÅÏ¢£º"..myPrintText);
end


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()
local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 0) then
		mySex = "C«ng tö "
	else
		mySex = "N÷ hiÖp"
	end
	
return mySex
end


function AssignValue(myTaskVariable,myTaskTextID)

local i,j,k = 0,0,0
local myTaskIndex = {}
myTaskVariable = {}
myTaskVariable[1] = {}
myTaskVariable[1][1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local myColText
local myReadRate

--	tl_print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
	for i = 1,20 do
		myTaskVariable[i]={}
		for j=1,myTableRow - 1 do
			myTaskVariable[i][j] = {0,0}
		end
	end

	for i = 1,20 do
		myTaskIndex[i] = 0
	end

	for i = 1,20 do  -- ´ÓµÚÒ»¼¶µ½µÚ¶şÊ®¼¶µÄÀú±éÑ­»·
		for j = 2,myTableRow do
			myColText = format("%s%s","TaskRate",i)
			myReadRate = tonumber(TabFile_GetCell(myTaskTextID,j,myColText))
			
			if (myReadRate ~= nil) then -- Èç¹ûÔÚÈÎÎñÁ´µÈ¼¶È¨ÖØÀïÃæÓĞÊıÖµµÄ»°£¬ÔòÊôÓÚÕâ¸öµÈ¼¶

					myTaskIndex[i] = myTaskIndex[i] + 1
					myTaskVariable[i][myTaskIndex[i]] = {j,myReadRate}
			end
		end
	end
	
return myTaskVariable

end


-- ¹¹ÔìÈÎÎñ±í¸ñ
function AssignValue_TaskLink(myTaskVariable,myTaskTextID)

local myTaskLevel,myTaskStart,myTaskEnd
local i,j = 0,0

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i] = {0,0,0}
	end
	
	for i = 2,myTableRow do
		
		j = j + 1
		
		-- ¼ÇÂ¼ÕâÒ»µÈ¼¶Á´£ºĞèÇóµÈ¼¶¡¢³õÊ¼ÖµºÍ×î¸ßÖµ
		if (i<myTableRow) then
			
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = tonumber(TabFile_GetCell(myTaskTextID,i+1,2)) - 1
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		elseif (i==myTableRow) then
		
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = TL_MAXLINKS
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		end
		
--		tl_print("ÈÎÎñµÈ¼¶Á´£º"..j.."Ê±³õÊ¼ÖµÎª£º"..myTaskVariable[j][2].."  ×î¸ßÖµÎª£º"..myTaskVariable[j][3].."  ĞèÇóµÈ¼¶Îª£º"..myTaskVariable[j][1]);
	
	end
	
	return myTaskVariable
	
end


-- ËùÓĞÈÎÎñÀàĞÍÔÚÃ¿¸öµÈ¼¶ÖĞ±ÈÂÊµÄË÷Òı
function AssignValue_TaskRate(myTaskVariable,myTaskTextID)

local i,j,k

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID) -- »ñÈ¡TABLEÎÄ¼şµÄ×ÜĞĞÊı
local myTableCol -- ºÏ²¢×Ö·û´®£¬¹¹Ôì±íÍ·±êÊ¶£º"level20"
local myRate

	for i = 1,TL_MAXLINKS do
		myTaskVariable[i]={}
		for j=1,6 do
			myTaskVariable[i][j] = 0
		end
	end
	
	k = 0
	
	for i = 1,TL_MAXLINKS do
		for j = 2,myTableRow do
			k = j - 1 
			myTableCol = format("%s%s","level",i)
			myRate = tonumber(TabFile_GetCell(myTaskTextID,j,myTableCol))
			myTaskVariable[i][k] = myRate
		end
	end

return myTaskVariable

end


-- ¹¹Ôì½±ÀøÄÚ´æ±í¸ñ
function AssignValue_Award(myTaskVariable,myTaskTextID)

local i,j = 0,1

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i]={}
	end
	
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTaskVariable[i] = {j,tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue"))}
--		tl_print ("ÔÚ "..myTaskTextID.."  ÖĞ ".."  µÚ "..i.." ¸öÔªËØ£º".." µÚ  "..j.."  ĞĞµÄ¼ÛÖµÁ¿ÊÇ  "..tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue")))
	end
	
return myTaskVariable
	
end


-- ¹¹ÔìÑ°ÕÒÎïÆ·ÈÎÎñ¶Ô»°µÄÄÚ´æË÷Òı
function AssignValue_TaskTalk(myTaskVariable,myTaskTextID)

local i,j = 0,0
local myTextValue

myTaskVariable = {{0},{0},{0},{0},{0},{0}} -- Áù¸öÔªËØ·Ö±ğÎª£ºÊ±¼ä¡¢µØµã¡¢ÈËÎï¡¢Ô­ÒòÒ»ºÍ¶ş¡¢ÊÂ¼ş

local myTableRow = TabFile_GetRowCount(myTaskTextID)
	
	tl_print ("Sè hµng t×m ®­îc lµ:"..myTableRow);
	
	-- ¹¹ÔìÊ±¼äÊı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"When")
		if (myTextValue ~= "n") then
			myTaskVariable[1][i] = j
		end	
	end
	
	-- ¹¹ÔìµØµãÊı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Where")
		if (myTextValue ~= "n") then
			myTaskVariable[2][i] = j
		end	
	end

	-- ¹¹ÔìÈËÎïÊı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Who")
		if (myTextValue ~= "n") then
			myTaskVariable[3][i] = j
		end	
	end

	-- ¹¹ÔìÔ­ÒòÒ»Êı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why1")
		if (myTextValue ~= "n") then
			myTaskVariable[4][i] = j
		end	
	end
	
	-- ¹¹ÔìÔ­Òò¶şÊı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why2")
		if (myTextValue ~= "n") then
			myTaskVariable[5][i] = j
		end	
	end
	
	-- ¹¹ÔìÊÂ¼şÊı×é
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"What")
		if (myTextValue ~= "n") then
			myTaskVariable[6][i] = j
		end	
	end
	
	for i=1,6 do
		tl_print("§èi tho¹i nhiÖm vô hiÖn t¹i  "..i.."  Tæng sè ch÷ sè nguyªn tè lµ: "..getn(myTaskVariable[i]));
	end
	
return myTaskVariable

end