
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÈÎÎñÏµÍ³ÈÎÎñ¾íÖá¿Í»§¶Ë½Å±¾
-- Edited by peres
-- 2005/07/04 PM 19:59

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================
-- ÈÎÎñÏµÍ³
IncludeLib("TASKSYS");

-- ¶ÁÈëÊı¾İ¶¨ÒåÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_head.lua");

function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local strDesc = "";

	strDesc = strDesc.."<enter>Miªu t¶ nhiÖm vô: <color=yellow>"..TaskId(magiclevel1, 1, TaskID_Table.TaskText_Row).."<color><enter><enter>";

	strDesc = strDesc..CreateAwardText(TaskName(magiclevel1));

	strDesc = strDesc.."<enter><color=yellow>DiÔn gi¶i: nhÊp chuét ph¶i th× lËp tøc tiÕp nhËn nhiÖm vô nµy<color><enter>";
	
	return strDesc;

end;


-- Éú³É½±ÀøÎÄ×Ö×Ö¶Î
function CreateAwardText(taskName)

local nRow, nCol = TaskAwardMatrix(taskName);

local i=0;

local aryAward = {{}};

local strArray = "";
local strArrayRate = "";
local strText = ""; -- ½±ÀøµÄËµÃ÷

local nIsArray = 0; -- ÅĞ¶ÏÊÇ·ñÓĞÊı×é

local strAwardNormal = {} -- ¹Ì¶¨·¢ÓèµÄ½±Àø
local strAward = "Sau khi hoµn thµnh nhiÖm vô nhËn ®­îc phÇn th­ëng: <enter>"; -- ×îºó·µ»ØµÄ½±Àø×Ö¶Î

local strType = "";

	strType = TaskAward(taskName, 1, 1);

	-- ¶ÔÓÚÈÎÎñ½±ÀøÀàĞÍÊÇ½±ÀøË÷ÒıµÄ´¦Àí
	if strType=="hÖ thèng phÇn th­ëng" then
		-- Ö±½ÓË÷Òıµ½ÈÎÎñÃû³Æ
		taskName = TaskAward(taskName, 1, Award.AlliedAward_Row);
		nRow, nCol = TaskAwardMatrix(taskName);
	end;

	for i=1, nRow do
	
		strArray = TaskAward(taskName, i, Award.ArrayID_Row);
		strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
		strText     = TaskAward(taskName, i, Award.AwardText_Row);
		
		-- Èç¹û½±Àø±»¶¨ÒåÁËÊı×é
		if strArray~="" then
		
			-- Èç¹ûÊı×é²»´æÔÚÔò³õÊ¼»¯Êı×é
			if aryAward[tonumber(strArray)]==nil then
				rawset(aryAward, tonumber(strArray), {}); 
			end;
			
			 rawset(aryAward[tonumber(strArray)],
			 		getn(aryAward[tonumber(strArray)])+1,
			 		"<color=green>"..strText.."<color>  "..strArrayRate.."% c¬ héi"
			 		);
			 		
			 nIsArray = 1;
			 
		else
			rawset(strAwardNormal,
					getn(strAwardNormal)+1,
					strText);
		end;
	
	end;
	
	-- Èç¹û½±Àø±»¶¨ÒåÁËÊı×é£¬Ôòµ÷ÓÃÊı×é·¢½±º¯Êı
	if nIsArray==1 then
		for i=1, getn(aryAward) do
			strAward = strAward.."<enter>thø "..i.."phÇn th­ëng ngÉu nhiªn:<enter>";
			strAward = strAward..CreateTextForArray(aryAward[i]);
		end;
	end;
	
	strAward = strAward.."<enter>PhÇn th­ëng cè ®Şnh:<enter>";
	
	if getn(strAwardNormal)~=0 then
	
		for i=1, getn(strAwardNormal) do
			strAward = strAward.."<color=green>"..strAwardNormal[i].."<enter>";
		end;
		
	else
		strAward = strAward.."<color=green>PhÇn th­ëng kh«ng cè ®Şnh<color>";
	end;
	
	return strAward;
	
end;



function CreateTextForArray(aryAward)

local strAward = "";
local i=0;


	-- °ÑÊı×éÀïÃæµÄ¶«Î÷·¢³öÈ¥
	for i=1, getn(aryAward) do
		strAward = strAward..aryAward[i].."<enter>";
	end;
	
	return strAward;
	
end;