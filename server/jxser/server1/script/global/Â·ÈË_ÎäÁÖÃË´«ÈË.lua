--Ìá¹©¸£ÔµÁìÈ¡µÄNPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007Äê´º½Ú»î¶¯
Include([[\script\event\springfestival07\head.lua]]);
--ÎäÁÖÁî»î¶¯
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- ·²ÊÇÉæ¼°µ½»î¶¯µÄÎäÁÖÃË´«ÈË¶Ô»°½Ô²åÈëµ½´ËÊı×é -- ÅåÀ×Ë¹ 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>Thêi thÕ lo¹n l¹c, ch­ vŞ nªn gi÷ ®¹o chİnh ph¸i, t¹o phóc chóng sinh. Cã thÕ míi hi väng trë thµnh mét ®¹i hiÖp ®­îc mäi ng­êi ng­ìng mé.");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"Ho¹t ®éng 30-4 vµ Quèc tÕ lao ®éng/nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk, "Vâ L©m §Ö NhÊt Bang/tongWar_Start");
	end;
	
	--tinsert(aryTalk, "§i danh nh©n ®­êng/honor_hall_enter");
	
	--tinsert(aryTalk, "§i Minh NguyÖt trÊn/autumn_enter");
	
	tinsert(aryTalk, "NhËn ®iÓm phóc duyªn cña  b¹n/OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "NhËn ®iÓm phóc duyªn cña tÊt c¶ thµnh viªn trong nhãm/OnGain_Team");
	end;
	
	tinsert(aryTalk, "NhËn ®iÓm danh väng (ch¬i nhiÒu giê) /W33_prise");
	
	tinsert(aryTalk, "Thêi gian tİch lòy ®æi ®iÓm phóc duyªn/OnQueryTime");
	
	tinsert(aryTalk, "Liªn quan ®Õn phóc duyªn/OnAbout");
	
	tinsert(aryTalk, "Hñy bá /OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--ÁìÈ¡Íæ¼Ò±¾ÈËµÄ¸£ÔµµãÊı
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a n¹p thÎ, n¹p xong  h·y ®Õn t×m ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B¹n ®· b­íc vµo giai ®o¹n mÖt mái! kh«ng thÓ nhËn ®iÓm phóc duyªn. Xin h·y nghØ ng¬i, gi÷ g×n søc kháe!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C¸c h¹ míi ra giang hå, ta cã chót lÔ vËt, xin nhËn lÊy!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "Ng­¬i phiªu b¹t giang hå cßn ch­a ®ñ, häc hái nhiÒu thªm råi ®Õn t×m ta!", 0 );
	elseif( nResult == 1 ) then
		Say( "Ng­¬i phiªu b¹t giang hå ®· l©u, c«ng lao ®· nhiÒu, ®©y lµ phÇn th­ëng ng­¬i ®¸ng ®­îc nhËn! §õng bá lì!", 0 );
	end
end

--ÁìÈ¡Íæ¼Ò¶ÓÎéËùÓĞ³ÉÔ±µÄ¸£ÔµµãÊı
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a n¹p thÎ, n¹p xong  h·y ®Õn t×m ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B¹n ®· b­íc vµo giai ®o¹n mÖt mái! kh«ng thÓ nhËn ®iÓm phóc duyªn. Xin h·y nghØ ng¬i, gi÷ g×n søc kháe!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C¸c h¹ míi ra giang hå, ta cã chót lÔ vËt, xin nhËn lÊy!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "Ng­¬i phiªu b¹t giang hå ®· l©u, c«ng lao ®· nhiÒu, ®©y lµ phÇn th­ëng ng­¬i ®¸ng ®­îc nhËn! §õng bá lì!", 0 );
	else
		Say( "Ng­¬i phiªu b¹t giang hå cßn ch­a ®ñ, häc hái nhiÒu thªm råi ®Õn t×m ta!", 0 );
	end
end

--²éÑ¯µ±Ç°¿É»»È¡¸£ÔµµÄÀÛ»ıÔÚÏßÊ±¼ä
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a n¹p thÎ, n¹p xong  h·y ®Õn t×m ta!", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C¸c h¹ míi ra giang hå, ta cã chót lÔ vËt, xin nhËn lÊy!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#> Tõ ®iÓm phóc duyªn lÇn tr­íc nhËn ®­îc, tæng céng b¹n tİch lòy ®­îc <color=yellow>"..timeToString( nFYTotalTime ).."<#> <color> thêi gian Online", 0 );
end

--¹ØÓÚ¸£Ôµ
function OnAbout()
	Talk( 3, "", "Sè ®iÓm phóc duyªn: Th«ng qua tİch lòy thêi gian Online sÏ ®æi lÊy mét sè ®iÓm ¶o, cã thÓ dïng ®Ó ®æi c¸c lo¹i vËt phÈm ®Æc biÖt  ë ThÇn bİ Th­¬ng Nh©n LiÔu Êt(T­¬ng D­¬ng) .", "§æi phóc duyªn: Sau khi online > 2 giê, ®Õn Vâ L©m TruyÒn Nh©n ë c¸c §¹i thµnh thŞ ®Ó ®æi. NÕu 1 ngµy ®æi phóc duyªn thµnh c«ng 2 lÇn, sÏ nhËn ®­îc phÇn th­ëng. NÕu Online < 4 giê, mçi giê ®æi ®­îc 1 ®iÓm. Sau ®ã, mçi 2 giê ®æi ®­îc 1 ®iÓm. Thµnh viªn trong ®éi cã thÓ nhËn ®iÓm gióp cho c¶ ®éi.", "H¹n chÕ: khi ngåi tï vµ luyÖn c«ng trªn §µo hoa ®¶o sÏ kh«ng tİnh vµo thêi gian tİch lòy ®æi ®iÓm phóc duyªn. ë gian ®o¹n mÖt mái kh«ng thÓ nhËn ®iÓm phóc duyªn." );
end


function W33_prise()				-- ÔÚÏßÊ±¼äËÍÉùÍûÈÎÎñ

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","Vâ l©m truyÒn nh©n: Nç lùc cña ng­¬i ta ®Òu nh×n thÊy! TiÒn ®å s¸ng l¹n kh«ng xa! TiÕp tôc cè g¾ng nhĞ!")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("B¹n ®­îc t¨ng 1 ®iÓm danh väng.")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("B¹n ®­îc t¨ng 2 ®iÓm danh väng.")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("B¹n ®­îc t¨ng 3 ®iÓm danh väng.")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("B¹n ®­îc t¨ng 4 ®iÓm danh väng.")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("B¹n ®­îc t¨ng 5 ®iÓm danh väng.")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("B¹n ®­îc t¨ng 6 ®iÓm danh väng.")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("B¹n ®­îc t¨ng 7 ®iÓm danh väng.")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("B¹n ®­îc t¨ng 8 ®iÓm danh väng.")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("B¹n ®­îc t¨ng 9 ®iÓm danh väng.")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("B¹n ®­îc t¨ng 10 ®iÓm danh väng.")
	end

else

	Say("Vâ l©m truyÒn nh©n: §iÒu kiÖn cña ng­¬i hiÖn nay kh«ng ®ñ ®Ó nhËn ®iÓm danh väng. V× lı t­ëng cña m×nh, h·y cè lªn!",0)

end

end



--È¡Ïû
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#> giê "..nMinute.."<#> phót "..nSecond.."<#> gi©y ";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end