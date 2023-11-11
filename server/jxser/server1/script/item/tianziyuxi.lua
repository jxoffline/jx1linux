-- Ìì×ÓÓñçô
-- ZhiDong
IL("LEAGUE")
IL("SETTING")
IncludeLib("ITEM")
IncludeLib("TASKSYS");
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\global\\login_head.lua")

-- ¹¹Ôì
if not tbItemTianZiYuXi then
	tbItemTianZiYuXi = tbBaseClass:new();
end

-- ³õÊ¼»¯
function tbItemTianZiYuXi:init()
	self.ParamID_Blank_1			= 1    -- ¿Õ°×±ê¼ÇÎ»
	self.ParamID_Blank_2			= 2    -- ¿Õ°×±ê¼ÇÎ»
	self.ParamID_OverdueDate		= 3	   -- ¼ÇÂ¼ÓñçôµÄ¹ıÆÚÈÕÆÚ
	self.ParamID_UsingDate			= 4	   -- ¼ÇÂ¼ÉÏ´ÎÊ¹ÓÃÓñçôµÄÈÕÆÚ
	self.ParamID_TotalCount		 	= 5	   -- ¼ÇÂ¼×Ü¹²»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	self.ParamID_DayCount			= 6	   -- ¼ÇÂ¼µ±Ìì»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	self.nMaxUseTotalCount			= 12   -- ÓñçôµÄ×î´óÊ¹ÓÃ×Ü´ÎÊı
	self.nMaxUseDayCount			= 2	   -- ÓñçôµÄÃ¿Ìì×î´óÊ¹ÓÃ´ÎÊı
	self.nMinMsgLen					= 4	   -- ÓñçôµÄ×îĞ¡³¤¶È
	self.nMaxMsgLen					= 80   -- ÓñçôµÄ×î´ó³¤¶È
	self.nDetailType				= 1    -- ÎïÆ·ÀàĞÍ
	self.nParticualType				= 2059 -- ÎïÆ·ÀàĞÍ
	self.TempTask_HasYuXi			= 252  -- ÁÙÊ±ÈÎÎñ±äÁ¿£¬¼ÇÂ¼ÊÇ·ñÓµÓĞÓñçô
	self.szDescLink					= "<link=image[0,0]:\\spr\\item\\tianziyuxi.spr><link>"
	self.szMsg						= self.szDescLink.."Thiªn Tö ngäc tû, vËt b¸u quèc gia"
	self.tbForbidWord 				= {"<item=", "<link=", "<pic=", "<color=", "<bclr=", "<enter"}
end
tbItemTianZiYuXi:init();

-- ¿ª·¢²âÊÔÊ¹ÓÃº¯Êı
function tbItemTianZiYuXi:DeBug(nItemIndex)
	
--	self:GiveCallBack(nItemIndex);
	 
	local nBlank_1		= GetItemParam(nItemIndex, self.ParamID_Blank_1);		-- ¿Õ°×±ê¼ÇÎ»
	local nBlank_2		= GetItemParam(nItemIndex, self.ParamID_Blank_2);		-- ¿Õ°×±ê¼ÇÎ»
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- ÓñçôµÄ¹ıÆÚÈÕÆÚ
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- ÉÏ´ÎÊ¹ÓÃÓñçôµÄÈÕÆÚ
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- ×Ü¹²»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- µ±Ìì»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
	Msg2Player("nItemIndex: "..nItemIndex);
	Msg2Player("nBlank_1: "..nBlank_1);
	Msg2Player("nBlank_2: "..nBlank_2);
	Msg2Player("nOverdueDate: "..nOverdueDate);
	Msg2Player("nUsingDate:	  "..nUsingDate);
	Msg2Player("nTotalCount:  "..nTotalCount);
	Msg2Player("nDayCount:    "..nDayCount);
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
end

-- Ê¹ÓÃÓñçô
function tbItemTianZiYuXi:OnUse(nItemIndex)
	
	-- µ÷ÊÔº¯Êı
