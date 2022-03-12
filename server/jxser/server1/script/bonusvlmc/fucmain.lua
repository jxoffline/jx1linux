Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\bonusvlmc\\func_check.lua");
Include("\\script\\bonusvlmc\\func_quest999.lua");
Include("\\script\\bonusvlmc\\vlmc_main.lua");

function VLMC_main()
	local tbOpp = {}
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	
	ResetTaskGiveQuest()
	
	local str1 = "<#> Mét h¹t c¸t kh«ng thÓ lµm nªn sa m¹c. Tuy ta lµ ng­êi cã vâ c«ng c¸i thÕ trong thiªn h¹, nh­ng ®Ó thèng nhÊt vâ l©m th× cÇn cã sù ®ãng gãp c«ng søc cña c¸c anh hïng hµo kiÖt !";
	local str2 = "<#> §êi sèng chØ lµ mét kho¶nh kh¾c nh­ng víi kho¶nh kh¾c Êy ng­êi ta cã thÓ lµm nªn nh÷ng viÖc vÜnh cöu !";
	
--	if (GetTask(VLMC_Task_IsQuest) == 0) then
--		tinsert(tbOpp,"Ta ®Õn nhËn nhiÖm vô [Cøu khèn phß nguy]/AcceptQuest");
--	end
--	
--	if (GetTask(VLMC_Task_IsQuest) == 1 and GetTask(VLMC_Task_IsFinishQuest) ~= 1) then
--		tinsert(tbOpp,"Ta ®· hoµn thµnh nhiÖm vô [Cøu khèn phß nguy]/FinishQuest");
--		tinsert(tbOpp,"Xem chi tiÕt nhiÖm vô/ReviewQuest");
--	end
	
	if (GetGlbValue(GlbVar1)== 1 and GetTask(TSK_Get2ExpTK)~= nCurrDate ) then
		tinsert(tbOpp,"NhËn phÇn th­ëng nhËn ®«i ®iÓm kinh nghiÖm chiÕn tr­êng Tèng Kim/Get2xExpTK");
	end	
	
	if (GetGlbValue(GlbVar2)== 1 and GetTask(TSK_GetBonusEXP)== 0 ) then
		tinsert(tbOpp,"NhËn phÇn th­ëng nhËn ®«i ®iÓm kinh nghiÖm khi ®¸nh qu¸i/GetEXPBonus");
	end
	
	if (GetGlbValue(GlbVar1) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_TK) == 0 ) then
			tinsert(tbOpp,"Bang ph¸t nh©n ®«i ®iÓm kinh nghiÖm trong Tèng Kim/AcceptEXPBonusTK");
		end
	end
	
	if (GetGlbValue(GlbVar2) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_x2EXP) == 0 ) then
			tinsert(tbOpp,"Bang ph¸t nh©n ®«i ®iÓm kinh nghiÖm ®¸nh qu¸i/AcceptActiveX2EXP");
		end
	end
	
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( Is_VLMC() == 0 ) then
		Say( str1, getn( tbOpp ), tbOpp )
		return
	end;
	Say( str2, getn( tbOpp ), tbOpp )	
end

function OnCancel()
end 

