Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")

function IpBonus()
	local nPromotionSay = {	}
	
	tinsert(nPromotionSay,"Ta muèn xem thêi gian trªn m¹ng/ShowTimeNow")
	tinsert(nPromotionSay,"NhËn phÇn th­ëng Lam B¶o H¹p/GetBonusGreenItem")	
	tinsert(nPromotionSay,"NhËn phÇn th­ëng Hoµng B¶o H¹p/GetBonusYellowItem")	
	--tinsert(nPromotionSay,"NhËn phÇn th­ëng Nh©n ®«i kinh nghiÖm/GetBonusExp")	
	tinsert(nPromotionSay,"NhËn phÇn th­ëng Nh©n 1.5 ®iÓm tİch lòy Tèng Kim/GetTongKimBonus")	
	tinsert(nPromotionSay,"T¹i h¹ chØ ghĞ qua th«i!/OnCancel")
	
	Say("Trong ngµy, cø 4 giê ®¹i hiÖp trªn m¹ng ë m¸y cã cµi ®Æt CSM sÏ nhËn ®­îc <color=red>1 Lam B¶o H¹p<color>. Tr­êng hîp ®¹i hiÖp rêi m¹ng, ñy th¸c trªn m¹ng hoÆc ñy th¸c rêi m¹ng sÏ kh«ng ®­îc tİnh. Ngoµi ra, ®¹i hiÖp cã thÓ nhËn hiÖu qu¶ nh©n ®«i kinh nghiÖm trong 1 giê.",getn(nPromotionSay),nPromotionSay)
end;

function ShowTimeNow()
	if CheckIPBonus() == 0 then
		Say("HiÖn t¹i ®¹i hiÖp ch­a thÓ xem tin tøc, h·y thö l¹i sau!",0)
		return
	end
	IpBonus_Close()	
	local nHour, nMin, nSec = ShowTime()
	local nHour2, nMin2, nSec2 = ShowTimeYellowBox()
	local strMsg = format("Thêi gian trªn m¹ng ë m¸y cµi ®Æt CSM cã thÓ quy ®æi Lam B¶o H¹p lµ: %d giê %d phót %d gi©y.<enter>Tæng thêi gian trªn m¹ng: %d giê %d phót %d gi©y",nHour, nMin, nSec,nHour2, nMin2, nSec2)
	IpBonus_Start()
	Talk(1,"IpBonus",strMsg)
end

function GetBonusGreenItem()
	if CheckIPBonus() == 0 then
		Say("HiÖn t¹i ®¹i hiÖp ch­a thÓ nhËn th­ëng, h·y thö l¹i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
		
	if GetTask(TASKID_GET_TIMES) >= 6 then
		Say("H«m nay ®¹i hiÖp ®· nhËn th­ëng 6 lÇn råi. Ngµy mai quay l¹i nhĞ!",0)
		return
	end	
	
	local nHour, nMin, nSec = ShowTime()
	if nHour < 4 then
		Say("§¹i hiÖp ch­a ®ñ 4 giê trªn m¹ng!",0)
		return
	end	
	
	if CalcFreeItemCellCount() < 2 then
		Say("Kh«ng ®ñ 2 « trèng trong hµnh trang cña ®¹i hiÖp!",0)
		return
	end
	
	if IpBonus_Minus(4*60*60) == 1 then	
		SetTask(TASKID_GET_TIMES,GetTask(TASKID_GET_TIMES) + 1);
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30000,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);	
		SetItemBindState(nItemIndex, -2);
		Say("Chóc mõng ®¹i hiÖp nhËn ®­îc 1 Lam B¶o H¹p.");
		Msg2Player("B¹n nhËn ®­îc 1 Lam B¶o H¹p.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","nhËn Lam B¶o H¹p",GetAccount(),GetName()))		
	end
end;

