-- ÎÄ¼þÃû¡¡£ºchuangongdan.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function main(nItemIndex)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	if (parttype == 30036 or parttype == 30037) then	
			return 1
	end

	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime		= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime		= GetCurServerTime()
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông c¸c lo¹i ch©n ®an (b¹ch ch©n ®an, huyÕt ch©n ®an, huyÒn ch©n ®an).", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("Sö dông ch©n ®an nµy kh«ng thÓ nhËn ®­îc kinh nghiÖm.", 0)
		return 0
	end
	
	local szTime = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit < nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ngµy %d giê %d phót %d gi©y", nDay, nHour, nMin, nSec);
		end
	end
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	
	
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin chµo <color=yellow>%s<color>, ®¹i hiÖp sö dông c¸c lo¹i tiªn ®¬n vµ nhËn ®­îc tæng kinh nghiÖm cao nhÊt lµ 3 tû ®iÓm, v× vËy kh«ng thÓ sö dông thªm tiªn ®¬n ®­îc n÷a. H·y ®îi <color=yellow>%s<color> råi thö l¹i.",GetName(),szTime)
		tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
	else
		szTitle	= format("Xin chµo <color=yellow>%s<color>, ®¹i hiÖp sö dông c¸c lo¹i tiªn ®¬n nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm, cßn cã thÓ nhËn ®­îc thªm <color=yellow>%s<color> kinh nghiÖm. <enter>Tiªn ®¬n nµy chøa <color=yellow>%s<color> kinh nghiÖm, nÕu sö dông lo¹i tiªn ®¬n nµy cã thÓ nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm, c¸c h¹ cã muèn sö dông kh«ng?",GetName(), nTSKVExp, nRemnant, nContainExp, nExp)
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
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime	= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime	= tonumber(GetLocalDate("%Y%m"));
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông c¸c lo¹i ch©n ®an (b¹ch ch©n ®an, huyÕt ch©n ®an, huyÒn ch©n ®an).", 0)
		return 1;
	end
	
	
	if nContainExp <= 0 then
		Say("Sö dông ch©n ®an nµy kh«ng thÓ nhËn ®­îc kinh nghiÖm.", 0)
		return 1
	end
	
	
	local nDay = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit <= nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ngµy %d giê %d phót %d gi©y", nDay, nHour, nMin, nSec);
		end
	end
	
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin chµo <color=yellow>%s<color>, ®¹i hiÖp sö dông c¸c lo¹i tiªn ®¬n vµ nhËn ®­îc tæng kinh nghiÖm cao nhÊt lµ 3 tû ®iÓm, v× vËy kh«ng thÓ sö dông thªm tiªn ®¬n ®­îc n÷a. H·y ®îi <color=yellow>%s<color> råi thö l¹i.",GetName(), szTime)
		tbOpt = 
		{
			"X¸c nhËn/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tl_addPlayerExp(nExp);
			SetBeiDouChuanGongExp(nTSKVExp+nExp);
			if nTSKVExp+nExp >= 30e8 then 
				SetTask(TSK_BeiDouChuanGong_NIANYUE, GetCurServerTime());
			end
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local itemgenre, detailtype, parttype = GetItemProp(nItem)
	if (itemgenre == 6 and detailtype == 1 and parttype == 30003 or parttype == 30004) then	
			local nVar = GetItemParam(nItem, 1);
			return format("\nMang m· sè <color=yellow>%s<color>", nVar);
	end
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nChøa <color=yellow>%s<color> kinh nghiÖm", nContainExp);
end
