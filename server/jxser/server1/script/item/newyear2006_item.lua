
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline 2006 Ôªµ©»î¶¯ÎäÁÖÃËÖ÷Ú¯ÊéÎÄ¼ş
-- Edited by peres
-- 2005/12/22 PM 15:12

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ¶ÁÈë 2006 Ôªµ©»î¶¯Í·ÎÄ¼ş
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- Ëæ»úÈÎÎñµÄ´¦ÀíÖ§³Ö
Include("\\script\\task\\random\\task_head.lua");

function main()

Say("§Ó tri ©n c¸c anh hïng hiÖp kh¸ch, vµo dŞp TÕt ¢m LŞch, ta muèn tÆng mét sè lÔ vËt, vµo ngµy <color=yellow>30/12 ®Õn 01/01<color> cã thÓ ®Õn chç ta nhËn quµ--§éc C« KiÕm",
	7,
	"NhËn ®iÓm kinh nghiÖm t¨ng gÊp ®«i trong 8 giê mçi ngµy/getDoubleExp",
	"NhËn phÇn th­ëng ®iÓm kinh nghiÖm mçi ngµy/getMoreExp_Confirm",
	"NhËn mËt tŞch nhiÖm vô mçi ngµy/getTaskBook",
	"Liªn quan vÒ tû lÖ t¨ng ®iÓm kinhn nghiÖm cña nhiÖm vô ngÉu nhiªn/getRandomTaskInfo",
	"Tin tøc míi vÒ B¹ch C©u hoµn/getBaijuInfo",
	"Cã thÓ sö dông TiÒn ®ång mua dông cô míi/getCoppercashInfo",
	"§· ®äc xong/OnExit");
	
	return 1;

end;


function getDoubleExp()

