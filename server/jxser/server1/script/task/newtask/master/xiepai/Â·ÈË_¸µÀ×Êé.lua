
-- ÁúÈª´å¸µÀ×Êé½Å±¾
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");
Include("\\script\\task\\random\\treasure_head.lua");  -- ²Ø±¦Í¼¼øÉÍ¹¦ÄÜ

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==140) then
		task_level30_09();
		return
	elseif (myTaskValue==150) then
		Say("MÆc Thï H­¬ng chñ Tang Chu cña Ngò §éc gi¸o ë phİa §«ng Nam Long TuyÒn Th«n, ta nãi vËy ®· ®ñ ch­a?",0);
		return
	elseif (myTaskValue==151) then
		task_level30_10();
		return
	elseif (myTaskValue==160) then -- ¼ûÁËÉ£Öéºó»Øµ½ÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°
		task_level30_16();
		return
	elseif (myTaskValue==230) then
		task_level50_01(); -- µÃµ½ÁËÕòÚ¤Ö®Á´ºó»Øµ½ÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°
		return
	end
	
	local tbOpp = {
		--"ÎÒÊÇÀ´ÇëÄú¼ø¶¨Ò»ÏÂ²Ø±¦Í¼µÄ/CheckTreasureMap_Say",
		"Ta kh«ng cã chuyÖn g× /OnExit"
		};
	
	
	Say("Khô! Khô!....L¹i ®Õn t×m l·o cã viÖc g×?",
				getn(tbOpp),
				tbOpp	);

end;


function CheckTreasureMap_Say()
	Say("A......§©y lµ Tµng B¶o ®å, gåm tÊt c¶ c¸c ®Şa ®iÓm chøa b¶o vËt tuyÖt thÕ,  ng­êi th­êng xem kh«ng hiÓu ®­îc, nÕu ng­¬i cã 30 v¹n <color=yellow>30 v¹n<color>...Khô! Khô!...",2,
		"§­îc! 30  th× 30/CheckMoney",
		"B¹n kh«ng cã ®ñ tiÒn/OnExit");
	return 1;
end;


function CheckMoney()

	-- ÔÚÕâÀïµÚÒ»´ÎÅĞ¶Ï½ğÇ®£¬×¼±¸¼ø¶¨Ê±ÔÙÅĞ¶ÏÒ»´Î
	if GetCash()>=300000 then
		-- µ¯³ö¸øÓè½çÃæ
		GiveItemUI("Gi¸m ®Şnh Tµng B¶o ®å","Xin ®Æt Tµng B¶o ®å cña b¹n vµo","CheckTreasureMap","OnExit");
		return
	else
		Say("Haha…B¹n trÎ, kh«ng ®ñ tiÒn th× nãi lµm g×, ®õng t­ëng l·o giµ nµy ngu muéi. Ng­¬i vµ vËt kú tr©n dŞ b¶o tuyÖt thÕ nµy cã thÓ lµ v« duyªn råi.",0);
		return
	end;

end;

