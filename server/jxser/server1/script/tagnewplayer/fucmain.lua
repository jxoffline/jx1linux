Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\func_itembonusweekly.lua");
Include("\\script\\tagnewplayer\\func_itemtim.lua");
Include("\\script\\tagnewplayer\\func_itemanbang.lua");
Include("\\script\\tagnewplayer\\bonusEXP.lua");
Include("\\script\\tagnewplayer\\func_bonusthanhtich.lua");
Include("\\script\\tagnewplayer\\func_quest180.lua");



function NWP_main()
do return end
	if (IsCode()~=1) then
		Talk(1, "", "§¹i hiÖp kh«ng thuéc ®èi t­îng tham gia An Bang Hoµng Kim LÖnh bµi ! .");
		return
	end
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> §¹i hiÖp xin h·y chän phÇn th­ëng";
	if (CheckObject() == 1) then
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) == 1) then
			tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng th¨ng ®¼ng cÊp 120 sau khi ®· trïng sinh/GetLevel120"); --®· trïng sinh lÇn 1, th¨ng cÊp 120
		end
	end
	if (CheckObject() == 2) then
		local IsQ, IsFQ = GetCurQuest()
		if(IsQ == 0) then
			tinsert(tbOpp,"Ta muèn nhËn nhiÖm vô liªn hoµn thø nhÊt/AcceptFirstQuest");
		end
		
		if (IsQ == 1) then
			if (IsFQ == 0) then
				tinsert(tbOpp,"Ta muèn xem nhiÖm vô ®· nhËn/ReviewCurQuest");
				tinsert(tbOpp,"Ta ®· hoµn thµnh nhiÖm vô liªn hoµn thø nhÊt/FinishFirstQuest");
			elseif (IsFQ == 1) then
				tinsert(tbOpp,"Ta muèn nhËn nhiÖm vô liªn hoµn thø hai/GetSecondQuest");
			end		
		end
		
		if (IsQ == 2) then
			if (IsFQ == 1) then
				tinsert(tbOpp,"Ta muèn xem nhiÖm vô ®· nhËn/ReviewCurQuest");
				tinsert(tbOpp,"Ta ®· hoµn thµnh nhiÖm vô liªn hoµn thø hai/FinishSecondQuest");
			elseif (IsFQ == 2) then
				tinsert(tbOpp,"Ta muèn nhËn nhiÖm vô liªn hoµn thø ba/GetThirdQuest");
			end	
		end
		
		if (IsQ == 3) then
			if (IsFQ == 2) then
				tinsert(tbOpp,"Ta muèn xem nhiÖm vô ®· nhËn/ReviewCurQuest");
				tinsert(tbOpp,"Ta ®· hoµn thµnh nhiÖm vô liªn hoµn thø ba/FinishThirdQuest");
			end	
		end
		
	end
	if (CheckObject() == 3 and CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) == 1) then
		tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng th¨ng ®¼ng cÊp 165/GetLevel165");--ch­a trïng sing, thang lªn cÊp 165
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) == 1) then
			tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng trang bÞ TÝm/GetItemTim");
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) == 1) then
			tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng trang bÞ An Bang/GetItemAnBang");
	end
	tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng thµnh tÝch/GetBonusThanhTich_main");
	tinsert(tbOpp,"Ta muèn nhËn phÇn th­ëng h»ng ngµy/BonusEveryDay");
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