-- È¡µÃÈÕÆÚ
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- Èç¹ûÈÕÆÚ²»¶Ô£¬Ö±½Ó·µ»Ø
	if isNewYearTime()==0 then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;

	-- Èç¹ûµÈ¼¶Î´´ïµ½ 80 ¼¶
	if GetLevel()<80 then
		Say("ChØ cã ng­êi ch¬i tõ cÊp 80 trë lªn míi cã thÓ nhËn ®­îc phÇn th­ëng gÊp ®«i ®iÓm kinh nghiÖm!", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("H«m nay b¹n ®· nhËn phÇn th­ëng gÊp ®«i ®iÓm kinh nghiÖm råi!", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 ¼¶ÒÔÉÏµÄÈËÃ¿Ìì¿ÉÒÔÁìÈ¡Ò»´Î 8 Ğ¡Ê±¾­ÑéË«±¶
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("B¹n nhËn ®­îc <color=green>PhÇn th­ëng ®iÓm kinh nghiÖm gÊp ®«i trong 8 giê!<color>");
		WriteTaskLog("NhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm gÊp ®«i trong 8 giê!");
		
	else
		Say("ChØ cã ng­êi ch¬i tõ cÊp 80 trë lªn míi cã thÓ nhËn ®­îc phÇn th­ëng gÊp ®«i ®iÓm kinh nghiÖm!", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- È¡µÃÈÕÆÚ
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- Èç¹ûÈÕÆÚ²»¶Ô£¬Ö±½Ó·µ»Ø
	if isNewYearTime()==0 then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;
	
	-- Èç¹ûÊÇ·Ç³å¿¨ÓÃ»§
	if IsCharged()==0 then
		Say("Ho¹t ®éng Nguyªn §¸n lÇn nµy chØ cã n¹p thÎ míi sö dông ®­îc!", 0);
		return
	end;
	
	-- Èç¹ûµÈ¼¶Î´´ïµ½ 80 ¼¶
	if GetLevel()<80 then
		Say("ChØ cã ng­êi ch¬i tõ cÊp 80 trë lªn míi cã thÓ nhËn ®­îc mËt tŞch nhiÖm vô nµy!", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("H«m nay b¹n ®· nhËn mét mËt tŞch nhiÖm vô råi!", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- Ñ¡ÔñÒ»¸öµÚ¶ş²ãµÄËæ»úÈÎÎñ
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- Éú³ÉÒ»¸öÈÎÎñ¾íÖá
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	SyncItem(nRandomItemIndex);

	Msg2Player("B¹n nhËn ®ù¬c <color=green>nhiÖm vô ngÉu nhiªn!<color>");
	
	WriteTaskLog("NhËn ®­îc 1 mËt tŞch nhiÖm vô, m· sè lµ:"..nRandomTaskID);
	
end;


-- Ñ¯ÎÊÍæ¼ÒÊÇ·ñÁìÈ¡¾­Ñé
function getMoreExp_Confirm()
	Say("Trong kho¶ng thêi gian tõ <color=yellow>20-12-2005 ®Õn 01-01-2006<color>, mçi ngµy lªn m¹ng ®Òu nhËn ®­îc ®iÓm kinh nghiÖm do Vâ l©m minh chñ tÆng.<color=yellow>Trong vßng 3 ngµy nµy cã thÓ nhËn 1 lÇn <color>, nh­ng 2 lÇn nhËn ph¶i c¸ch nhau <color=yellow>trªn mét giê trªn m¹ng<color>. Ng­¬i ®ång ı nhËn kh«ng?",2,
		"§­îc råi! Ta muèn nhËn l·nh!/getMoreExpMain",
		"Th«i ®Ó l¸t ®i/OnExit");
	return
end;


-- ÁìÈ¡Ã¿ÈÕµÄ¾­Ñé
function getMoreExpMain()

local nExp = countMoreExpNum();

-- È¡µÃÈÕÆÚ
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- Èç¹ûÈÕÆÚ²»¶Ô£¬Ö±½Ó·µ»Ø
	if isNewYearTime()==0 then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;
	
	-- Èç¹ûÊÇ·Ç³å¿¨ÓÃ»§
	if IsCharged()==0 then
		Say("Ho¹t ®éng Nguyªn §¸n lÇn nµy chØ cã n¹p thÎ míi sö dông ®­îc!", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- ÏŞÖÆÖ»ÄÜÉı 5 ¼¶
		else
			addPlayerExpForLimit(nExp, 0); -- ²»ÏŞÖÆ
		end;
		
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng trong ho¹t ®éng Nguyªn §¸n:<color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm!");
		
		writeMoreExpData();  -- ¼ÇÂ¼ÁìÈ¡¾­ÑéµÄÏà¹ØÊı¾İ
	
		WriteTaskLog("nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm mçi ngµy:"..nExp);
		
	else
		Say("HiÖn t¹i ng­¬i kh«ng ®ñ ®iÒu kiÖn ®Ó nhËn.<color=yellow>Trong vßng 3 ngµy mçi ngµy sÏ nhËn 1 lÇn<color>, nh­ng 2 lÇn nhËn ph¶i c¸ch nhau <color=yellow>trªn 1 giê trªn m¹ng<color>!", 0);
		return
	end;


end;


-- »ñÈ¡Í­Ç®µÄÌáÊ¾
function getCoppercashInfo()

	Say("GÇn ®©y DŞ dung thuËt sÜ ë L©m An cã b¸n mét sè MÆt n¹ Tinh Linh, MÆt n¹ T©n Niªn HiÖp Kh¸ch, MÆt n¹ T©n Niªn HiÖp N÷, MÆt n¹ ThuÇn Léc…Bªn c¹nh ®ã Hµnh c­íc th­¬ng nh©n mét sè n¬i còng cã nhËp vµo mét sè hép lÔ vËt mµu xanh, hép hoa, n¬i Hµng Rong còng cã b¸n ThiÖp Nh­ ı cho ng­êi ch¬i cã thÓ viÕt lêi chóc phóc lªn ®ã, hoan nghªnh mäi ng­êi ®Õn mua!", 0);
	return
	
end;


function getBaijuInfo()

	Say("Trong thêi gian <color=yellow>30/12/2005 ®Õn 01/01/2006<color> mçi ngµy tõ <color=red>0:00~18:00<color>, sö dông B¹ch C©u hoµn treo m¸y nhËn ®­îc t¨ng ®«i ®iÓm kinh nghiÖm, Kü n¨ng B¹ch C©u hoµn treo m¸y nhËn ®­îc kü n¨ng t¨ng 1.5 lÇn ", 0);
	return

end;


function getRandomTaskInfo()

	Say("Trong thêi gian <color=yellow>30-12-2005 ®Õn 01-01-2006<color> nhËn ®­îc nhiÖm vô ngÉu nhiªn - phÇn th­ëng nh©n ®«i!", 0);
	return

end;



function OnExit()

end;