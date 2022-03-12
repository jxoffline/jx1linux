--½õÄÒÊÂ¼ş ÎïÆ·Àà

--by zhongchaolong 2008-10-30
-- ĞèÒªÔö¼ÓÊÂÇéÔÚDailogÀïÔö¼Ó¶Ô»°Èë¿Ú
-- ²¢ÔÚÊÂ¼ş´¦ÀíÍê±ÏºóĞèÒª ÊÖ¶¯µ÷ÓÃ ¼õÉÙÊ¹ÓÃ´ÎÊıµÄÖ¸Áî¡®
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\task\\system\\task_string.lua");


--ĞÂÔöÊÂ¼şµÄÍ·ÎÄ¼ş


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
if not tbItemJingnianshijian then
	tbItemJingnianshijian = tbBaseClass:new()
end


local nMaxUseCount = 1000 --Ä¬ÈÏ×î´óÊ¹ÓÃ´ÎÊı
local nExpiredTime = 20090907



--ÔÚÕâÀïÔö¼ÓÊÂ¼ş¶Ô»°Èë¿Ú
function tbItemJingnianshijian:Dailog(nItemIndex)
	local szMsg = self.szDescLink.."Sö dông cÈm nang sù kiÖn."
	local tbOpt = {}	
	tinsert(tbOpt, "Hñy bá /OnCancel")
	
	Describe(szMsg, getn(tbOpt), tbOpt);
end

function tbItemJingnianshijian:_init()
	self.PARAM_ID_USEDATE	= 1
	self.PARAM_ID_USECOUNT 	= 2
	self.szDescLink			= "<link=image[0,0]:\\spr\\item\\script\\jingniangshijian.spr><link>" --²»ÖªµÀÊÇ¶ÁÈ¡ÎÄ¼şĞÅÏ¢ºÃ»¹ÊÇĞ´ËÀºÃ
end


--Èç¹ûÎïÆ·ÊÇµÚÒ»´ÎÊ¹ÓÃ£¬ÄÇÃ´ÉèÉÏÊ¹ÓÃÈÕÆÚµÄÏŞÖÆºÍ£¬×î´óÊ¹ÓÃ´ÎÊı
function tbItemJingnianshijian:ItemParamInit(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);
	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	if nUseDate == 0 and nUseCount == 0 then
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USEDATE, %nExpiredTime );
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, %nMaxUseCount);
		SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë
	end
end

--ÎïÆ·Ê¹ÓÃÊ±
function tbItemJingnianshijian:OnUse(nItemIndex)
	
	self:ItemParamInit(nItemIndex);
	
	if self:CheckItem(nItemIndex) == nil then
		return 0
	end
	self:Dailog(nItemIndex)
	
	
	return 1
end

--¼ì²éÎïÆ·ÊÇ·ñ¹ıÆÚ£¬ ²»ÊÇ×Ô¼ºµÄ£¬ÎïÆ·ÄÍ¾Ã
function tbItemJingnianshijian:CheckItem(nItemIndex)
	
	if not nItemIndex  or  nItemIndex <= 0 then
		return nil;
	end
	if  tonumber(GetLocalDate("%Y%m%d")) >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","VËt phÈm nµy ®· hÕt h¹n");
		return nil
	end
	
	
	if IsMyItem(nItemIndex) ~= 1 then
		return 0
	end
	
	local ng, nd, np = GetItemProp(nItemIndex);
	
	if (ng ~= 6 or nd ~= 1 or np ~= 1833) then
		return 0
	end
	
	local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
	if nUseCount < 1 then --ÄÍ¾ÃĞ¡ÓÚ 1 É¾³ı
		RemoveItemByIndex(nItemIndex)
		Talk(1,"", "VËt phÈm nµy ®· hÕt ®é bÒn vµ biÕn mÊt.")
		return nil
	end
	return 1
end

--¼õÉÙÊ¹ÓÃ´ÎÊı
function tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	if nItemIndex  and nItemIndex > 0 then 
		local ng, nd, np = GetItemProp(nItemIndex);
		
		if (ng == 6 and nd == 1 and np == 1833 and IsMyItem(nItemIndex) == 1) then
		
			local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
			nUseCount = nUseCount - 1
			SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, nUseCount)
			SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë
			if nUseCount < 1 then --ÓÃÍêÁË¾ÍÉ¾³ı
				RemoveItemByIndex(nItemIndex)
			end
		end
		
	end
end


function tbItemJingnianshijian:GetDesc(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);

	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	local nDate		= %nExpiredTime
	
	if nUseDate == 0 and nUseCount == 0 then
		nUseCount = %nMaxUseCount
	end
	
	return format("<color=green>Sè lÇn sö dông cßn l¹i: %d<color>", nUseCount)
end
function OnCancel()
	
end

tbItemJingnianshijian:_init()