function GetBonusYellowItem()
	if CheckIPBonus() == 0 then
		Say("HiÖn t¹i ®¹i hiÖp ch­a thÓ nhËn th­ëng, h·y thö l¹i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 0 then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
		return
	end
	if IsCharged() == 0 then
		Talk(1, "", "Ph¶i qua n¹p thÎ míi cã thÓ nhËn th­ëng.")
		return
	end
	
	if GetLevel() < 130 and  ST_IsTransLife() < 1 then
		Talk(1, "", "Ch­a trïng sinh ph¶i cÊp 130 míi cã thÓ nhËn th­ëng.")
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Say("Kh«ng ®ñ 2 « trèng trong hµnh trang cña ®¹i hiÖp!",0)
		return
	end
	
	if IpBonus_Minus_Yellow_Box(50*60*60) == 1 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX, 1)
		if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 1 then		
			return
		end
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30001,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);
		SetItemBindState(nItemIndex, -2);
		Say("Chóc mõng ®¹i hiÖp nhËn ®­îc 1 Hoµng B¶o H¹p.");
		Msg2Player("B¹n nhËn ®­îc 1 Hoµng B¶o H¹p.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","nhËn Hoµng B¶o H¹p",GetAccount(),GetName()))
	else
		Say("§¹i hiÖp ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng nµy!",0)
		return
	end
end;

function GetBonusExp()
	if CheckIPBonus() == 0 then
		Say("HiÖn t¹i ®¹i hiÖp ch­a thÓ nhËn th­ëng, h·y thö l¹i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
		Say("PhÇn th­ëng nµy chØ nhËn ®­îc vµo c¸c ngµy thø s¸u, thø b¶y vµ chñ nhËt h»ng tuÇn!" ,1,"ThËt ng¹i qu¸!/OnCancel")
		return
	end

	if GetSkillState(451) > 0 then
		Say("Ch¼ng ph¶i ®¹i hiÖp ®· nhËn th­ëng råi sao?" ,1,"ThËt ng¹i qu¸!/OnCancel")
		return
	end	
		
	AddSkillState(451, 20, 1, 18*60*60);
	Say("Chóc mõng ®¹i hiÖp nhËn ®­îc hiÖu qu¶ Nh©n ®«i kinh nghiÖm!");
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i kinh nghiÖm trong vßng 60 phót.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh©n ®«i kinh nghiÖm",GetAccount(),GetName()))
end

function GetTongKimBonus()
	if CheckIPBonus() == 0 then
		Say("HiÖn t¹i ®¹i hiÖp ch­a thÓ nhËn th­ëng, h·y thö l¹i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	
--	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
--		Say("PhÇn th­ëng nµy chØ nhËn ®­îc vµo c¸c ngµy thø s¸u, thø b¶y vµ chñ nhËt h»ng tuÇn!" ,1,"ThËt ng¹i qu¸!/OnCancel")
--		return
--	end
	
	if (PlayerFunLib:CheckTaskDaily(TASKID_DAILY_X2TONGKIM,3,"H«m nay ®¹i hiÖp ®· nhËn th­ëng 3 lÇn råi. Ngµy mai quay l¹i nhĞ!","<") ~= 1) then
			return
	end
	
	if (GetTask(TASKID_COUNT_X2TONGKIM) ~= 0) then
		Talk(1,"","Ch¼ng ph¶i §¹i hiÖp ®· nhËn råi sao, h·y mau ®i tham gia chiÕn tr­êng Tèng Kim!!!!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(TASKID_DAILY_X2TONGKIM,1)
	SetTask(TASKID_COUNT_X2TONGKIM,1)
	Say("Chóc mõng ®¹i hiÖp nhËn ®­îc hiÖu qu¶ Nh©n 1.5 ®iÓm tİch lòy Tèng Kim!");
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i ®iÓm tİch lòy Tèng Kim.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh©n ®«i ®iÓm tİch lòy Tèng Kim",GetAccount(),GetName()))
	
end


function OnCancel()
end;