--	self:DeBug(nItemIndex);	
	
	local tbOpt 		= {}	
	local nDate 		= floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ
	local nHour 		= tonumber(GetLocalDate("%H"));							-- µ±Ç°Ğ¡Ê±
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- ÓñçôµÄ¹ıÆÚÈÕÆÚ
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- ÉÏ´ÎÊ¹ÓÃÓñçôµÄÈÕÆÚ
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- ×Ü¹²»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- µ±Ìì»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("Nh©n vËt ch÷ tr¾ng kh«ng thÓ sö dông ngäc tû.")
		return 1;
	end
	
	-- Óñçô¹ıÆÚ
	if nDate > nOverdueDate or (nDate == nOverdueDate and nHour >= 21) then
		return 0;
	end
	
	-- ĞÂµÄÒ»Ìì£¬¸üĞÂÊ¹ÓÃÏŞÖÆ
	if nDate ~= nUsingDate then
		nUsingDate = nDate;
		nDayCount  = self.nMaxUseDayCount;
		SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nUsingDate);
		SetSpecItemParam(nItemIndex, self.ParamID_DayCount,  nDayCount);
	end
	
	-- ×Ü´ÎÊı³¬¹ıÏŞÖÆ
	if nTotalCount <= 0 then
		tinsert(tbOpt, "Ngäc tû ®· vÉn ®ôc, sÏ kh«ng bao giê ph¸t ra ¸nh s¸ng may m¾n n÷a/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- µ±Ìì´ÎÊı³¬¹ıÏŞÖÆ
	if nDayCount <= 0 then
		tinsert(tbOpt, "Ngäc tû ®· lãe lªn ¸nh s¸ng, nh­ng mµ vÉn kh«ng tİ ph¶n øng nµo/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- ¿ÉÒÔÊ¹ÓÃ
	AskClientForString("SendMsg2AllServer", "", self.nMinMsgLen, self.nMaxMsgLen, "Muèn c¸o thŞ b¸ch tİnh ra sao?");
	return 1;
end

-- ·¢ËÍÏûÏ¢
function tbItemTianZiYuXi:SendMsg2AllServer(szMsg)
	
	local tbOpt			= {}	
	local nItemIndex 	= FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	
	if (ST_CheckTextFilter(szMsg) ~= 1) then
		tinsert(tbOpt, "Néi dung chiÕu th­ cã mét sè tõ kh«ng æn, xin Thiªn Tö h·y c©n nh¾c./OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end
	
	for i = 1, getn(self.tbForbidWord) do
		local bp = strfind(szMsg, self.tbForbidWord[i])
		if (bp ~= nil) then
			tinsert(tbOpt, "Néi dung chiÕu th­ cã mét sè tõ kh«ng æn, xin Thiªn Tö h·y c©n nh¾c./OnCancel")
			Describe(self.szMsg, getn(tbOpt), tbOpt);
			return
		end
	end
	
	if (nItemIndex <= 0) then
		tinsert(tbOpt, "Së h÷u Thiªn Tö Ngäc Tû míi ®­îc phĞp ban truyÒn chiÕu th­/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end

	-- ¼õÉÙÊ¹ÓÃ´ÎÊı
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount) - 1;	-- ×Ü¹²»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount) - 1;		-- µ±Ìì»¹¿ÉÒÔÊ¹ÓÃµÄ´ÎÊı
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, nTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, nDayCount);
	Msg2Player(format("Xem ra h«m nay cßn ®­îc sö dông %d lÇn, tæng céng cßn ®­îc sö dông %d lÇn", nDayCount, nTotalCount));
	
	-- ·¢²¼ÏûÏ¢
	AddLocalNews(format("Chiªu c¸o thiªn h¹: %s", szMsg));
	AddLocalNews(format("Chiªu c¸o thiªn h¹: %s", szMsg));
	AddLocalNews(format("Chiªu c¸o thiªn h¹: %s", szMsg));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", format("Chiªu c¸o thiªn h¹: %s", szMsg), "", "");
	tinsert(tbOpt, "Ngäc tû ®ét nhiªn ph¸t ra mét ¸nh hµo quang táa ra bèn ph­¬ng./OnCancel")
	Describe(self.szMsg, getn(tbOpt), tbOpt);
	return
end

-- ÉÏÏß¹«¸æ
function tbItemTianZiYuXi:LoginMsg()
	
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		return
	end
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ±ê¼ÇÎªÓµÓĞÓñçô
	local szMsg = format("Giang hå t­¬ng truyÒn: %s mang ngäc tû truyÒn quèc lªn m¹ng.", GetName());
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	AddLocalNews(szMsg);
end

-- ÇĞ»»µØÍ¼¹«¸æ
function tbItemTianZiYuXi:ChangeMapMsg()
	
	-- ²»ÊÇ°ï»áĞûÕ½µØÍ¼
	if IsTongWarMap(SubWorld) ~= 1 then
		return
	end

	-- ³õ²½¼ì²éÊÇ·ñÓµÓĞÓñçô
	if	GetTaskTemp(self.TempTask_HasYuXi) ~= 1 then
		return
	end
	
	-- °×Ãû²»¹«¸æ
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	-- Êµ¼Ê¼ì²éÊÇ·ñÓµÓĞÓñçô
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		SetTaskTemp(self.TempTask_HasYuXi, 0);	-- ±ê¼ÇÎªÃ»ÓĞÓñçô
		return
	end
	
	local szMsg = format("Giang hå t­¬ng truyÒn: %s ®em ngäc tû ®Õn %s.", GetName(), SubWorldName(SubWorld));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
end

-- ¼ñÆğÓñçô
function tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ±ê¼ÇÎªÓµÓĞÓñçô
	NW_OwnSeal(GetName());					-- ¼ÇÂ¼ÓñçôµÄÓµÓĞÕß
	
	
	local szMsg = format("Giang hå t­¬ng truyÒn: %s nhÆt ®­îc truyÒn quèc ngäc tû", GetName());
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

-- ·¢·ÅÓñçôÊ±µÄ»Øµ÷º¯Êı£¬¸øÓñçôÉèÖÃÏàÓ¦µÄ³õÊ¼Öµ
function tbItemTianZiYuXi:GiveCallBack(nItemIndex)
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ±ê¼ÇÎªÓµÓĞÓñçô
	NW_OwnSeal(GetName());					-- ¼ÇÂ¼ÓñçôµÄÓµÓĞÕß
	
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ
	local nWeek = tonumber(GetLocalDate("%w"));							-- µ±Ç°ĞÇÆÚ
	local nHour = tonumber(GetLocalDate("%H"));							-- µ±Ç°Ğ¡Ê±
	
	-- ĞÇÆÚÌì
	if nWeek == 0 then
		nWeek = 7;
	end
	
	-- ĞÇÆÚÒ» ÇÒÎªÀÏµÄÒ»³¡
	if nWeek == 1 and nHour < 21 then
		nWeek = 8;
	end
	
 	local nEndDate = floor(FormatTime2Number((8 - nWeek) * 24 * 60 *60 + GetCurServerTime())/10000);	-- ½áÊøÈÕÆÚ
	
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_1, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_2, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_OverdueDate, nEndDate );
	SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nDate);
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, self.nMaxUseTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, self.nMaxUseDayCount);
	
	local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
	ITEM_SetExpiredTime(nItemIndex, nExpiredDate, 120000);
	SyncItem(nItemIndex)
end




function OnCancel()	
	
end

function main(nItemIndex)
	return tbItemTianZiYuXi:OnUse(nItemIndex);
end

function IsPickable( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("Hµnh trang kh«ng ®ñ chç trèng, xin mêi s¾p xÕp l¹i!")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("Nh©n vËt ch÷ tr¾ng kh«ng thÓ nhÆt ngäc tû.")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	return tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex );
end

function SendMsg2AllServer(szMsg)
	return tbItemTianZiYuXi:SendMsg2AllServer(szMsg);
end

function LoginMsg(bExchangeIn)
	
	-- ¿ç·ş¹ıÀ´µÄ¾Í²»ÓÃÔÙÌáÊ¾ÁË
	if (bExchangeIn == 1) then
		return
	end
	
	tbItemTianZiYuXi:LoginMsg();
	return
end

function YuXiChangeMapMsg()
	return tbItemTianZiYuXi:ChangeMapMsg();
end


if login_add then login_add(LoginMsg, 2) end