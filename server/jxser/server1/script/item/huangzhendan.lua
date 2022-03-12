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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d ngµy %d giê %d phót %d gi©y<color>",nDay,nHour,nMin,nSec);
	end		

	local szTitle;
	local tbOpt;
	
	if szMsg_Huang ~= nil then
		szTitle	= format("Xin chµo <color=yellow>%s<color>, trong thêi gian 60 ngµy chØ ®­îc sö dông 1 lÇn Hoµng Ch©n §¬n, ®¹i hiÖp ®îi thªm %s råi h·y thö l¹i.",GetName(), szMsg_Huang);
		tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
	else
		szTitle	= format("Xin chµo <color=yellow>%s<color>, sö dông hoµng ch©n ®¬n cã thÓ nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm. X¸c nhËn muèn sö dông?",GetName(), 2000000000)
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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d ngµy %d giê %d phót %d gi©y<color>",nDay,nHour,nMin,nSec);
	end			
	
	if szMsg_Huang ~= nil then
		local szTitle = format("Xin chµo <color=yellow>%s<color>, trong thêi gian 60 ngµy chØ ®­îc sö dông 1 lÇn Hoµng Ch©n §¬n, ®¹i hiÖp ®îi thªm %s råi h·y thö l¹i.",GetName(), szMsg_Huang)
		local tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
		
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tbAwardTemplet:GiveAwardByList({nExp_tl = 2000000000;}, format("%s sö dông hoµng ch©n ®¬n", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	return format("\nChøa <color=yellow>%s<color> kinh nghiÖm", 2000000000);
end
