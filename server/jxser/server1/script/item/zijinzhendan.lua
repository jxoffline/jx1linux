-- ÎÄ¼þÃû¡¡£ºchuangongdan.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("ChØ cã nh©n vËt ®· trïng sinh míi cã thÓ sö dông Tö Kim Ch©n §¬n", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("Sö dông ch©n ®an nµy kh«ng thÓ nhËn ®­îc kinh nghiÖm.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ngµy %d giê %d phót %d gi©y<color>",nDay,nHour,nMin,nSec);
	end
		
	local szTitle;
	local tbOpt;
	
	if szMsg_ZiJin ~= nil then
		szTitle	= format("Xin chµo <color=yellow>%s<color>, trong thêi gian 60 ngµy chØ ®­îc sö dông 1 lÇn Tö Kim Ch©n §¬n, ®¹i hiÖp ®îi thªm %s råi h·y thö l¹i.",GetName(),szMsg_ZiJin)
		tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
	else
		szTitle	= format("Xin chµo <color=yellow>%s<color>, sö dông tiªn ®¬n nµy cã thÓ nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm. X¸c nhËn muèn sö dông?",GetName(), nContainExp)
		tbOpt = 
		{
			format("X¸c nhËn/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"Hñy bá /OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("ChØ cã nh©n vËt ®· trïng sinh míi cã thÓ sö dông Tö Kim Ch©n §¬n", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("Sö dông ch©n ®an nµy kh«ng thÓ nhËn ®­îc kinh nghiÖm.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ngµy %d giê %d phót %d gi©y<color>",nDay,nHour,nMin,nSec);
	end	
	
	
	if szMsg_ZiJin ~= nil then
		local szTitle = format("Xin chµo <color=yellow>%s<color>, trong thêi gian 60 ngµy chØ ®­îc sö dông 1 lÇn Tö Kim Ch©n §¬n, ®¹i hiÖp ®îi thªm %s råi h·y thö l¹i.",GetName(),szMsg_ZiJin)
		local tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			
			tbAwardTemplet:GiveAwardByList({nExp_tl = nContainExp;}, format("%s sö dông Tö Kim Ch©n §¬n", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
			
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nChøa <color=yellow>%s<color> kinh nghiÖm", nContainExp);
end
